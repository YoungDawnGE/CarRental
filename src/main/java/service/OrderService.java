package service;

import org.springframework.stereotype.Repository;
import entity.Order;
import entity.TypePriceBean;

import java.util.List;

@Repository
public interface OrderService {
    //获得所有Order
    List<Order> getAllOrder();
    //通过ID获得一个Order
    Order getOrderById(String id);
    //插入Order
    void insertOrder(Order Order);

    List<Order> getOrdersByUid(String uid);

    List<Order> getOrdersByDate(String date);

    List<Order> getOrdersByCarID(String cid);

    List<Double> getSales();

//    @Select("select c.type,sum(o.price) from carinfo as c, orderinfo as o where c.id=o.cid GROUP BY c.type ORDER BY sum(o.price)")
//    @ResultType(TypePriceBean.class)
    List<TypePriceBean> getTypePrice();

}
