package jx.tour.mapper;

import java.util.List;

import org.apache.coyote.http11.filters.VoidInputFilter;

import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicComment;
import jx.tour.pojo.Search;

public interface ScenicCommentMapper {
	 //显示对某一景点的所有评论信息
	public List<ScenicComment> getScenicComment(int scenic_id);
	 //得到3个景点显示在资讯页面
	public List<Scenic> getScenic();
	//随机显示10个景点在“醉美江西页面”
	public List<Scenic> getSomeScenic();
	//根据景点名称模糊查询具体景点信息
	public List<Scenic> getScenicByName(Search search);
	
/*	后台*/
	//得到所有的景点的评论信息
	public List<ScenicComment> getAllScenicComment();
	//对评论信息审核通过
	public void passScenicComment(int cid);
	//对评论信息进行审核失败
	public void rejectScenicComment(int cid);
	
}