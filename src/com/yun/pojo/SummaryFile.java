package com.yun.pojo;

import java.util.List;
/**
 * 移动/复制文件实体类
 *
 */
public class SummaryFile {
	private boolean isFile;
	private String path;
	private String fileName;
	private int listdiretory;
	private List<SummaryFile> listFile;
	public boolean getisFile() {
		return isFile;
	}
	public void setisFile(boolean file) {
		isFile = file;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getfileName() {
		return fileName;
	}
	public void setfileName(String fileName) {
		this.fileName = fileName;
	}
	public List<SummaryFile> getListFile() {
		return listFile;
	}
	public void setListFile(List<SummaryFile> listFile) {
		this.listFile = listFile;
	}
	public int getListdiretory() {
		return listdiretory;
	}
	public void setListdiretory(int listdiretory) {
		this.listdiretory = listdiretory;
	}
}
