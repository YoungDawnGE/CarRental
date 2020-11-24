package service;

import entity.Car;

import java.util.List;

public interface CarService {


    //获得所有Car
    List<Car> getAllCar();


    //通过ID获得一个Car
    Car findCarById(String id);
    //插入Car
    void insertCar(Car car);

    //按车名模糊查询
    List<Car> getCarByFuzzyName(String name);

    List<Car> getCarByType(String type);

    void increaseCarClickByID(String id);

    String getPicPathByID(String id);

    List<Car> getTOP10ByCarClick();

    void deleteCarByID(String id);

    void updateCarByID(Car car);
}
