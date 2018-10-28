package jx.tour.pojo;

public class Scenic {
    private Integer scenicid;

    private String name;

    private Integer scenicnum;

    private String scenicaddress;

    private String pic1;

    private String title1;

    private String pic2;

    private String pic3;

    private Double cost;

    private String time;

    private String tel;

    private Integer category;

    private Integer stage;

    public Integer getScenicid() {
        return scenicid;
    }

    public void setScenicid(Integer scenicid) {
        this.scenicid = scenicid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getScenicnum() {
        return scenicnum;
    }

    public void setScenicnum(Integer scenicnum) {
        this.scenicnum = scenicnum;
    }

    public String getScenicaddress() {
        return scenicaddress;
    }

    public void setScenicaddress(String scenicaddress) {
        this.scenicaddress = scenicaddress == null ? null : scenicaddress.trim();
    }

    public String getPic1() {
        return pic1;
    }

    public void setPic1(String pic1) {
        this.pic1 = pic1 == null ? null : pic1.trim();
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1 == null ? null : title1.trim();
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

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public Integer getStage() {
        return stage;
    }

    public void setStage(Integer stage) {
        this.stage = stage;
    }
}