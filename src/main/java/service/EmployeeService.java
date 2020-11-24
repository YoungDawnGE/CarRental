package service;

import entity.Employee;

import java.util.HashMap;
import java.util.List;

public interface EmployeeService {
    //获得所有Employee
    List<Employee> getAllEmployee();
    //通过ID获得一个Employee
    Employee findEmployeeById(String id);
    //插入员工
    void insertEmployee(Employee employee);
    //模糊查询
    List<Employee> getEmployeeByFuzzyName(String name);

    //用户登陆查询id和password
    Employee getWhomIsLogin(HashMap<String, Object> map);

    //通过ID删除
    void deleteEmployeeByID(String id);

    //通过ID更新
    void updateEmployeeByID(Employee employee);
}
