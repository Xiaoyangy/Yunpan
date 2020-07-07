package com.yun.dao;

import com.yun.pojo.Vip;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yun.pojo.User;

@Repository
public interface UserDao {
	User findUser(User user) throws Exception;

	void addUser(User user) throws Exception;

	void reSize(@Param("username") String username, @Param("formatSize") String formatSize) throws Exception;

	User findUserByUserName(String username) throws Exception;

	String getCountSize(String username) throws Exception;

	void updatePassword(@Param("username") String username, @Param("password") String password);

	void updateVip(@Param("username") String username);

	void updateVipStatus(@Param("code") String code);

	Vip findVip(@Param("vipCode") String vipCode);

}
