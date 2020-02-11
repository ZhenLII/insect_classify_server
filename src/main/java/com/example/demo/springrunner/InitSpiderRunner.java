package com.example.demo.springrunner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.example.demo.uitils.SearchInsect;

@Component
public class InitSpiderRunner implements ApplicationRunner{

	private static final Logger LOG = LoggerFactory.getLogger(InitSpiderRunner.class);
	
	@Autowired
	private SearchInsect SearchInsect;
 
	@Override
	public void run(ApplicationArguments args) throws Exception {
//		SearchInsect.getInsectsKeyList(false);
		
	}

}
