package jx.tour.service;

import java.util.List;

import jx.tour.pojo.Ads;

public interface BackAdsService {
	//查询所有的广告信息
    public List<Ads> getAllAds();
    //保存广告信息
    public void addAds(Ads ad);
    //编辑广告信息
    public void editAds(Ads ad);
    //更新广告的状态（下架）
    public void downAds(int id);
    //更新广告的状态（上架）
    public void upAds(int id);
}
