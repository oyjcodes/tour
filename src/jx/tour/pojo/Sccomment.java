package jx.tour.pojo;

import java.util.Date;

public class Sccomment {
    private Integer cid;

    private Integer usernum;

    private Integer secenynum;

    private Date ptime;

    private Integer stage;

    private String content;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUsernum() {
        return usernum;
    }

    public void setUsernum(Integer usernum) {
        this.usernum = usernum;
    }

    public Integer getSecenynum() {
        return secenynum;
    }

    public void setSecenynum(Integer secenynum) {
        this.secenynum = secenynum;
    }

    public Date getPtime() {
        return ptime;
    }

    public void setPtime(Date ptime) {
        this.ptime = ptime;
    }

    public Integer getStage() {
        return stage;
    }

    public void setStage(Integer stage) {
        this.stage = stage;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}