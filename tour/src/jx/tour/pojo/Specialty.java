package jx.tour.pojo;

public class Specialty {
    private Integer id;

    private Integer tnum;

    private String tcategory;

    private String tname;

    private Double tprice;

    private String tpic;

    private String pic2;

    private String pic3;

    private Integer stocknum;

    private Integer stage;

    private String tdescrible;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTnum() {
        return tnum;
    }

    public void setTnum(Integer tnum) {
        this.tnum = tnum;
    }

    public String getTcategory() {
        return tcategory;
    }

    public void setTcategory(String tcategory) {
        this.tcategory = tcategory == null ? null : tcategory.trim();
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public Double getTprice() {
        return tprice;
    }

    public void setTprice(Double tprice) {
        this.tprice = tprice;
    }

    public String getTpic() {
        return tpic;
    }

    public void setTpic(String tpic) {
        this.tpic = tpic == null ? null : tpic.trim();
    }

    public String getPic2() {
        return pic2;
    }

    public void setPic2(String pic2) {
        this.pic2 = pic2 == null ? null : pic2.trim();
    }

    public String getPic3() {
        return pic3;
    }

    public void setPic3(String pic3) {
        this.pic3 = pic3 == null ? null : pic3.trim();
    }

    public Integer getStocknum() {
        return stocknum;
    }

    public void setStocknum(Integer stocknum) {
        this.stocknum = stocknum;
    }

    public Integer getStage() {
        return stage;
    }

    public void setStage(Integer stage) {
        this.stage = stage;
    }

    public String getTdescrible() {
        return tdescrible;
    }

    public void setTdescrible(String tdescrible) {
        this.tdescrible = tdescrible == null ? null : tdescrible.trim();
    }
}