package util;

import entity.Order;

public class OrderPicBean {
    private String orderID;
    private String cid;
    private String picPath;
    private double price;
    private String ordertime;


    public OrderPicBean() {
        super();
    }

    public OrderPicBean(Order order,String picPath) {
        orderID = order.getId();
        cid = order.getCid();
        this.picPath = picPath;
        price = order.getPrice();
        ordertime = order.getOrdertime();
    }

    public OrderPicBean(String orderID, String cid, String picPath, double price, String ordertime) {
        this.orderID = orderID;
        this.cid = cid;
        this.picPath = picPath;
        this.price = price;
        this.ordertime = ordertime;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    @Override
    public String toString() {
        return "OrderPicBean{" +
                "orderID='" + orderID + '\'' +
                ", cid='" + cid + '\'' +
                ", picPath='" + picPath + '\'' +
                ", price='" + price + '\'' +
                ", ordertime='" + ordertime + '\'' +
                '}';
    }
}
