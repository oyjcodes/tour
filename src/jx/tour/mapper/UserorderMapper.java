package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Userorder;
import jx.tour.pojo.UserorderExample;
import org.apache.ibatis.annotations.Param;

public interface UserorderMapper {
    int countByExample(UserorderExample example);

    int deleteByExample(UserorderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Userorder record);

    int insertSelective(Userorder record);

    List<Userorder> selectByExample(UserorderExample example);

    Userorder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Userorder record, @Param("example") UserorderExample example);

    int updateByExample(@Param("record") Userorder record, @Param("example") UserorderExample example);

    int updateByPrimaryKeySelective(Userorder record);

    int updateByPrimaryKey(Userorder record);
}