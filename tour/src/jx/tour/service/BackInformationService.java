package jx.tour.service;

import java.util.List;

import jx.tour.pojo.Information;

public interface BackInformationService {
	//查询所有的资讯信息
    public List<Information> getAllInformations();
    //更新资讯的状态（下架）
    public void downInformation(int id);
    //更新广告的状态（上架）
    public void upInformation(int id);
    //发布新的资讯信息
    public void addInformation(Information information);
    //编辑已经发布的资讯信息
    public void editInformation(Information information);
}
