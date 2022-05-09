package com.controller;

import com.bean.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

//用户相关功能实现controller
@Controller
@RequestMapping(value = "user")
public class UserController {
    @Autowired
    UserService userService;

    //登录验证
    @RequestMapping(value = "/login.do")
    public String login(String username, String password, HttpSession session) {
        User thisUser = userService.userExist(username, password);
        if (thisUser != null) {
            session.setAttribute("nowUser", thisUser);
            session.setAttribute("userFlag", true);
            if (thisUser.getUpower() == 0 || thisUser.getUpower() == 1) {
                return "back_index";
            } else {
                return "index";
            }
        } else {
            session.setAttribute("userFlag", false);
            return "login";
        }
    }

    //用户注册
    @RequestMapping(value = "/register.do")
    public String register(@RequestParam String username, @RequestParam String password, @RequestParam String nickname, HttpSession session) {
        User user = userService.userExist(username, password);
        if (username.equals("") || password.equals("")) {
            session.setAttribute("registerErInfo", "用户名或密码不能为空");
            return "register";
        } else {
            if (user != null) {
                List<User> users = userService.getUsers();
                for(User user1 : users){
                    if(nickname.equals(user1.getUnickname())){
                        session.setAttribute("registerErInfo", "用户名重复");
                        break;
                    }
                }
                return "register";
            } else {
                user = new User();
                user.setUname(username);
                user.setUpwd(password);
                user.setUnickname(nickname);
                user.setUpower(2);
                userService.register(user);
                session.setAttribute("registerFlag", true);
                session.setAttribute("registerErInfo", null);
                session.setAttribute("users", userService.getUsers());
                return "login";
            }
        }
    }

    //修改用户权限
    @RequestMapping(value = "/updatePower.do")
    public String updatePower(@RequestParam int uid, @RequestParam int power, HttpSession session) {
        if (power != -1) {
            userService.updatePower(uid, power);
            session.setAttribute("users", userService.getUsers());
        }
        return "back_users";
    }

    //删除一个用户
    @RequestMapping(value = "delUser.do")
    public String delUser(@RequestParam int uid, HttpSession session) {
        userService.delete(uid);
        session.setAttribute("users", userService.getUsers());
        return "back_users";
    }

    //收藏一篇文章
    @RequestMapping(value = "addCollection.do")
    public String collectionArticle(@RequestParam int aid, HttpSession session) {
        if ((User) session.getAttribute("nowUser") == null) {
            return "login";
        } else {
            int uid = ((User) session.getAttribute("nowUser")).getUid();
            userService.addCollection(uid, aid, session);
            return "redirect:/jsp/single.jsp?aid=" + aid;
        }
    }

    //取消收藏
    @RequestMapping(value = "deleteCollection.do")
    public String deleteCollection(@RequestParam int uid,@RequestParam  int aid,HttpSession session){
        userService.deleteCollection(uid,aid,session);
        return "redirect:/jsp/single.jsp?aid=" + aid;
    }

    //清空历史
    @RequestMapping(value = "deleteHistorys.do")
    public String deleteHistorys(@RequestParam int uid,HttpSession session){
        userService.deleteHistorys(uid,session);
        return "history";
    }

}
