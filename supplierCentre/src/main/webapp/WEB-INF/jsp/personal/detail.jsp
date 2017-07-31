<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/layout/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
    <div class="header-wrap">
	<div class="header">
		<a href="${ctx}/" class="logo"></a>
		<ul class="nav">
			<li><a href="${ctx}/">首页</a></li>
			<li><a href="${ctx}/zxindex">资讯</a></li>
			<li><a href="${ctx}/zsindex">商家报名</a></li>
		</ul>
	</div>
	</div>
		<div class="process-wrap process-js1">
		<div class="process-rel">
			<div class="step-wrap background-none">
				<div class="step">
					<p class="fl current">每天惠商家中心 > 商品查询 > 商品详情</p>
				</div>
			</div>
			<div class="detailshow" >
	            <%@ include file="preSupplierDetail.jsp" %>
            </div>
            <c:if test="${preSupplier.audit_status eq 'fail'}">
	           <div class="editdiv" style="display: none;">
	           <%@ include file="preSupplierEdit.jsp" %>
	           </div>
            </c:if>
		   
	 </div>
	 </div>
	<script type="text/javascript"> 
	$(function(){
		//切换显示编辑详情页面
		$("#md-bj").click(function(){
			$(".detailshow").hide();
			$(".editdiv").show();
		});
		
		$("#md-qx").click(function(){
			$(".detailshow").show();
			$(".editdiv").hide();
		});
	    $(".pics .gods-imgs .imgshow").on('click', function(){
			layer.open({
				  type: 1,
				  title: false,
				  closeBtn: 0,
				  area:  ['500px', '500px'],
				  skin: 'layui-layer-nobg', //没有背景色
				  shadeClose: true,
				  content: $($(this).closest(".gods-imgs").find(".imgdetailshow"))
			});
		});
	    $(".imgdetailshow").on('click',function(){
	    	layer.closeAll();
	     })
	    //图片切换
		var bigImg = $('.pro-img-big img');
		var smallImg = $('.pro-img-min li img');
		$(smallImg).click(function(){
			var aa = $(this).attr('src');
			$(bigImg).attr('src', aa);
		});
		
		
	});
	
	function copyToClipBoard(){
	       $('#prelink').trigger('select');
			  document.execCommand('copy');
			 M.alert("复制成功");
		 }
    function validateLogistic(){
    	var flag = true;
    	var company = $("input[name='company']").val();
    	var bh = $("input[name='bh']").val();
    	if($.trim(bh) == ""){
    		M.alert("物流单号不能为空!");
    		flag = false;
    	}
    	if($.trim(company) == ""){
    		M.alert("物流公司不能为空!");
    		flag = false;
    	}
    	return flag;
    	
    }

	function submitFun(){
		   var supplier_id = $("#supplier_id").val();
		   if(validateLogistic()){
			    var params = M.formatElement('#logisticForm');
       			M.post('logistic', params, function(result){
       				M.alert("操作成功！");
       				window.location.href = '${ctx}/presupplier/detail?supplier_id='+supplier_id;
       			}, function(result){
       				M.alert(result.msg || '提交失败！');
       			});
		    }
	}
    </script>
	
<%@ include file="/common/layout/footer.jsp"%>
<script type="text/javascript" src="${static_resource_server}/common/third-part/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="${ctx}/common/static/js/areaSelector.js"></script>
