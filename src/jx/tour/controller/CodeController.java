package jx.tour.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jx.tour.utils.GetMessageCode;
import jx.tour.utils.ReturnContant;

@Controller
public class CodeController {

    @Autowired
    private ReturnContant returnContant;
    /**
     * 根据获取到的手机号发送验证码
     * @param request
     * @param phone 获取的手机号码
     * @return
     * @throws JSONException 
     */
    @RequestMapping(value="/sendSMS.action",method=RequestMethod.POST)
    public @ResponseBody ReturnContant sendSMS(HttpServletRequest request,HttpSession session,String phone) throws JSONException{
        //根据获取到的手机号发送验证码
        String code=GetMessageCode.getCode(phone); 
        returnContant.setStatus(1);
        returnContant.setData(code);
        session.setAttribute("code",code);
        return returnContant;
    }
}   