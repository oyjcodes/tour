package jx.tour.service;
import java.util.List;

import jx.tour.pojo.HComment;
import jx.tour.pojo.Hotel;
import jx.tour.pojo.HotelWithBLOBs;
import jx.tour.pojo.Hotelcomment;

public interface HotelService {
  //根据id显示酒店的具体信息
  public  Hotel getHotel(int hotel_id);
  //在某个酒店详细信息页面显示其余的酒店信息
  public List<Hotel> getOtherHotel(int hnum,int hid);
  //得到该酒店的评价信息
  public List<HComment> getHotelComment(int hid);
  //随机抽取3个酒店的信息
  public List<Hotel> getSomeHotels();
  //随机抽取11个酒店的信息
  public List<HotelWithBLOBs> getAllHotels();
  //保存对酒店的信息评论
  public void saveHotelComment(Hotelcomment hotelcomment);
  
 
}
