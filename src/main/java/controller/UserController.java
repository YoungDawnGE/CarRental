package controller;

import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import entity.User;
import service.UserService;
import util.EncryptionMD5;
import util.ResponseEntity;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/signUp")
    public String signUp() {
        return "user/signUp";
    }

    @RequestMapping("/checkID")
    @ResponseBody
    public ResponseEntity checkID(@RequestBody Map<String,String> map) {
        String id = map.get("id");
        System.out.println("user ID:"+id);
        User user = this.userService.findUserById(id);
        System.out.println(user);
        if (user == null) {
            return new ResponseEntity(1, "", "此ID可用");
        }else {
            return new ResponseEntity(0, "", "*此ID已被占用");
        }
    }


    //注册了之后返回登陆界面
    @RequestMapping("/addUser")//自己预先注册只有账号和密码
    public String addUser(User user,ModelMap modelMap) {
        String password= EncryptionMD5.md5(user.getPassword());
        user.setPassword(password);
        modelMap.put("user",user);
        System.out.println(user);
        this.userService.insertUser(user);
        return "redirect:/login";
    }

    //管理员帮忙注册user
    @RequestMapping("/adminAddUser")
    @ResponseBody
    public ResponseEntity adminAddUser(@RequestBody User user) {
        String password= EncryptionMD5.md5(user.getPassword());
        user.setPassword(password);
        System.out.println(user);
        this.userService.insertUser(user);
        return new ResponseEntity(1, "", "添加成功");
    }

    //返回所有用户信息
    @RequestMapping("/showUser")
    public String showUser(ModelMap modelMap) {
        List<User> users = this.userService.getAllUser();
        System.out.println();
        modelMap.put("userList", users);
        return "user/userList";
    }

    @RequestMapping("/login")
    public ModelAndView login(User user,
                              RedirectAttributes redirectAttributes,
                              HttpSession session ) {
        ModelAndView mv=new ModelAndView();
        System.out.println("user的login");
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("id",user.getId());
        String password = EncryptionMD5.md5(user.getPassword());
        map.put("password", password);
        //查询ID和密码都输入正确的客户
        User u = this.userService.getWhomIsLogin(map);
        System.out.println(u);
        if (u == null) {
            mv.setViewName("redirect:/login");
            redirectAttributes.addFlashAttribute("message", "您的账号或密码有误");
        }else {
            mv.setViewName("redirect:/user/home");
            redirectAttributes.addFlashAttribute("user", u);
            session.setAttribute("user",u);
        }
        return mv;
    }

    @RequestMapping("/home")
    public String toEmpHome(HttpSession session) {
        User user = (User)session.getAttribute("user");
        System.out.println("session:"+user);
        if (user == null) {
            return "redirect:/login";
        }
        return "user/userFirstPage";
    }

    @RequestMapping("/logout")
    public String logout(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "redirect:/login";
    }

    @RequestMapping("/updateUserForm")
    public String toUpdateEmp(@RequestParam("id") String id, ModelMap modelMap) {
        User user = this.userService.findUserById(id);
        modelMap.put("user", user);
        return "user/userUpdate";
    }

    @RequestMapping("/changeInfo")
    public String changeInfo(@RequestParam("id") String id, ModelMap modelMap){
        User user = this.userService.findUserById(id);
        modelMap.put("user", user);
        return "user/userPersonal";
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public ResponseEntity updateUser(@RequestBody User user) {
        String newPassword = user.getPassword();
        if (newPassword.length() != 32) {
            String ps = EncryptionMD5.md5(newPassword);
            user.setPassword(ps);
        }
        this.userService.updateUserByID(user);
        System.out.println("更新 user："+user);
        return new ResponseEntity(1, "", "更新用户信息成功");
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public ResponseEntity deleteUser(@RequestParam("id") String id) {
        System.out.println("删除 id："+id);
        this.userService.deleteUserByID(id);
        return new ResponseEntity(1, "", "删除成功");
    }

    @RequestMapping("/firstPage")
    public ModelAndView toFirstPage(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User user = (User)session.getAttribute("user");
        System.out.println("session:"+user);
        if (user == null) {
            mv.setViewName("redirect:/login");
            return mv;
        }
        else {
            mv.setViewName("user/userFirstPage");
            return mv;
        }
    }
}
