package dao;

import entity.Employee;

import java.util.HashMap;
import java.util.List;
public interface EmployeeDao {
    Employee queryById(String id);

    List<Employee> queryAll();

    //姓名模糊查询
    List<Employee> fuzzyQueryByName(String name);

    void insertEmployee(Employee employee);

    Employee login(HashMap<String,Object> map);

    void deleteEmployeeByID(String id);

    void updateByID(Employee employee);
}
