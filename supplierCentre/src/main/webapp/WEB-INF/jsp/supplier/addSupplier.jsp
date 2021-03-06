<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/layout/common.jsp" %>
<%
	session.setAttribute("ctx", request.getContextPath());
	session.setAttribute("static_resource_server", "//mps-static.meitianhui.com/product");	//静态资源访问地址
%>
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
		<a href="#" class="logo">商家中心</a>
		<ul class="nav">
			
			<li><a href="#">供应商登录</a></li>
		</ul>
	</div>
	
	<div class="process-wrap">
		<div class="process-rel">
			<div class="step-wrap">
				<div class="step">
					<ul class="step-list">
						<li ><i>1</i>商家资料</li>
						<li class="sel"><i>2</i>产品资料</li>
						<li class="sel"><i>3</i>合作方案</li>
					</ul>
				</div>
			</div>
			<div class="tab-containe abs-top">
			    <form id="presupplier_form" >
				<div class="tab-wrap">
					<table class="tab-info" id="content0" >
						<tr>
							<td align="right">公司名称</td>
							<td><input type="text" class="k430" name="supplier_name" ><em>*</em></td>
						</tr>
						<tr>
							<td align="right" valign="top">注册地址</td>
							<input type="hidden" id="address" name="address" >
							<td class="areaContainer">
							       <select class="bind-province k130">省/自治区</select>
	                               <select class="bind-city k130">市/自治州</select>
	                               <select class="bind-district k130" name="area_id">区县</select>
	                               <em>*</em>
	                        </td>
							
						</tr>
						<tr>
							<td align="right"></td>
							<td><input type="text" placeholder="输入详细地址" id="detaildz" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">联系人</td>
							<td><input type="text" placeholder="输入具体联系人" name="contact_person" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">手机号</td>
							<td><input type="text" placeholder="输入联系人手机号" name="contact_tel" class="k430"><em>*</em></td>
						</tr>
						
						<tr>
							<td align="right">产品名称</td>
							<td><input type="text" class="k430" name="title"><em>*</em></td>
						</tr>
						<tr>
							<td align="right" valign="top">产品描述</td>
							<td><textarea  class="k430"  name="desc1"></textarea><em class="middle">*</em></td>
						</tr>
					<%-- 	<tr>
							<td align="right">产品图片</td>
							<td>
								<a class="cg-img product-img"><img src="${ctx}/common/static/images/img.jpg"><em></em></a>
								<a class="add-img product-img"><input type="file">上传图片 最多3张</a>
								<a class="add-img product-img"><input type="file">上传图片 最多3张</a>
								<em class="fl">*</em>
							</td>
						</tr> --%>
						
				
						<tr>
								<td align="right">产品图片</td>
								<td align="left" colspan="3" id="pic_td">
									<input type="hidden" name="pic_info" id="pic_info">
									<c:forEach begin="0" end="2">
										<span class="img-wrap">
											<label class="img-pro" style="display: none;">
												<a class="img"><img src=""><i class="icon-sc"></i></a>
												<p class="ms"></p>
											</label>
											<label>
												<a class="add-img"></a>
											</label>
										</span>
									</c:forEach>
									<div class="img-illustrate">
										<p class="name">上传图片 最多3张</p>
									</div>
								</td>
							</tr>
						
						
						<tr>
							<td align="right">品类</td>
							<td><select class="k430" name="category"><option>选择品类</option>
										<c:forEach items="${appEnumList}" var="appEnum" varStatus="enumStatus">
												<c:forEach items="${appEnum.app_display_area_list}" var="displayArea" varStatus="status">
													<option value="${displayArea.display_area}">${displayArea.display_area}</option>
												</c:forEach>
										</c:forEach>
							</select><em>*</em></td>
						</tr>
						<tr>
							<td align="right">规格</td>
							<td><input type="text" placeholder="输入产品规格" name="specification" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">库存</td>
							<td><input type="text" placeholder="输入产品库存" name="stock_qty" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">厂家</td>
							<td><input type="text" placeholder="输入产品生产厂家"  name="manufacturer" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">标签</td>
							<td><input type="text" placeholder="多个标签请用逗号“，”隔开" name="label" class="k430"><em>*</em></td>
						</tr>
						
						<tr>
							<td align="right">市场价</td>
							<td><input type="text" placeholder="输入市场价" name="market_price" class="k430"><em>*</em></td>
						</tr>
						
						<tr>
							<td align="right">结算价</td>
							<td><input type="text" placeholder="输入结算价" name="settled_price" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">起订</td>
							<td><input type="text" placeholder="输入起订数量"  name="min_buy_qty" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td align="right">限购</td>
							<td><input type="text" placeholder="输入限购数量" name="max_buy_qty" class="k430"><em>*</em></td>
						</tr>
						<!-- <tr>
							<td align="right">有效期</td>
							<td><select class="k188" name="valid_thru"><option>选择日期</option></select><em>*</em></td>
						</tr> -->
						
						 <tr>
								<td align="right">有效期</td>
								<td align="left" colspan="3" class="wind-td k188"><input type="text" name="valid_thru"  datatype="*" data-beatpicker="true" data-beatpicker-id="validDatePicker"/>
								</td>
						</tr>
						<tr>
							<td align="right">配送范围</td>
							<td><input type="text" placeholder="多个配送区域请用逗号“，”隔开" name="delivery_area" class="k430"><em>*</em></td>
						</tr>
						<tr>
							<td></td>
							<td><a class="btn-x btn" id="addBut">提交</a></td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	
		            <!-- 弹框 -->
					<div id="upload_img_div" class="tankuang-bor" style="display: none;">
						<p style="height:100px;">
							<label class="img-pro" style="">
								<a class="img"><img src=""><i class="icon-sc"></i></a>
							</label>
							<label>
								<a class="add-img" style="position: relative; z-index: 1; display: inline-block;"></a>
							</label>
						</p>
						<p style="height:100px;"><textarea id="upload-img-desc" placeholder="您可以对照片进行描述"></textarea></p>
					</div>
	
