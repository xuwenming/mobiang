package jb.service;

import java.util.List;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.pageModel.WebsiteData;

/**
 * 
 * @author John
 * 
 */
public interface WebsiteDataServiceI {

	/**
	 * 获取WebsiteData数据表格
	 * 
	 * @param websiteData
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(WebsiteData websiteData, PageHelper ph);

	/**
	 * 添加WebsiteData
	 * 
	 * @param websiteData
	 */
	public void add(WebsiteData websiteData);

	/**
	 * 获得WebsiteData对象
	 * 
	 * @param id
	 * @return
	 */
	public WebsiteData get(String id);

	/**
	 * 修改WebsiteData
	 * 
	 * @param websiteData
	 */
	public void edit(WebsiteData websiteData);

	/**
	 * 删除WebsiteData
	 * 
	 * @param id
	 */
	public void delete(String id);
	
	public List<WebsiteData> getList(WebsiteData websiteData);

}
