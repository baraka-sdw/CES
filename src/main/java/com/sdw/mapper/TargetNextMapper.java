package com.sdw.mapper;

import java.util.List;

import com.sdw.entity.TargetFormMap;
import com.sdw.entity.TargetNextFormMap;
import com.sdw.mapper.base.BaseMapper;

public interface TargetNextMapper extends BaseMapper{
	public List<TargetFormMap> findTargetNextPage(TargetNextFormMap targetNextFormMap);
//	public List<TargetFormMap> findTargetNext(TargetFormMap indexFormMap);
}
