package impl;

import dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Order;
import service.OrderService;
import entity.TypePriceBean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> getAllOrder() {
        List<Order> orders = this.orderDao.queryAll();
        return orders;
    }

    @Override
    public Order getOrderById(String id) {
        Order order = this.orderDao.queryById(id);
        return order;
    }

    @Override
    public void insertOrder(Order order) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String ordertime = df.format(date);
        System.out.println("订单时间"+ordertime);

        DateFormat df2 = new SimpleDateFormat("yyyyMMdd");
        String temp = df2.format(date);

        StringBuilder sb = new StringBuilder();
        sb.append(order.getUid());
        sb.append("-");
        sb.append(temp);
        sb.append("-");
        sb.append(order.getCid());
        sb.append("-");

        String uuid = UUID.randomUUID().toString();
        sb.append(uuid);


        order.setId(sb.toString());

        order.setOrdertime(ordertime);

        System.out.println(order);

        this.orderDao.insertOrder(order);
    }

    @Override
    public List<Order> getOrdersByUid(String uid) {
        List<Order> orders = this.orderDao.queryByUid(uid);
        return orders;
    }

    @Override
    public List<Order> getOrdersByDate(String date) {
        List<Order> orders = this.orderDao.queryByDate(date);
        return orders;
    }

    @Override
    public List<Order> getOrdersByCarID(String cid) {
        List<Order> orders = this.orderDao.queryByCarID(cid);
        return orders;
    }


    public List<Double> getSales() {
        return this.orderDao.getSales();
    }


    public List<TypePriceBean> getTypePrice() {
        return this.orderDao.getTypePrice();
    }

}
