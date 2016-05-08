package com.sdw.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.CardeMapper;
import com.sdw.mapper.CollectMapper;
import com.sdw.mapper.EvaluateMapper;
import com.sdw.mapper.TargetMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.CollectFormMap;
import com.sdw.entity.EvaluateFormMap;
import com.sdw.entity.TargetFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/collect/")
public class CollectController extends BaseController{
	@Inject
	private CollectMapper collectMapper;
	@Inject
	private EvaluateMapper evaluateMapper;
	@Inject
	private TargetMapper  targetMapper;
	@Inject
	private CardeMapper cardeMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/collect/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		EvaluateFormMap evaluateFormMap = getFormMap(EvaluateFormMap.class);
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		model.addAttribute("carde", cardeMapper.findCarde(cardeFormMap));
		model.addAttribute("evaluate",  evaluateMapper.findEvaluate(evaluateFormMap));
		model.addAttribute("target",  targetMapper.findTarget(targetFormMap));
		return Common.BACKGROUND_PATH + "/system/collect/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		CollectFormMap cardeFormMap = getFormMap(CollectFormMap.class);
		collectMapper.addEntity(cardeFormMap);
		return "success";
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		EvaluateFormMap evaluateFormMap = getFormMap(EvaluateFormMap.class);
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		model.addAttribute("carde", cardeMapper.findCarde(cardeFormMap));
		model.addAttribute("evaluate",  evaluateMapper.findEvaluate(evaluateFormMap));
		model.addAttribute("target",  targetMapper.findTarget(targetFormMap));
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("collect", collectMapper.findbyFrist("id", id, CollectFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/collect/edit";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		CollectFormMap cardeFormMap = getFormMap(CollectFormMap.class);
		collectMapper.editEntity(cardeFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			collectMapper.deleteByAttribute("id", id, CollectFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		CollectFormMap cardeFormMap = getFormMap(CollectFormMap.class);
		cardeFormMap=toFormMap(cardeFormMap, pageNow, pageSize,cardeFormMap.getStr("orderby"));
		cardeFormMap.put("column", column);
		cardeFormMap.put("sort", sort);
        pageView.setRecords(collectMapper.findCollectPage(cardeFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
