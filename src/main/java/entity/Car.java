package entity;

public class Car {
    private String id;
    private String name;
    private String carkind;
    private String type;
    private String color;
    private int seatNum=0;
    private String pic;//图片路径
    private String releasetime;
    private String description;
    private String price;
    private int carClick;

    public Car() {
        super();
    }

    public Car(String id, String name, String carkind, String type, String color, int seatNum, String pic, String releasetime, String description, String price, int carClick) {
        this.id = id;
        this.name = name;
        this.carkind = carkind;
        this.type = type;
        this.color = color;
        this.seatNum = seatNum;
        this.pic = pic;
        this.releasetime = releasetime;
        this.description = description;
        this.price = price;
        this.carClick = carClick;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCarkind() {
        return carkind;
    }

    public void setCarkind(String carkind) {
        this.carkind = carkind;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getReleasetime() {
        return releasetime;
    }

    public void setReleasetime(String releasetime) {
        this.releasetime = releasetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getCarClick() {
        return carClick;
    }

    public void setCarClick(int carClick) {
        this.carClick = carClick;
    }

    @Override
    public String toString() {
        return "CarDao{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", carkind='" + carkind + '\'' +
                ", type='" + type + '\'' +
                ", color='" + color + '\'' +
                ", seatNum=" + seatNum +
                ", pic='" + pic + '\'' +
                ", releasetime='" + releasetime + '\'' +
                ", description='" + description + '\'' +
                ", price='" + price + '\'' +
                ", carClick=" + carClick +
                '}';
    }
}
