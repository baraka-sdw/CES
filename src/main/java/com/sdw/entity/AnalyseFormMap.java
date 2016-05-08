package com.sdw.entity;

import com.sdw.util.FormMap;
import com.sdw.annotation.TableSeg;

/**
 * analyse分析实体表
 */
@TableSeg(tableName = "collect", id="id")
public class AnalyseFormMap extends FormMap<String,Object>{
	private static final long serialVersionUID = 1L;
}
