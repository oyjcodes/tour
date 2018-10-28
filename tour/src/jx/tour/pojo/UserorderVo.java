package jx.tour.pojo;

public class UserorderVo extends Userorder {
   private int allnum;//某一产品的库存量
   private String  tpic;//商品图片
   private String  pic2;
   private String  pic3;

public int getAllnum() {
	return allnum;
}

public void setAllnum(int allnum) {
	this.allnum = allnum;
}

public String getTpic() {
	return tpic;
}

public void setTpic(String tpic) {
	this.tpic = tpic;
}

public String getPic2() {
	return pic2;
}

public void setPic2(String pic2) {
	this.pic2 = pic2;
}

public String getPic3() {
	return pic3;
}

public void setPic3(String pic3) {
	this.pic3 = pic3;
}  

}
