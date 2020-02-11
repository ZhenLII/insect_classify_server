package com.example.demo.uitils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.entity.Insect;
import com.example.demo.entity.InsectClass;
import com.example.demo.mapper.InsectClassMapper;
import com.example.demo.mapper.InsectMapper;
@PropertySource(value="classpath:spider.properties", encoding="UTF-8")
@Component
public class SearchInsect {
	
	private static final Logger LOG = LoggerFactory.getLogger(SearchInsect.class);
	
	@Autowired
    private InsectMapper InsectMapper;
	@Autowired
    private InsectClassMapper InsectClassMapper;
	
	@Value("${spider.url}")
	private String targetURL;
	
	@Value("${targetkey.animal}")
	private String keyAnimal;
	
	@Value("${targetkey.biological}")
	private String keyBiological;
	
	@Value("${spider.classify_url}")
	private String classifyURL;
	
	/**
	 * @author JiangSwenwei
	 * @param String queryKey 百科词条搜索的关键字
	 * @return Insect insect 根据词条内容构造的实体类
	 * 公共方法 search
	 * 搜索百度百科关键字词条，提取信息构造为实体类
	 * **/
	@Transactional
	public Insect search(String queryKey) throws Exception { 
		String target = targetURL.concat("/item/").concat(queryKey);
		Insect insect = new Insect();
		// 加载词条首页
		Document doc = Jsoup.connect(target).get();
		
		// 判断词条合法性	
		// 判断词条存在 通过百度百科抱歉html标签的类名判断
		Element noresult = doc.selectFirst(".sorryBox");
		if (noresult != null) {
			throw new Exception("百度百科查询结果为空");
		}
		// 判断词条范围 通过百度百科词条标签的html标签的类名判断
		Elements tags = doc.select(".taglist");
		List<String> tagsStr = getTagsString(tags);
		if (!(tagsStr.contains(keyAnimal)||tagsStr.contains(keyBiological))) {
			throw new Exception("关键字不属于相关范围");
		}
		
		//获得综述，即词条开头的描述，我想要获得的是某个昆虫的基本描述 通过标签 的类名.lemma-summary获取
		Element lemmaSummary = doc.selectFirst(".lemma-summary");
		String lemmaSummaryStr = null;
		if (lemmaSummary != null) {
			lemmaSummaryStr = lemmaSummary.text();
		}
		insect.setDescription(lemmaSummaryStr);
		
		//获得百度百科提供的基本信息
		if(doc.selectFirst(".basic-info.cmn-clearfix") == null) {
			throw new Exception("没有找到基本信息标签");
		}
		Element basicInfoContainer = doc.selectFirst(".basic-info.cmn-clearfix");
		Elements basicInfo = basicInfoContainer.select("dl");
		
		// 检查发现百度百科的基本信息分为左右两个标签构成样式 我们需要的分别在这两个标签中
		Map<String, String> basicInfoMap = new HashMap<String, String>();
		for(Element e : basicInfo) {
			basicInfoMap.putAll(getBasicInfoMap(e.children()));
		}
		
		if(basicInfoMap.get("纲") == null || !basicInfoMap.get("纲").contains("昆虫纲")) {
			throw new Exception("词条非法，没有找昆虫纲分类");
		}
		// 填充信息到昆虫类中
		// 种类以 目 为大类
		String reg = "[^\u4e00-\u9fa5]";
		if(basicInfoMap.get("目") != null) {
			// 测试发现一些词条的目不纯 包含英文信息
			String name = basicInfoMap.get("目").replaceAll(reg, "");
			insect.setClassName(name);
			insect.setOrder(name);
		} else {
			throw new Exception("没有找到目一级的分类信息");
		}
		if(basicInfoMap.get("科") != null) {
			insect.setFamily(basicInfoMap.get("科").replaceAll(reg, ""));
		}
		if(basicInfoMap.get("属") != null) {
			insect.setGenus(basicInfoMap.get("属").replaceAll(reg, ""));
		}
		// 名称 设置为词条名
		insect.setInsectName(doc.selectFirst("h1").text());
		
		// 设置学名 拉丁学名 优先级最高
		if(basicInfoMap.get("拉丁学名") != null) {
			insect.setScientificName(basicInfoMap.get("拉丁学名"));
		}else if(basicInfoMap.get("英文名") != null) {
			insect.setScientificName(basicInfoMap.get("英文学名"));
		}else {
			insect.setScientificName(basicInfoMap.get("中文学名"));
		}
		
		// 设置别名
		if (basicInfoMap.get("别称") != null) {
			insect.setInsectAlias(basicInfoMap.get("别称"));
		} else {
			insect.setInsectAlias(basicInfoMap.get("别名"));
		}
		
		// 获得图片
		Element pic = doc.selectFirst(".summary-pic > a[href]");
		if(pic == null) {
			throw new Exception("没有找到百科图册地址");
		}
		String picPageURL = targetURL.concat(pic.attr("href"));
		
		// 查询类是否存在
		InsectClass insectClass = getClassByName(insect.getClassName());
		if(insectClass == null) {
			insectClass = new InsectClass();
			insectClass.setClassName(insect.getClassName());
			InsectClassMapper.insertClass(insectClass); // 插入成功会回填id
		}
		insect.setClassId(insectClass.getClassId());
		// 下载图片
		List<String> picUrlList = getBaikeImgs(picPageURL);
		PictureUtils picUtil = new PictureUtils();
		String folder = picUtil.loadInsectPic(insect, picUrlList);
		insect.setPic(folder);
		// 入库
		InsectMapper.insertInsect(insect);
		LOG.info(insect.getInsectName().concat(" 入库"));
		return insect;
		
	}
	
