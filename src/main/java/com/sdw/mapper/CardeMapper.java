package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.UserFormMap;

public interface CardeMapper extends BaseMapper{
	public List<CardeFormMap> findCardePage(CardeFormMap cardeFormMap);
	public List<CardeFormMap> findCarde(CardeFormMap cardeFormMap);
}
