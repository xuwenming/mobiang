package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.WebsiteDataDaoI;
import jb.model.TwebsiteData;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.pageModel.WebsiteData;
import jb.service.WebsiteDataServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebsiteDataServiceImpl extends BaseServiceImpl<WebsiteData> implements WebsiteDataServiceI {

	@Autowired
	private WebsiteDataDaoI websiteDataDao;

	@Override
	public DataGrid dataGrid(WebsiteData websiteData, PageHelper ph) {
		List<WebsiteData> ol = new ArrayList<WebsiteData>();
		String hql = " from TwebsiteData t ";
		DataGrid dg = dataGridQuery(hql, ph, websiteData, websiteDataDao);
		@SuppressWarnings("unchecked")
		List<TwebsiteData> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TwebsiteData t : l) {
				WebsiteData o = new WebsiteData();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	
	@Override
	public List<WebsiteData> getList(WebsiteData websiteData) {
		List<WebsiteData> ol = new ArrayList<WebsiteData>();
		String hql = " from TwebsiteData t ";
		Map<String, Object> params = new HashMap<String, Object>();
		String where = whereHql(websiteData, params);
		List<TwebsiteData> l = websiteDataDao.find(hql  + where + " order by t.seq asc, t.addtime desc", params);
		if (l != null && l.size() > 0) {
			for (TwebsiteData t : l) {
				WebsiteData o = new WebsiteData();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		
		return ol;
	}
	

	protected String whereHql(WebsiteData websiteData, Map<String, Object> params) {
		String whereHql = "";	
		if (websiteData != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(websiteData.getTitle())) {
				whereHql += " and t.title like :title";
				params.put("title", "%%" + websiteData.getTitle() + "%%");
			}		
			if (!F.empty(websiteData.getMenu())) {
				whereHql += " and t.menu = :menu";
				params.put("menu", websiteData.getMenu());
			}		
			if (!F.empty(websiteData.getType())) {
				whereHql += " and t.type = :type";
				params.put("type", websiteData.getType());
			}		
			if (!F.empty(websiteData.getStatus())) {
				whereHql += " and t.status = :status";
				params.put("status", websiteData.getStatus());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(WebsiteData websiteData) {
		TwebsiteData t = new TwebsiteData();
		BeanUtils.copyProperties(websiteData, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		websiteDataDao.save(t);
	}

	@Override
	public WebsiteData get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TwebsiteData t = websiteDataDao.get("from TwebsiteData t  where t.id = :id", params);
		WebsiteData o = new WebsiteData();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(WebsiteData websiteData) {
		TwebsiteData t = websiteDataDao.get(TwebsiteData.class, websiteData.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(websiteData, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		websiteDataDao.delete(websiteDataDao.get(TwebsiteData.class, id));
	}

}
