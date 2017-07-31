package com.meitianhui.supplierCentre.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meitianhui.partner.entity.SessionUser;
import com.meitianhui.platform.entity.Page;
import com.meitianhui.platform.entity.Pagetion;
import com.meitianhui.platform.utils.IDUtil;
import com.meitianhui.supplierCentre.dao.SupplierMapper;
import com.meitianhui.supplierCentre.entity.SupplierLog;
import com.meitianhui.supplierCentre.service.SupplierService;

/***
 * 供应商逻辑处理接口
 * 
 * @author 丁硕
 * @date 2016年11月2日
 */
@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	
	@Autowired
	private SupplierMapper supplierMapper;

	@Override
	public Map<String, Object> queryOneSupplier(String supplier_id) {
		return supplierMapper.queryOneSupplier(supplier_id);
	}
	
	@Override
	public Map<String, Object> selectSupplierByTel(String contact_tel) {
		// TODO Auto-generated method stub
		return supplierMapper.selectSupplierByTel(contact_tel);
	}
	
	@Override
	public Map<String, Object> querySupplierBusinessInfo(String supplier_id) {
		return supplierMapper.querySupplierBussinesInfo(supplier_id);
	}

	@Override
	public List<Map<String, Object>> querySupplierContractList(String supplier_id) {
		return supplierMapper.querySupplierContractList(supplier_id);
	}

	@Override
	public Page querySupplierLogListPage(int pageNum, int pageSize, String supplier_id) {
		Pagetion.startPage(pageNum, pageSize);
		supplierMapper.querySupplierLogList(supplier_id);
		return Pagetion.endPage(); 
	}

	@Override
	public void saveSupplierLog(SessionUser user, String event) {
		SupplierLog log = new SupplierLog();
		log.setLog_id(IDUtil.getUUID());
		log.setSupplier_id(user.getId());
		log.setCategory_key("JMSSJLB_05");
		log.setTracked_by(user.getId());
		log.setTracked_date(DateFormatUtils.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
		log.setEvent("供应商|" + user.getName() + "|" + event);
		supplierMapper.addSupplierLog(log);
	}


	

}