	/**
	 * @author JiangSwenwei
	 * @return List<Insect> 返回昆虫列表
	 * 公共方法 spiderForInsects
	 * 爬取百度百科上昆虫分类信息页的爬虫，大概有140种
	 * **/
	public List<Insect> spiderForInsects() throws Exception{
		// 不带分页信息请求默认请求第一页
		String fenleiURL = classifyURL.concat("昆虫");
		Document doc = Jsoup.connect(fenleiURL).get();
		
		// 判断页面存在 通过百度百科抱歉html标签的类名判断
		Element noresult = doc.selectFirst(".sorryBox");
		if (noresult != null) {
			throw new Exception("百度百科页面结果为空");
		}
		
		// 通过分页组件获得分页信息
		Element pageEle = doc.getElementById("pageIndex");
//		int pageNum = pageEle.childNodeSize();
		
		// 分页中的 换页a标签，其中包含了分页请求的信息
		Elements pageAEles = pageEle.select("a[href]");
		
		// 每页的url列表
		List<String> urlList = new ArrayList<String>();
		urlList.add(fenleiURL);
		for(Element e : pageAEles) {
			urlList.add(classifyURL.concat(e.attr("href")));
		}
		
		List<Insect> res = new ArrayList<Insect>();
		for(String url : urlList) {
			res.addAll(getInsectsInSinglePage(url));
		}
		return res;
	}
	
