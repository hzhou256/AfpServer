package cn.itcast.matlab;

import cn.itcast.domain.Afp;
import com.mathworks.toolbox.javabuilder.MWException;
import mkghknn_package.Class1;
import org.springframework.beans.factory.annotation.Autowired;

public class Predict {
    @Autowired
    private Class1 c1;

    public Object[] func(Afp afp, String folder) {
        String uid = afp.getUid();
        String filename = afp.getFilename();
        System.out.println(folder);
        Object[] res = null;
        try {
            res = c1.test_Entry(2, uid, filename, folder);
        } catch (MWException e) {
            e.printStackTrace();
        }
        //System.out.println(res[0]);
        //System.out.println(res[1]);
        //c1.dispose();
        return res;
    }
}
