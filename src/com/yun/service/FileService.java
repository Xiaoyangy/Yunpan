package com.yun.service;

import com.yun.dao.FileDao;
import com.yun.dao.UserDao;
import com.yun.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @author 陈宏阳
 * @date 2020/7/1
 * Yunpan
 */
@Service
public class FileService {
    //文件相对前缀
    public static final String PREFIX = "WEB-INF" + File.separator + "file" + File.separator;
    //新用户注册默认文件夹
    public static final String[] DEFAULT_DIRECTORY = { "vido", "music", "source", "image", User.RECYCLE };
    @Autowired
    private UserDao userDao;
    @Autowired
    private FileDao fileDao;
    public void addNewNameSpace(HttpServletRequest request, String namespace) {
        String fileName = getRootPath(request);
        File file = new File(fileName, namespace);
        file.mkdir();
        for (String newFileName : DEFAULT_DIRECTORY) {
            File newFile = new File(file, newFileName);
            newFile.mkdir();
        }
    }

    private String getRootPath(HttpServletRequest request) {
        String rootPath=request.getSession().getServletContext().getRealPath("/")+PREFIX;
        return rootPath;
    }
}