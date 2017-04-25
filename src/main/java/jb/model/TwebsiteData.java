
/*
 * @author John
 * @date - 2016-01-11
 */

package jb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "website_data")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TwebsiteData implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "WebsiteData";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TITLE = "标题";
	public static final String ALIAS_ICON = "封面";
	public static final String ALIAS_TYPE = "分类";
	public static final String ALIAS_CONTENT = "内容";
	public static final String ALIAS_SEQ = "排序";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_ADDTIME = "创建时间";
	
	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private java.lang.String id;
	//@Length(max=255)
	private java.lang.String title;
	//@Length(max=2147483647)
	private java.lang.String icon;
	//@Length(max=6)
	private java.lang.String menu;
	private java.lang.String type;
	//@Length(max=2147483647)
	private java.lang.String content;
	//
	private java.lang.Integer seq;
	//@Length(max=4)
	private java.lang.String status;
	//
	private java.util.Date addtime;
	//columns END


		public TwebsiteData(){
		}
		public TwebsiteData(String id) {
			this.id = id;
		}
	

	public void setId(java.lang.String id) {
		this.id = id;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "title", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String title) {
		this.title = title;
	}
	
	@Column(name = "icon", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getIcon() {
		return this.icon;
	}
	
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}
	
	@Column(name = "type", unique = false, nullable = true, insertable = true, updatable = true, length = 6)
	public java.lang.String getType() {
		return this.type;
	}
	
	public void setType(java.lang.String type) {
		this.type = type;
	}
	
	@Column(name = "menu", unique = false, nullable = true, insertable = true, updatable = true, length = 6)
	public java.lang.String getMenu() {
		return this.menu;
	}
	public void setMenu(java.lang.String menu) {
		this.menu = menu;
	}
	
	@Column(name = "content", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String content) {
		this.content = content;
	}
	
	@Column(name = "seq", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.Integer getSeq() {
		return this.seq;
	}
	
	public void setSeq(java.lang.Integer seq) {
		this.seq = seq;
	}
	@Column(name = "status", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String status) {
		this.status = status;
	}

	@Column(name = "addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 19)
	public java.util.Date getAddtime() {
		return this.addtime;
	}
	
	public void setAddtime(java.util.Date addtime) {
		this.addtime = addtime;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Title",getTitle())
			.append("Icon",getIcon())
			.append("Type",getType())
			.append("Content",getContent())
			.append("Seq",getSeq())
			.append("Addtime",getAddtime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof WebsiteData == false) return false;
		if(this == obj) return true;
		WebsiteData other = (WebsiteData)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

