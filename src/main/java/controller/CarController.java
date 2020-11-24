package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import entity.Car;
import entity.Order;
import service.CarService;
import service.OrderService;
import util.PicTool;
import util.ResponseEntity;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CarController {
    @Autowired
    private CarService carService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("emp/carForm")
    public String toAddCar() {
        return "car/carForm";
    }

    @RequestMapping("car/addCar")
    public String insertCar(Car car,
                          @RequestParam("getImg") CommonsMultipartFile getImg,
                          HttpSession session,ModelMap modelMap) throws IllegalStateException{
        System.out.println(car);
        System.out.println(getImg.getName());
        PicTool picTool = new PicTool(getImg);
        picTool.storePic(car,session);
        System.out.println(car);
        this.carService.insertCar(car);
        modelMap.put("message", "添加汽车成功");
        return "admin/adminCarForm";
    }

    @RequestMapping("car/modifyCar")
    public String updateCarByID(Car car,
                            @RequestParam("getImg") CommonsMultipartFile getImg,
                            HttpSession session,ModelMap modelMap) throws IllegalStateException{
        PicTool picTool = new PicTool(getImg);
        picTool.storePic(car,session);
        System.out.println(car);
        this.carService.updateCarByID(car);
        modelMap.put("message", "更新汽车成功");
        return "admin/adminCarForm";
    }

    @RequestMapping("car/checkID")
    @ResponseBody//处理Ajax的callback
    public ResponseEntity checkID(@RequestBody Map<String,String> map) {
        String id = map.get("id");
        System.out.println("----------"+id+"-----------");
        Car car = this.carService.findCarById(id);
        System.out.println(car);

        if (car == null) {
            return new ResponseEntity(1, "", "此ID可用");
        }else {
            return new ResponseEntity(0, "", "*此ID已被占用");
        }
    }

    @RequestMapping("emp/fuzzyCarName")
    public ModelAndView queryByFuzzyName(String name) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("car/carList");
        List<Car> cars = this.carService.getCarByFuzzyName("奔");//这边给参数
        mv.addObject("cars", cars);

        for (Car car : cars) {
            System.out.println(car);
        }
        return mv;
    }

    //管理员看carlist
    @RequestMapping("car/showCar")
    public String showCar(@RequestParam("type") String type, ModelMap modelMap) {
        if(type.equals("全部")){
            List<Car> cars = this.carService.getAllCar();
            modelMap.put("carList", cars);
        }else {
            List<Car> cars = this.carService.getCarByType(type);
            modelMap.put("carList", cars);
        }
        System.out.println("--------------"+type+"--------------");
        return "car/carList";
    }

    @RequestMapping("car/carDetail")
    public String showDetil(@RequestParam("id") String id,ModelMap modelMap) {
        this.carService.increaseCarClickByID(id);
        Car car = this.carService.findCarById(id);
        List<Order> orders = this.orderService.getOrdersByCarID(id);
        modelMap.put("orderList", orders);
        modelMap.put("car", car);
        return "car/carDetail";
    }


    //用户看carlist
    @RequestMapping("car/userViewCar")
    public String userViewCar(@RequestParam("type") String type, ModelMap modelMap){
        List<Car> cars ;
        if(type.equals("全部")){
            cars = this.carService.getAllCar();
            modelMap.put("carList", cars);
        }else {
            cars = this.carService.getCarByType(type);
            modelMap.put("carList", cars);
        }
        return "user/userCarList";
    }


    @RequestMapping("car/userCarDetail")
    public String showDetailToUser(@RequestParam("id") String id,ModelMap modelMap) {
        this.carService.increaseCarClickByID(id);
        Car car = this.carService.findCarById(id);
        List<Order> orders = this.orderService.getOrdersByCarID(id);
        modelMap.put("orderList", orders);
        System.out.println("-----------评论-----------");
        for (Order o : orders) {
            System.out.println(o.getComment());
        }
        System.out.println("-------------------------");
        System.out.println(car);
        modelMap.put("car", car);
        return "user/userCarDetail";
    }


    //跳转到修改汽车信息的界面
    @RequestMapping("car/updateCarForm")
    public String toUpdateCar(@RequestParam("id") String id, ModelMap modelMap) {
        Car car = this.carService.findCarById(id);
        System.out.println(car);
        modelMap.put("car", car);
        return "car/carUpdate";
    }

    //获得TOP点击量的汽车
    @RequestMapping("car/top10Click")
    @ResponseBody
    public ResponseEntity<List<Car>> getTop10ClickCar() {
        List<Car> cars10 = this.carService.getTOP10ByCarClick();
        System.out.println("------------获得点击量前10的车------------");
        return new ResponseEntity<List<Car>>(1, cars10, "Top10点击量的图片");
    }

    @RequestMapping("car/delCar")
    @ResponseBody
    public ResponseEntity deleteCarByID(@RequestBody String id) {
        System.out.println("删除id为"+id+"汽车");
        this.carService.deleteCarByID(id);
        return new ResponseEntity(1,"","删除汽车成功");
    }
}
