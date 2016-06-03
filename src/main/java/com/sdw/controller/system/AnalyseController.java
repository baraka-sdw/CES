package com.sdw.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.AnalyseMapper;
import com.sdw.mapper.TargetMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.AnalyseFormMap;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.TargetFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/analyse/")
public class AnalyseController extends BaseController{
	@Inject
	private AnalyseMapper analyseMapper;
	@Inject
	private TargetMapper  targetMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		TargetFormMap targetFormMap = getFormMap(TargetFormMap.class);
		model.addAttribute("target",  targetMapper.findTarget(targetFormMap));
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/analyse/list";
	}

	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/analyse/add";
	}
	
	@ResponseBody
	@RequestMapping("findCollect")
	public List<AnalyseFormMap> findCollect() throws Exception {
		AnalyseFormMap analyseFormMap = getFormMap(AnalyseFormMap.class);
		String question_name=getPara("question_name");
		analyseFormMap.put("question_name", question_name);
        return  analyseMapper.findCollect(analyseFormMap);
	}

	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		AnalyseFormMap analyseFormMap = getFormMap(AnalyseFormMap.class);
		analyseFormMap=toFormMap(analyseFormMap, pageNow, pageSize,analyseFormMap.getStr("orderby"));
		analyseFormMap.put("column", column);
		analyseFormMap.put("sort", sort);
        pageView.setRecords(analyseMapper.findCollectPage(analyseFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
