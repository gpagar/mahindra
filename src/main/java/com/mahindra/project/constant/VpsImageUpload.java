package com.mahindra.project.constant;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VpsImageUpload {

	
	//public static final String pm = "/usr/local/tomcat7/uploads/";
	
	public static final String pm = "E:/EMaintainence/pdf/";

	public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName) throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = Paths.get(pm + imageName);

			byte[] bytes = file.getBytes();
			
			if (imageType == 1) {
				System.out.println("Inside Image Type =1");

				path = Paths.get(pm + imageName);

				System.out.println("Path= " + path.toString());

			}
			
			Files.write(path, bytes);
		}
	}
}
