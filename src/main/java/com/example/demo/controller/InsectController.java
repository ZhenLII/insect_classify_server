package com.example.demo.controller;


import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Insect;
import com.example.demo.entity.InsectClass;
import com.example.demo.service.InsectService;
import com.example.demo.uitils.ResHelper;


@RestController
@RequestMapping("/insect")
public class InsectController {
	@Autowired
	public InsectService InsectService;
	
	@RequestMapping("/list")
	public ResHelper<List<Insect>> getList(@RequestParam int limit, @RequestParam int offset, @RequestParam String query) {
		ResHelper<List<Insect>> res = new ResHelper<List<Insect>>();
		try {
			List<Insect> insects = InsectService.getList(limit, offset, query);
			res.success();
			res.setData(insects);
		} catch (Exception e) {
			res.error(e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
//	@RequestMapping("file-upload")
//	public ResHelper<Object> upload(@RequestParam("file") MultipartFile file) {
//		ResHelper<Object> res = InsectService.upload(file);
//		return res;
//
//	}
	
	@RequestMapping("internet-search")
	public ResHelper<Insect> internetSearch(@RequestParam("query") String query) {
		return InsectService.internetSearch(query);
	}
	
	@RequestMapping("internet-spider-insects")
	public ResHelper<List<Insect>> getInternetInsects(){
		ResHelper<List<Insect>> res = new ResHelper<List<Insect>>();
		try {
			res = InsectService.spiderForInsects().get(1000, TimeUnit.SECONDS);
		} catch (InterruptedException | ExecutionException | TimeoutException e) {
			res.error(e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	@RequestMapping("internet-database-build")
	public ResHelper<Object> buildDBfromSpider(){
		ResHelper<Object> res = new ResHelper<Object>();
		try {
			res = InsectService.buildDBfromSpider().get(1000, TimeUnit.SECONDS);
		} catch (InterruptedException | ExecutionException | TimeoutException e) {
			res.error(e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping("insect-class")
	public ResHelper<InsectClass> getClassByName(@RequestParam("className") String className) {
		ResHelper<InsectClass> res = new ResHelper<InsectClass>();
		try {
			InsectClass resInsectClass = InsectService.getClassByName(className);
			res.setData(resInsectClass);
			res.success();
		} catch(Exception e) {
			res.error(e.getMessage());
			e.printStackTrace();
		}
		return res;
	}
	
	@RequestMapping("post-insect-class")
	public ResHelper<Object> insertInsectClass(@RequestParam("className") String className) {
		return InsectService.insertInsectClass(className);
	}
	@RequestMapping("classify")
	public ResHelper<Object> classify(@RequestParam("file") MultipartFile file) {
        ResHelper<Object> res = InsectService.classify(file);
        return res;
	}
	@RequestMapping("insect")
	public ResHelper<Insect> getInsectById(@RequestParam("insectId") String insectId) {
		ResHelper<Insect> res = new ResHelper<>();
		res.setData(InsectService.getInsectById(insectId));
		res.success();
		return res;
	}
}
