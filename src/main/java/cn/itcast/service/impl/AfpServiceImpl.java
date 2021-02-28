package cn.itcast.service.impl;

import cn.itcast.domain.Afp;
import cn.itcast.service.AfpService;
import org.springframework.stereotype.Service;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

@Service("afpService")
public class AfpServiceImpl implements AfpService{
    @Override
    public void generateFeatures(Afp afp, String pyPath, String folder) {
        //String folder = realPath+"/WEB-INF/temp/feature/";
        String uid = afp.getUid();
        String filename = afp.getFilename();
        System.out.println(uid);
        //调用python脚本生成特征csv文件
        String exe = "python";
        String command = pyPath+"extract_feature.py";
        String[] args = new String[] {exe, command, uid, folder};

        try {
            Process process = Runtime.getRuntime().exec(args);// 执行py文件
            process.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }



    }
}
