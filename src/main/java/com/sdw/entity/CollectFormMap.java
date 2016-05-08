package com.sdw.entity;

import com.sdw.util.FormMap;
import com.sdw.annotation.TableSeg;

/**
 * collect数据采集实体表
 */
@TableSeg(tableName = "collect", id="id")
public class CollectFormMap extends FormMap<String,Object>{
	private static final long serialVersionUID = 1L;
}
