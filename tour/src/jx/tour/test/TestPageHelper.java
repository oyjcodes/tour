package jx.tour.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jx.tour.mapper.ContentMapper;
import jx.tour.pojo.Content;
import jx.tour.pojo.ContentExample;

public class TestPageHelper {
   @Test
   public void testPageHelper(){
	 //创建一个spring容器
	 		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
	 		//从spring容器中获得Mapper的代理对象
	 		ContentMapper mapper = applicationContext.getBean(ContentMapper.class);
	 		//执行查询，并分页
	 		ContentExample example = new ContentExample();
	 		//分页处理
	 		PageHelper.startPage(1, 10);
	 		List<Content> list = mapper.selectByExample(example);
	 		//取商品列表
	 		for (Content tbItem : list) {
	 			System.out.println(tbItem.getTitle());
	 		}
	 		//取分页信息
	 		PageInfo<Content> pageInfo = new PageInfo<>(list);
	 		long total = pageInfo.getTotal();
	 		System.out.println("共有广告："+ total);
   }
}
