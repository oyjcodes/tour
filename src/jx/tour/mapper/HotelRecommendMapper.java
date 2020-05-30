package jx.tour.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.HotelWithBLOBs;

public interface HotelRecommendMapper {
	//得到某地的其它酒店
    public List<Hotel> getOtherHotels(int hnum, int hid);
    //随机抽取3个酒店信息
    public List<Hotel> getSomeHotels();
    //得到11个酒店(当点击更多时随机显示11个酒店信息)
    public List<HotelWithBLOBs> getALLHotels();
}