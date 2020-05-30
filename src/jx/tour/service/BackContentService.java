package jx.tour.service;

import java.util.List;

import jx.tour.pojo.Content;
import jx.tour.pojo.ContentVo;

public interface BackContentService {
	 //对前台的特产及风景的发布表进行查询
    public List<ContentVo> getPublishContent(int categoryid);
    //对前台的特产及风景的发布表项进行下架
    public void downPublishContent(int cid);
    //对前台的特产及风景的发布表项进行上架
    public void upPublishContent(int cid);
    //发布新的特产或风景的资讯信息
    public void addContent(Content content);
    //对新发布的特产或风景进行修改
    public void editContent(Content content);
}
