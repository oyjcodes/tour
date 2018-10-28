package jx.tour.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderFactory {
	public static String getOrderIdByTime() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        String result="";
        Random random=new Random();
        for(int i=0;i<3;i++){
            result+=random.nextInt(3);  
        }
        return newDate+result;
    }
}
