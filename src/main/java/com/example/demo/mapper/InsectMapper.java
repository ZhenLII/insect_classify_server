package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.entity.Insect;

@Mapper
public interface InsectMapper {

	public List<Insect> getList(@Param("limit") int limit, @Param("offset") int offset, @Param("query") String query);
	public int insertInsect(@Param("insect") Insect insect);
	public Insect getInsectById(@Param("insectId") int insectId);
}
