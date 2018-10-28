package jx.tour.service;

import java.util.List;

import javax.sound.midi.MidiDevice.Info;

import jx.tour.pojo.Information;
import jx.tour.pojo.Search;


public interface InformationService {
 //首页每个景点的具体信息
  public  Information getInformation(int information_id);
  //得到其余5个资讯信息（按时间排序）
  public List<Information> getOtherInformations(int id);
  //得到所有的热点资讯
  public List<Information> getALLInformations();
  
  //根据资讯标题模糊查询资讯信息
  public List<Information> getInformationByTitle(Search search);
  
 
}
