package com.sdw.mapper;

import java.util.List;

import com.sdw.mapper.base.BaseMapper;
import com.sdw.entity.RoleFormMap;

public interface RoleMapper extends BaseMapper{
	public List<RoleFormMap> seletUserRole(RoleFormMap map);
	
	public void deleteById(RoleFormMap map);
}
