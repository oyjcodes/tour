package jx.tour.service;

import java.util.List;

import jx.tour.pojo.HotelVo;
import jx.tour.pojo.HotelWithBLOBs;

public interface BackHotelService {
	//查询所有的酒店信息
    public List<HotelVo> getAllHotel(); 
    //更新景点的状态（下架）
    public void downHotel(int hid);  
    //更新景点的状态（上架）
    public void upHotel(int hid);  
    //编辑指定的景点信息
  	public void editHotel(HotelWithBLOBs hotel); 
  	//添加酒店信息
  	public void addHotel(HotelWithBLOBs hotel);
}
