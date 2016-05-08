package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.AnalyseFormMap;

public interface AnalyseMapper extends BaseMapper{
	public List<AnalyseFormMap> findCollectPage(AnalyseFormMap analyseFormMap);
	public List<AnalyseFormMap> findCollect(AnalyseFormMap analyseFormMap);
}
