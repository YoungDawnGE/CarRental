import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import entity.Admin;
import entity.Employee;
import util.FKSqlSessionFactory;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyBatisTest {
    public static void main(String[] args) throws IOException {
        InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
        SqlSession session = sqlSessionFactory.openSession();

        Admin user = new Admin("2010150112", "顾浩亮", "123456");
        Admin user2 = new Admin("2", "TEST1", "123456");

        session.insert("mapper.AdminMapper.saveAdmin", user2);
        session.commit();
        session.close();
    }

    @Test
    public void insertEmp() throws IOException{
        InputStream in = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
        SqlSession session = sqlSessionFactory.openSession();
        Employee employee = new Employee("2010150114", "123456", "张三", true,"18752011111", "1997-01-27", 22);
        session.insert("mapper.EmployeeMapper.saveEmployee", employee);
        session.commit();
        session.close();
    }

    @Test
    public void test() throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date birthdate = df.parse("1997-01-27");
        System.out.println(birthdate);
        DateFormat df1 = new SimpleDateFormat("y");
        int start= Integer.parseInt(df1.format(birthdate));
        System.out.println(start);
        int end=Integer.parseInt(df1.format(new Date()));
        System.out.println(end);
        System.out.println(end - start);
    }

    @Test
    public void selectEmployeeById() throws IOException{
        SqlSession session = FKSqlSessionFactory.getSqlSession();
        Employee employee = session.selectOne("mapper.EmployeeMapper.selectEmployeeById", "2010150112");
        System.out.println(employee);

        session.commit();
        session.close();
    }
}
