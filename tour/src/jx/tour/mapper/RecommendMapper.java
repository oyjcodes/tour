package jx.tour.mapper;

import java.util.List;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.Specialty;

public interface RecommendMapper {
	//从特产表中随机抽取当前城市6种不同的特产
    List<Specialty> findGoodSpecialty(int id);
   //从特产表中随机抽取当前城市6种不同的美食
    List<Specialty> findGoodFood(int id);
   //从景点表中随机选取当前城市6个红色旅游景点
    List<Scenic> findSomeRedScenic(int id);
    //随机选取当前城市6个酒店
    List<Hotel> findSomeHotels(int id);
    
}