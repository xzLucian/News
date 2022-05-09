package com.dao;

import com.bean.User;
import com.common.JUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@Component
public class UserDao implements Dao {

    @Autowired
    JUtil jUtil;

    public List<User> select() {
        String sql = "select * from user";
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<User> users = new LinkedList<User>();
        try {
            while (resultSet.next()) {
                User user = new User();
                user.setUid(resultSet.getInt("uid"));
                user.setUname(resultSet.getString("uname"));
                user.setUpwd(resultSet.getString("upwd"));
                user.setUnickname(resultSet.getString("unickname"));
                user.setUpower(resultSet.getInt("upower"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return users;
        }
    }

    public User selectById(int uid) {
        String sql = "select * from user where uid="+uid;
        ResultSet resultSet = jUtil.executeSQL(sql);
        User user = new User();
        try {
            while (resultSet.next()) {
                user.setUid(resultSet.getInt("uid"));
                user.setUname(resultSet.getString("uname"));
                user.setUpwd(resultSet.getString("upwd"));
                user.setUnickname(resultSet.getString("unickname"));
                user.setUpower(resultSet.getInt("upower"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return user;
        }
    }

    public void insert(User user) {
        String sql = "insert into user (uname,upwd,unickname,upower) values (" +
                "'" + user.getUname() + "'" + "," +
                "'" + user.getUpwd() + "'" + "," +
                "'" + user.getUnickname() + "'" + "," +
                user.getUpower() +
                ")";
        jUtil.executeSQL(sql);
    }

    public void updatePower(int uid, int power) {
        String sql = "update user set upower = " + power + " where uid=" + uid;
        jUtil.executeSQL(sql);
    }

    public void delete(int uid) {
        String sql = "delete from user where uid = " + uid;
        jUtil.executeSQL(sql);
    }
}
