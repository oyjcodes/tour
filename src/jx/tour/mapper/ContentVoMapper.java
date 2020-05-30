package jx.tour.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jx.tour.pojo.Content;
import jx.tour.pojo.ContentVo;
public interface ContentVoMapper {
    //对前台的特产及风景的发布表进行查询
    public List<ContentVo> getPublishContent(int categoryid);
    //对前台的特产及风景的发布表项进行下架
    public void downPublishContent(int cid);
    //对前台的特产及风景的发布表项进行上架
    public void upPublishContent(int cid);
    
    
    //查询发布到首页的风景或特产信息（先发布最新的风景或特产信息）
    public List<Content> getContentScenic();
    public List<Content> getContentSpecialty();
    
}