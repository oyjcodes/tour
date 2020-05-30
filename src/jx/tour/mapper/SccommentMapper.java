package jx.tour.mapper;

import java.util.List;
import jx.tour.pojo.Sccomment;
import jx.tour.pojo.SccommentExample;
import org.apache.ibatis.annotations.Param;

public interface SccommentMapper {
    int countByExample(SccommentExample example);

    int deleteByExample(SccommentExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Sccomment record);

    int insertSelective(Sccomment record);

    List<Sccomment> selectByExampleWithBLOBs(SccommentExample example);

    List<Sccomment> selectByExample(SccommentExample example);

    Sccomment selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Sccomment record, @Param("example") SccommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Sccomment record, @Param("example") SccommentExample example);

    int updateByExample(@Param("record") Sccomment record, @Param("example") SccommentExample example);

    int updateByPrimaryKeySelective(Sccomment record);

    int updateByPrimaryKeyWithBLOBs(Sccomment record);

    int updateByPrimaryKey(Sccomment record);
}