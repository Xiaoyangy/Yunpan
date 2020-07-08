package com.yun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 陈宏阳
 * @date 2020/7/8
 * Yunpan
 */
@Controller
public class MoreController {
    @RequestMapping("/more")
    public String toMore(){
        return "more";
    }
}
