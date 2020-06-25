package com.ben.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class FileUtils {

    private static final String DIR = "C://xampp//htdocs//timezone-shop//";
    public static final String IP = "192.168.137.143";
    public static final String PATH = "http://" + IP + "/timezone-shop/";

    public static String uploadFile(MultipartFile file){
        try {
            byte[] bytes = file.getBytes();
            // Creating the directory to store file
            String rootPath = DIR;
            File dir = new File(rootPath);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            String name = UUID.randomUUID() + ".png";
            String path = rootPath + name;
            File serverFile = new File(path);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            return name;
        } catch (Exception e) {
            return null;
        }
    }

    public static List<String> uploadMultiFile(List<MultipartFile> files){
        List<String> paths = new ArrayList<>();
        for (MultipartFile file : files) {
            String path = uploadFile(file);
            paths.add(path);
        }
        return paths;
    }

}
