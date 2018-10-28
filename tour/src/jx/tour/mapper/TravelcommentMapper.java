package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Travelcomment;
import jx.tour.pojo.TravelcommentExample;
import org.apache.ibatis.annotations.Param;

public interface TravelcommentMapper {
    int countByExample(TravelcommentExample example);

    int deleteByExample(TravelcommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Travelcomment record);

    int insertSelective(Travelcomment record);

    List<Travelcomment> selectByExampleWithBLOBs(TravelcommentExample example);

    List<Travelcomment> selectByExample(TravelcommentExample example);

    Travelcomment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Travelcomment record, @Param("example") TravelcommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Travelcomment record, @Param("example") TravelcommentExample example);

    int updateByExample(@Param("record") Travelcomment record, @Param("example") TravelcommentExample example);

    int updateByPrimaryKeySelective(Travelcomment record);

    int updateByPrimaryKeyWithBLOBs(Travelcomment record);

    int updateByPrimaryKey(Travelcomment record);
}