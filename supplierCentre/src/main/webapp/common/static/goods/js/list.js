$(function(){
	        var flag = 0;
			loadList(flag);
			$('.current-wrap li').click(function(event) {
				flag = $(this).index();
				$('.current-wrap li a').removeClass('sel');
				$('.current-wrap li a').eq(flag).addClass('sel');
				loadList(flag);
			});
	  
});


function searchPart(flag){
	M.post(ctx + '/presupplier/searchlist', {"flag":flag}, function(result){
		  var dataList = result.data;
		  //console.log(dataList);
		  var html = '';
        if(dataList == null || dataList == ""){
	      $(".goods-list").html(html);
		  M.alert("没有查到相关数据!");
		  }else{
		  for(var index in dataList){
			    var obj = dataList[index];
			    html += '<li>'
				+'<div class="god">'
				+'<div class="fl">';
				var imghtml = '';
				   for(var num in obj.picList){
					   var imgobj = obj.picList[num];
					   imghtml += '<img src="'+ctx+'/file/preview.do?doc_id='+imgobj.path_id+'">'
				   }
	           html += imghtml
				+'</div>'
				+'<div class="fl">'
					+'<p class="name">'+obj.title+'</p>'
					+'<p class="xiangqing">'+obj.desc1+'</p>'
				+'</div>'
				+'<a style="display: none;" href="查看状态3.html" class="fr icon-bj"></a>'
			+'</div>';
			if(flag == '3'){
				html += '<form id="logisticForm'+obj.supplier_id+'" >'
				+'<input type="hidden" name="supplier_id" value="'+obj.supplier_id+'"/>';
			}
			html+= '<div class="info">'
			        +'<p>'
					+'<span>品类：'+obj.category+'</span>'      
					+'<span>规格：'+obj.specification+'</span>'       
					+'<span>库存：'+obj.stock_qty+'</span>'       
					+'<span>厂家：'+obj.manufacturer+'</span>'       
					+'<span>标签：'+obj.label+'</span>'  
					+'</p>' 
					+'<p>';
					var marketprice = formatNum(obj.market_price);
					var settledprice = formatNum(obj.settled_price);
					html += '<span>市场价：'+marketprice+'元</span>'        
					+'<span>结算价：'+settledprice+'元 </span>'      
					+'<span>起订：'+obj.min_buy_qty+'件  </span>'     
					+'<span>限购：'+obj.purchMax+' </span>'      
					+'<span>有效期：'+obj.valid_thru+'</span>'    
					+'<span>配送范围：'+obj.delivery_area+'</span>' ;
					if(flag == '5'){
						html += '<span>驳回原因：'+obj.resultdesc+'</span>';
					}
					html +='</p>';
					if(flag == '4' || flag == '5' || flag == '6'){
						html += '<p><span>物流公司：'+obj.logisticCompany+'</span><span>物流单号：'+obj.logisticCode+'</span></p>';
					}
					html += '</div>';
					if(flag == '3'){
						html += '<div class="logistics">'
						+'<p>'
						+'<span>物流公司：<input type="text" name="company" /></span>'
						+'<span>物流单号：<input type="text" name="bh" /></span>'
						+'<span><input value="确定" class="btn-qd" type="button" onclick="submitFun(\''+obj.supplier_id+'\')"  style="border:none;"/></span>'
						+'</p></div></form>';
					}
					html += '</li>';
		  }
		  $(".goods-list").html(html);
     }
		}, function(result){
			M.alert('抱歉！系统繁忙，请稍后...');
		});
	
}

function loadList(flag){
	$('.current-wrap li a').removeClass('sel');
	$('.current-wrap li a').eq(flag).addClass('sel');
	searchPart(flag);
}

function formatNum(flt) {
	 var value=Math.round(parseFloat(flt)*100)/100;
	 var xsd=value.toString().split(".");
	 if(xsd.length==1){
	 value=value.toString()+".00";
	 return value;
	 }
	 if(xsd.length>1){
	 if(xsd[1].length<2){
	  value=value.toString()+"0";
	 }
	 return value;
	 }
}


	    function validateLogistic(id){
	    	var flag = true;
	    	var company = $('#logisticForm'+id+' input[name="company"]').val();
	    	var orderNum = $('#logisticForm'+id+' input[name="bh"]').val();
	    	if($.trim(company) == ""){
	    		M.alert("物流公司不能为空!");
	    		flag = false;
	    	}
	    	if($.trim(orderNum) == ""){
	    		M.alert("物流单号不能为空!");
	    		flag = false;
	    	}
	    	return flag;
	    	
	    }

		function submitFun(id){
		
			   if(validateLogistic(id)){
				    var params = M.formatElement('#logisticForm'+id+'');
				    console.log(params);
	       			M.post('logistic', params, function(result){
	       				loadList(4);
	       			}, function(result){
	       				M.alert(result.msg || '提交失败！');
	       			});
			    }
		}