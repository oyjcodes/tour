package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Ads;

public interface MadsMapper {
	
	//按发布时间的最新顺序+stage=1显示轮播广告
	public List<Ads> getAdsList(); 
	
	//查询所有的广告信息
    public List<Ads> getAllAds();
    //更新广告的状态（下架）
    public void downAds(int id);
    //更新广告的状态（上架）
    public void upAds(int id);
}