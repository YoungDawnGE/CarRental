package util;

import org.junit.Test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateToolTest {

    @Test
    public void getAge() throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String ordertime = df.format(new Date());

        DateFormat df2 = new SimpleDateFormat("yyyyMMdd");
        String temp = df2.format(new Date());


//        DateFormat df1 = new SimpleDateFormat("y");
//        int start= Integer.parseInt(df1.format(birthdate));
//        int end=Integer.parseInt(df1.format(new Date()));

        System.out.println(ordertime);
        System.out.println(temp);
    }
}
