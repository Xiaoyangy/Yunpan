package com.yun.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.dao.UserDao;
import com.yun.pojo.User;
import com.yun.utils.UserUtils;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	public boolean addUser(User user) {
		user.setPassword(UserUtils.MD5(user.getPassword()));
		try {
			userDao.addUser(user);
		} catch (Exception e) {

			return false;
		}
		return true;
	}

	public String getCountSize(String username) {
		String countSize = null;
		try {
			countSize = userDao.getCountSize(username);
		} catch (Exception e) {
			e.printStackTrace();
			return countSize;
		}
		return countSize;
	}

    public User findUser(User user) {
		try {
			user.setPassword(UserUtils.MD5(user.getPassword()));
			User exsitUser = userDao.findUser(user);
			return exsitUser;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
}
