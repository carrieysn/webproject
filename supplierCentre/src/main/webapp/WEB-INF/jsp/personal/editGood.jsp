<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/layout/common.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>每天惠商家中心-领了么商品推荐</title>    
    <link type="text/css" href="${ctx}/common/static/css/base.css" rel="stylesheet" />
    <link type="text/css" href="${ctx}/common/static/css/index.css" rel="stylesheet" />
    <script type="text/javascript" src="${ctx}/common/static/js/jquery-1.11.3.min.js"></script>
</head>

<body>
	<div class="header">
		<a href="javascript:void(0);" class="logo">产品修改</a>
		<ul class="nav">
			
			<li><a href="javascript:void(0);">供应商登录</a></li>
		</ul>
	</div>
	
	<div class="process-wrap">
		<div class="process-rel">
			<div class="step-wrap">
				<div class="step">
					
				</div>
			</div>
			<div class="tab-containe">
				<div class="tab-wrap">
					<div class="tab-title">产品资料</div>
					<table class="tab-info">
						<tr>
							<td align="right">产品名称</td>
							<td><input type="text" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right" valign="top">产品描述</td>
							<td><textarea  class="k430"></textarea><em class="middle">*</em></td>
						</tr>
						<tr>
							<td align="right">产品图片</td>
							<td>
								<a class="cg-img product-img"><img src="images/img.jpg"><em></em></a>
								<a class="add-img product-img"><input type="file">上传图片 最多3张</a>
								<a class="add-img product-img"><input type="file">上传图片 最多3张</a>
								<em class="fl">*</em>
							</td>
						</tr>
						<tr>
							<td align="right">品类</td>
							<td><select class="k430"><option>选择品类</option></select><em>*</em></td>
						</tr>
						<tr>
							<td align="right">规格</td>
							<td><input type="text" placeholder="输入产品规格" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">库存</td>
							<td><input type="text" placeholder="输入产品库存" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">厂家</td>
							<td><input type="text" placeholder="输入产品生产厂家" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">标签</td>
							<td><input type="text" placeholder="多个标签请用逗号“，”隔开" class="k430"><em>*</em></td>
						</tr>
					</table>
					<div class="tab-title">产品资料</div>
					<table class="tab-info">
						<tr>
							<td align="right">市场价</td>
							<td><input type="text" placeholder="输入市场价" class="k430"><em>*</em></td>
						</tr>
						
						<tr>
							<td align="right">结算价</td>
							<td><input type="text" placeholder="输入结算价" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">起订</td>
							<td><input type="text" placeholder="输入起订数量" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">限购</td>
							<td><input type="text" placeholder="输入限购数量" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">有效期</td>
							<td><select class="k188"><option>选择日期</option></select>&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class="k188"><option>选择日期</option></select><em>*</em></td>
						</tr>
						<tr>
							<td align="right">配送范围</td>
							<td><input type="text" placeholder="多个配送区域请用逗号“，”隔开" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td></td>
							<td><a class="btn-login">提交</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/common/layout/footer.jsp"%>

<script>
	$(function(){

		var oHeight = $('.tab-containe').height();
		$('.process-wrap').css('height',oHeight+177);
	})
</script>