	/**
	 * @author JiangSenwei
	 * @param String url 百度百科昆虫分类页面单页的昆虫信息获取
	 * @return List<Insect> 返回昆虫列表
	 * 私有方法 getInsectsInSinglePage
	 * 爬取百度百科上昆虫分类信息的一页，一页目前是30种
	 * **/
	private List<Insect> getInsectsInSinglePage(String url) throws Exception{
		List<Insect> res = new ArrayList<Insect>();
		Document doc = Jsoup.connect(url).get();
		Elements insectEleList = doc.select(".list");
		// 这里为了方便直接调用了之前定义的搜索方法，所以获得的是list中的title的文本作为搜索的关键字
		// 事实上a便签的href值直接就是相关链接，也可以通过这个打开
		List<String> keyList = new ArrayList<String>();
		for(Element e : insectEleList) {
			keyList.add(e.selectFirst("a.title").text());
		}
		for(String s : keyList) {
			try {
				LOG.info("spider get item key: ".concat(s));
				res.add(search(s));
			} catch(Exception e) {
				LOG.error(e.getMessage());
			}
		}
		return res;
	}
	/**
	 * @author JiangSenwei
	 * @param boolean isBSF 是否广度搜索整个百度百科
	 * 获取昆虫关键字列表
	 * @throws Exception 
	 * **/
	public List<String> getInsectsKeyList(boolean isBSF){
		LOG.info("开始获取昆虫关键字");
		// 关键字队列
		Queue<String> keyQueue = new ConcurrentLinkedQueue<String>();

		// 不带分页信息请求默认请求第一页
		String fenleiURL = classifyURL.concat("昆虫");
		Document doc = null;
		try {
			doc = Jsoup.connect(fenleiURL).get();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 判断页面存在 通过百度百科抱歉html标签的类名判断
		Element noresult = doc.selectFirst(".sorryBox");
		if (noresult != null) {
			try {
				throw new Exception("百度百科页面结果为空");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		// 通过分页组件获得分页信息
		Element pageEle = doc.getElementById("pageIndex");

		
		// 分页中的 换页a标签，其中包含了分页请求的信息
		Elements pageAEles = pageEle.select("a[href]");
		
		// 每页的url列表
		List<String> urlList = new ArrayList<String>();
		urlList.add(fenleiURL);
		for(Element e : pageAEles) {
			urlList.add(classifyURL.concat(e.attr("href")));
		}
		for(String url : urlList) {
			Document pageDoc = null;
			try {
				pageDoc = Jsoup.connect(url).get();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Elements insectEleList = pageDoc.select(".list");
			for(Element ele : insectEleList) {
				try {
					String key = ele.selectFirst("a.title").text();
					if (isNeededItem(key)) {
						LOG.info(key);
						keyQueue.add(key);
					}
				} catch (Exception e) {
					LOG.error(e.getMessage());
				}
			}
		}
		List<String> res = new ArrayList<String>();
		res.addAll(keyQueue);
		int index = 1000;
		if(isBSF) {
			while(!keyQueue.isEmpty() && index > 0) {
				String key = keyQueue.poll();
				List<String> tempList = getItemKeyList(key);
				for(String k : tempList) {
					if(!res.contains(k)) {
						res.add(k);
						keyQueue.offer(k);
					}
				}
				index--;
			}
		}
		return res;
	}
	/**
	 * @author JiangSenwei
	 * @param Elements tags 标签元素
	 * @return List<String> 返回便签文本列表
	 * 私有方法 getTagsString
	 * 获取百度百科词条标签的文本列表 用于判断词条的范围
	 * **/
	private List<String> getTagsString(Elements tags) {
		List<String> tagsList = new ArrayList<String>();
		for(Element e : tags) {
			tagsList.add(e.text());
		}
		return tagsList;
	}
	
	/**
	 * @author JiangSenwei
	 * @param Elements basicInfo 信息标签元素
	 * @return Map<String,String> 返回信息map
	 * 私有方法 getBasicInfoMap
	 * 从包含键值的标签对中抽取出需要的信息map
	 * **/
	private Map<String,String> getBasicInfoMap(Elements basicInfo) {
		if (basicInfo.size() % 2 != 0) {
			return null;
		}
		int num = basicInfo.size();
		Map<String,String> basicInfoMap = new HashMap<String, String>();
		for (int i = 0; i < num; i++) {
			basicInfoMap.put(basicInfo.get(i).text().replaceAll(" ", ""), basicInfo.get(++i).text());
		}
		return basicInfoMap;
	}
	
	/**
	 * @author JiangSenwei
	 * @param String picPage 图册url
	 * @return List<String> 网络图片地址列表
	 * 私有方法 getBaikeImgs
	 * 从百度百科词条图册地址中爬去所有词条相关图片
	 * **/
	private List<String> getBaikeImgs(String picPage) throws Exception {
		// 解析百科图册
		// 检查源代码发现图册中每个next相册的a标签中会存有代表图册的一串字符，在后面拼接地址时有用
		// 第一个图册的这个值都为0
		String picPageURL = picPage;
		Document picPageDoc = Jsoup.connect(picPageURL).get();
		// 判断页面存在 通过百度百科抱歉html标签的类名判断
		Element noresult = picPageDoc.selectFirst(".sorryBox");
		if (noresult != null) {
			throw new Exception("百度百科页面结果为空");
		}
		
		Element nextAlbum = picPageDoc.selectFirst(".next-album");
		List<String> albumHashList = new ArrayList<String>();
		String currAlbum = "0";
		
		// 存放结果的列表
		List<String> resPicUrlList = new ArrayList<String>();
		// 遍历所有图册中的图片 因为百度百科词条图册是循环展示的，最后一个图册的下一图册是第一个图册
		// 所以这里用do-while 循环，条件是判断图册的代号有没有在albumHashList中，存在说明已经解析过了
		do {
			albumHashList.add(currAlbum);
			// 图册显示图片的URL列表，注意这里不是原图，是百度图册显示图片的地址，我们要在这个地址中获得原图地址
			List<String> picShowUrlList = new ArrayList<String>();
			// 当前图册下的原图地址列表
			List<String> picUrlList = new ArrayList<String>();
			
			Elements pics = picPageDoc.select("a.pic-item");
			for(Element e : pics) {
				picShowUrlList.add(targetURL.concat(e.attr("href")));
			}
			// 遍历图片地址获得原图地址
			for(String showPic : picShowUrlList) {
				Document picDoc = Jsoup.connect(showPic).get();
				
				Element mainImg = picDoc.getElementById("imgPicture");
				if(mainImg != null) {
					picUrlList.add(mainImg.attr("src"));
				}
			}
			resPicUrlList.addAll(picUrlList);
			
			// 寻找下一个图册 
			
			if (nextAlbum != null) {
				picPageURL = picPageURL.replace(String.format("/%s/", currAlbum), String.format("/%s/", nextAlbum.attr("data-album")));
				currAlbum = nextAlbum.attr("data-album");
				picPageDoc = Jsoup.connect(picPageURL).get();
				nextAlbum = picPageDoc.selectFirst(".next-album");
			}
		} while(!albumHashList.contains(currAlbum));
				
		for (String res : resPicUrlList) {
			LOG.info("pic url: ".concat(res));
		}
		return resPicUrlList;
	}
	
	/**
	 * @author JiangSenwei
	 * @param String name 类（目）名
	 * @return InsectClass 昆虫类class
	 * 私有方法 getClassByName
	 * 从数据库中查询满足名称的昆虫类
	 * **/
	private InsectClass getClassByName(String name) {
		InsectClass ic = new InsectClass();
		InsectClass resClass = null;
		ic.setClassName(name);
		resClass = InsectClassMapper.getInsectClassByName(ic);
		return resClass;
	}
	/**
	 * 	获得关键字页下符合条件的内链关键字
	 * 	@param String queryKey 关键字
	 * 	@return 符合条件的关键字列表
	 * 
	 * **/
	public List<String> getItemKeyList(String queryKey){ 
		String target = targetURL.concat("/item/").concat(queryKey);
		// 加载词条首页
		Document doc = null;
		try {
			doc = Jsoup.connect(target).get();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Elements aLink = doc.select("a[href]");
		List<String> keyRes = new ArrayList<String>();
		for(Element e : aLink) {
			String href = e.attr("href");
			if(href.contains("/item/") && isNeededItem(e.text())) {
				LOG.info("获得关键字：".concat(e.text()));
				keyRes.add(e.text());
			}
		}
		return keyRes;
	}
	/**
	 * 	判断关键字是否符合条件
	 * 	@param String queryKey 关键字
	 * 	@return boolean 
	 * **/
	private boolean isNeededItem(String queryKey) {
		LOG.info("正在判断关键字：".concat(queryKey));
		String target = targetURL.concat("/item/").concat(queryKey);
		Insect insect = new Insect();
		// 加载词条首页
		Document doc = null;
		try {
			doc = Jsoup.connect(target).get();
		} catch (IOException e1) {
			e1.printStackTrace();
			return false;
		}
		
		// 判断词条存在 通过百度百科抱歉html标签的类名判断
		Element noresult = doc.selectFirst(".sorryBox");
		if (noresult != null) {
			LOG.info("词条不存在");
			return false;
		}
		
		// 判断词条范围 通过百度百科词条标签的html标签的类名判断
		Elements tags = doc.select(".taglist");
		List<String> tagsStr = getTagsString(tags);
		if (!(tagsStr.contains(keyAnimal)||tagsStr.contains(keyBiological))) {
			LOG.info("词条标签不符");
			return false;
		} 
		
		//获得综述，即词条开头的描述，我想要获得的是某个昆虫的基本描述 通过标签 的类名.lemma-summary获取
		Element lemmaSummary = doc.selectFirst(".lemma-summary");
		String lemmaSummaryStr = null;
		if (lemmaSummary != null) {
			lemmaSummaryStr = lemmaSummary.text();
		}
		insect.setDescription(lemmaSummaryStr);
		
		//获得百度百科提供的基本信息
		if(doc.selectFirst(".basic-info.cmn-clearfix") == null) {
			LOG.info("词条不存在基本信息");
			return false;
		}
		Element basicInfoContainer = doc.selectFirst(".basic-info.cmn-clearfix");
		Elements basicInfo = basicInfoContainer.select("dl");
		
		// 检查发现百度百科的基本信息分为左右两个标签构成样式 我们需要的分别在这两个标签中
		Map<String, String> basicInfoMap = new HashMap<String, String>();
		for(Element e : basicInfo) {
			basicInfoMap.putAll(getBasicInfoMap(e.children()));
		}
		
		// 填充信息到昆虫类中
		
		// 种类以 目 为大类
		String reg = "[^\u4e00-\u9fa5]";
		if(basicInfoMap.get("纲") == null || !basicInfoMap.get("纲").contains("昆虫纲")) {
			LOG.info("词条不属于昆虫纲");
			return false;
		}
		LOG.info("符合条件");
		return true;
	}

}
