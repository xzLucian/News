package com.service;

import com.bean.User;
import com.dao.CollectionDao;
import com.dao.HistoryDao;
import com.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserDao userDao;
    @Autowired
    CollectionDao collectionDao;
    @Autowired
    HistoryDao historyDao;

    //获取所有用户信息
    public List<User> getUsers() {
        List<User> users = userDao.select();
        for (User user : users) {
            user.setCollections(collectionDao.selectByUid(user.getUid()));
            user.setHistorys(historyDao.selectByUid(user.getUid()));
        }
        return users;
    }

    //判断用户是否存在
    public User userExist(String username, String password) {
        List<User> users = userDao.select();
        User thisUser = null;
        for (User user : users) {
            if (user.getUname().equals(username) && user.getUpwd().equals(password)) {
                user.setCollections(collectionDao.selectByUid(user.getUid()));
                user.setHistorys(historyDao.selectByUid(user.getUid()));
                thisUser = user;
                break;
            }
        }
        return thisUser;
    }

    //注册新用户
    public void register(User user) {
        userDao.insert(user);
    }

    //更新用户权限
    public void updatePower(int uid, int power) {
        userDao.updatePower(uid, power);
    }

    //删除一个用户
    public void delete(int uid) {
        userDao.delete(uid);
    }

    //添加一条收藏
    public void addCollection(int uid, int aid, HttpSession session) {
        if (collectionDao.selectById(uid,aid).size() == 0) {
            User user = (User) session.getAttribute("nowUser");
            collectionDao.insert(uid, aid);
            user.setCollections(collectionDao.selectByUid(user.getUid()));
            session.setAttribute("nowUser", user);
        }
    }

    //取消一条收藏
    public void deleteCollection(int uid,int aid,HttpSession session){
        collectionDao.delete(uid,aid);
        User user = (User) session.getAttribute("nowUser");
        user.setCollections(collectionDao.selectByUid(user.getUid()));
        session.setAttribute("nowUser", user);
    }

    //增加一条历史记录
    public void addHistory(int uid, int aid, HttpSession session) {
        if (historyDao.selectById(uid,aid).size() == 0) {
            User user = (User) session.getAttribute("nowUser");
            historyDao.insert(uid, aid);
            user.setHistorys(historyDao.selectByUid(user.getUid()));
            session.setAttribute("nowUser", user);
        }
    }
//清空历史记录
    public void deleteHistorys(int uid,HttpSession session){
        historyDao.deleteHistorys(uid);
        User user = userDao.selectById(uid);
        session.setAttribute("nowUser", userExist(user.getUname(),user.getUpwd()));
    }
}
