package util;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import entity.Car;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class PicTool {
    private CommonsMultipartFile file;

    public PicTool(CommonsMultipartFile file) {
        this.file = file;
    }

    public boolean storePic(Car car, HttpSession session) {
        String originalFilename = file.getOriginalFilename();
        System.out.println("-------------------------------------");
        System.out.println("原始文件名:" + originalFilename);
        System.out.println("文件类型:" + file.getContentType());
        System.out.println("文件大小:" + file.getSize());
        System.out.println("-------------------------------------");
        // 要上传的图片/文件 目的地
        String  realPath = session.getServletContext().getRealPath("/WEB-INF/statics/img/cars");
        System.out.println("-------------------------------------");
        System.out.println("上传的真实路径"+realPath);
        System.out.println("-------------------------------------");
        File f = new File(realPath);
        // 创建多层目录
        f.mkdirs();

        // "1.jpg"  ---> 1
        // substring(int beginIndex, int endIndex)  [beginIndex,endIndex)
        System.out.println("-------------------------------------");
        String prefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
        System.out.println("前缀"+prefix);
        // "1.jpg"  ---> .jpg
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
        System.out.println("后缀"+suffix);
        System.out.println("-------------------------------------");

        // 生成UUID, 保证文件名不会重复
        String uuid = UUID.randomUUID().toString();
        String fileNameOnly = prefix + "-" +uuid + suffix;
        System.out.println("-------------------------------------");
        String imgPath= "img/cars/"+fileNameOnly;
        car.setPic(imgPath);
        System.out.println("图片路径"+imgPath);
        System.out.println("-------------------------------------");
        // 做文件上传操作  file.transferTo(File file)
        try {
            file.transferTo(new File(realPath, fileNameOnly));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

}
