package com.yun.pojo;
/**
 * 用户实体类
 * @author Frank
 *
 */
public class User {
	public static final String NAMESPACE = "username";
	
	public static final String RECYCLE = "recycle";
	private Integer id;
	private String username;
	private String password;
	private String countSize;

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", countSize='" + countSize + '\'' +
				", totalSize='" + totalSize + '\'' +
				", vip=" + vip +
				'}';
	}

	private String totalSize;
	public Integer getVip() {
		return vip;
	}
	public void setVip(Integer vip) {
		this.vip = vip;
	}
	private Integer vip;

	public String getCountSize() {
		return countSize;
	}
	public void setCountSize(String countSize) {
		this.countSize = countSize;
	}
	public String getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(String totalSize) {
		this.totalSize = totalSize;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
