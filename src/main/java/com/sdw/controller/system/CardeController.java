package com.sdw.controller.system;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdw.mapper.CardeMapper;
import com.sdw.mapper.UserMapper;
import com.sdw.plugin.PageView;
import com.sdw.util.Common;
import com.sdw.annotation.SystemLog;
import com.sdw.controller.index.BaseController;
import com.sdw.entity.AnalyseFormMap;
import com.sdw.entity.CardeFormMap;
import com.sdw.entity.RoleFormMap;
import com.sdw.entity.UserFormMap;

/**
 * 
 * @author songdewei 2016-05-01
 */
@Controller
@RequestMapping("/carde/")
public class CardeController extends BaseController{
	@Inject
	private CardeMapper cardeMapper;
	
	@RequestMapping("list")
	public String listUI(Model model) throws Exception {
		model.addAttribute("res", findByRes());
		return Common.BACKGROUND_PATH + "/system/carde/list";
	}
	
	@RequestMapping("addUI")
	public String addUI(Model model) throws Exception {
		return Common.BACKGROUND_PATH + "/system/carde/add";
	}
	
	@ResponseBody
	@RequestMapping("addEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity() throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		cardeMapper.addEntity(cardeFormMap);
		return "success";
	}
	
	@RequestMapping("editUI")
	public String editUI(Model model) throws Exception {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			model.addAttribute("carde", cardeMapper.findbyFrist("id", id, CardeFormMap.class));
		}
		return Common.BACKGROUND_PATH + "/system/carde/edit";
	}
	@ResponseBody
	@RequestMapping("findByDepartment")
	public List<CardeFormMap> findByDepartment() throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		String department = getPara("department");
		cardeFormMap.put("department", department);
		return  cardeMapper.findCardeByDp(cardeFormMap);
	}
	
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-修改组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity() throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		cardeMapper.editEntity(cardeFormMap);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("deleteEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="组管理-删除组")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity() throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			cardeMapper.deleteByAttribute("id", id, CardeFormMap.class);
		}
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("findByPage")
	public PageView findByPage( String pageNow,
			String pageSize,String column,String sort) throws Exception {
		CardeFormMap cardeFormMap = getFormMap(CardeFormMap.class);
		cardeFormMap=toFormMap(cardeFormMap, pageNow, pageSize,cardeFormMap.getStr("orderby"));
		cardeFormMap.put("column", column);
		cardeFormMap.put("sort", sort);
        pageView.setRecords(cardeMapper.findCardePage(cardeFormMap));//不调用默认分页,调用自已的mapper中findUserPage
        return pageView;
	}
}
