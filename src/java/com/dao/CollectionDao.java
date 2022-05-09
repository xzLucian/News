package com.dao;

import com.bean.Collection;
import com.common.JUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@Component
public class CollectionDao implements Dao {
    @Autowired
    JUtil jUtil;

    public List<Collection> selectByUid(int uid) {
        String sql = "select * from collection where uid=" + uid;
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<Collection> collections = new LinkedList<Collection>();
        try {
            while (resultSet.next()) {
                Collection collection = new Collection();
                collection.setUid(resultSet.getInt("uid"));
                collection.setAid(resultSet.getInt("aid"));
                collections.add(collection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collections;
    }

    public List<Collection> selectById(int uid,int aid) {
        String sql = "select * from collection where aid=" + aid + " and uid="+uid;
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<Collection> collections = new LinkedList<Collection>();
        try {
            while (resultSet.next()) {
                Collection collection = new Collection();
                collection.setUid(resultSet.getInt("uid"));
                collection.setAid(resultSet.getInt("aid"));
                collections.add(collection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collections;
    }

    public void insert(int uid, int aid) {
        String sql = "insert into collection(uid,aid) values(" +
                uid + "," +
                aid +
                ")";
        jUtil.executeSQL(sql);
    }

    public void delete(int uid,int aid){
        String sql = "delete from collection where uid = "+uid+" and aid="+aid;
        jUtil.executeSQL(sql);
    }
}
