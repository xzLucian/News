package com.controller;

import com.bean.Article;
import com.bean.Comment;
import com.bean.User;
import com.service.ArticleService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

//文章相关功能实现controller
@Controller
@RequestMapping(value = "article")
public class ArticleController {
    @Autowired
    ArticleService articleService;
    @Autowired
    UserService userService;

    //增加一篇新文章
    @RequestMapping(value = "addArticle.do")
    public String addArticle(@RequestParam String atitle,@RequestParam String atype,@RequestParam String acontent,@RequestParam String imgSrc, HttpSession session){
        if(atitle.equals("") || acontent.equals("")){
            return "back_articles";
        }else{
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
            User nowUser = (User) session.getAttribute("nowUser");
            Article article = new Article();
            article.setAtitle(atitle);
            article.setAtype(atype);
            article.setAuthor(nowUser.getUnickname());
            article.setContent(acontent);
            article.setAstate(0);
            article.setAdate(df.format(new Date()));
            article.setImgSrc(imgSrc);
            articleService.addArticle(article);
            session.setAttribute("articles", articleService.getArticles());
            return "back_articles";
        }
    }

    //删除一篇文章
    @RequestMapping(value = "deleteArticle.do")
    public String deleteArticle(@RequestParam int aid,HttpSession session){
        articleService.deleteArticle(aid);
        session.setAttribute("articles", articleService.getArticles());
        return "back_articles";
    }

    //添加一条评论
    @RequestMapping(value = "addComment.do")
    public String addComment(@RequestParam int aid, @RequestParam String author, @RequestParam String content, HttpSession session) {
        if ((User) session.getAttribute("nowUser") == null) {
            return "login";
        }else {
            Comment comment = new Comment();
            comment.setAid(aid);
            comment.setCauthor(author);
            comment.setContent(content);
            articleService.addComment(comment);
            session.setAttribute("articles", articleService.getArticles());
            return "redirect:/jsp/single.jsp?aid=" + aid;
        }
    }

    //更新文章审核状态
    @RequestMapping(value = "updateState.do")
    public String updateState(@RequestParam int aid, HttpSession session) {
        articleService.sh(aid);
        session.setAttribute("articles", articleService.getArticles());
        return "back_articles";
    }

    //增加一个新分类
    @RequestMapping(value = "addType.do")
    public String addType(@RequestParam String typeName,HttpSession session){
        articleService.addType(typeName);
        session.setAttribute("types",articleService.getTypes());
        return "back_type";
    }

    @RequestMapping(value = "deleteType.do")
    public String subType(@RequestParam String typeName,HttpSession session){
        articleService.deleteType(typeName);
        session.setAttribute("types",articleService.getTypes());
        return "back_type";
    }

    //点赞
    @RequestMapping(value = "addStar.do")
    public String addStar(@RequestParam int uid,@RequestParam int aid,HttpSession session){
        articleService.updateStar(uid,aid,1);
        session.setAttribute("articles", articleService.getArticles());
        session.setAttribute("stars",articleService.getStars());
        return "redirect:/jsp/single.jsp?aid=" + aid;
    }

    //取消点赞
    @RequestMapping(value = "subStar.do")
    public String subStar(@RequestParam int uid,@RequestParam int aid,HttpSession session){
        articleService.updateStar(uid,aid,-1);
        session.setAttribute("articles", articleService.getArticles());
        session.setAttribute("stars",articleService.getStars());
        return "redirect:/jsp/single.jsp?aid=" + aid;
    }

}
