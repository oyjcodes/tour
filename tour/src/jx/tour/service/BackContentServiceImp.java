package jx.tour.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jx.tour.mapper.ContentMapper;
import jx.tour.mapper.ContentVoMapper;
import jx.tour.pojo.Content;
import jx.tour.pojo.ContentVo;

@Service
public class BackContentServiceImp implements BackContentService {

@Autowired
private ContentVoMapper contentVoMapper;
@Autowired
private ContentMapper contentMapper;
	@Override
	public List<ContentVo> getPublishContent(int categoryid) {
		List<ContentVo> list = contentVoMapper.getPublishContent(categoryid);
		return list;
	}

	@Override
	public void downPublishContent(int cid) {
		contentVoMapper.downPublishContent(cid);
	}

	@Override
	public void upPublishContent(int cid) {
		contentVoMapper.upPublishContent(cid);
	}

	@Override
	public void addContent(Content content) {
		contentMapper.insert(content);
	}

	@Override
	public void editContent(Content content) {
		contentMapper.updateByPrimaryKey(content);
	}

}
