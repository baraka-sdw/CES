package com.sdw.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.CollectFormMap;
import com.sdw.entity.EvaluateFormMap;
import com.sdw.entity.TargetFormMap;
import com.sdw.mapper.CardeMapper;
import com.sdw.mapper.CollectMapper;
import com.sdw.mapper.EvaluateMapper;
import com.sdw.mapper.TargetMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;

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
	
	@RequestMapping("list2")
	public String list2UI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/collect/list2";
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
		List<CollectFormMap> cardeFormMap =new ArrayList<CollectFormMap>();
		String weight1 = getPara("collectFormMap.weight1");
		String weight2 = getPara("collectFormMap.weight2");
		String weight3 = getPara("collectFormMap.weight3");
		String weight4 = getPara("collectFormMap.weight4");
		String weight5 = getPara("collectFormMap.weight5");
		String weight6 = getPara("collectFormMap.weight6");
		String weight7 = getPara("collectFormMap.weight7");
		String weight8 = getPara("collectFormMap.weight8");
		String weight9 = getPara("collectFormMap.weight9");
		String weight10 = getPara("collectFormMap.weight10");
		String[] carde = getParaValues("collectFormMap.cardename");
		String target = getPara("collectFormMap.target");
		String evaluate = getPara("collectFormMap.evaluate");
		String[] target1 = getParaValues("collectFormMap.target1");
		String[] target2 = getParaValues("collectFormMap.target2");
		String[] target3 = getParaValues("collectFormMap.target3");
		String[] target4 = getParaValues("collectFormMap.target4");
		String[] target5 = getParaValues("collectFormMap.target5");
		String[] target6 = getParaValues("collectFormMap.target6");
		String[] target7 = getParaValues("collectFormMap.target7");
		String[] target8 = getParaValues("collectFormMap.target8");
		String[] target9 = getParaValues("collectFormMap.target9");
		String[] target10= getParaValues("collectFormMap.target10");
		for (int i = 0; i < target1.length; i++) {
			CollectFormMap collect=new CollectFormMap();
			collect.set("weight1", weight1);
			collect.set("weight2", weight2);
			collect.set("weight3", weight3);
			collect.set("weight4", weight4);
			collect.set("weight5", weight5);
			collect.set("weight6", weight6);
			collect.set("weight7", weight7);
			collect.set("weight8", weight8);
			collect.set("weight9", weight9);
			collect.set("weight10", weight10);
			collect.set("carde", carde[i]);
			collect.set("target", target);
			collect.set("evaluate", evaluate);
			collect.set("target1", target1[i]);
			collect.set("target2", target2[i]);
			collect.set("target3", target3[i]);
			collect.set("target4", target4[i]);
			collect.set("target5", target5[i]);
			collect.set("target6", target6[i]);
			collect.set("target7", target7[i]);
			collect.set("target8", target8[i]);
			collect.set("target9", target9[i]);
			collect.set("target10", target10[i]);
			cardeFormMap.add(collect);
		}
		collectMapper.batchSave(cardeFormMap);
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
