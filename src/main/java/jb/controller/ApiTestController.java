package jb.controller;

import jb.absx.F;
import jb.listener.Application;
import jb.pageModel.ApiTest;
import jb.pageModel.Json;
import jb.service.ApiTestServiceI;
import jb.util.HttpPostUploadUtil;
import jb.util.HttpUtil;
import jb.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

/**
 * ApiTest管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/api/apiTestController")
public class ApiTestController extends BaseController {

	@Autowired
	private ApiTestServiceI apiTestService;

	/**
	 * 获取接口列表
	 *  @return
	 * @param name
	 */
	@RequestMapping("/apilist")
	@ResponseBody
	public Json getApiList(ApiTest apiTest) {
		Json j = new Json();
		j.success();
		j.setObj(apiTestService.getApiList(apiTest));
		return j;
	}

	/**
	 * 获取接口信息
	 *
	 * @param apiTest
	 * @return
	 */
	@RequestMapping("/apitest")
	@ResponseBody
	public ApiTest apiTest(ApiTest apiTest) {
		return apiTestService.get(apiTest.getId());
	}

	/**
	 * 添加ApiTest
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(ApiTest apiTest) {
		Json j = new Json();		
		apiTestService.add(apiTest);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 修改ApiTest
	 * 
	 * @param apiTest
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ApiTest apiTest) {
		Json j = new Json();		
		apiTestService.edit(apiTest);
		j.setObj(apiTest);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除ApiTest
	 * 
	 * @param apiTest
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(ApiTest apiTest) {
		Json j = new Json();
		apiTestService.delete(apiTest.getId());
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

	/**
	 *
	 *
	 * @param
	 * @return
	 */
	@RequestMapping("/test_api")
	@ResponseBody
	public Json testApi(String url, String method, String projectMark) {
		Json j = new Json();
		try {
			String apiUrl = "";
			if (!F.empty(projectMark)) {
				apiUrl = Application.getString(projectMark);
				apiUrl = apiUrl.endsWith("/") ? apiUrl : apiUrl + "/";
			}

			//if(!F.empty(url))
				//apiUrl += new String(url.getBytes("GBK"), "UTF-8");
			apiUrl += url;
			String[] str = apiUrl.split("[?]");

			if (HttpUtil.POST.equals(method)) j.setObj(WebUtils.doPost(str[0], str.length == 1 ? null : str[1], null,"UTF-8",3000,3000,null));
			else if (HttpUtil.GET.equals(method)) j.setObj(HttpUtil.doGet(apiUrl));

			j.success();
		} catch (Exception e) {
			j.fail();
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/photo_upload")
	@ResponseBody
	public Json photo_upload(String url, String sid, String uid, String language, String projectMark, String type, @RequestParam MultipartFile photo) {
		Json j = new Json();
		try {
			if(photo != null) {
				String apiUrl = "";
				if (!F.empty(projectMark)) {
					apiUrl = Application.getString(projectMark);
					apiUrl = apiUrl.endsWith("/") ? apiUrl : apiUrl + "/";
				}

				if(!F.empty(url))
					apiUrl += new String(url.getBytes("GBK"), "UTF-8");

				Map<String, String> textMap = new HashMap<String, String>();
				textMap.put("sid", sid);
				textMap.put("uid", uid);
				textMap.put("language", language);
				textMap.put("type", type);
				Map<String, MultipartFile> fileMap = new HashMap<String, MultipartFile>();
				fileMap.put("photo", photo);
				String result = HttpPostUploadUtil.formUpload(apiUrl, textMap, fileMap);
				if(!F.empty(result)) {
					j.success();
					j.setObj(result);
				} else {
					j.fail();
					j.setMsg("图片上传失败");
				}
			}
		} catch (Exception e) {
			j.fail();
			j.setMsg(e.getMessage());
		}
		return j;
	}

}
