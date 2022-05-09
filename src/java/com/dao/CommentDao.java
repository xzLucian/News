package com.dao;

import com.bean.Comment;
import com.common.JUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@Component
public class CommentDao implements Dao{
    @Autowired
    JUtil jUtil;

    public List<Comment> selectByAid(int aid){
        String sql = "select * from comment where aid="+aid;
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<Comment> comments = new LinkedList<Comment>();
        try {
            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setAid(resultSet.getInt("aid"));
                comment.setCauthor(resultSet.getString("cauthor"));
                comment.setCid(resultSet.getInt("cid"));
                comment.setContent(resultSet.getString("content"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return comments;
        }
    }

    public void insert(Comment comment){
        String sql = "insert into comment(aid,cid,cauthor,content) values(" +
                comment.getAid()+","+
                comment.getCid()+","+
                "'"+comment.getCauthor()+"'"+","+
                "'"+comment.getContent()+"'"+
                ")";
        jUtil.executeSQL(sql);
    }
}
