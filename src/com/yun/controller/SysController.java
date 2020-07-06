package com.yun.controller;

import com.yun.pojo.Sys;
import com.yun.service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 陈宏阳
 * @date 2020/7/6
 * Yunpan
 */
@Controller
public class SysController {
    @Autowired
    private SysService sysService;
    @RequestMapping("/syslog")
    public String Syslog(Model model){
        List<Sys> sysList=sysService.selectAll();
        model.addAttribute("sensor",sysList);
        return "log";
    }
}
