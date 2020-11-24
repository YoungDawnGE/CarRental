package service;

import entity.User;

import java.util.HashMap;
import java.util.List;

public interface UserService {
    //获得所有User
    List<User> getAllUser();
    //通过ID获得一个User
    User findUserById(String id);
    //通过姓名获得一个User
    User findUserByName(String name);
    //插入User 由emp插入
    void insertUser(User user);
    //由user自己插入注册的账号 密码
    void inserUser2(User user);
    //更新个人信息
//    void updataInfo(User user);
    //按id模糊查询
    List<User> getUserByFuzzyID(String id);
    //按车名模糊查询
    List<User> getUserByFuzzyName(String name);
    //登陆操作
    User getWhomIsLogin(HashMap<String, Object> map);
    //通过id更新User
    void updateUserByID(User user);
    //通过id删除User
    void deleteUserByID(String id);

}
