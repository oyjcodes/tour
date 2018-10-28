package jx.tour.service;
import java.util.List;

import jx.tour.pojo.Hotel;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.Specialty;
public interface AreaService {
 //显示江西某个城市的风景
  public List<Scenic> getALLScenicList(int id);
  //显示江西某个城市的特产
  public List<Specialty> getALLSpecialty(int id);
  //显示江西某个城市的美食
  public List<Specialty> getALLGoodFood(int id);
  //随机显示江西某个城市的6种特产
  public List<Specialty> getSomeSpecialty(int id);
  //随机显示江西某个城市的6种美食
  public List<Specialty> getSomeFood(int id);
  //随机显示江西某个城市的6个红色景点
  public List<Scenic> getSomeRedScenic(int id);
  //随机显示江西某个城市的6个红色景点
  public List<Hotel> getSomHotels(int id);
}
