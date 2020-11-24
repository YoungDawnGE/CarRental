package controller;

import entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import entity.Admin;
import entity.Car;
import service.AdminService;
import service.CarService;
import service.EmployeeService;
import service.OrderService;
import entity.TypePriceBean;
import util.EncryptionMD5;
import util.OrderPicBean;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private CarService carService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/test")
    public String test(){
        return "test";
    }

    @RequestMapping(value = "/empForm")
    public String toAddEmployee() {
        System.out.println("admin/empForm");
        return "admin/adminEmpForm";
    }

    @RequestMapping(value = "/carForm")
    public String toAddCar() {
        System.out.println("admin/adminCarForm");
        return "admin/adminCarForm";
    }

    @RequestMapping(value = "/userForm")
    public String toAddUser() {
        System.out.println("admin/adminCarForm");
        return "admin/adminUserForm";
    }

    @RequestMapping("/login")
    public ModelAndView login(Admin admin,
                              RedirectAttributes redirectAttributes,
                              HttpSession session ) {
        ModelAndView mv=new ModelAndView();

        System.out.println("admin的login");
        System.out.println(admin);
        System.out.println(admin.getId() + "\n" + admin.getPassword());
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id",admin.getId());
        String password= EncryptionMD5.md5(admin.getPassword());
        map.put("password", password);
        Admin a = this.adminService.getWhomIsLogin(map);
        System.out.println(a);
        if (a == null) {
            mv.setViewName("redirect:/login");
            redirectAttributes.addFlashAttribute("message",
                    "您的账号或密码有误");
        }else {
            mv.setViewName("redirect:/admin/firstPage");
            redirectAttributes.addFlashAttribute("admin", a);
            session.setAttribute("admin",a);
        }
        return mv;
    }

    @RequestMapping("/adminDataView")
    public ModelAndView viewDate(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin)session.getAttribute("admin");
        System.out.println("session:"+admin);
        if (admin == null) {
            mv.setViewName("redirect:/login");
            return mv;
        }

        List<Car> carTop10 = this.carService.getTOP10ByCarClick();
        List<Double> sales = this.orderService.getSales();
        List<TypePriceBean> types = this.orderService.getTypePrice();
        for (double s : sales) {
            System.out.println(s);

        }

        mv.setViewName("admin/adminDataView");
        mv.addObject("carTop10",carTop10);
        mv.addObject("sales",sales);
        mv.addObject("types",types);

        return mv;
    }

    @RequestMapping("/firstPage")
    public ModelAndView toFirstPage(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Admin admin = (Admin)session.getAttribute("admin");
        System.out.println("session:"+admin);
        if (admin == null) {
            mv.setViewName("redirect:/login");
            return mv;
        }
        else {
            mv.setViewName("admin/adminFirstPage");
            return mv;
        }
    }

    @RequestMapping("/showAllOrders")
    public ModelAndView showAllOrders() {
        ModelAndView mv = new ModelAndView();
        List<Order> orders = this.orderService.getAllOrder();

        List<OrderPicBean> opbList = new ArrayList<OrderPicBean>();
        for (Order o : orders) {
            String picPath = this.carService.getPicPathByID(o.getCid());
            OrderPicBean opb = new OrderPicBean(o,picPath);
            opbList.add(opb);
        }
        mv.addObject("opbList", opbList);
        mv.setViewName("admin/adminShowOrders");
        return mv;
    }


//    @RequestMapping(value = "/addEmployee")
//    public void addEmployee(Employee employee) {
//        employeeService.insertEmployee(employee);
//        System.out.println(employee);
//        System.out.println("admin/addEmployee");
//        //this.employeeService.insertEmployee();
//
//    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/login";
    }

}
