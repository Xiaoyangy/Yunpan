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
        this.login_name=loginName;
        this.login_time=loginTime;
    }
    private String login_time;
    private String login_name;
    private Integer id;
    private String des;
    public String getDes() {
        return des;
    }

    public String getLogin_time() {
        return login_time;
    }

    public void setLogin_time(String login_time) {
        this.login_time = login_time;
    }

    public String getLogin_name() {
        return login_name;
    }

    @Override
    public String toString() {
        return "Sys{" +
                "login_time='" + login_time + '\'' +
                ", login_name='" + login_name + '\'' +
                ", id=" + id +
                ", des='" + des + '\'' +
                '}';
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getId() {
        return id;
    }
}
