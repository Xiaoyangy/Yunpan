package com.yun.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yun.pojo.FileCustom;
import com.yun.pojo.RecycleFile;
import com.yun.pojo.Result;
import com.yun.pojo.SummaryFile;
import com.yun.service.FileService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/file")
public class FileController {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private FileService fileService;

    /**
     * 文件上传
     *
     * @param files
     *            文件名（多个）
     * @param currentPath
     *            当前路径
     * @return Json对象
     */
    @RequestMapping("/upload")
    public @ResponseBody Result<String> upload(
            @RequestParam("files") MultipartFile[] files, String currentPath) {
        try {
            fileService.uploadFilePath(request, files, currentPath);
        } catch (Exception e) {
            return new Result<>(301, false, "上传失败");
        }
        return new Result<String>(305, true, "上传成功");
    }


    /**
     * 文件上传(安卓端接口)
     *
     * @param file
     *            文件名（多个）
     * @param currentPath
     *            当前路径
     * @return Json对象
     */
    @RequestMapping("/uploadForApp")
    public @ResponseBody Map<String,String> uploadExt(
            @RequestParam("file") MultipartFile file, String currentPath,String username) {
        Map<String,String> map = new HashMap<>();
        try {
            fileService.uploadFilePathExt(request, file, currentPath,username);
            map.put("ret", "1000");
            map.put("msg", "上传成功");
        } catch (Exception e) {
            map.put("ret", "1001");
            map.put("msg", "上传失败");
            return map;
        }
        return map;
    }

