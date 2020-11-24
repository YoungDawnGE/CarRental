package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping(value="/login")
    public String welcome() {
        System.out.println("This is main controller");
        return "index";
    }

    @RequestMapping(value = "/test2")
    public String test() {
        return "test2";
    }

    @RequestMapping(value = "/test3")
    public String test3() {
        return "test3";
    }
}
