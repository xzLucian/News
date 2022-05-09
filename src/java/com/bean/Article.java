package com.bean;

import java.util.List;

//文章的实体类
public class Article {
    //文章ID
    private int aid;
    //文章标题
    private String atitle;
    //文章种类
    private String atype;
    //文章作者
    private String author;
    //文章日期
    private String adate;
    //文章内容
    private String content;
    //文章状态，0未审核，1已审核
    private int astate;
    //文章评论
    private List<Comment> comments = null;
    //文章点赞数
    private int astar;

    private String imgSrc;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAtitle() {
        return atitle;
    }

    public void setAtitle(String atitle) {
        this.atitle = atitle;
    }

    public String getAtype() {
        return atype;
    }

    public void setAtype(String atype) {
        this.atype = atype;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAdate() {
        return adate;
    }

    public void setAdate(String adate) {
        this.adate = adate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAstate() {
        return astate;
    }

    public void setAstate(int astate) {
        this.astate = astate;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public int getAstar() {
        return astar;
    }

    public void setAstar(int astar) {
        this.astar = astar;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    @Override
    public String toString() {
        return "Article{" +
                "aid=" + aid +
                ", atitle='" + atitle + '\'' +
                ", atype='" + atype + '\'' +
                ", author='" + author + '\'' +
                ", adate='" + adate + '\'' +
                ", content='" + content + '\'' +
                ", astate=" + astate +
                ", comments=" + comments +
                '}';
    }
}
