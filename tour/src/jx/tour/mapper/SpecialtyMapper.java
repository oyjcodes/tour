package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtyExample;
import org.apache.ibatis.annotations.Param;

public interface SpecialtyMapper {
    int countByExample(SpecialtyExample example);

    int deleteByExample(SpecialtyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Specialty record);

    int insertSelective(Specialty record);

    List<Specialty> selectByExampleWithBLOBs(SpecialtyExample example);

    List<Specialty> selectByExample(SpecialtyExample example);

    Specialty selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Specialty record, @Param("example") SpecialtyExample example);

    int updateByExampleWithBLOBs(@Param("record") Specialty record, @Param("example") SpecialtyExample example);

    int updateByExample(@Param("record") Specialty record, @Param("example") SpecialtyExample example);

    int updateByPrimaryKeySelective(Specialty record);

    int updateByPrimaryKeyWithBLOBs(Specialty record);

    int updateByPrimaryKey(Specialty record);
}