package jx.tour.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * <p>Title: CustomExceptionResolver</p>
 * <p>Description:全局异常处理器 </p>
 * <p>Company: www.itcast.com</p> 
 * @date	2015-4-14上午11:57:09
 * @version 1.0
 */
public class ContentExceptionResolver implements HandlerExceptionResolver {

	/**
	 * （非 Javadoc）
	 * <p>Title: resolveException</p>
	 * <p>Description: </p>
	 * @param request
	 * @param response
	 * @param handler
	 * @param ex 系统 抛出的异常
	 * @return
	 * @see org.springframework.web.servlet.HandlerExceptionResolver#resolveException(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		//handler就是处理器适配器要执行Handler对象（只有method）
		
//		解析出异常类型
//		如果该 异常类型是系统 自定义的异常，直接取出异常信息，在错误页面展示
//		String message = null;
//		if(ex instanceof CustomException){
//			message = ((CustomException)ex).getMessage();
//		}else{
////			如果该 异常类型不是系统 自定义的异常，构造一个自定义的异常类型（信息为“未知错误”）
//			message="未知错误";
//		}
		
		//上边代码变为
		ContentException customException = null;
		if(ex instanceof ContentException){
			customException = (ContentException)ex;
		}else{
			customException = new ContentException("未知错误");
		}
		
		//错误信息
		String message = customException.getMessage();
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		//将错误信息传到页面
		modelAndView.addObject("message", message);
		
		//指向错误页面
		modelAndView.setViewName("error");

		
		return modelAndView;
	}

}
