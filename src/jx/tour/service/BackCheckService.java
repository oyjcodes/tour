package jx.tour.service;

import jx.tour.pojo.Manager;

public interface BackCheckService {
   //验证管理员的登录
   public int checkLogin(Manager manager);
}
