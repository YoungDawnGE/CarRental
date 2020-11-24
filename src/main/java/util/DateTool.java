package util;

import org.junit.Test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTool {
    @Test
    //获取年龄
    public static int getAge(String date){
        int start;
        int end;
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdate = df.parse(date);
            DateFormat df1 = new SimpleDateFormat("y");
            start = Integer.parseInt(df1.format(birthdate));
            end = Integer.parseInt(df1.format(new Date()));
            System.out.println(end - start);
            System.out.println("==================================");
            return end-start;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
