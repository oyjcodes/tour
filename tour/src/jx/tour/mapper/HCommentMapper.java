package jx.tour.mapper;

import java.util.List;

import jx.tour.pojo.HComment;


public interface HCommentMapper {
	//获取当前酒店的评论信息
    List<HComment> getHotelCommment(int hid);
    
    //获取所有酒店的评论信息
    List<HComment> getAllHotelCommnet();
    //对酒店评论信息进行下架
    public void rejectHotelComment(int id);
    //对酒店评价信息进行上架
    public void passHotelComment(int id);
    
}