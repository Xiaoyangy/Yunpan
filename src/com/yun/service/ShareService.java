package com.yun.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.dao.ShareDao;
import com.yun.pojo.FileCustom;
import com.yun.pojo.Share;
import com.yun.pojo.ShareFile;
import com.yun.pojo.User;
import com.yun.utils.FileUtils;
import com.yun.utils.UserUtils;

@Service
public class ShareService {
	@Autowired
	private ShareDao shareDao;
	/**
	 * 查找分享
	 * @param request
	 * @param shareUrl	分享url
	 * @return
	 * @throws Exception
	 */
	public List<ShareFile> findShare(HttpServletRequest request, String shareUrl) throws Exception{
		Share share = new Share();
		share.setShareUrl(shareUrl);
		share.setStatus(Share.PUBLIC);
		List<Share> shares = shareDao.findShare(share);
		return getShareFile(request, shares);
	}
	/**
	 * 查找分享文件
	 * @param request
	 * @param status	分享文件状态	
	 * @return
	 * @throws Exception
	 */
	public List<ShareFile> findShareByName(HttpServletRequest request, int status) throws Exception{
		List<Share> shares = shareDao.findShareByName(UserUtils.getUsername(request), status);
		return getShareFile(request, shares);
	}
	/**
	 * 获取分享文件列表
	 * @param request
	 * @param shares	分享文件
	 * @return
	 */
	private List<ShareFile> getShareFile(HttpServletRequest request, List<Share> shares){
		List<ShareFile> files = null;
		if(shares != null){
			files = new ArrayList<>();
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			rootPath=rootPath.replace("\\classes\\artifacts\\ShareYun_Web_exploded","");
			rootPath+="/WebContent/";
			rootPath=rootPath+ FileService.PREFIX;
			System.out.println(rootPath);
			for (Share share : shares) {
				File file = new File(rootPath + share.getShareUser(), share.getPath());
				ShareFile shareFile = new ShareFile();
				shareFile.setFileType(FileUtils.getFileType(file));
				shareFile.setFileName(file.getName());
				shareFile.setFileSize(file.isFile() ? FileUtils.getDataSize(file.length()) : "-");
				shareFile.setLastTime(FileUtils.formatTime(file.lastModified()));
				shareFile.setShareUser(share.getShareUser());
				shareFile.setUrl(share.getShareUrl());
				shareFile.setFilePath(share.getPath());
				files.add(shareFile);
			}
		}
		return files;
	}
	/**
	 * 分享文件
	 * @param request
	 * @param currentPath
	 * @param shareFile
	 * @return
	 * @throws Exception
	 */
	public String shareFile(HttpServletRequest request, String currentPath, String[] shareFile) throws Exception {
		String username = (String) request.getSession().getAttribute(User.NAMESPACE);
		String shareUrl = FileUtils.getUrl8();
		for (String file : shareFile) {
			Share share = new Share();
			share.setPath(currentPath + File.separator + file);
			share.setShareUser(username);
			share.setShareUrl(shareUrl);
			shareDao.shareFile(share);
		}
		return shareUrl;
	}
	/**
	 * 取消分享
	 * @param url		分享url
	 * @param filePath	分享路径
	 * @param status	分享状态
	 * @return
	 * @throws Exception
	 */
	public String cancelShare(String url, String filePath, int status) throws Exception {
		if(Share.CANCEL == status){
			shareDao.cancelShare(url, filePath, Share.DELETE);
			return "删除成功";
		}else{
			shareDao.cancelShare(url, filePath, Share.CANCEL);
			return "取消成功";
		}
	}
}
