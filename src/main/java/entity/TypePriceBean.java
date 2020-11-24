package entity;

public class TypePriceBean {
    private String type;
    private double sumPrice;

    public TypePriceBean() {
        super();
    }

    public TypePriceBean(String type, double sumPrice) {
        this.type = type;
        this.sumPrice = sumPrice;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(double sumPrice) {
        this.sumPrice = sumPrice;
    }

    @Override
    public String toString() {
        return "TypePriceBean{" +
                "type='" + type + '\'' +
                ", sumPrice=" + sumPrice +
                '}';
    }
}
