package jx.tour.service;

import java.util.List;

import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.pojo.Ads;
import jx.tour.pojo.Content;
import jx.tour.pojo.Information;
import jx.tour.pojo.Travels;
import jx.tour.pojo.TravelsVo;

public interface IndexService {
 //首页轮播图的信息显示
  public List<Ads> getAdsList();
 //首页风景图的信息显示
  public List<Content> getContentScenic();
//首页特产的信息显示
  public List<Content> getContentSpecialty();
 //首页活动、热点资讯信息显示
  public List<Information>getInformationList(int value);
//首页游记信息显示
  public List<TravelsVo>getTravelVoList();
 
}
