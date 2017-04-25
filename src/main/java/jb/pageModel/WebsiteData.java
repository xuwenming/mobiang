package jb.pageModel;

import java.util.Date;

import jb.listener.Application;

public class WebsiteData implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String title;	
	private java.lang.String icon;	
	private java.lang.String menu;	
	private java.lang.String type;	
	private java.lang.String content;	
	private java.lang.Integer seq;
	private java.lang.String status;	
	private Date addtime;			

	public String getMenuZh() {
		return Application.getString(menu);
	}
	public String getTypeZh() {
		return Application.getString(type);
	}
	public String getStatusZh() {
		return Application.getString(this.status);
	}

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setTitle(java.lang.String title) {
		this.title = title;
	}
	
	public java.lang.String getTitle() {
		return this.title;
	}
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}
	
	public java.lang.String getIcon() {
		return this.icon;
	}
	public java.lang.String getMenu() {
		return menu;
	}

	public void setMenu(java.lang.String menu) {
		this.menu = menu;
	}
	public void setType(java.lang.String type) {
		this.type = type;
	}
	
	public java.lang.String getType() {
		return this.type;
	}
	public void setContent(java.lang.String content) {
		this.content = content;
	}
	
	public java.lang.String getContent() {
		return this.content;
	}
	public void setSeq(java.lang.Integer seq) {
		this.seq = seq;
	}
	
	public java.lang.Integer getSeq() {
		return this.seq;
	}
	public java.lang.String getStatus() {
		return status;
	}
	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

}
