import entity.Car;
import impl.EmployeeServiceImpl;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import service.EmployeeService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class MainTest {
    public static void main(String[] args) throws Exception {
        EmployeeService employeeService=new EmployeeServiceImpl();
    }

    private CommonsMultipartFile file;
    public MainTest(CommonsMultipartFile file) {
        this.file = file;
    }
    public boolean storePic(Car car, HttpSession session) {
        // 要上传的图片/文件 目的地
        String  realPath = session.getServletContext().getRealPath("/WEB-INF/statics/img/cars");
        // 创建多层目录
        File f = new File(realPath);
        f.mkdirs();
        //文件名处理
        String originalFilename = file.getOriginalFilename();
        String prefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
        // 生成UUID, 保证文件名不会重复
        String uuid = UUID.randomUUID().toString();
        String fileNameOnly = prefix + "-" +uuid + suffix;
        String imgPath= "img/cars/"+fileNameOnly;
        car.setPic(imgPath);
        // 做文件上传操作  file.transferTo(File file)
        try {
            file.transferTo(new File(realPath, fileNameOnly));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }
}
