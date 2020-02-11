package com.example.demo.uitils;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.example.demo.entity.Insect;

@Component
public class PictureUtils {
	
	private static final Logger LOG = LoggerFactory.getLogger(PictureUtils.class);
	
	private static final String INSECT_PIC_FOLDER = "insect/";
	
	
	public PictureUtils () {
		File rootDir = new File(INSECT_PIC_FOLDER);
		if (!rootDir.exists()) {
            rootDir.mkdirs();
        }
	}
	public String loadInsectPic(Insect insect, List<String> picUrlList) {
		if(insect.getOrder() == null) {
			return null;
		}
		StringBuffer targetFolderBuff = new StringBuffer(insect.getOrder().concat("/"));
		if(insect.getFamily() == null) {
			targetFolderBuff.append("unKnowFamily").append("/");
		} else {
			targetFolderBuff.append(insect.getFamily()).append("/");
		}
		if(insect.getGenus() == null) {
			targetFolderBuff.append("unKnowGenus").append("/");
		} else {
			targetFolderBuff.append(insect.getGenus()).append("/");
		}
		targetFolderBuff.append(insect.getInsectName()).append("/");
		// 若一切正常 路径为 insect/order/family/genus/insectName/
		String targetDir = INSECT_PIC_FOLDER + targetFolderBuff.toString();
		File insectDir = new File(targetDir);
		if(!insectDir.exists()) {
			insectDir.mkdirs();
		}
		String insectName = insect.getInsectName();
		int index = 1;
		for(String url : picUrlList) {
			String targetPicPath = targetDir.concat(insectName).concat(String.format("%03d", index)).concat(".jpg");
			URL targetPicurl;
			try {
				targetPicurl = new URL(url);
				DataInputStream dataInputStream = new DataInputStream(targetPicurl.openStream());
				FileOutputStream fileOutputStream = new FileOutputStream(new File(targetPicPath));
				ByteArrayOutputStream output = new ByteArrayOutputStream();
	            byte[] buffer = new byte[1024];
	            int length;
	            while ((length = dataInputStream.read(buffer)) > 0) {
	                output.write(buffer, 0, length);
	            }
	            fileOutputStream.write(output.toByteArray());
	            LOG.info("GET IMAGE ".concat(targetPicPath));
	            dataInputStream.close();
	            fileOutputStream.close();
			} catch (MalformedURLException e) {
				LOG.error(e.getMessage());
			} catch (IOException e) {
				LOG.error(e.getMessage());
			}
			index++;
		}
		
		return targetDir;
	}
	
}
