package impl;

import dao.CarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import entity.Car;
import service.CarService;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarDao carDao;

    @Override
    public List<Car> getAllCar() {
        List<Car> cars = this.carDao.queryAll();
        return cars;
    }

    @Override
    public Car findCarById(String id) {
        Car car = this.carDao.queryById(id);
        return car;
    }

    @Override
    public void insertCar(Car car) {
        this.carDao.insertCar(car);
        System.out.println(car);
    }

    @Override
    public List<Car> getCarByFuzzyName(String name) {
        List<Car> cars = this.carDao.queryByFuzzyName(name);
        return cars;
    }

    @Override
    public List<Car> getCarByType(String type) {
        List<Car> cars = this.carDao.queryByType(type);
        return cars;
    }

    //点击量+1

    @Override
    public void increaseCarClickByID(String id) {
        this.carDao.increaseCarClickByID(id);
    }

    @Override
    public String getPicPathByID(String id) {
        String picPath = this.carDao.getPicPathByID(id);
        return picPath;
    }

    @Override
    public List<Car> getTOP10ByCarClick() {
        return this.carDao.getTOP10ByCarClick();
    }

    @Override
    public void deleteCarByID(String id) {
        System.out.println("进入了delCar service impl" + id);
        this.carDao.deleteCarByID(id);
    }

    public void updateCarByID(Car car) {
        this.carDao.updateCarByID(car);
    }
}
