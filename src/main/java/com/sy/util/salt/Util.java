package com.sy.util.salt;

import java.io.File;
import java.util.Timer;
import java.util.TimerTask;


/**
 * @ClassName: ExcelTimerTask
 * @Description: TODO(这
 *
 */
public class Util extends TimerTask {

    private String savePath;
    @Override
    public void run() {
//删除temp下面的所有文件和文件夹
        deleteAllFile(this.savePath);
    }

    public Util(String savePath) {
        super();
        this.savePath = savePath;

    }


    public Util() {
        super();
    }

    private void deleteAllFile(String url){
//不删文件夹
        File f = new File(url);
        if(f.isDirectory()){
            File []fs = f.listFiles();
            for (int i = 0; i < fs.length; i++) {
                if(fs[i].isFile());
                deleteAllFile(fs[i].getPath());
            }
        }else{
            f.delete();
        }

    }

    //定时测试主线程


    public static void main(String[] args) {
        System.out.println(Util.class.getResource("/"));
//
////url 删除的文件夹路径
//
////time 定时的周期时间
//
////        new Timer().schedule(new ExcelTimerT(url),
////                time);
//
    }
}

