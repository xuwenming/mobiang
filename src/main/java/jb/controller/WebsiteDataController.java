package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.WebsiteData;
import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.WebsiteDataServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

/**
 * WebsiteData管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/websiteDataController")
public class WebsiteDataController extends BaseController {

	@Autowired
	private WebsiteDataServiceI websiteDataService;


	/**
	 * 跳转到WebsiteData管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/websitedata/websiteData";
	}

	/**
	 * 获取WebsiteData数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(WebsiteData websiteData, PageHelper ph) {
		return websiteDataService.dataGrid(websiteData, ph);
	}
	/**
	 * 获取WebsiteData数据表格excel
	 * 
	 * @param user
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * @throws IOException 
	 */
	@RequestMapping("/download")
	public void download(WebsiteData websiteData, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(websiteData,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加WebsiteData页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		WebsiteData websiteData = new WebsiteData();
		websiteData.setId(UUID.randomUUID().toString());
		return "/websitedata/websiteDataAdd";
	}

	/**
	 * 添加WebsiteData
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(WebsiteData websiteData, @RequestParam(required=false) MultipartFile iconFile, HttpServletRequest request) {
		Json j = new Json();		
		websiteData.setIcon(uploadFile(request, "store/" + websiteData.getType(), iconFile, "website"));
		websiteDataService.add(websiteData);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到WebsiteData查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, String id) {
		WebsiteData websiteData = websiteDataService.get(id);
		request.setAttribute("websiteData", websiteData);
		return "/websitedata/websiteDataView";
	}

	/**
	 * 跳转到WebsiteData修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		WebsiteData websiteData = websiteDataService.get(id);
		request.setAttribute("websiteData", websiteData);
		return "/websitedata/websiteDataEdit";
	}

	/**
	 * 修改WebsiteData
	 * 
	 * @param websiteData
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(WebsiteData websiteData, @RequestParam(required=false) MultipartFile iconFile, HttpServletRequest request) {
		Json j = new Json();		
		websiteData.setIcon(uploadFile(request, "store/" + websiteData.getType(), iconFile, "website"));
		websiteDataService.edit(websiteData);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除WebsiteData
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		websiteDataService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
