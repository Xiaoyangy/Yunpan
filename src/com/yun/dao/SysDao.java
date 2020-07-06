package com.yun.dao;

import com.yun.pojo.Sys;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @author 陈宏阳
 * @date 2020/7/6
 * Yunpan
 */

@Repository
public interface SysDao {
    /** 插入登录时间*/
     void insertSysTime(Sys sys);
    /** 查询所有登录信息 */
     List<Sys> selectAll();
}
