package jx.tour.service;

import java.util.List;

 
import org.springframework.web.multipart.MultipartFile;

import jx.tour.pojo.Content;

public interface UploadFileService {
   //返回上传的游记图片要保存进数据库的路径
	public List<String> uploadFile(MultipartFile[] files)throws Exception;
	//返回上传的用户头像要保存进数据库的路径
	public String uploadUserImag(MultipartFile file)throws Exception;
	//返回上景点图片要保存进数据库的路径
   public List<String>  uploadScenicImag(MultipartFile[] files,int scenicNum)throws Exception;
   //返回上传的特产图片要保存进数据库的路径
   public List<String>  uploadSpecialtyImag(MultipartFile[] files,int specialtyNum)throws Exception;
   //返回上传的酒店图片要保存进数据库的路径
   public List<String>  uploadHotelImag(MultipartFile[] files,int hNum)throws Exception;
   //将轮播图的广告图片保存进数据库
   public String uploadAdsImag(MultipartFile file)throws Exception;
   //进资讯图片插入数据库
   public String uploadInformationImag(MultipartFile file)throws Exception;
   //将上传的景点和特产图片保存进数据库
   public String uploadContentImag(MultipartFile file,Content content)throws Exception;
}
