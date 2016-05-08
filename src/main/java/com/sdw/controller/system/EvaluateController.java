package com.sdw.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.CardeMapper;
import com.sdw.mapper.EvaluateMapper;
import com.sdw.mapper.TargetMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.EvaluateFormMap;
import com.sdw.entity.TargetFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/evaluate/")
public class EvaluateController extends BaseController{
	@Inject
	private EvaluateMapper evaluateMapper;
	@Inject
	private TargetMapper targetMapper;
	@Inject
	private CardeMapper cardeMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/evaluate/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		model.addAttribute("target", targetMapper.findTarget(targetFormMap));
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		model.addAttribute("carde", cardeMapper.findCarde(cardeFormMap));
		return Common.BACKGROUND_PATH + "/system/evaluate/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		EvaluateFormMap evaluateFormMap = getFormMap(EvaluateFormMap.class);
		evaluateMapper.addEntity(evaluateFormMap);
		return "success";
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		model.addAttribute("target", targetMapper.findTarget(targetFormMap));
//		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
//		model.addAttribute("carde", cardeMapper.findCarde(cardeFormMap));
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("evaluate", evaluateMapper.findbyFrist("id", id, EvaluateFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/evaluate/edit";
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		EvaluateFormMap cardeFormMap = getFormMap(EvaluateFormMap.class);
		evaluateMapper.editEntity(cardeFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			evaluateMapper.deleteByAttribute("id", id, EvaluateFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		EvaluateFormMap evaluateFormMap = getFormMap(EvaluateFormMap.class);
		evaluateFormMap=toFormMap(evaluateFormMap, pageNow, pageSize,evaluateFormMap.getStr("orderby"));
		evaluateFormMap.put("column", column);
		evaluateFormMap.put("sort", sort);
        pageView.setRecords(evaluateMapper.findEvaluatePage(evaluateFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
