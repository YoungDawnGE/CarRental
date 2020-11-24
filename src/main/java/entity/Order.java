package entity;

public class Order {
    private String id;
    private String cid;
    private double price;
    private String uid;
    private int num;
    private String ordertime;
    private String comment;

    public Order() {
        super();
    }

    public Order(String id, String cid, double price, String uid, int num, String ordertime, String comment) {
        this.id = id;
        this.cid = cid;
        this.price = price;
        this.uid = uid;
        this.num = num;
        this.ordertime = ordertime;
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", cid='" + cid + '\'' +
                ", price=" + price +
                ", uid='" + uid + '\'' +
                ", num=" + num +
                ", ordertime='" + ordertime + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }
}

