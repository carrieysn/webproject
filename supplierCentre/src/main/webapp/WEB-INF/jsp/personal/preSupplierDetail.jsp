<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="tab-containe abs-top">
				<div class="tab-wrap clearfix">
					<div class="pro-title clearfix">
						商品资料 
							<div class="edit-btn">
								<a href="${ctx}/presupplier/list" style="margin-top:10px;">返回</a>
								 <c:if test="${preSupplier.audit_status eq 'fail'}">
								   <a href="javascript:void(0);" class="bj" id="md-bj">编辑</a>
								 </c:if>
							</div>
					</div>
		<div class="pro-wrap clearfix">
						<div class="pro-img-wrap fl">
							<div class="pro-img-big clearfix"><img src="${ctx}/file/preview.do?doc_id=${picInfoList[0].path_id}" height="320" width="320" alt=""></div>
							<ul class="pro-img-min clearfix">
						       <c:forEach items="${picInfoList}" var="picInfo">
								    <li><img src="${ctx}/file/preview.do?doc_id=${picInfo.path_id}" height="60" width="60" alt=""></li>
							   </c:forEach>
							</ul>
						</div>
						<div class="pro-text-wrap fl">
							<table class="pro-table">
								<tr>
									<th style="width:80px;">商品名称： </th>
									<td class="titles"><label style="width:500px;overflow:hidden;">${preSupplier.title}</label> <c:if test="${preSupplier.audit_status == 'sample'}"><img src="${ctx}/common/static/images/icon-djy.png" alt=""></c:if>
									<c:if test="${preSupplier.audit_status == 'review'}"><img src="${ctx}/common/static/images/icon-dfs.png" alt=""></c:if>
									<c:if test="${preSupplier.audit_status == 'fail'}"><img src="${ctx}/common/static/images/icon-ybh.png" alt=""></c:if>
									<c:if test="${preSupplier.audit_status == 'pass'}"><img src="${ctx}/common/static/images/icon-ytg.png" alt=""></c:if>
									<c:if test="${preSupplier.audit_status == 'trial'}"><img src="${ctx}/common/static/images/icon-dcs.png" alt=""></c:if>
									</td>
								</tr>
								<tr>
									<th>类目：</th>
									<td>${preSupplier.category}</td>
								</tr>
								<tr>
									<th>规格：</th>
									<td>${preSupplier.specification}</td>
								</tr>
								<tr>
									<th>库存：</th>
									<td>${preSupplier.stock_qty}</td>
								</tr>
								<tr>
									<th>标签：</th>
									<td class="tags">
										<c:forEach items="${labels}" var="label">
											<i>${label}</i>
						                </c:forEach>
									</td>
								</tr>
								<tr>
									<th>当前售价：</th>
									<td class="price">¥ ${preSupplier.market_price}</td>
								</tr>
								<tr>
									<th>结算佣金：</th>
									<td class="price">¥ ${preSupplier.settled_price}</td>
								</tr>
								<tr>
									<th>商品链接：</th>
									<td class="links">
									<input type="text" value="${preSupplier.pic_url}" id="prelink" ><a class="btn-url" href="javascript:void(0);" onclick="copyToClipBoard()">复制链接</a>
									</td>
								</tr>
								<tr>
									<th style="line-height:30px;">商品描述：</th>
									<td>${preSupplier.desc1}</td>
								</tr>
								<tr><th></th><td></td></tr>
								<tr>
									<th style="line-height:30px;">备注：</th>
									<td>${preSupplier.remark}</td>
								</tr>
								<tr>
									<th>商品详情：</th>
									<td class="pics">
										<c:forEach items="${picDetailInfoList}" var="picDetailInfo">
										    <div class="gods-imgs">
										    <img src="${ctx}/file/preview.do?doc_id=${picDetailInfo.path_id}"  height="100" width="100"  class="imgshow">
										    <img src="${ctx}/file/preview.do?doc_id=${picDetailInfo.path_id}"  height="500" width="500" style="display: none;" class="imgdetailshow">
										    </div>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<c:if test="${preSupplier.audit_status eq 'sample' || preSupplier.audit_status eq 'review' || preSupplier.audit_status eq 'pass' || preSupplier.audit_status eq 'fail'}">
				<div class="top20 tab-wrap clearfix">
					<div class="pro-title clearfix">寄样信息</div>
					<div class="pro-text-wrap fl">
						<div class="wuliu-wrap clearfix">
						<table class="pro-table">
							<tr>
								<th style="width:120px;">样品接收地址：</th>
								<td class="titles">广东省深圳市龙华区东环二路慧华园1栋四楼金惠优选网络科技有限公司</td>
							</tr>
							<c:choose>
					          <c:when test="${preSupplier.audit_status eq 'sample'}">
					              <form id="logisticForm">
					              <input type="hidden" name="supplier_id" value="${preSupplier.supplier_id}" id="supplier_id"/>
									<tr>
										<th style="vertical-align:middle;">物流公司：</th>
										<td class="wuliugs"><input type="text" name="company" placeholder="请填写物流公司"></td>
									</tr>
									<tr>
										<th style="vertical-align:middle;">物流单号：</th>
										<td class="wuliu"><input type="text" name="bh" placeholder="请填写物流单号"></td>
									</tr>
									<tr>
										<th> </th>
										<td><input type="button" value="提交寄样信息" class="btn" onclick="submitFun()" /></td>
									</tr>
								 </form>
						    </c:when>
						    <c:otherwise>
						      <tr>
								<th>物流公司：</th>
								<td class="wuliugs">${preSupplier.logisticCompany}</td>
							</tr>
							<tr>
								<th>物流单号：</th>
								<td class="wuliu">${preSupplier.logisticCode}</td>
							</tr>
						    </c:otherwise>
						    </c:choose>
						</table>
						</div>
					</div>
				</div>
				</c:if>
				<div class="top20 tab-wrap clearfix">
					<div class="pro-title clearfix">商家资料</div>
					<div class="pro-text-wrap fl">
						<div class="wuliu-wrap clearfix">
						<table class="pro-table">
							<tr>
								<th>店铺名称：</th>
								<td class="">${preSupplier.supplier_name}</td>
							</tr>
							<tr>
								<th>联系人名：</th>
								<td class="">${preSupplier.contact_person} </td>
							</tr>
							<tr>
								<th style="width:120px;">联系人手机号：</th>
								<td class="">${preSupplier.contact_tel}</td>
							</tr>
							<tr>
								<th>介绍人：</th>
								<td>${preSupplier.introducer} </td>
							</tr>
							<tr>
								<th>注册地址：</th>
								<td>${preSupplier.detailPath} </td>
							</tr>
						</table>
						</div>
					</div>
				</div>
				<div class="bottom-btn clearfix">
					<a href="${ctx}/presupplier/list">返回列表</a>
				</div>
		  </div>
