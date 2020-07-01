package com.yun.pojo;
/**
 * 分享文件实体类
 * @author Frank
 *
 */
public class ShareFile extends FileCustom {
	private String shareUser;
	private String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
//	public String getPath() {
//		return path;
//	}
//	public void setPath(String path) {
//		this.path = path;
//	}
	public String getShareUser() {
		return shareUser;
	}
	public void setShareUser(String shareUser) {
		this.shareUser = shareUser;
	}
}
