package dao;

import entity.Car;

import java.util.List;
public interface CarDao {
    Car queryById(String id);

    //接口:获取全部汽车
    List<Car> queryAll();

    void insertCar(Car car);

    //名称模糊查询
    List<Car> queryByFuzzyName(String name);

    List<Car> queryByType(String type);

    void increaseCarClickByID(String id);

    String getPicPathByID(String id);

    List<Car> getTOP10ByCarClick();

    void deleteCarByID(String id);

    void updateCarByID(Car car);
}
