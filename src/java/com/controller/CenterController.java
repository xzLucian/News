package com.controller;

import com.bean.User;
import com.service.ArticleService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

//主页相关功能实现controller
@Controller
public class CenterController {
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;

    //指定主页页面，向session中添加初始信息
    @RequestMapping(value = "/")
    public String index(HttpSession session) {
        //已登录的用户信息
        session.setAttribute("nowUser", null);
        //所有文章信息
        session.setAttribute("articles", articleService.getArticles());
        //所有用户信息
        session.setAttribute("users", userService.getUsers());
        //查询到的信息
        session.setAttribute("findArticles", null);
        //所有的新闻分类
        session.setAttribute("types",articleService.getTypes());
        //点赞信息
        session.setAttribute("stars",articleService.getStars());
        return "index";
    }
    //跳转到单页，记录历史记录
    @RequestMapping(value = "single.do")
    public String single(@RequestParam int aid,HttpSession session){
        if (((User) session.getAttribute("nowUser")) == null) {
            return "redirect:/jsp/single.jsp?aid=" + aid;
        }else{
            int uid = ((User) session.getAttribute("nowUser")).getUid();
            userService.addHistory(uid,aid,session);
            return "redirect:/jsp/single.jsp?aid=" + aid;
        }
    }

}
