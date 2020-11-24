package entity;

import java.io.Serializable;

public class Employee implements Serializable {
    private String id;
    private String password;
    private String name;
    private boolean sex;
    private String phonenum;
    private String birthdate;
    private int age;

    public Employee(String id, String password, String name, boolean sex, String phonenum, String birthdate, int age) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.phonenum = phonenum;
        this.birthdate = birthdate;
        this.age = age;
    }

    public Employee() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", phonenum='" + phonenum + '\'' +
                ", birthdate='" + birthdate + '\'' +
                ", age=" + age +
                '}';
    }
}
