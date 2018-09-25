package com.sy.util;

public class CalUtil {
    /**
     * 根据仰角，距离计算高度
     */
    public static Float CalHigh(float elevation,float distance){
        float a = 0f;
        try {
            a = Float.parseFloat(String.valueOf(distance * Math.sin(Math.PI*elevation/180.0)));
        }catch (Exception e){
            e.printStackTrace();
        }

        return a;
    }

    /**
     * 根据仰角，距离计算真实距离
     */
    public static Float CalRealDistance(float elevation,float distance){
        float a = 0f;
        try {
            a = Float.parseFloat(String.valueOf(distance * Math.cos(Math.PI*elevation/180.0)));
        }catch (Exception e){
            e.printStackTrace();
        }

        return a;
    }
    public static void main(String args[]){
        System.out.println(String .valueOf(Math.cos(Math.PI*60f/180.0)));
        System.out.println(CalHigh(30f,5f));
        System.out.println(CalRealDistance(60f,5f));
    }
}
