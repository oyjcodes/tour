package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Scenic;
import jx.tour.pojo.ScenicExample;
import jx.tour.pojo.ScenicWithBLOBs;
import org.apache.ibatis.annotations.Param;

public interface ScenicMapper {
    int countByExample(ScenicExample example);

    int deleteByExample(ScenicExample example);

    int deleteByPrimaryKey(Integer scenicid);

    int insert(ScenicWithBLOBs record);

    int insertSelective(ScenicWithBLOBs record);

    List<ScenicWithBLOBs> selectByExampleWithBLOBs(ScenicExample example);

    List<Scenic> selectByExample(ScenicExample example);

    ScenicWithBLOBs selectByPrimaryKey(Integer scenicid);

    int updateByExampleSelective(@Param("record") ScenicWithBLOBs record, @Param("example") ScenicExample example);

    int updateByExampleWithBLOBs(@Param("record") ScenicWithBLOBs record, @Param("example") ScenicExample example);

    int updateByExample(@Param("record") Scenic record, @Param("example") ScenicExample example);

    int updateByPrimaryKeySelective(ScenicWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ScenicWithBLOBs record);

    int updateByPrimaryKey(Scenic record);
}