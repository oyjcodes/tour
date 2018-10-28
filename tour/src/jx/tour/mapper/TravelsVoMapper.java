package jx.tour.mapper;

import java.util.List;

import jx.tour.pojo.GiveGood;
import jx.tour.pojo.HComment;
import jx.tour.pojo.Information;
import jx.tour.pojo.Search;
import jx.tour.pojo.TravelCommentVo;
import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsVo;

public interface TravelsVoMapper {
	 //活动资讯、头条
	 List<Information> findInformationList(int value);
     //得到游记在界面上显示
	 List<TravelsVo> findGoodTravels();
	 //根据id找到某一个个游记
	 TravelsVo findTravelArticle(int id);
	 //根据游记id找到所有对该游记的评价
	 List<HComment> findTravelComment(int id);
	 //显示其余排行前四的游记
	 List<TravelsVo> findOtherTravels(int id);
	 //显示其余5个按时间排序的资讯文章
	 List<Information> findOtherInformation(int id);
	 
	 //按点赞数+保存数排序得到所有的游记
	 List<TravelsVo> findALLTravels();
	 //根据游记的标题模糊查询游记
	 List<TravelsVo> findTravelsByName(Search search);

	//根据资讯的标题模糊查询资讯
	 List<Information> findInformationByTitle(Search search);
    //点赞加1
	 public void addGood(GiveGood giveGood);
	 //显示用户自己发布的所有游记
     public List<TravelsVo> findUserAllTravels(int userid);
     
     //更新用户游记
     public void updateTravel(TravelsVo travelsVo);
     
     //后台修改游记的发布状态(通过游记发布)
     public void pass(int id);
     //后台修改游记的发布状态(不通过游记发布)
     public void noPass(int id);
     //批量通过一批游记的审核
     public void passSome(int[] ids);  
     //批量查询刚刚审核通过的游记
     public List<Travels> getPassTravels(int[] ids);
     
     //查询所有的游记评论
     public List<TravelCommentVo> getAllTravelsComment();
     //对游记评价进行审核通过
     public void passTravelsComment(int id);
     //对游记评价进行撤回处理
     public void rejectTravelsCommment(int id);
	 
}