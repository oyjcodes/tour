package jx.tour.service;

import java.util.List;

import jx.tour.pojo.GiveGood;
import jx.tour.pojo.HComment;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Search;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.Travelcomment;
import jx.tour.pojo.TravelsVo;
import jx.tour.pojo.TravelsWithBLOBs;

public interface TravelsService {
 //根据id得到某个游记的具体信息
  public  TravelsVo getTravelsVo(int Travels_id);
 //根据id得到某个游记的所有评价信息
  public  List<HComment> getTravelsComment(int Travels_id);
  //显示其余排行前四的游记
  public List<TravelsVo> getOtherTravels(int id);
  
  //显示所有的游记
  public List<TravelsVo> getAllTravels();
  
   //将游记信息保存进数据库中
  public void saveTravel(TravelsWithBLOBs travel);
  
  //根据游记的标题模糊查询游记
	 List<TravelsVo> getTravelsByName(Search search);
	 
  //评论游记
	 public void giveTravelCommment(Travelcomment travelcomment);
  //给游记点赞
  public void addGood(GiveGood giveGood);
  //根据用户id查询该用户所有发布过的游记
  public List<TravelsVo> getUserAllTravels(int userid);
  //编辑修改用户游记
  public void editTravel(TravelsVo travelsVo);
  //删除游记
  public void deleteTravel(int travelid);
  
 
}
