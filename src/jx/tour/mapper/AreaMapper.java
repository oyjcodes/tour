package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Area;
import jx.tour.pojo.AreaExample;
import org.apache.ibatis.annotations.Param;

public interface AreaMapper {
    int countByExample(AreaExample example);

    int deleteByExample(AreaExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Area record);

    int insertSelective(Area record);

    List<Area> selectByExampleWithBLOBs(AreaExample example);

    List<Area> selectByExample(AreaExample example);

    Area selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Area record, @Param("example") AreaExample example);

    int updateByExampleWithBLOBs(@Param("record") Area record, @Param("example") AreaExample example);

    int updateByExample(@Param("record") Area record, @Param("example") AreaExample example);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKeyWithBLOBs(Area record);

    int updateByPrimaryKey(Area record);
}