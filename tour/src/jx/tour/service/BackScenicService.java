package jx.tour.service;

import java.util.List;

import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.pojo.Content;
import jx.tour.pojo.ScenicVo;
 

public interface BackScenicService {  
  //得到可以显示在首页的所有风景信息
  public EUDateGridResult getContentScenics(int page, int rows);
  //得到所有的风景信息
  public List<ScenicVo> getAllScenics();
  //发布景点信息到前前台页面
  public void publishScenic(Content content);
}
