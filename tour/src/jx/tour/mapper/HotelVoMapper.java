package jx.tour.mapper;

import java.util.List;

import jx.tour.pojo.HotelVo;


//后台查询酒店的相关信息
public interface HotelVoMapper {
	//查询所有的酒店信息
    public List<HotelVo> getAllHotel();
    //更新景点的状态（下架）
    public void downHotel(int hid);
    //更新景点的状态（上架）
    public void upHotel(int hid);
}