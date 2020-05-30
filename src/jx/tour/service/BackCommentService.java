package jx.tour.service;

import java.util.List;

import jx.tour.pojo.HComment;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.SpecialtycommentVo;
import jx.tour.pojo.TravelCommentVo;

public interface BackCommentService {
	   //得到所有的景点的评论信息
		public List<ScenicComment> getAllScenicComment();
		//对评论信息审核通过
		public void passScenicComment(int cid);
		//对评论信息进行审核失败
		public void rejectScenicComment(int cid);
		
		
		//得到所有的特产评论
		public List<SpecialtycommentVo> getAllSpecialtyComment();
		//通过特产评论
		public void passSpecialtyComment(int id);
		//不通过特产评论
		public void rejectSpecialtyComment(int id);
		
		
		//获取所有酒店的评论信息
	    List<HComment> getAllHotelCommnet();
	    //对酒店评论信息进行下架
	    public void rejectHotelComment(int id);
	    //对酒店评价信息进行上架
	    public void passHotelComment(int id);
	    
	    //查询所有的游记评论
	     public List<TravelCommentVo> getAllTravelsComment();
	     //对游记评价进行审核通过
	     public void passTravelsComment(int id);
	     //对游记评价进行撤回处理
	     public void rejectTravelsCommment(int id);
}
