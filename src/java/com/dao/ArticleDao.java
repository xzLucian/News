package com.dao;

import com.bean.Article;
import com.bean.Star;
import com.common.JUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@Component
public class ArticleDao implements Dao {
    @Autowired
    JUtil jUtil;

    public List<Article> select() {
        String sql = "select * from article";
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<Article> articles = new LinkedList<Article>();
        try {
            while (resultSet.next()) {
                Article article = new Article();
                article.setAid(resultSet.getInt("aid"));
                article.setAdate(resultSet.getString("adate"));
                article.setAuthor(resultSet.getString("author"));
                article.setContent(resultSet.getString("content"));
                article.setAtitle(resultSet.getString("atitle"));
                article.setAtype(resultSet.getString("atype"));
                article.setAstate(resultSet.getInt("astate"));
                article.setAstar(resultSet.getInt("astar"));
                article.setImgSrc(resultSet.getString("imgSrc"));
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return articles;
        }
    }

    public List<Article> selectByTitle(String atitle) {
        String sql = "select * from article where atitle like '%" + atitle + "%'";
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<Article> articles = new LinkedList<Article>();
        try {
            while (resultSet.next()) {
                Article article = new Article();
                article.setAid(resultSet.getInt("aid"));
                article.setAdate(resultSet.getString("adate"));
                article.setAuthor(resultSet.getNString("author"));
                article.setContent(resultSet.getString("content"));
                article.setAtitle(resultSet.getString("atitle"));
                article.setAtype(resultSet.getString("atype"));
                article.setAstate(resultSet.getInt("astate"));
                article.setAstar(resultSet.getInt("astar"));
                article.setImgSrc(resultSet.getString("imgSrc"));
                articles.add(article);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            return articles;
        }
    }


    public void insert(Article article) {
        String sql = "insert into article (atitle,atype,author,adate,content,imgSrc,astate) values(" +
                "'" + article.getAtitle() + "'" + "," +
                "'" + article.getAtype() + "'" + "," +
                "'" + article.getAuthor() + "'" + "," +
                "'" + article.getAdate() + "'" + "," +
                "'" + article.getContent() + "'" + "," +
                "'" + article.getImgSrc() + "'" +","+
                article.getAstate() +
                ")";
        jUtil.executeSQL(sql);
    }

    public void delete(int aid){
        String sql = "delete from article where aid="+aid;
        jUtil.executeSQL(sql);
    }

    public void updateStateByID(int aid) {
        String sql = "update article set astate=1 where aid=" + aid;
        jUtil.executeSQL(sql);
    }

    public List<String> selectType() {
        List<String> types = new LinkedList<String>();
        String sql = "select type from type";
        ResultSet resultSet = jUtil.executeSQL(sql);
        try {
            while (resultSet.next()) {
                types.add(resultSet.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }

    public void deleteType(String typeName){
        String sql = "delete from type where type="+"'"+typeName+"'";
        jUtil.executeSQL(sql);
    }

    public void insertType(String typeName){
        String sql = "insert into type(type) values('" +
                typeName+
                "')";
        jUtil.executeSQL(sql);
    }

    public List<Star> selectStar(){
        List<Star> stars = new LinkedList<Star>();
        String sql = "select * from star";
        ResultSet resultSet = jUtil.executeSQL(sql);
        try{
            while (resultSet.next()){
                Star star = new Star();
                star.setUid(resultSet.getInt("uid"));
                star.setAid(resultSet.getInt("aid"));
                stars.add(star);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return stars;
        }
    }

    public void updateStarByAid(int uid,int aid,int num){
        String sql= "update article set astar = astar+"+num+" where aid = "+aid;
        jUtil.executeSQL(sql);
        if(num==-1){
            String sql1 = "delete from star where uid="+uid +" and aid="+aid;
            jUtil.executeSQL(sql1);
        }else {
            String sql2= "insert into star(uid,aid) values("+uid+","+aid+")";
            jUtil.executeSQL(sql2);
        }
    }
}
