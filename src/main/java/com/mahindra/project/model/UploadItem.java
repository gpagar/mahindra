package com.mahindra.project.model;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadItem {

    private List<CommonsMultipartFile> fileData;

	public List<CommonsMultipartFile> getFileData() {
		return fileData;
	}

	public void setFileData(List<CommonsMultipartFile> fileData) {
		this.fileData = fileData;
	}

	@Override
	public String toString() {
		return "UploadItem [fileData=" + fileData + "]";
	}

    
}
