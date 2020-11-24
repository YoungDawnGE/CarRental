package dao;

import entity.User;
import java.util.HashMap;
import java.util.List;
public interface UserDao {
    //通过ID查询user
    User queryById(String id);
    //通过名称查询user
    User queryByName(String name);
    //查询所有的user
    List<User> queryAll();
    //employee帮user注册
    void insertUser(User user);
    //user自己注册账号+密码
    void insertUser2(User user);
    //user设置姓名等信息
    void updataInfo(User user);
    //通过ID模糊查询
    List<User> queryUserByFuzzyID(String id);
    //通过名称模糊搜索
    List<User> queryUserByFuzzyName(String name);
    //用户登陆login
    User login(HashMap<String,Object> map);
    //管理员通过id更新员工信息
    void updateUserByID(User user);
    //通过id删除用户
    void deleteUserByID(String id);
}
