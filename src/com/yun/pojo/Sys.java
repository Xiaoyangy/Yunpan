package com.yun.pojo;


import java.sql.Date;
import java.sql.Timestamp;

/**
 * @author 陈宏阳
 * @date 2020/7/6
 * Yunpan
 */
public class Sys {

    public Sys() { }
    public Sys(String loginTime,String loginName,String des){
        this.des=des;
        this.loginName=loginName;
        this.loginTime=loginTime;
    }
    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime =  loginTime;
    }

    private String loginTime;
    private String loginName;

    @Override
    public String toString() {
        return "Sys{" +
                "loginTime='" + loginTime + '\'' +
                ", loginName='" + loginName + '\'' +
                ", des='" + des + '\'' +
                '}';
    }

    private String des;

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
}
