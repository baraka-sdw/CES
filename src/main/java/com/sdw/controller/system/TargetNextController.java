package com.sdw.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.TargetFormMap;
import com.sdw.entity.TargetNextFormMap;
import com.sdw.entity.TargetOneFormMap;
import com.sdw.mapper.TargetNextMapper;
import com.sdw.mapper.TargetOneMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/targetnext/")
public class TargetNextController extends BaseController{
	@Inject
	private TargetNextMapper targetnextMapper;
	@Inject
	private TargetOneMapper targetOneMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/targetnext/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		model.addAttribute("targetone",  targetOneMapper.findTargetOne(targetOneFormMap));
		return Common.BACKGROUND_PATH + "/system/targetnext/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		TargetNextFormMap targetNextFormMap = getFormMap(TargetNextFormMap.class);
		targetnextMapper.addEntity(targetNextFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findTargetNextByTargetName")
	public TargetNextFormMap findTargetNextByTargetName() throws Exception {
		TargetNextFormMap targetNextFormMap = getFormMap(TargetNextFormMap.class);
		String targetName = getPara("targetName");
		targetNextFormMap.put("targetName", targetName);
		return targetnextMapper.findTargetNextByTargetName(targetNextFormMap);
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		model.addAttribute("targetone",  targetOneMapper.findTargetOne(targetOneFormMap));
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("targetnext", targetnextMapper.findbyFrist("id", id, TargetNextFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/targetnext/edit";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		TargetNextFormMap targetNextFormMap = getFormMap(TargetNextFormMap.class);
		targetnextMapper.editEntity(targetNextFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			targetnextMapper.deleteByAttribute("id", id, TargetNextFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		TargetNextFormMap targeNexttFormMap = getFormMap(TargetNextFormMap.class);
		targeNexttFormMap=toFormMap(targeNexttFormMap, pageNow, pageSize,targeNexttFormMap.getStr("orderby"));
		targeNexttFormMap.put("column", column);
		targeNexttFormMap.put("sort", sort);
        pageView.setRecords(targetnextMapper.findTargetNextPage(targeNexttFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
