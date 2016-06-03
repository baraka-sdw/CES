package com.sdw.mapper;

import java.util.List;

import com.sdw.entity.TargetFormMap;
import com.sdw.entity.TargetNextFormMap;
import com.sdw.mapper.base.BaseMapper;

public interface TargetNextMapper extends BaseMapper{
	public List<TargetNextFormMap> findTargetNextPage(TargetNextFormMap targetNextFormMap);
	public List<TargetNextFormMap> findTargetNext(TargetNextFormMap targetNextFormMap);
	public  List<TargetNextFormMap> findTargetNextByTarget(TargetNextFormMap targetNextFormMap);
	public  TargetNextFormMap findTargetNextByTargetName(TargetNextFormMap targetNextFormMap);
	
}
