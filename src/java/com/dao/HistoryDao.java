package com.dao;

import com.bean.Collection;
import com.bean.History;
import com.common.JUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@Component
public class HistoryDao implements Dao {
    @Autowired
    JUtil jUtil;

    public List<History> selectByUid(int uid) {
        String sql = "select * from history where uid=" + uid;
        ResultSet resultSet = jUtil.executeSQL(sql);
        List<History> historys = new LinkedList<History>();
        try {
            while (resultSet.next()) {
                History history = new History();
                history.setUid(resultSet.getInt("uid"));
                history.setAid(resultSet.getInt("aid"));
                historys.add(history);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return historys;
    }

    public List<Collection> selectById(int uid,int aid) {
        String sql = "select * from history where aid="+aid+" and uid="+uid;
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
        String sql = "insert into history(uid,aid) values(" +
                uid + "," +
                aid +
                ")";
        jUtil.executeSQL(sql);
    }

    public void deleteHistorys(int uid){
        String sql = "delete from history where uid = "+uid;
        jUtil.executeSQL(sql);

    }
}
