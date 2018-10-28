package jx.tour.pojo;

public class TravelsWithBLOBs extends Travels {
    private String describle1;

    private String describle2;

    private String describle3;

    public String getDescrible1() {
        return describle1;
    }

    public void setDescrible1(String describle1) {
        this.describle1 = describle1 == null ? null : describle1.trim();
    }

    public String getDescrible2() {
        return describle2;
    }

    public void setDescrible2(String describle2) {
        this.describle2 = describle2 == null ? null : describle2.trim();
    }

    public String getDescrible3() {
        return describle3;
    }

    public void setDescrible3(String describle3) {
        this.describle3 = describle3 == null ? null : describle3.trim();
    }
}