    /**
     * 文件下载
     *
     * @param currentPath
     *            当前路径
     * @param downPath
     *            文件名
     * @param username
     *            用户名
     * @return 文件下载流
     */
    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String currentPath,
                                           String[] downPath, String username) {
        try {
            String down = request.getParameter("downPath");
            File downloadFile = fileService.downPackage(request, currentPath,
                    downPath, username);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            String fileName = new String(downloadFile.getName().getBytes(
                    "utf-8"), "iso-8859-1");
            headers.setContentDispositionFormData("attachment", fileName);
            byte[] fileToByteArray = org.apache.commons.io.FileUtils
                    .readFileToByteArray(downloadFile);
            fileService.deleteDownPackage(downloadFile);
            return new ResponseEntity<byte[]>(fileToByteArray, headers,
                    HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取文件列表
     *
     * @param path
     *            路径
     * @return Json对象
     */
    @RequestMapping("/getFiles")
    public @ResponseBody Result<List<FileCustom>> getFiles(String path) throws IOException {
        String realPath = fileService.getFileName(request, path);
        List<FileCustom> listFile = fileService.listFile(realPath);
        Result<List<FileCustom>> result = new Result<List<FileCustom>>(325,
                true, "获取成功");
        result.setData(listFile);
        return result;
    }

    /**
     * 登录-移动端
     *
     * @param req
     * @param rep
     * @throws Exception
     */
    @RequestMapping("/getAppFiles")
    public void getjson(HttpServletRequest req, HttpServletResponse rep)
            throws Exception {
        req.setCharacterEncoding("utf-8");
        rep.setContentType("text/html;charset=utf-8");
        String path = req.getParameter("path");
        String username = req.getParameter("username");
        String realPath = fileService.getFileName(request, path,username);
        List<FileCustom> listFile = fileService.listFileForApp(realPath,request,username);
        // Result<List<FileCustom>> resultList = new
        // Result<List<FileCustom>>(325, true, "获取成功");
        // resultList.setData(listFile);
        // return result;

        System.out.println("安卓端访问文件列表..............");

        PrintWriter writer = rep.getWriter();
        JSONObject object = new JSONObject();
        if (listFile != null && listFile.size() > 0) {
            //object.put("result", listFile);
            object.put("ret", "1000");
            object.put("msg", "查询成功");
            object.put("data", listFile);
        } else {
            //object.put("result", "fail");// fail代表该目录下无文件
            object.put("ret", "1001");
            object.put("msg", "查询失败");
        }
        writer.println(object.toString());
        writer.flush();
        writer.close();
    }

    /*
     * @RequestMapping("/getFilesByCategory") public @ResponseBody
     * Result<List<FileCustom>> getFilesByCategory(String category) { String
     * realPath = fileService.getFileName(request, category); List<FileCustom>
     * listFile = fileService.listFile(realPath); Result<List<FileCustom>>
     * result = new Result<List<FileCustom>>(325, true, "获取成功");
     * result.setData(listFile); return result; }
     */
    /**
     * 获取分享文件列表
     *
     * @param path
     *            路径
     * @param username
     *            用户名
     * @return Json对象
     */
    @RequestMapping("/getShareFiles")
    public @ResponseBody Result<List<FileCustom>> getFiles(String path,
                                                           String username) throws IOException {
        String realPath = fileService.getFileName(request, path, username);
        List<FileCustom> listFile = fileService.listFile(realPath);
        Result<List<FileCustom>> result = new Result<List<FileCustom>>(326,
                true, "获取成功");
        result.setData(listFile);
        return result;
    }

    /**
     * 新建文件夹
     *
     * @param currentPath
     *            当前路径
     * @param directoryName
     *            文件夹名
     * @return Json对象
     */
    @RequestMapping("/addDirectory")
    public @ResponseBody Result<String> addDirectory(String currentPath,
                                                     String directoryName) {
        System.out.println(currentPath);
        try {
            if(fileService.addDirectory(request, currentPath, directoryName))
            {
                return new Result<>(336, true, "添加成功");
            }
            else{
                return new Result<>(331, false, "添加失败");
            }
        } catch (Exception e) {
            return new Result<>(331, false, "添加失败");
        }
    }

    /**
     * 删除文件夹
     *
     * @param currentPath
     *            当前路径
     * @param directoryName
     *            文件夹名
     * @return Json对象
     */
    @RequestMapping("/delDirectory")
    public @ResponseBody Result<String> delDirectory(String currentPath,
                                                     String[] directoryName) {
        try {
            fileService.delDirectory(request, currentPath, directoryName);
            return new Result<>(346, true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(341, false, "删除失败");
        }
    }

    /**
     * 重命名文件夹
     *
     * @param currentPath
     *            当前路径
     * @param srcName
     *            源文件名
     * @param destName
     *            目标文件名
     * @return Json对象
     */
    @RequestMapping("/renameDirectory")
    public @ResponseBody Result<String> renameDirectory(String currentPath,
                                                        String srcName, String destName) {
        try {
            fileService
                    .renameDirectory(request, currentPath, srcName, destName);
            return new Result<>(356, true, "重命名成功");
        } catch (Exception e) {
            return new Result<>(351, false, "重命名失败");
        }
    }

    @RequestMapping("/copyDirectory")
    public @ResponseBody Result<String> copyDirectory(String currentPath,
                                                      String[] directoryName, String targetdirectorypath)
            throws Exception {
        try {
            fileService.copyDirectory(request, currentPath, directoryName,
                    targetdirectorypath);
            return new Result<>(366, true, "复制成功");
        } catch (IOException e) {
            return new Result<>(361, true, "复制失败");
        }
    }

    /**
     * 移动文件夹
     *
     * @param currentPath
     *            当前路径
     * @param directoryName
     *            文件夹名
     * @param targetdirectorypath
     *            目标位置
     * @return Json对象
     */
    @RequestMapping("/moveDirectory")
    public @ResponseBody Result<String> moveDirectory(String currentPath,
                                                      String[] directoryName, String targetdirectorypath) {

        try {
            fileService.moveDirectory(request, currentPath, directoryName,
                    targetdirectorypath);
            return new Result<>(366, true, "移动成功");
        } catch (Exception e) {
            return new Result<>(361, true, "移动失败");
        }
    }

    /**
     * 请求移动文件夹页面
     *
     * @param model
     *            模型
     * @return 页面逻辑视图名
     */
    @RequestMapping("/summarylist")
    /* 如果方法声明了注解@ResponseBody ，则会直接将返回值输出到页面。 */
    public String summarylist(Model model) throws IOException {
        String webrootpath = fileService.getFileName(request, "");
        int number = webrootpath.length();
        SummaryFile rootlist = fileService.summarylistFile(webrootpath, number);
        model.addAttribute("rootlist", rootlist);
        return "summarylist";
    }

    /**
     * 查找文件（模糊查询）
     *
     * @param reg
     *            要查找的文件名
     * @param currentPath
     *            当面路径
     * @param regType
     *            查找文件类型
     * @return Json对象
     */
    @RequestMapping("/searchFile")
    public @ResponseBody Result<List<FileCustom>> searchFile(String reg,
                                                             String currentPath, String regType) {
        try {
            List<FileCustom> searchFile = fileService.searchFile(request,
                    currentPath, reg, regType);
            Result<List<FileCustom>> result = new Result<>(376, true, "查找成功");
            result.setData(searchFile);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(371, false, "查找失败");
        }
    }

    /**
     * 打开文件
     *
     * @param response
     *            响应文件流
     * @param currentPath
     *            当前路径
     * @param fileName
     *            文件名
     * @param fileType
     *            文件类型
     */
    @RequestMapping("/openFile")
    public void openFile(HttpServletResponse response, String currentPath,
                         String fileName, String fileType) {
        try {
            fileService.respFile(response, request, currentPath, fileName,
                    fileType);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 请求音乐播放页面
     *
     * @param model
     * @param currentPath
     *            当面路径
     * @param fileName
     *            文件名
     * @return
     */
    @RequestMapping("/openAudioPage")
    public String openAudioPage(Model model, String currentPath, String fileName) {
        model.addAttribute("currentPath", currentPath);
        model.addAttribute("fileName", fileName);
        return "audio";
    }

    /**
     * 打开文档
     *
     * @param currentPath
     *            当面路径
     * @param fileName
     *            文件名
     * @param fileType
     *            文件类型
     * @return Json对象（文件Id）
     */
    @RequestMapping("/openOffice")
    public @ResponseBody Result<String> openOffice(String currentPath,
                                                   String fileName, String fileType) {
        try {
            String openOffice = fileService.openOffice(request, currentPath,
                    fileName);
            if (openOffice != null) {
                Result<String> result = new Result<>(505, true, "打开成功");
                result.setData(openOffice);
                return result;
            }
            return new Result<>(501, false, "打开失败");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(501, false, "打开失败");
        }
    }

    /*--存储回收站所有删除文件信息，并返回给recycle.jsp--*/
    @RequestMapping("/recycleFile")
    public String recycleFile() {
        try {
            List<RecycleFile> findDelFile = fileService.recycleFiles(request);
            // 返回的删除文件若没有，则不设置findDelFile
            if (null != findDelFile && findDelFile.size() != 0) {
                request.setAttribute("findDelFile", findDelFile);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "recycle";
    }

    /*
     * --删除回收站多个文件-- --获取当前路径以及文件名--
     */
    @RequestMapping("/delRecycle")
    public @ResponseBody Result<String> delRecycleDirectory(int fileId[]) {
        try {
            fileService.delRecycle(request, fileId);
            return new Result<>(327, true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result<>(322, false, "删除失败");
        }
    }

    /* --清空回收站-- */
    @RequestMapping("/delAllRecycle")
    public @ResponseBody Result<String> delAllRecycleDirectory() {
        try {
            fileService.delAllRecycle(request);
            // 返回状态码
            return new Result<>(327, true, "删除成功");
        } catch (Exception e) {
            return new Result<>(322, false, "删除失败");
        }
    }

    /*
     * --还原回收站文件-- --获取目的路径以及文件名--
     */
    @RequestMapping("/revertDirectory")
    public @ResponseBody Result<String> revertDirectory(int[] fileId) {
        try {
            fileService.revertDirectory(request, fileId);
            return new Result<>(327, true, "还原成功");
        } catch (Exception e) {
            return new Result<>(322, false, "还原失败");
        }
    }
}
