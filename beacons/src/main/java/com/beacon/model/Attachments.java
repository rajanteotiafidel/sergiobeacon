package com.beacon.model;

import java.util.List;

public class Attachments {
	private String attachmentName;
	private String namespacedType;
	private String title;
	private String url;
	private List<Targeting> targeting;
	private String creationTimeMs;
	private String data;
	
	public String getAttachmentName() {
		return attachmentName;
	}
	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}
	public String getNamespacedType() {
		return namespacedType;
	}
	public void setNamespacedType(String namespacedType) {
		this.namespacedType = namespacedType;
	}
	public String getCreationTimeMs() {
		return creationTimeMs;
	}
	public void setCreationTimeMs(String creationTimeMs) {
		this.creationTimeMs = creationTimeMs;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public List<Targeting> getTargeting() {
		return targeting;
	}
	public void setTargeting(List<Targeting> targeting) {
		this.targeting = targeting;
	}

}
