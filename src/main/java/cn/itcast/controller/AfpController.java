package cn.itcast.controller;

import cn.itcast.domain.Afp;
import cn.itcast.matlab.Predict;
import cn.itcast.service.AfpService;
import cn.itcast.service.impl.AfpServiceImpl;
import com.mathworks.toolbox.javabuilder.MWNumericArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/afp")
public class AfpController {

    @Autowired
    private Predict pred;

    @RequestMapping("/fileUpload")
    public String testResponseJson(String RNA, MultipartFile uploadFile, String fastaSeq, HttpServletRequest request, Model model)
            throws Exception{
//        System.out.println(fastaSeq);
//        System.out.println(uploadFile.isEmpty());
        //把文件加上随机数，防止文件重复
        String uid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        String fileName = uid+".fasta";
        //2.获取文件路径
        ServletContext context = request.getServletContext();
        String realPath = context.getRealPath("/");
        System.out.println(realPath);
        String basePath = realPath+"WEB-INF/temp/feature/"+uid;

        File file = new File(basePath);
        if(!file.exists()) {
            file.mkdirs();
        }
        //5.使用MulitpartFile接口中方法，把上传的文件写到指定位置
        //如果上传了文件，优先使用文件
        if(!uploadFile.isEmpty())
            uploadFile.transferTo(new File(file,fileName));
        //否则使用文本框序列保存为文件
        else if(fastaSeq != null && fastaSeq.length() > 0) {
//            System.out.println(fastaSeq);
            FileWriter fw = null;
            try {
                fw = new FileWriter(basePath+"/"+fileName);
                //将str里面的内容读取到fw所指定的文件中
                fw.write(fastaSeq);
            } catch(IOException e) {
                e.printStackTrace();
            } finally {
                if(fw != null)
                    fw.close();
            }
        }
        Afp afp = new Afp();
        afp.setUid(uid);
        afp.setFilename(RNA);

        //调用service生成feature的csv文件
        String pyPath = realPath+"WEB-INF/extract_feature/";
        AfpService service = new AfpServiceImpl();

        String folder = realPath+"WEB-INF/temp/feature/";

        service.generateFeatures(afp, pyPath, folder);

        //调用matlab的包进行识别
        Object[] res = pred.func(afp, folder);
        MWNumericArray arr = (MWNumericArray) res[0];
        int[][] o = (int[][]) arr.toIntArray();
        List<List<Integer>> list = new ArrayList<>();
        for (int[] ints : o) {
            List<Integer> temp = new ArrayList<>();
            for (int j = 0; j < o[0].length; j++) {
                temp.add(ints[j]);
            }
            list.add(temp);
        }

        //System.out.println(Arrays.toString(o[0]));
        model.addAttribute("list", list);

        for(Object x : res) {
            MWNumericArray y = (MWNumericArray) x;
            y.dispose();
        }
        deleteDir(file);

        List<String> headerList = new ArrayList<>();
        if("snoRNA".equals(RNA)) {
            headerList.add("Nucleus");
            headerList.add("Nucleolus");
            headerList.add("Exosome");
            headerList.add("Cytoplasm");
            headerList.add("Cytosol");
        } else if("lncRNA".equals(RNA)) {
            headerList.add("Nucleus");
            headerList.add("Cytoplasm");
            headerList.add("Ribosome");
            headerList.add("Cytosol");
            headerList.add("Exosome");
        } else if("miRNA".equals(RNA)) {
            headerList.add("Exosome");
            headerList.add("Nucleus");
            headerList.add("Cytoplasm");
            headerList.add("Mitochondrion");
            headerList.add("Circulating");
            headerList.add("Microvesicle");
        }
        model.addAttribute("headerList", headerList);

        return "list";
    }

    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (String child : children) {
                boolean success = deleteDir(new File(dir, child));
                if (!success) {
                    return false;
                }
            }
        }
        if(dir.delete()) {
            System.out.println("目录已被删除！");
            return true;
        } else {
            System.out.println("目录删除失败！");
            return false;
        }
    }
}
