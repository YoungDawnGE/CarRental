package controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import entity.Employee;
import service.EmployeeService;
import util.EncryptionMD5;
import util.ResponseEntity;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")

public class EmployeeController {
    private static final Log logger = LogFactory.getLog(EmployeeController.class);

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    public ModelAndView login(Employee employee, RedirectAttributes redirectAttributes,HttpSession session ) {
        ModelAndView mv=new ModelAndView();

        System.out.println("emp的login");
        System.out.println(employee);
        System.out.println(employee.getId() + "\n" + employee.getPassword());
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id1",employee.getId());
        String pw = EncryptionMD5.md5(employee.getPassword());
        map.put("password1", pw);
        Employee e = this.employeeService.getWhomIsLogin(map);
        System.out.println(e);
        if (e == null) {
            mv.setViewName("redirect:/login");
            redirectAttributes.addFlashAttribute("message", "您的账号或密码有误");
        }else {
            mv.setViewName("redirect:/emp/home");
            redirectAttributes.addFlashAttribute("employee", e);
            session.setAttribute("employee",e);
        }
        return mv;
    }

    @RequestMapping("/home")
    public String toEmpHome(HttpSession session) {
        Employee employee = (Employee)session.getAttribute("employee");
        System.out.println("session:"+employee);
        if (employee == null) {
            return "redirect:/login";
        }
        return "employee/empHome";
    }

    @RequestMapping(value = "/addEmployee",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public ResponseEntity addEmployee(@RequestBody Employee employee) {


        System.out.println(employee);
        String password = EncryptionMD5.md5(employee.getPassword());
        employee.setPassword(password);

        this.employeeService.insertEmployee(employee);

        System.out.println("emp/addEmployee");

        return new ResponseEntity(1, "", "插入成功");
        //this.employeeService.insertEmployee();
    }

    //按ID查重
    @RequestMapping(value = "/checkID",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity checkID(@RequestBody Map<String,String> map) {
        String id = map.get("id");
        System.out.println("--------------"+id+"-------------");
        Employee employee = this.employeeService.findEmployeeById(id);
        System.out.println(employee);
        if (employee == null) {
            return new ResponseEntity(1, "", "此ID可用");
        }else {
            return new ResponseEntity(0, "", "*此ID已被占用");
        }
    }

    @RequestMapping("/queryAll")
    public ModelAndView queryAll() {
        System.out.println("===================queryAll=================");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("car/carList");
        List<Employee> eList = employeeService.getAllEmployee();
        for (Employee e : eList) {
            System.out.println(e);
        }
        return mv;
    }

    @RequestMapping("/fuzzyName")
    public ModelAndView queryByFuzzyName() {
        System.out.println("===================queryByFuzzyName=================");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("car/carList");

        //这里给参数
        List<Employee> eList = employeeService.getEmployeeByFuzzyName("亮");
        mv.addObject("elist", eList);

        for (Employee e : eList) {
            System.out.println(e);
        }
        return mv;
    }

    @RequestMapping("/showEmp")
    public String showEmp(ModelMap modelMap) {
        List<Employee> employees = this.employeeService.getAllEmployee();
        modelMap.put("empList", employees);
        return "employee/empList";
    }


    @RequestMapping(value = "/delEmp", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity delEmp(@RequestBody Map<String,String> map) {
        String id = map.get("id");
        System.out.println("--------------删除员工"+id+"-------------");
        this.employeeService.deleteEmployeeByID(id);
        return new ResponseEntity(1, "", "删除成功");
    }


    //跳转到更新Emp的界面
    @RequestMapping("/updateEmpForm")
    public String toUpdateEmp(@RequestParam("id") String id, ModelMap modelMap) {
        Employee e = this.employeeService.findEmployeeById(id);
        modelMap.put("emp", e);
        return "employee/empUpdate";
    }

    //更新  撤销
    @RequestMapping("/updateEmp")
    @ResponseBody
    public ResponseEntity updateEmp(@RequestBody Employee employee) {
        System.out.println(employee);
        String newPassword = employee.getPassword();
        System.out.println("当前密码长度"+newPassword.length());

        if (newPassword.length() == 32) {
            this.employeeService.updateEmployeeByID(employee);
        }else {
            //加密
            String s = EncryptionMD5.md5(newPassword);
            employee.setPassword(s);
            this.employeeService.updateEmployeeByID(employee);
        }

        return new ResponseEntity(1, "", "更新成功");
    }
}
