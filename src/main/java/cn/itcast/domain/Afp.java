package cn.itcast.domain;

import java.io.Serializable;

public class Afp implements Serializable {
    private String uid;
    private String filename;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String toString() {
        return "Afp{" +
                "uid=" + uid +
                ", filename='" + filename + '\'' +
                '}';
    }
}
