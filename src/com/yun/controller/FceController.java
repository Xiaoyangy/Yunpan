package com.yun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.baidubce.util.JsonUtils;
import com.google.gson.*;
import com.jayway.jsonpath.JsonPath;
import com.yun.ai.FaceSearch;
import com.yun.pojo.Result;
import com.yun.service.FileService;
import com.yun.service.SysService;
import com.yun.utils.GsonUtils;
import com.yun.utils.UserUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yun.pojo.User;
import com.yun.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author 陈宏阳
 * @date 2020/7/9
 * Yunpan
 */
@Controller
public class FceController {
    @Autowired
    UserService userService;
    @Autowired
    SysService sysService;
  //  @RequestMapping("/faceRegister")
  //  @ResponseBody
  //  public String FaceRegister(HttpServletRequest request){
  //      System.out.println("---------faceregister-------");
  //      String image = request.getParameter("base");
  //      System.out.println(image);
      //  String result = FaceAdd.add(image);
  //      System.out.println("-----人脸注册成功");
     //   return result;
   // }
    @RequestMapping("/facelogin")
    @ResponseBody
    public Result<String> FaceLogin(HttpServletRequest request, String img) throws ParseException {

        System.out.println(img);

        String msg = FaceSearch.faceSearch(img);
         System.out.println(msg);
        Map<String, String> data = new HashMap<String, String>();
        // 将json字符串转换成jsonObject
        JSONObject jsonObject = JSONObject.fromObject(msg);

        JSONObject jsonObject1=jsonObject.getJSONObject("result");

        JSONArray array1=jsonObject1.getJSONArray("user_list");

        System.out.println("array1="+array1);

        String str = (String) array1.getJSONObject(0).get("user_id");

        Double sco=(Double) array1.getJSONObject(0).get("score");

        System.out.println("str:  "+str);
        System.out.println("score:  "+sco);
        Integer userid=Integer.parseInt(str);

        User exsitUser = userService.findUser(userid);
        if(exsitUser!=null&&sco>=70){
            HttpSession session = request.getSession();
            session.setAttribute(User.NAMESPACE, exsitUser.getUsername());
            session.setAttribute("totalSize", exsitUser.getTotalSize());
            System.out.println("登陆成功");
            sysService.loginTime(exsitUser.getUsername());
            return new Result<>(111,true,"true");
        }else {
            System.out.println("人脸登陆失败");
            return new Result<>(112,false,"false");
        }
    }
}
