package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.CollectFormMap;

public interface CollectMapper extends BaseMapper{
	public List<CardeFormMap> findCollectPage(CollectFormMap collectFormMap);
//	public List<CardeFormMap> findCarde(CollectFormMap collectFormMap);
}
