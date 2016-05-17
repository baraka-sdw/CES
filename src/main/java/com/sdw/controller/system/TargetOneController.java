package com.sdw.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.TargetOneFormMap;
import com.sdw.mapper.TargetOneMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/targetone/")
public class TargetOneController extends BaseController{
	@Inject
	private TargetOneMapper targetOneMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/targetone/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/targetone/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		targetOneMapper.addEntity(targetOneFormMap);
		return "success";
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("targetone", targetOneMapper.findbyFrist("id", id, TargetOneFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/targetone/edit";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		targetOneMapper.editEntity(targetOneFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			targetOneMapper.deleteByAttribute("id", id, TargetOneFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		TargetOneFormMap targeOneFormMap = getFormMap(TargetOneFormMap.class);
		targeOneFormMap=toFormMap(targeOneFormMap, pageNow, pageSize,targeOneFormMap.getStr("orderby"));
		targeOneFormMap.put("column", column);
		targeOneFormMap.put("sort", sort);
        pageView.setRecords(targetOneMapper.findTargetOnePage(targeOneFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
