package cn.itcast.matlab;

import cn.itcast.domain.Afp;
import com.mathworks.toolbox.javabuilder.*;
import mkghknn_package.*;

public class Predict {

    public Object[] func(Afp afp, String folder) {
        Class1 c1 = null;
        try {
            c1 = new Class1();
        } catch (MWException e) {
            e.printStackTrace();
        }
        String uid = afp.getUid();
        String filename = afp.getFilename();

        Object[] res = null;
        try {
            res = c1.test_Entry(2, uid, filename, folder);
        } catch (MWException e) {
            e.printStackTrace();
        }
        //System.out.println(res[0]);
        //System.out.println(res[1]);
        c1.dispose();
        return res;
    }
}
