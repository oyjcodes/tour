package jx.tour.service;

import java.util.List;

import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsWithBLOBs;

public interface BackTravelsService {
   //得到所有的游记
   public List<TravelsWithBLOBs> getAllTravles();
   //修改游记的发布状态(通过用户游记的发布）
   public void pass(int id);
 //修改游记的发布状态(不通过用户游记的发布）
   public void reject(int id);
   //批量通过一批游记的审核
   public void passSome(int[] ids);
   //批量查询刚刚审核通过的游记
   public List<Travels> getPassTravels(int[] ids);
 
}
