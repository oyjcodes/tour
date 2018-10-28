package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Hotelcomment;
import jx.tour.pojo.HotelcommentExample;
import org.apache.ibatis.annotations.Param;

public interface HotelcommentMapper {
    int countByExample(HotelcommentExample example);

    int deleteByExample(HotelcommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Hotelcomment record);

    int insertSelective(Hotelcomment record);

    List<Hotelcomment> selectByExampleWithBLOBs(HotelcommentExample example);

    List<Hotelcomment> selectByExample(HotelcommentExample example);

    Hotelcomment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Hotelcomment record, @Param("example") HotelcommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Hotelcomment record, @Param("example") HotelcommentExample example);

    int updateByExample(@Param("record") Hotelcomment record, @Param("example") HotelcommentExample example);

    int updateByPrimaryKeySelective(Hotelcomment record);

    int updateByPrimaryKeyWithBLOBs(Hotelcomment record);

    int updateByPrimaryKey(Hotelcomment record);
}