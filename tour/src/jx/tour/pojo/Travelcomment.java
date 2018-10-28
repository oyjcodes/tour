package jx.tour.pojo;

import java.util.Date;

public class Travelcomment {
    private Integer id;

    private Integer usernum;

    private Integer travelnum;

    private Date ptime;

    private Integer stage;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUsernum() {
        return usernum;
    }

    public void setUsernum(Integer usernum) {
        this.usernum = usernum;
    }

    public Integer getTravelnum() {
        return travelnum;
    }

    public void setTravelnum(Integer travelnum) {
        this.travelnum = travelnum;
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