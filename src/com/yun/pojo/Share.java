package com.yun.pojo;
/**
 * 分享表映射
 * @author Frank
 *
 */
public class Share {
	public static final int PUBLIC = 1;
	public static final int PRIVATE = 2;
	public static final int CANCEL = 0;
	public static final int DELETE = -1;
	
	private String shareUrl;
	private String shareId;
	private String shareUser;
	private String path;
	private String command;
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public String getShareId() {
		return shareId;
	}
	public void setShareId(String shareId) {
		this.shareId = shareId;
	}
	public String getShareUser() {
		return shareUser;
	}
	public void setShareUser(String shareUser) {
		this.shareUser = shareUser;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getShareUrl() {
		return shareUrl;
	}
	public void setShareUrl(String shareUrl) {
		this.shareUrl = shareUrl;
	}
}
