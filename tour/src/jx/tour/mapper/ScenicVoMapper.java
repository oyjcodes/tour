package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicExample;
import jx.tour.pojo.ScenicVo;
import jx.tour.pojo.ScenicWithBLOBs;
import org.apache.ibatis.annotations.Param;

//后台查询景点的相关信息
public interface ScenicVoMapper {
	
	//查询景点的所有信息
    public List<ScenicVo> getAllScenic();
    //更新景点的状态（下架）
    public void downScenic(int scenicid);
   //更新景点的状态（上架）
    public void upScenic(int scenicid);
    //查询批量下架的景点信息
    public List<ScenicVo> selectScenics(int ids[]);
}