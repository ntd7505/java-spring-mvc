package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleUploadFile(MultipartFile file, String targetFolder) {
        if (file == null || file.isEmpty()) {
            return "";
        }

        String rootPath = this.servletContext.getRealPath("/resources/images");
        String storedName = "";

        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            String originalName = file.getOriginalFilename();
            // ✅ chống lỗi tên có khoảng trắng
            originalName = originalName.replaceAll("\\s+", "_");

            storedName = System.currentTimeMillis() + "-" + originalName;

            File serverFile = new File(dir.getAbsolutePath() + File.separator + storedName);

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return storedName; // ✅ quan trọng
    }
}
