package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.TargetFormMap;
import com.sdw.entity.UserFormMap;

public interface TargetMapper extends BaseMapper{
	public List<TargetFormMap> findTargetPage(TargetFormMap indexFormMap);
	public List<TargetFormMap> findTarget(TargetFormMap indexFormMap);
}
