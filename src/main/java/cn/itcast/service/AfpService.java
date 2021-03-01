package cn.itcast.service;

import cn.itcast.domain.Afp;

public interface AfpService {

    public void generateFeatures(Afp afp, String pyPath, String folder);

}
