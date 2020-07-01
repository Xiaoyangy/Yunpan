package com.yun.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OfficeDao {
	/**
	 * 增加百度云解码Id
	 * @param officeId	解码id
	 * @param officeMd5	文件md5值
	 * @throws Exception
	 */
	void addOffice(@Param("officeId") String officeId, @Param("officeMd5") String officeMd5) throws Exception;
	/**
	 * 查找文件解析id
	 * @param officeMd5	文件md5
	 * @return
	 * @throws Exception
	 */
	String getOfficeId(String officeMd5) throws Exception;
}
