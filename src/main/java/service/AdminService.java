package service;

import entity.Admin;

import java.util.HashMap;

public interface AdminService {
    Admin getWhomIsLogin(HashMap<String, Object> map);
}
