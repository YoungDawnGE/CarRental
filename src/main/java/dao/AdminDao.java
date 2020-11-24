package dao;

import entity.Admin;

import java.util.HashMap;
import java.util.List;
public interface AdminDao {
    Admin queryById(String id);

    List<Admin> queryAll();

    void insertCar(Admin admin);

    Admin login(HashMap<String,Object> map);

}
