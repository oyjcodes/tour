package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Ads;
import jx.tour.pojo.AdsExample;
import org.apache.ibatis.annotations.Param;

public interface AdsMapper {
    int countByExample(AdsExample example);

    int deleteByExample(AdsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ads record);

    int insertSelective(Ads record);

    List<Ads> selectByExampleWithBLOBs(AdsExample example);

    List<Ads> selectByExample(AdsExample example);

    Ads selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ads record, @Param("example") AdsExample example);

    int updateByExampleWithBLOBs(@Param("record") Ads record, @Param("example") AdsExample example);

    int updateByExample(@Param("record") Ads record, @Param("example") AdsExample example);

    int updateByPrimaryKeySelective(Ads record);

    int updateByPrimaryKeyWithBLOBs(Ads record);

    int updateByPrimaryKey(Ads record);
}