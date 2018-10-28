package jx.tour.service;

import java.util.List;

import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Search;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtycommentVo;

public interface SpecialtyService {
 //根据id得到某个特产的具体信息
  public  Specialty getSpecialty(int specialty_id);
 //根据id得到某个特产的所有相关评价
 //这里的用ScenicComment类代替SpeicaltyComment,字段差不多，就不写SpeicaltyComment类了
  public  List<ScenicComment> getSpecialtyComment(int specialty_id);
  //除此产品之外的其他特产推荐
  public  List<Specialty> getOtherSpecialty(int specialty_id);
  //随机选择3个特产商品
  public List<Specialty> getSomeSpecialty();
  //随机选择6个除了自己本身、本地区的6个特产商品
  public List<Specialty> getOtherSpecialty(int tnum,int id);
  //选择所有的特产，在特产商城显示
  public List<Specialty> getAllSpecialty();
  //根据输入框输入的特产名称模糊查询相关特产
  public List<Specialty> getSpecialtyByName(Search search);
  //发表特产评论
  public void publishSpecialtyComment(SpecialtycommentVo specialtycommentVo);
 
}
