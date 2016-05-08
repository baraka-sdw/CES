package com.sdw.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.AnalyseMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.AnalyseFormMap;
import com.sdw.entity.CardeFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/analyse/")
public class AnalyseController extends BaseController{
	@Inject
	private AnalyseMapper analyseMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
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
