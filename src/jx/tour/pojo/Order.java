package jx.tour.pojo;

import java.util.Date;

public class Order {
   private int id;//特产id
   private int allnum;//商品所在库存的总数
   private String tname;//订单商品名称
   private double tprice;//商品单价
   private int qty_item_1;//订购商品的数量
   private double total;//订单总价
   private String tpic;//商品图片
   private Date orderTime;//下单时间
   private String orderId;//订单编号
   
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTname() {
	return tname;
}
public void setTname(String tname) {
	this.tname = tname;
}
public double getTprice() {
	return tprice;
}
public void setTprice(double tprice) {
	this.tprice = tprice;
}
public int getQty_item_1() {
	return qty_item_1;
}
public void setQty_item_1(int qty_item_1) {
	this.qty_item_1 = qty_item_1;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}
public String getTpic() {
	return tpic;
}
public void setTpic(String tpic) {
	this.tpic = tpic;
}
public Date getOrderTime() {
	return orderTime;
}
public void setOrderTime(Date orderTime) {
	this.orderTime = orderTime;
}
public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public int getAllnum() {
	return allnum;
}
public void setAllnum(int allnum) {
	this.allnum = allnum;
}

}
