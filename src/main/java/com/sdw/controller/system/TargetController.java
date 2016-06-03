package com.sdw.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.TargetMapper;
import com.sdw.mapper.TargetNextMapper;
import com.sdw.mapper.TargetOneMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.TargetFormMap;
import com.sdw.entity.TargetNextFormMap;
import com.sdw.entity.TargetOneFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/target/")
public class TargetController extends BaseController{
	@Inject
	private TargetMapper targetMapper;
	@Inject
	private TargetOneMapper targetOneMapper;
	@Inject
	private TargetNextMapper targetNextMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/target/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		TargetNextFormMap targetNextFormMap1 = getFormMap(TargetNextFormMap.class);
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		List<TargetOneFormMap> list=targetOneMapper.findTargetOne(targetOneFormMap);
		List target=new ArrayList();
		for (TargetOneFormMap targetOneFormMap2 : list) {
			targetNextFormMap1.put("target", targetOneFormMap2.getInt("id"));
			List<TargetNextFormMap> targetnext=targetNextMapper.findTargetNextByTarget(targetNextFormMap1);
			target.add(targetnext);
		}
		model.addAttribute("targetone",  targetOneMapper.findTargetOne(targetOneFormMap));
		model.addAttribute("targetnext", target);
		return Common.BACKGROUND_PATH + "/system/target/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		targetMapper.addEntity(targetFormMap);
		return "success";
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		TargetNextFormMap targetNextFormMap = getFormMap(TargetNextFormMap.class);
		TargetOneFormMap targetOneFormMap = getFormMap(TargetOneFormMap.class);
		model.addAttribute("targetone",  targetOneMapper.findTargetOne(targetOneFormMap));
		model.addAttribute("targetnext",  targetNextMapper.findTargetNext(targetNextFormMap));
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("target", targetMapper.findbyFrist("id", id, TargetFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/target/edit";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		TargetFormMap cardeFormMap = getFormMap(TargetFormMap.class);
		targetMapper.editEntity(cardeFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			targetMapper.deleteByAttribute("id", id, TargetFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		targetFormMap=toFormMap(targetFormMap, pageNow, pageSize,targetFormMap.getStr("orderby"));
		targetFormMap.put("column", column);
		targetFormMap.put("sort", sort);
        pageView.setRecords(targetMapper.findTargetPage(targetFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
