package com.sdw.entity;

import com.sdw.util.FormMap;
import com.sdw.annotation.TableSeg;

/**
 * index指标实体表
 */
@TableSeg(tableName = "target", id="id")
public class TargetFormMap extends FormMap<String,Object>{
	private static final long serialVersionUID = 1L;
}
