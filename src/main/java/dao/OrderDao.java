package dao;

import entity.Order;
import entity.TypePriceBean;

import java.util.List;
public interface OrderDao {
    Order queryById(String id);

    List<Order> queryAll();

    void insertOrder(Order order);

    //通过uid搜索订单
    List<Order> queryByUid(String uid);

    //通过日期模糊搜索订单
    List<Order> queryByDate(String ordertime);

    //通过车名搜索订单
    List<Order> queryByCarID(String cid);

    //获得每月的销售量
    List<Double> getSales();

    //按类型把销售额分开
    List<TypePriceBean> getTypePrice();
}
