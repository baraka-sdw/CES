package com.sdw.controller.system;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.controller.index.BaseController;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.EvaluateFormMap;
import com.sdw.entity.TargetFormMap;
import com.sdw.mapper.CardeMapper;
import com.sdw.mapper.EvaluateMapper;
import com.sdw.mapper.TargetMapper;
import com.sdw.util.Common;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/question/")
public class QuestionController extends BaseController{
	@Inject
	private TargetMapper targetMapper;
	@Inject
	private CardeMapper cardeMapper;
	@Inject
	private EvaluateMapper evaluateMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		TargetFormMap targetOneFormMap = getFormMap(TargetFormMap.class);
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		EvaluateFormMap  evaluateFormMap= getFormMap(EvaluateFormMap.class);
		model.addAttribute("target",  targetMapper.findTarget(targetOneFormMap));
		model.addAttribute("carde",  cardeMapper.findCarde(cardeFormMap));
		model.addAttribute("evaluate",  evaluateMapper.findEvaluate(evaluateFormMap));
		return Common.BACKGROUND_PATH + "/system/question/question2";
	}
	
	@ResponseBody
	@RequestMapping("findById")
	public TargetFormMap findById() throws Exception {
		String id = getPara("target");
		return  targetMapper.findbyFrist("id", id, TargetFormMap.class);
	}

}
