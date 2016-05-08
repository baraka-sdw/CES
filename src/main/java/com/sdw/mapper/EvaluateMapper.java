package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.EvaluateFormMap;
import com.sdw.entity.TargetFormMap;
import com.sdw.entity.UserFormMap;

public interface EvaluateMapper extends BaseMapper{
	public List<EvaluateFormMap> findEvaluatePage(EvaluateFormMap cardeFormMap);
	public List<EvaluateFormMap> findEvaluate(EvaluateFormMap cardeFormMap);
}
