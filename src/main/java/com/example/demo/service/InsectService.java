package com.example.demo.service;

import java.util.List;
import java.util.concurrent.Future;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Insect;
import com.example.demo.entity.InsectClass;
import com.example.demo.uitils.ResHelper;

public interface InsectService {
	public List<Insect> getList(int limit, int offset, String query);
	public String upload(MultipartFile file);
	public ResHelper<Insect> internetSearch(String key);
	public Future<ResHelper<List<Insect>>> spiderForInsects();
	public Future<ResHelper<Object>> buildDBfromSpider();
	public InsectClass getClassByName(String name);
	public ResHelper<Object> insertInsectClass(String className);
	public ResHelper<Object> classify(MultipartFile file);
	public Insect getInsectById(String insectId);
}
