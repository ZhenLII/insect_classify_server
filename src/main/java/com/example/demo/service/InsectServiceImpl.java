package com.example.demo.service;

import java.io.*;
import java.util.List;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Insect;
import com.example.demo.entity.InsectClass;
import com.example.demo.mapper.InsectMapper;
import com.example.demo.mapper.InsectClassMapper;
import com.example.demo.uitils.ResHelper;
import com.example.demo.uitils.SearchInsect;

@Service
public class InsectServiceImpl implements InsectService {
    String basePath = new ApplicationHome(this.getClass()).getSource().getParentFile().getPath() + "/";
	@Autowired
    private InsectMapper InsectMapper;
	@Autowired
    private InsectClassMapper InsectClassMapper;
	@Autowired
	private SearchInsect SearchInsect;
	@Value("${upload.path}")
 	private String uploadPath;

	@Value("${python.path}")
	private String pythonPath;

	@Value("${python.command}")
	private String pythonCmd;

	@Value("${python.runtime-charset}")
	private String pythonRuntimeCharset;

	@Override
	public List<Insect> getList(int limit, int offset, String query) {
		List<Insect> insects = InsectMapper.getList(limit, offset, query);
		for(Insect insect : insects) {
			insect.setPic(insect.getPic().concat(insect.getInsectName().concat("001.jpg")));
			if(insect.getDescription().length() > 40) {
				insect.setDescription(insect.getDescription().substring(0, 40).concat("..."));
			}
		}
		return insects;
	}

	@Override
	public String upload(MultipartFile file) {
		 
		String path = null;
		try {
            if (file.isEmpty()) {
                return path;
            }
            // 获取文件名
            String fileName = file.getOriginalFilename();

            // 设置文件存储路径

            // 调试环境 获取路径
//			String url = ResourceUtils.getURL("classpath:").getPath();
//			url = url.substring(1,url.length());
//            path = url+uploadPath + fileName;


			// 部署为jar后直接采取相对路径
            path = basePath+uploadPath + fileName;
            path = path.replaceAll("\\\\","/");
            File dest = new File(path);
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdirs();// 新建文件夹
            }
            file.transferTo(dest);// 文件写入
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return path;

	}

	@Override
	public ResHelper<Insect> internetSearch(String key) {
		ResHelper<Insect> res = new ResHelper<Insect>(); 
		try {
			res.setData(SearchInsect.search(key,false));
			res.success();
		} catch(Exception e) {
			e.printStackTrace();
			res.setCode(500);
			res.setMessage(e.getMessage());
		}
		return res;
	}

	// 异步方法，因为爬虫很耗时
	@Override
	@Async
	public Future<ResHelper<List<Insect>>> spiderForInsects() {
		ResHelper<List<Insect>> res = new ResHelper<List<Insect>>(); 
		try {
			res.setData(SearchInsect.spiderForInsects());
		} catch (Exception e) {
			res.error(e.getMessage());
			e.printStackTrace();
		}
		return  new AsyncResult<ResHelper<List<Insect>>>(res);
	}
	
	@Override
	@Async
	@Transactional
	public Future<ResHelper<Object>> buildDBfromSpider() {
		ResHelper<Object> res = new ResHelper<Object>();
		try {
			List<Insect> insects = SearchInsect.spiderForInsects();
			for(Insect insect : insects) {
				InsectClass insectClass = getClassByName(insect.getClassName());
				if(insectClass == null) {
					insectClass = new InsectClass();
					insectClass.setClassName(insect.getClassName());
					InsectClassMapper.insertClass(insectClass);
				}
				insect.setClassId(insectClass.getClassId());
				InsectMapper.insertInsect(insect);
			}
			res.success();
		} catch (Exception e) {
			e.printStackTrace();
			res.error(e.getMessage());
		}
		return new AsyncResult<ResHelper<Object>>(res);
	}
	
	
	@Override
	public InsectClass getClassByName(String name) {
		InsectClass ic = new InsectClass();
		InsectClass resClass = null;
		ic.setClassName(name);
		resClass = InsectClassMapper.getInsectClassByName(ic);
		return resClass;
	}

	@Override
	@Transactional
	public ResHelper<Object> insertInsectClass(String className) {
		InsectClass ic = new InsectClass();
		ic.setClassName(className);
		ResHelper<Object> res = new ResHelper<Object>();
		try {
			InsectClass insectClass = getClassByName(className);
			if(insectClass == null) {
				InsectClassMapper.insertClass(ic);
				res.setData(ic);
			}
			res.success();
		} catch(Exception e) {
			e.printStackTrace();
			res.error(e.getMessage());
		}
		return res;
	}

	@Override
	public ResHelper<Object> classify(MultipartFile file) {
		String filePath = upload(file);
		ResHelper<Object> res = new ResHelper<Object>();
		if (filePath == null) {
			res.error("file upload failed");
		}

		try{
		    // 开发环境
//            String url = ResourceUtils.getURL("classpath:").getPath();
//            url = url.substring(1, url.length());

            // 部署jar
            String url = basePath;
            url = url.replaceAll("\\\\","/");
            String[] arguments = new String[] {pythonCmd,url.concat(pythonPath).concat("classify.py"), filePath, url.concat(pythonPath)};
            Process process = Runtime.getRuntime().exec(arguments);
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream(), pythonRuntimeCharset));
            // 打印python执行结果
            String line = null;
            String classifyResult = "";
            while ((line = in.readLine()) != null) {
                System.out.println(line);
                classifyResult = line;
            }
            in.close();
            // 返回执行是否成功，0 代表成功，1 代表失败
            int re = process.waitFor();
            if (re == 0) {
                res.data = classifyResult;
                res.success();
            } else {
                    res.error("python run error");
                    res.data = classifyResult;
            }
		} catch(Exception e){
			e.printStackTrace();
			res.error(e.getMessage());
		}
		return res;
	}

	@Override
	public Insect getInsectById(String insectId) {
		int id = Integer.parseInt(insectId);
		Insect insect = InsectMapper.getInsectById(id);
		String pic = insect.getPic();
		try {
		    // 开发环境
//			String url = ResourceUtils.getURL("classpath:").getPath();

            //部署jar
			String url = basePath;

			File file=new File(url.concat("/static/").concat(pic));
			File[] fileName= file.listFiles(pathname -> {
				if (pathname.isFile())
					return true;
				else
					return false;
			});

			if(fileName.length>0) {
				StringBuffer pics = new StringBuffer();
				int picNum = 1;
				for(File f : fileName){
					String name = f.getName();
					pics.append(insect.getPic().concat(name).concat(";"));
					if(++picNum > 3)
						break;
				}
				pics.delete(pics.length()-1,pics.length());
				insect.setPic(pics.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return insect;
	}

}
