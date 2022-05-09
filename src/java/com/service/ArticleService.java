package com.service;

import com.bean.Article;
import com.bean.Comment;
import com.bean.Star;
import com.dao.ArticleDao;
import com.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService {

    @Autowired
    ArticleDao articleDao;
    @Autowired
    CommentDao commentDao;

    //获取所有新闻文章
    public List<Article> getArticles() {
        List<Article> articles = articleDao.select();
        for (Article article : articles) {
            List<Comment> comments = commentDao.selectByAid(article.getAid());
            article.setComments(comments);
        }
        return articles;
    }

    //增加、删除一篇新文章
    public void addArticle(Article article){
        articleDao.insert(article);
    }
    public void deleteArticle(int aid){
        articleDao.delete(aid);
    }

    //增加一条新评论
    public void addComment(Comment comment) {
        commentDao.insert(comment);
    }

    //根据标题模糊查询文章
    public List<Article> searchArticle(String atitle) {
        System.out.println(articleDao.selectByTitle(atitle).size());
        return articleDao.selectByTitle(atitle);
    }

    //通过未审核文章
    public void sh(int aid) {
        articleDao.updateStateByID(aid);
    }

    //获取所有新闻分类
    public List<String> getTypes(){
        return articleDao.selectType();
    }

    //增加一个新分类
    public void addType(String typeName){
        articleDao.insertType(typeName);
    }

    //获取点赞信息
    public List<Star> getStars(){
        return articleDao.selectStar();
    }

    //增加点赞数
    public void updateStar(int uid,int aid,int num){
        articleDao.updateStarByAid(uid,aid,num);
    }

    //删除一个分类
    public void deleteType(String typeName){
        articleDao.deleteType(typeName);
    }

}
