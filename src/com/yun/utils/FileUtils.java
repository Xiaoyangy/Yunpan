package com.yun.utils;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.print.Doc;

import org.apache.commons.io.IOUtils;
import org.springframework.util.DigestUtils;

import com.baidubce.BceClientConfiguration;
import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.doc.DocClient;

public class FileUtils {
	public static String getDataSize(long size) {
		DecimalFormat formater = new DecimalFormat("####.0");
		if (size < 1024) {
			return size + "B";
		} else if (size < 1024 * 1024) {
			float kbsize = size / 1024f;
			return formater.format(kbsize) + "KB";
		} else if (size < 1024 * 1024 * 1024) {
			float mbsize = size / 1024f / 1024f;
			return formater.format(mbsize) + "MB";
		} else if (size < 1024 * 1024 * 1024 * 1024) {
			float gbsize = size / 1024f / 1024f / 1024f;
			return formater.format(gbsize) + "GB";
		} else {
			return "-";
		}
	}
	
	public static String formatTime(long time){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(time));
	}
	
	public static String getUrl8(){
		return UUID.randomUUID().toString().replace("-", "").substring(0, 8);
	}
	public final static Map<String, String> FILE_TYPE_MAP = new HashMap<String, String>();
	static{
		FILE_TYPE_MAP.put("jpg", "image"); //JPEG (jpg)     
		FILE_TYPE_MAP.put("png", "image"); //PNG (png)     
		FILE_TYPE_MAP.put("gif", "image"); //GIF (gif)     
		FILE_TYPE_MAP.put("tif", "image"); //TIFF (tif)     
		FILE_TYPE_MAP.put("bmp", "image"); //16色位图(bmp)     
		FILE_TYPE_MAP.put("bmp", "image"); //24位位图(bmp)     
		FILE_TYPE_MAP.put("bmp", "image"); //256色位图(bmp)     
		
		FILE_TYPE_MAP.put("html", "docum"); //HTML (html)
		FILE_TYPE_MAP.put("htm" , "docum"); //HTM (htm)
		FILE_TYPE_MAP.put("css" , "docum"); //css
		FILE_TYPE_MAP.put("js"  , "docum"); //js
		FILE_TYPE_MAP.put("ini" , "docum");   
		FILE_TYPE_MAP.put("txt" , "docum");   
		FILE_TYPE_MAP.put("jsp" , "docum");//jsp文件
		FILE_TYPE_MAP.put("sql" , "docum");//xml文件
		FILE_TYPE_MAP.put("xml" , "docum");//xml文件
		FILE_TYPE_MAP.put("java", "docum");//java文件
		FILE_TYPE_MAP.put("bat" , "docum");//bat文件
		FILE_TYPE_MAP.put("mxp" , "docum");//bat文件
		FILE_TYPE_MAP.put("properties", "docum");//bat文件
		
		FILE_TYPE_MAP.put("doc", "office"); //MS Excel 注意：word、msi 和 excel的文件头一样     
		FILE_TYPE_MAP.put("docx", "office");//docx文件
		FILE_TYPE_MAP.put("vsd", "office"); //Visio 绘图     
		FILE_TYPE_MAP.put("mdb", "office"); //MS Access (mdb)      
		FILE_TYPE_MAP.put("pdf", "office"); //Adobe Acrobat (pdf)   
		FILE_TYPE_MAP.put("xlsx", "office");//docx文件
		FILE_TYPE_MAP.put("xls", "office");//docx文件
		FILE_TYPE_MAP.put("pptx", "office");//docx文件
		FILE_TYPE_MAP.put("ppt", "office");//docx文件
		FILE_TYPE_MAP.put("wps", "office");//WPS文字wps、表格et、演示dps都是一样的
		
		FILE_TYPE_MAP.put("mov","vido");
		FILE_TYPE_MAP.put("rmvb","vido"); //rmvb/rm相同  
		FILE_TYPE_MAP.put("flv","vido"); //flv与f4v相同  
		FILE_TYPE_MAP.put("mp4","vido"); 
		FILE_TYPE_MAP.put("avi","vido");  
		FILE_TYPE_MAP.put("wav","vido"); //Wave (wav)  
		FILE_TYPE_MAP.put("wmv","vido"); //wmv与asf相同    
		FILE_TYPE_MAP.put("mpg","vido"); //     
		
		FILE_TYPE_MAP.put("mp3","audio"); 
		FILE_TYPE_MAP.put("mid","audio"); //MIDI (mid)   
		
		FILE_TYPE_MAP.put("zip", "comp");    
		FILE_TYPE_MAP.put("rar", "comp");   
		FILE_TYPE_MAP.put("gz" , "comp");//gz文件
		
//		FILE_TYPE_MAP.put("class", "file");//bat文件
//		FILE_TYPE_MAP.put("jar", "file"); 
//		FILE_TYPE_MAP.put("exe", "file");//可执行文件
//		FILE_TYPE_MAP.put("mf", "file");//MF文件
//		FILE_TYPE_MAP.put("chm", "file");//bat文件
//		FILE_TYPE_MAP.put("torrent", "file");
//		FILE_TYPE_MAP.put("wpd", "file"); //WordPerfect (wpd)   
//		FILE_TYPE_MAP.put("dbx", "file"); //Outlook Express (dbx)     
//		FILE_TYPE_MAP.put("pst", "file"); //Outlook (pst)      
//		FILE_TYPE_MAP.put("qdf", "file"); //Quicken (qdf)     
//		FILE_TYPE_MAP.put("pwl", "file"); //Windows Password (pwl)         
//		FILE_TYPE_MAP.put("ram", "file"); //Real Audio (ram)
	}
	public static String getFileType(File file) {
		if(file.isDirectory()){
			return "folder-open";
		}
		String fileName = file.getPath();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		String fileType = FILE_TYPE_MAP.get(suffix);
		return fileType == null ? "file" : fileType;
	}
	private static DocClient docClient = null;
	public static DocClient getDocClient(){
		if(docClient == null){
			BceClientConfiguration config = new BceClientConfiguration();
			config.setConnectionTimeoutInMillis(3000);
			config.setSocketTimeoutInMillis(2000);
		    config.setCredentials(new DefaultBceCredentials("3f87852806b2406dad987f9139120c6e", "8d8e5fb70309411b8ad9a055fda6922b"));
		    docClient = new DocClient(config);
		}
	    return docClient;
	}
	
	public static String MD5(File file){
		byte[] bys = null;
		try {
			bys = org.apache.commons.io.FileUtils.readFileToByteArray(file);
			return DigestUtils.md5DigestAsHex(bys).toUpperCase();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
