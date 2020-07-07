package com.yun.pojo;

/**
 * @author 陈宏阳
 * @date 2020/7/7
 * Yunpan
 */
public class Vip {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    private Integer id;
    private String code;
    private Integer status;
}
