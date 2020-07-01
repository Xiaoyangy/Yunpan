package com.yun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.pojo.FileCustom;
import com.yun.pojo.Result;
import com.yun.pojo.ShareFile;
import com.yun.service.ShareService;

@Controller
public class ShareController {
	@Autowired
	private ShareService shareService;
	/**
	 * 链接文件分享页面
	 * @param request
	 * @param shareUrl
	 * @return
	 */
	@RequestMapping("/share")
	public String share(HttpServletRequest request, String shareUrl){
		try {
			List<ShareFile> files = shareService.findShare(request, shareUrl);
			request.setAttribute("files", files);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "share";
	}
	/**
	 * 按状态查找分享
	 * @param request
	 * @param status	状态 1|2|-1
	 * @return
	 */
	@RequestMapping("/searchShare")
	public @ResponseBody Result<List<ShareFile>> searchShare(HttpServletRequest request, int status){
		try {
			List<ShareFile> files = shareService.findShareByName(request, status);
			Result<List<ShareFile>> result = new Result<>(415, true, "获取成功");
			result.setData(files);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return new Result<>(411, false, "获取失败");
		}
	}
	/**
	 * 分享文件
	 * @param request
	 * @param currentPath	当前路径
	 * @param shareFile		分享文件名
	 * @return
	 */
	@RequestMapping("/shareFile")
	public @ResponseBody Result<String> shareFile(HttpServletRequest request, String currentPath, String[] shareFile){
		try {
			String shareUrl = shareService.shareFile(request, currentPath, shareFile);
			Result<String> result = new Result<>(405, true, "分享成功");
			result.setData(shareUrl);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return new Result<>(401, false, "分享失败");
		}
	}
	/**
	 * 取消分享
	 * @param url		链接url
	 * @param filePath	文件路径
	 * @param status	状态
	 * @return
	 */
	@RequestMapping("/cancelShare")
	public @ResponseBody Result<String> cancelShare(String url, String filePath, int status){
		try {
			String msg = shareService.cancelShare(url, filePath, status);
			Result<String> result = new Result<>(425, true, msg);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return new Result<>(421, false, "取消失败");
		}
	}
}
