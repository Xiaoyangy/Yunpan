package com.yun.service;

import com.baidubce.services.cdn.model.GetDomainConfigResponse;
import com.yun.dao.SysDao;
import com.yun.dao.UserDao;
import com.yun.pojo.Sys;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author 陈宏阳
 * @date 2020/7/6
 * Yunpan
 */
@Service
public class SysService {
    @Autowired
    private SysDao sysDao;
    /*
    * 记录登录时间
    * */
    public boolean loginTime(String username) throws ParseException {
        Timestamp d= new Timestamp(System.currentTimeMillis());
        String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
        try {
              Sys sys=new Sys(time,username);
              sysDao.insertSysTime(sys);
              System.out.println("success");
        } catch (Exception e) {
            System.out.println("log false");
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /*
    * 查询全部登录记录
    * */
    public List<Sys> selectAll(){
        try{
          return sysDao.selectAll();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    @Test
    public void te() throws ParseException {
      System.out.println(selectAll());
    }
}
