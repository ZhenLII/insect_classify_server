package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.entity.InsectClass;

@Mapper
public interface InsectClassMapper {

	public int insertClass(@Param("insectClass") InsectClass insectClass);
	public InsectClass getInsectClassByName(@Param("insectClass") InsectClass insectClass);
}
