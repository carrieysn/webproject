package com.meitianhui.supplierCentre.entity;

import java.io.Serializable;
/**
 * 商家中心查看状态临时用户
 * @author Administrator
 *
 */
public class SessionSupplier implements Serializable{

	
	private static final long serialVersionUID = 8930891018680987763L;
	private String id; // ID
	private String supplier_name; // 名称
	private String contact_tel; // 手机号码
	private String detailAddress;//详细地址
	private String contact_person;//联系人
	private String mobile;//跟踪客服手机号
	private String serviceName;//跟踪客服名字

	public SessionSupplier() {

	}


	public SessionSupplier(String id, String supplier_name, String contact_tel, String detailAddress, String contact_person) {
		this.id = id;
		this.supplier_name = supplier_name;
		this.contact_tel = contact_tel;
		this.detailAddress = detailAddress;
		this.contact_person = contact_person;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getContact_tel() {
		return contact_tel;
	}
	public void setContact_tel(String contact_tel) {
		this.contact_tel = contact_tel;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getContact_person() {
		return contact_person;
	}
	public void setContact_person(String contact_person) {
		this.contact_person = contact_person;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	

	

}
