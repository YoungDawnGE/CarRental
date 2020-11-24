package impl;

import dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Admin;
import service.AdminService;

import java.util.HashMap;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin getWhomIsLogin(HashMap<String, Object> map) {
        Admin admin = this.adminDao.login(map);
        return admin;

    }
}
