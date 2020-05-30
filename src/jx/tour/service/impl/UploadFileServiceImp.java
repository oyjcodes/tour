package jx.tour.service.impl;

import java.io.File;
 
import java.util.ArrayList;
 
import java.util.List;
import java.util.UUID;

 

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import jx.tour.pojo.Content;
import jx.tour.service.UploadFileService;

@Service
public class UploadFileServiceImp implements UploadFileService {
	@Override
	public List<String> uploadFile(MultipartFile[] files) throws Exception{
		List<String> picPath = null;
        // 先判断文件files不为空
        if (files != null && files.length > 0) {  
        	 picPath = new ArrayList<String>();
            for (MultipartFile file : files) { //循环遍历，取出单个文件，下面的操作和单个文件就一样了
                if (!file.isEmpty()) {//这个判断必须加上
                    // 获得原始文件名
                    String originalFileName = file.getOriginalFilename();
                    //新文件名
                    String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
                    String save = "travel/"+newFileName;
                    picPath.add(save);
                    //获得物理路径webapp所在路径，即新文件将要保存的路径
                    String pathRoot = "E:/upload/temp/"+"travel/";  
                    //新图片
                    File newFile = new File(pathRoot+newFileName);
                    //将内存的图片数据写入磁盘
                    file.transferTo(newFile);

                }
            }
        }
		return picPath;
	}

	@Override
	public String uploadUserImag(MultipartFile file) throws Exception {
		String save = "";
		 if (!file.isEmpty()) {//这个判断必须加上
             // 获得原始文件名
             String originalFileName = file.getOriginalFilename();
             //新文件名
             String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
             save = "user/"+newFileName;
             //获新文件将要保存的路物理径
             String pathRoot = "E:/upload/temp/"+"user/";
             //新图片
             File newFile = new File(pathRoot+newFileName);
             //将内存的图片数据写入磁盘
             file.transferTo(newFile);

         }
		 return save;
	}
	@Override
	 public List<String>  uploadScenicImag(MultipartFile[] files,int scenicNum)throws Exception {
		List<String> picPath = null;
        // 先判断文件files不为空
        if (files != null && files.length > 0) {
        	 picPath = new ArrayList<String>();
            for (MultipartFile file : files) { //循环遍历，取出单个文件，下面的操作和单个文件就一样了
                if (!file.isEmpty()) {//这个判断必须加上  
                    // 获得原始文件名
                    String originalFileName = file.getOriginalFilename();
                    //新文件名
                    String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
                    String save = "area/"+scenicNum+"/scenic/"+newFileName;
                    picPath.add(save);  
                    //获得物理路径webapp所在路径，即新文件将要保存的路径
                    String pathRoot = "E:/upload/temp/"+save;
                    //新图片
                    File newFile = new File(pathRoot);
                    //将内存的图片数据写入磁盘
                    file.transferTo(newFile);  

                }
            }
        }
     return picPath;
	}

	@Override
	public List<String> uploadSpecialtyImag(MultipartFile[] files, int specialtyNum) throws Exception {
		List<String> picPath = null;
        // 先判断文件files不为空
        if (files != null && files.length > 0) {
        	 picPath = new ArrayList<String>();
            for (MultipartFile file : files) { //循环遍历，取出单个文件，下面的操作和单个文件就一样了
                if (!file.isEmpty()) {//这个判断必须加上  
                    // 获得原始文件名
                    String originalFileName = file.getOriginalFilename();
                    //新文件名
                    String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
                    String save = "area/"+specialtyNum+"/specialty/"+newFileName;
                    picPath.add(save);  
                    //获得物理路径webapp所在路径，即新文件将要保存的路径
                    String pathRoot = "E:/upload/temp/"+save;
                    //新图片
                    File newFile = new File(pathRoot);
                    //将内存的图片数据写入磁盘
                    file.transferTo(newFile);  

                }
            }
        }
     return picPath;
	}

	@Override
	public List<String> uploadHotelImag(MultipartFile[] files, int hNum) throws Exception {
		 
		List<String> picPath = null;
        // 先判断文件files不为空
        if (files != null && files.length > 0) {
        	 picPath = new ArrayList<String>();
            for (MultipartFile file : files) { //循环遍历，取出单个文件，下面的操作和单个文件就一样了
                if (!file.isEmpty()) {//这个判断必须加上  
                    // 获得原始文件名
                    String originalFileName = file.getOriginalFilename();
                    //新文件名
                    String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
                    String save = "area/"+hNum+"/hotel/"+newFileName;
                    picPath.add(save);  
                    //获得物理路径,即新文件将要保存的路径
                    String pathRoot = "E:/upload/temp/"+save;
                    //新图片
                    File newFile = new File(pathRoot);
                    //将内存的图片数据写入磁盘
                    file.transferTo(newFile);  

                }
            }
        }
     return picPath;
	}

	@Override
	public String uploadAdsImag(MultipartFile file) throws Exception {
		  // 获得原始文件名
        String originalFileName = file.getOriginalFilename();
        //新文件名
        String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
        String save = "ads/"+newFileName;
        //获得物理路径,即新文件将要保存的路径
        String pathRoot = "E:/upload/temp/"+save;
        //新图片
        File newFile = new File(pathRoot);
        //将内存的图片数据写入磁盘
        file.transferTo(newFile);  
		return save;
	}

	@Override
	public String uploadInformationImag(MultipartFile file) throws Exception {
		  // 获得原始文件名
        String originalFileName = file.getOriginalFilename();
        //新文件名
        String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
        String save = "information/"+newFileName;
        //获得物理路径,即新文件将要保存的路径
        String pathRoot = "E:/upload/temp/"+save;
        //新图片
        File newFile = new File(pathRoot);
        //将内存的图片数据写入磁盘
        file.transferTo(newFile);  
		return save;
	}

	@Override
	public String uploadContentImag(MultipartFile file,Content content) throws Exception {
		int areanum = content.getAreanum();
		int categoryid = content.getCategoryid();
		String save = "";
		 // 获得原始文件名
        String originalFileName = file.getOriginalFilename();
        //新文件名
        String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
        if(categoryid==0){
        	save = "area/"+areanum+"/scenic/"+newFileName;
        }
        else{
        	save = "area/"+areanum+"/specialty/"+newFileName;
        }
        
        //获得物理路径,即新文件将要保存的路径
        String pathRoot = "E:/upload/temp/"+save;
        //新图片
        File newFile = new File(pathRoot);
        //将内存的图片数据写入磁盘
        file.transferTo(newFile);  
		return save;
	}
}
