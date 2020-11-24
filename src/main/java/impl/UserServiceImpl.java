package impl;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.User;
import service.UserService;
import java.util.HashMap;
import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> getAllUser() {
        List<User> users = this.userDao.queryAll();
        return users;
    }
    @Override
    public User findUserById(String id) {
        User user = this.userDao.queryById(id);
        return user;
    }
    @Override
    public User findUserByName(String name) {
        User user = this.userDao.queryByName(name);
        return user;
    }
    @Override
    public void insertUser(User user) {
        this.userDao.insertUser(user);
    }
    @Override
    public void inserUser2(User user) {
        this.userDao.insertUser(user);
    }
    @Override
    public List<User> getUserByFuzzyID(String id) {
        List<User> users = this.userDao.queryUserByFuzzyID(id);
        return users;
    }
    @Override
    public List<User> getUserByFuzzyName(String name) {
        List<User> users = this.userDao.queryUserByFuzzyName(name);
        return users;
    }
    @Override
    public User getWhomIsLogin(HashMap<String, Object> map) {
        User user = this.userDao.login(map);
        return user;
    }
    @Override
    public void updateUserByID(User user) {
        this.userDao.updateUserByID(user);
    }
    @Override
    public void deleteUserByID(String id) {
        this.userDao.deleteUserByID(id);
    }
}
