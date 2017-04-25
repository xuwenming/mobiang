package jb.service.impl;

import jb.absx.F;
import jb.dao.ApiTestDaoI;
import jb.model.TapiTest;
import jb.pageModel.ApiTest;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.service.ApiTestServiceI;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ApiTestServiceImpl extends BaseServiceImpl<ApiTest> implements ApiTestServiceI {

	@Autowired
	private ApiTestDaoI apiTestDao;

	@Override
	public DataGrid dataGrid(ApiTest apiTest, PageHelper ph) {
		List<ApiTest> ol = new ArrayList<ApiTest>();
		String hql = " from TapiTest t ";
		DataGrid dg = dataGridQuery(hql, ph, apiTest, apiTestDao);
		@SuppressWarnings("unchecked")
		List<TapiTest> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TapiTest t : l) {
				ApiTest o = new ApiTest();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(ApiTest apiTest, Map<String, Object> params) {
		String whereHql = "";
		if (apiTest != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(apiTest.getName())) {
				whereHql += " and t.name like :name";
				params.put("name", "%%" + apiTest.getName() + "%%");
			}
			if (!F.empty(apiTest.getProjectMark())) {
				whereHql += " and t.projectMark = :projectMark";
				params.put("projectMark", apiTest.getProjectMark());
			}
			if (!F.empty(apiTest.getSearch())) {
				whereHql += " and (t.name like :search or t.url like :search)";
				params.put("search", "%%" + apiTest.getSearch() + "%%");
			}
		}
		return whereHql;
	}

	@Override
	public void add(ApiTest apiTest) {
		TapiTest t = new TapiTest();
		BeanUtils.copyProperties(apiTest, t);
		t.setId(UUID.randomUUID().toString());
		t.setIsSuccess(0);
		apiTestDao.save(t);
	}

	@Override
	public ApiTest get(String id) {
		TapiTest t = apiTestDao.get(TapiTest.class, id);
		ApiTest o = new ApiTest();
		if(null!=t)
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(ApiTest apiTest) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("url", apiTest.getUrl());
		TapiTest t = apiTestDao.get("from TapiTest t where t.url = :url", params);
		if(t != null){
			BeanUtils.copyProperties(apiTest, t, new String[] { "id" , "createdatetime" });
		}else{
			apiTest.setId(UUID.randomUUID().toString());
			TapiTest tt = new TapiTest();
			BeanUtils.copyProperties(apiTest, tt);
			tt.setIsSuccess(0);
			apiTestDao.save(tt);
		}
	}

	@Override
	public void delete(String id) {
		apiTestDao.delete(apiTestDao.get(TapiTest.class, id));
	}

	@Override
	public List<ApiTest> getApiList(ApiTest apiTest) {
		List<ApiTest> ol = new ArrayList<ApiTest>();
		String hql = " from TapiTest t ";
		Map<String, Object> params = new HashMap<String, Object>();
		String where = whereHql(apiTest, params);
		List<TapiTest> ts = apiTestDao.find(hql + where + " order by t.name ", params);
		for (TapiTest t : ts){
			ApiTest o = new ApiTest();
			BeanUtils.copyProperties(t, o);
			ol.add(o);
		}
		return ol;
	}

	@Override
	public ApiTest apiTest(String name){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", name);
		TapiTest t = apiTestDao.get("from TapiTest t where t.name = :name", params);
		ApiTest o = new ApiTest();
		if(null!=o)
		BeanUtils.copyProperties(t, o);
		return o;
	}

}
