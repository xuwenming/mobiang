package jb.pageModel;

@SuppressWarnings("serial")
public class MenuDesc implements java.io.Serializable {

	private String url;
	private String name_zh;
	private String name_en;
	private int status; // 1:上架；-1：下架
	private String target;
	private boolean extLink;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName_zh() {
		return name_zh;
	}
	public void setName_zh(String name_zh) {
		this.name_zh = name_zh;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public boolean isExtLink() {
		return extLink;
	}
	public void setExtLink(boolean extLink) {
		this.extLink = extLink;
	}
}
