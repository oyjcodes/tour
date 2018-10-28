package jx.tour.pojo;

public class Area {
    private Integer aid;

    private Integer areanum;

    private String areaname;

    private String areadescrible;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getAreanum() {
        return areanum;
    }

    public void setAreanum(Integer areanum) {
        this.areanum = areanum;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname == null ? null : areaname.trim();
    }

    public String getAreadescrible() {
        return areadescrible;
    }

    public void setAreadescrible(String areadescrible) {
        this.areadescrible = areadescrible == null ? null : areadescrible.trim();
    }
}