package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import entity.Order;
import service.CarService;
import service.OrderService;
import util.OrderPicBean;
import util.ResponseEntity;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CarService carService;

    @RequestMapping("/order/submitOrder")
    @ResponseBody
    public ResponseEntity submitOrder(@RequestBody Order order) {
        System.out.println(order);
        this.orderService.insertOrder(order);
        return new ResponseEntity(1,"","创建订单成功");
    }

    @RequestMapping("user/showOrder")
    public String showOrderToUser(@RequestParam("id") String id, ModelMap modelMap) {
        List<Order> orderList = this.orderService.getOrdersByUid(id);
        List<OrderPicBean> opbList = new ArrayList<util.OrderPicBean>();
        for (Order o : orderList) {
            String picPath = this.carService.getPicPathByID(o.getCid());
            OrderPicBean opb = new OrderPicBean(o,picPath);
            opbList.add(opb);
        }


        modelMap.put("opbList", opbList);

        return "user/userOrderList";
    }

}
