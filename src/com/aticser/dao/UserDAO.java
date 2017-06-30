package com.aticser.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.aticser.model.User;

@Repository
public interface UserDAO {

	public List<User> getUsers();

}
