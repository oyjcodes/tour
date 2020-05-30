package jx.tour.service;

import java.util.List;

import jx.tour.pojo.Content;
import jx.tour.pojo.Specialty;
import jx.tour.pojo.SpecialtyVo;

public interface BackSpecialtyService {
    //查询所有的特产的信息
	public List<SpecialtyVo> selectAllSpecialty();
	//编辑指定的景点信息
	public void editSpecialty(Specialty specialty); 
	//更新特产的状态（下架）
    public void downSpecialty(int specialtyid);
   //更新特产的状态（上架）
    public void upSpecialty(int specialtyid);
    //添加特产信息
    public void addSpecialty(Specialty specialty);
    
    
    //将特产信息发布到首页
    public void publishSpecialty(Content Content);
   
}
