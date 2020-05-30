package jx.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.AdsMapper;
import jx.tour.mapper.MadsMapper;
import jx.tour.pojo.Ads;

@Service
public class BackAdsServiceImp implements BackAdsService {
@Autowired
private MadsMapper madsMapper;
@Autowired
private AdsMapper adsMapper;
	@Override
	public List<Ads> getAllAds() {
		List<Ads> list = madsMapper.getAllAds();
		return list;
	}

	@Override
	public void addAds(Ads ad) {
		adsMapper.insert(ad);
	}

	@Override
	public void downAds(int id) {
		 madsMapper.downAds(id);
	}

	@Override
	public void upAds(int id) {
		 madsMapper.upAds(id);
	}

	@Override
	public void editAds(Ads ad) {
		adsMapper.updateByPrimaryKey(ad);
		
	}

}