<%@ include file="/common/layout/footer.jsp"%>
	<script type="text/javascript" src="${static_resource_server}/common/third-part/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="${ctx}/common/static/js/areaSelector.js"></script>
	<script type="text/javascript" src="${ctx}/common/static/js/thelper.js"></script>
	<script type="text/javascript">
		var goods_display_area = '${goods.display_area}', goods_pic_info = '${goods.pic_info}', goods_pic_detail_info = '${goods.pic_detail_info}';
	</script>
<script>
	$(function(){
		//初始化地区选择
		M.area(".areaContainer");
		//初始化图片显示
		//initPicInfo();
		//上传事件
		bindUploadEvent();
		//初始化上传控件
		initUpload();
		var oHeight = $('.tab-containe').height();
		$('.process-wrap').css('height',oHeight+220);
		
		$("#next1").on("click",function(){
		   
	            $("#content1").css({
	                display: "block"
	            });
	            $("#content0").css({
	                display: "none"
	            });
	        
	           /*  $(".registor ul li").eq(0).removeClass("bac0277");
	            $(".registor ul li").eq(2).addClass("bac0277bd");
	            $(".registor ul li").eq(1).addClass("bac0277"); */
	        
    	
    })
 
     $('#addBut').on('click',function(){
    	    //验证成功、将上传的图片数据进行格式化
			var picInfoArray = new Array();
			//产品图片
			$("#pic_td .img-pro:visible").each(function(){
				var img = {};
				img.path_id = $(this).find('img').attr("doc_id");
				img.title = $(this).find('.ms').text();
				if(img.path_id){
					picInfoArray.push(img);
				}
			});
			alert(JSON.stringify(picInfoArray));
			if(picInfoArray.length < 1){
				M.alert('请至少上传一张产品图片');
				return false;
			} else{
				$("#pic_info").val(JSON.stringify(picInfoArray));
			}
			var min_buy_qty = parseInt($("#presupplier_form input[name='min_buy_qty']").val() || "0");	//起订量
			var stock_qty = parseInt($("#presupplier_form input[name='stock_qty']").val() || "0");	//库存
			if(stock_qty < min_buy_qty){
				layer.confirm("库存量少于起订量，是否确定发布？",{icon: 3}, function(index){
					layer.close(index);
					publish();
				});
			} else{
				layer.confirm("是否确认发布产品？", function(index){
					layer.close(index);
					publish();
				});
			}
     });
		
		//发布产品信息
		function publish(){
			formatDeliveryArea();
			formatPayWay();
			var loadIdContract = layer.load();
			var data = M.formatElement("#presupplier_form");
			M.post(ctx + '/presupplier/goods/save', data, function(result){
			 //发布成功
			 layer.closeAll();
			 M.alert('发布成功！', function(){
				 var goods_id = result.data; //产品编号
				 window.location.href = ctx + "/sales/goods/detail?goods_id=" + goods_id; 
			 });
			}, function(result){
				layer.close(loadIdContract);
				M.alert(result.msg || '发布失败!');
			});
			//格式化注册地址 
			function formatDeliveryArea(){
				var areaArray = new Array();
				$(".areaContainer").each(function(){
					var _this = this;
					var district = $(this).find(".bind-district").val();
					var city = $(this).find(".bind-city").val();
					var province = $(this).find(".bind-province").val();
					var areaCode = district || city || province;
					if(areaCode){
						areaArray.push(areaCode);
					}
				});
				var detaildz = $("#detaildz").val();
				$("#address").val(areaArray.join(",") + detaildz || "100000");  //默认为全国
				alert($("#address").val());
				return false;
			}
			
		}
		
		
		/**绑定图片上传事件**/
		function bindUploadEvent(){
			$(".add-img").not("#upload_img_div .add-img").bind("click", function(){
				var target = this;
				var parent = $(target).closest('span');
				layer.open({
				    type: 1,
				    title: '添加图片',
				    btn: ['确定', '取消'],
				    shadeClose: true,
				    shade: 0.8,
				    shadeClose: false,
				    area: ['480px', '410px'],
				    content: $("#upload_img_div"),
				    yes: function(index){
				    	var desc1 = $("#upload-img-desc").val() ;
						var doc_id = $('#upload_img_div .img-pro img').attr("doc_id");
						if(doc_id){
							//关闭层
							layer.close(index);
							//添加图片信息
							parent.find('.img-pro').show().find('img').attr('doc_id', doc_id).attr("src", ctx + "/file/preview.do?doc_id=" + doc_id);
							parent.find('.img-pro .ms').text(desc1);
							$(target).hide();
						} else{
							M.alert('请上传图片！');
						}
				    },
					cancel: function(index){
				    	layer.close(index);
				    },
				    end: function(){  //关闭层事件
				    	//还原之前样式
				    	$('#upload_img_div .icon-sc').trigger('click');
				    	$('#upload-img-desc').val('');
				    }
				}); 
			});
			
			//移除图片事件
			$('.icon-sc').on('click', function(){
				var parent = $(this).closest('.img-pro').hide();
				parent.find('img').removeAttr('doc_id').removeAttr("src");
				parent.find('.ms').text('');
				parent.next('label').find('.add-img').show().next("div").show();
			});
		}
		
		/**初始化上传控件**/
		function initUpload(){
			$('#upload_img_div .add-img').each(function(){
				var imgUpload = this;
				var uploader = new plupload.Uploader({
					runtimes: 'gears,html5,html4,flash,silverlight',
					browse_button : imgUpload, 	//触发文件选择对话框的按钮，为那个元素id
					url : ctx + '/file/upload.do', //服务器端的上传页面地址
					flash_swf_url : 'js/Moxie.swf', 		//swf文件，当需要使用swf方式进行上传时需要配置该参数
					silverlight_xap_url : 'js/Moxie.xap', 	//silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
					file_data_name: 'up_load_file',
					filters : {
						max_file_size : '200kb',
						mime_types: [
							{title : "Image files", extensions : "jpg"}
						]
					},
					init: {
						FilesAdded: function(up, files) {
							up.start();
						},
						UploadProgress: function(up, file) {
							$('#'+file.id).find('p').text(file.percent + '%');
						},
						FileUploaded: function(up, file, responseObject) {
							var data = JSON.parse(responseObject.response)	// 上传接口返回的数据
							var doc_id = data.data;
							$("#upload_img_div .img-pro").show();
							$("#upload_img_div .img-pro img").attr("doc_id", doc_id).attr("src", ctx + "/file/preview.do?doc_id=" + doc_id);
							$(imgUpload).hide().next("div").hide();
						}
					}
				});
				uploader.init();
			});
		}
		
	})
</script>