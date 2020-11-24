package util;

public class SaleMonth {
    private double sale;
    private int month;

    public SaleMonth() {
        super();
    }

    public SaleMonth(double sale, int month) {
        this.sale = sale;
        this.month = month;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "SaleMonth{" +
                "sale=" + sale +
                ", month=" + month +
                '}';
    }
}
