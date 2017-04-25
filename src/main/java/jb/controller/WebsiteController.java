package jb.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.absx.F;
import jb.listener.Application;
import jb.pageModel.BaseData;
import jb.pageModel.DataGrid;
import jb.pageModel.MenuDesc;
import jb.pageModel.PageHelper;
import jb.pageModel.WebsiteData;
import jb.service.BasedataServiceI;
import jb.service.WebsiteDataServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

/**
 * WebsiteData管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/websiteController")
public class WebsiteController extends BaseController {
	
	private static final String DATA_TYPE = "MU";
	private static final String STATUS_01 = "ST01";
	public static Gson gson = new Gson();

	@Autowired
	private WebsiteDataServiceI websiteDataService;
	
	@Autowired
	private BasedataServiceI basedataService;
	
	@RequestMapping("/mb")
	public String mb(String url, HttpServletRequest request) {
    	request.setAttribute("url", url);
		return "/web/mb";
	}

	@RequestMapping("/menu")
	public String menu(String menuId, HttpServletRequest request) {
		BaseData baseData = new BaseData();
		baseData.setBasetypeCode(DATA_TYPE);
		List<BaseData> data = basedataService.getBaseDatas(baseData);
		Iterator<BaseData> iterator = data.iterator();
		while(iterator.hasNext()) {
			BaseData d = iterator.next();
			if(!F.empty(d.getDescription())) {
				MenuDesc md = gson.fromJson(d.getDescription(), MenuDesc.class);
				if(md.getStatus() == 1) {
					d.setMenuDesc(md);
				} else {
					iterator.remove();
				}
			}
		}
    	request.setAttribute("menuList", data);
    	request.setAttribute("menuId", menuId);
		return "/web/menu";
	}
	
	@RequestMapping("/showMenu")
	public String showMenu(String menuId, int type, String dataType, String dataId, HttpServletRequest request) {
		
		if(!F.empty(dataType)) {
			WebsiteData websiteData = new WebsiteData();
			websiteData.setType(dataType);
			websiteData.setStatus(STATUS_01);
			request.setAttribute("data", websiteDataService.getList(websiteData));
			
			BaseData leftMenu = Application.get(dataType);
			MenuDesc menuDesc = gson.fromJson(leftMenu.getDescription(), MenuDesc.class);
			leftMenu.setMenuDesc(menuDesc);
			request.setAttribute("leftMenu", leftMenu);
		} else {
			BaseData baseData = new BaseData();
			baseData.setBasetypeCode(DATA_TYPE);
			baseData.setPid(menuId);
			List<BaseData> data = basedataService.getBaseDatas(baseData);
			Iterator<BaseData> iterator = data.iterator();
			while(iterator.hasNext()) {
				BaseData d = iterator.next();
				if(!F.empty(d.getDescription())) {
					MenuDesc md = gson.fromJson(d.getDescription(), MenuDesc.class);
					if(md.getStatus() == -1) {
						iterator.remove();
					} else {
						d.setMenuDesc(md);
					}
				}
			}
	 		request.setAttribute("data", data);
		}
		
		request.setAttribute("menuId", menuId);
		BaseData menu = Application.get(menuId);
		MenuDesc menuDesc = gson.fromJson(menu.getDescription(), MenuDesc.class);
		menu.setMenuDesc(menuDesc);
		request.setAttribute("menu", menu);
		
		if(!F.empty(dataId)) request.setAttribute("dataId", dataId);
		
		String returnUrl = null;
		if(type == 1) returnUrl = "/web/mb_1";
		else if(type == 2) returnUrl = "/web/mb_2";
		else if(type == 3) returnUrl = "/web/mb_3";
		else returnUrl = "/web/index";
		
		return returnUrl;
	}
	
	@RequestMapping("/case_list")
	public String case_list(PageHelper ph, WebsiteData websiteData, HttpServletRequest request) {
		ph.setPage(1);
		ph.setRows(Integer.valueOf(Application.getString("SV100")));
		ph.setSort("seq asc, t.addtime");
		ph.setOrder("desc");
		websiteData.setStatus(STATUS_01);
		DataGrid dg = websiteDataService.dataGrid(websiteData, ph);
		request.setAttribute("caseList", dg.getRows());
		return "/web/caselist";
	}
	
	@RequestMapping("/show_case")
	public String show_case(String menuId, HttpServletRequest request) {
		BaseData baseData = new BaseData();
		baseData.setBasetypeCode(DATA_TYPE);
		baseData.setPid(menuId);
		List<BaseData> data = basedataService.getBaseDatas(baseData);
		Iterator<BaseData> iterator = data.iterator();
		while(iterator.hasNext()) {
			BaseData d = iterator.next();
			if(!F.empty(d.getDescription())) {
				MenuDesc md = gson.fromJson(d.getDescription(), MenuDesc.class);
				if(md.getStatus() == -1) {
					iterator.remove();
				} else {
					d.setMenuDesc(md);
				}
			}
		}
 		request.setAttribute("data", data);
		
		return "/web/showCase";
	}
	
	@RequestMapping("/detail")
	public String detail(WebsiteData websiteData, HttpServletRequest request) {
		websiteData.setStatus(STATUS_01);
		List<WebsiteData> list = websiteDataService.getList(websiteData);
		if(list != null && list.size() > 0) {
			websiteData = list.get(0);
		}
		request.setAttribute("data", websiteData);
		return "/web/detail";
	}

}
