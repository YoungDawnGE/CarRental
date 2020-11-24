package impl;

import dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Employee;
import service.EmployeeService;
import util.DateTool;

import java.util.HashMap;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> getAllEmployee(){
        List<Employee> eList = employeeDao.queryAll();
        return eList;
    }

    @Override
    public Employee findEmployeeById(String id) {
        Employee employee=this.employeeDao.queryById(id);
        return employee;
    }

    @Override
    public void insertEmployee(Employee employee) {
        int age=DateTool.getAge(employee.getBirthdate());
        System.out.println("年龄"+age);
        System.out.println(employee);
        employee.setAge(age);
        this.employeeDao.insertEmployee(employee);
    }

    //按姓名模糊查询
    @Override
    public List<Employee> getEmployeeByFuzzyName(String name) {
        List<Employee> employeeList=employeeDao.fuzzyQueryByName(name);
        return employeeList;
    }

    //登陆查询
    @Override
    public Employee getWhomIsLogin(HashMap<String, Object> map) {
        Employee employee = employeeDao.login(map);
        return employee;
    }

    //按ID删除
    @Override
    public void deleteEmployeeByID(String id) {
        this.employeeDao.deleteEmployeeByID(id);
    }

    @Override
    public void updateEmployeeByID(Employee employee) {
        int age=DateTool.getAge(employee.getBirthdate());
        System.out.println("年龄"+age);
        System.out.println(employee);
        employee.setAge(age);
        this.employeeDao.updateByID(employee);
    }
}
