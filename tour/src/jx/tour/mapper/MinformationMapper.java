package jx.tour.mapper;

import java.util.List;

import jx.tour.pojo.Information;

public interface MinformationMapper {
	//查询所有的资讯信息
    public List<Information> getAllInformations();
    //更新资讯的状态（下架）
    public void downInformation(int id);
    //更新广告的状态（上架）
    public void upInformation(int id);
}