package com.bean;

import java.util.List;

//用户实体类
public class User {
    //用户ID
    private int uid;
    //用户账号
    private String uname;
    //用户密码
    private String upwd;
    //用户昵称
    private String unickname;
    //用户权限，0管理，1编辑，2普通用户
    private int upower;
    //用户查看记录
    private List<History> historys = null;
    //用户收藏
    private List<Collection> collections = null;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUnickname() {
        return unickname;
    }

    public void setUnickname(String unickname) {
        this.unickname = unickname;
    }

    public int getUpower() {
        return upower;
    }

    public void setUpower(int upower) {
        this.upower = upower;
    }

    public List<History> getHistorys() {
        return historys;
    }

    public void setHistorys(List<History> historys) {
        this.historys = historys;
    }

    public List<Collection> getCollections() {
        return collections;
    }

    public void setCollections(List<Collection> collections) {
        this.collections = collections;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", pwd='" + upwd + '\'' +
                ", unickname='" + unickname + '\'' +
                ", upower=" + upower +
                '}';
    }
}
