package jx.tour.utils;

public class PageUtils {
   private Long total;//总的记录数
   private int pageNum;//总的页数
   private int currentPageNum;//当前的页号
   private int nextPageNum;//下一页的页号
   private int backPageNum;//上一页的页号；

public Long getTotal() {
	return total;
}

public void setTotal(Long total) {
	this.total = total;
}

public int getPageNum() {
	return pageNum;
}

public void setPageNum(int pageNum) {
	this.pageNum = pageNum;
}

public int getCurrentPageNum() {
	return currentPageNum;
}

public void setCurrentPageNum(int currentPageNum) {
	this.currentPageNum = currentPageNum;
}

public int getNextPageNum() {
	return nextPageNum;
}

public void setNextPageNum(int nextPageNum) {
	this.nextPageNum = nextPageNum;
}

public int getBackPageNum() {
	return backPageNum;
}

public void setBackPageNum(int backPageNum) {
	this.backPageNum = backPageNum;
}
}
