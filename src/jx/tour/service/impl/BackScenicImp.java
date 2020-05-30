package jx.tour.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jx.tour.common.pojo.EUDateGridResult;
import jx.tour.mapper.ContentMapper;
import jx.tour.mapper.ScenicVoMapper;
import jx.tour.pojo.Content;
import jx.tour.pojo.ScenicVo;
import jx.tour.service.BackScenicService;

@Service
public class BackScenicImp implements BackScenicService {
    @Autowired
    private ScenicVoMapper scenicVoMapper;
    @Autowired
    private ContentMapper contentMapper;
	@Override
	public EUDateGridResult getContentScenics(int page, int rows) {
		return null;
	}
/*	@Override
	public List<ScenicVo> getAllScenics() {
		List<ScenicVo> list = scenicVoMapper.getAllScenic();
		return list;
	}
*/
	@Override  
	//得到所有的风景信息
	public List<ScenicVo> getAllScenics() {   
		List<ScenicVo> list = scenicVoMapper.getAllScenic();  
		return list;
	 
	}
	@Override
	public void publishScenic(Content content) {
		content.setCreated(new Date());
		content.setCategoryid(0);
		content.setStage(1);
		contentMapper.insert(content);
	}
	

}
