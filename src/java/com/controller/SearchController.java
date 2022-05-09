package com.controller;

import com.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
//查询功能实现controller
@Controller
public class SearchController {
    @Autowired
    ArticleService articleService;
    //根据标题模糊查询文章
    @RequestMapping(value = "search.do",produces = "text/plain;charset=utf-8")
    public String find(String findText, HttpSession session){
        System.out.println(findText);
        session.setAttribute("findArticles", articleService.searchArticle(findText));
        return "search_index";
    }

}
