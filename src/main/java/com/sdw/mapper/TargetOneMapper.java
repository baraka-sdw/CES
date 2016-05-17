package com.sdw.mapper;

import java.util.List;

import com.sdw.entity.TargetFormMap;
import com.sdw.entity.TargetOneFormMap;
import com.sdw.mapper.base.BaseMapper;

public interface TargetOneMapper extends BaseMapper{
	public List<TargetOneFormMap> findTargetOnePage(TargetOneFormMap targetOneFormMap);
	public List<TargetOneFormMap> findTargetOne(TargetOneFormMap targetOneFormMap);
}
