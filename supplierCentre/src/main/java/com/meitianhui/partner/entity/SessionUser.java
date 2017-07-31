package com.meitianhui.partner.entity;

import java.io.Serializable;

/***
 * 会话user
 * 供应商回话user
 * 
 * @date 
 */
public class SessionUser implements Serializable {

	private static final long serialVersionUID = 3469066934714879989L;

	private String id; // ID
	private String name; // 名称
	private String no; // 编号
	private String mobile; // 手机号码
	private boolean isAdmin; // 是否系统账号
	private String business_type; // 供应商类型
	private String business_type_key; // 供应商精英
	private String serviceName;//跟踪客服名称
	private String serviceMobile;//跟踪客服手机号
	private String from;//当前登入用户来源

	public SessionUser() {

	}

	public SessionUser(String id, String name, String no, String mobile, boolean isAdmin,String from) {
		this.id = id;
		this.name = name;
		this.no = no;
		this.mobile = mobile;
		this.isAdmin = isAdmin;
		this.from = from;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getBusiness_type() {
		return business_type;
	}

	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}

	public String getBusiness_type_key() {
		return business_type_key;
	}

	public void setBusiness_type_key(String business_type_key) {
		this.business_type_key = business_type_key;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceMobile() {
		return serviceMobile;
	}

	public void setServiceMobile(String serviceMobile) {
		this.serviceMobile = serviceMobile;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

}
