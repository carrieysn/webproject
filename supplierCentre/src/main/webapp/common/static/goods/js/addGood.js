   $(function(){
		 //初始化地区选择
		M.area(".areaContainer");
		//初始化图片显示
		//initPicInfo();
		//初始化上传控件
		initUpload();
	
		/**初始化上传控件**/
		function initUpload(){
			$("#upload_img_div .conp").html("");
			$('.add-img').each(function(){
				var imgUpload = this;
				var uploader = new plupload.Uploader({
					runtimes: 'gears,html5,html4,flash,silverlight',
					browse_button : imgUpload, 	//触发文件选择对话框的按钮，为那个元素id
					url : ctx + '/file/upload.do', //服务器端的上传页面地址
					flash_swf_url : 'js/Moxie.swf', 		//swf文件，当需要使用swf方式进行上传时需要配置该参数
					silverlight_xap_url : 'js/Moxie.xap', 	//silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数
					file_data_name: 'up_load_file',
					unique_names: false,
					filters : {
						max_file_size: '200kb',
						mime_types: [
							{title : "Image files", extensions : "jpg,png"}
						]
					},
					init: {
						FilesAdded: function(up, files) {
						 var loadLen = files.length;
						 var idname = $(imgUpload).parent().find('.god-img-list').attr('id');
						 var len = $(imgUpload).parent().find('.god-img-list').find('img').length;
						 if(idname == 'imglist'){
							 if(loadLen + len >5){
									M.alert("上传商品图片 最多5张!");
									for(var i=0;i<files.length;i++){
										up.removeFile(files[i]);
									}
									return;
								}else{
								up.start();}
						 }
						 if(idname == 'imgdetaillist'){
							 if(loadLen + len >10){
									M.alert("上传商品详情 最多10张!");
									for(var i=0;i<files.length;i++){
										up.removeFile(files[i]);
									}
									return;
								}else{
								up.start();}
						 }
						},
						UploadProgress: function(up, file) {
							$('#'+file.id).find('p').text(file.percent + '%');
						},
						Error: function(up,err){
							if(err.code == '-600'){
								var idname = $(imgUpload).parent().find('.god-img-list').attr('id');
								if(idname == 'imglist'){
									layer.msg("上传尺寸800x800,大小不超过200kb的jpg、png图片!", {time: 3000});
								}
								if(idname == 'imgdetaillist'){
									layer.msg("建议上传小于200kb宽度为750-800的jpg、png图片!", {time: 3000});
								}
							}
						},
						FileUploaded: function(up, file, responseObject) {
							var data = JSON.parse(responseObject.response)	// 上传接口返回的数据
							var doc_id = data.data;
							var idname = $(imgUpload).parent().find('.god-img-list').attr('id');
							var len = $(imgUpload).parent().find('.god-img-list').find('img').length;
							if(idname == 'imglist'){
								if(len < 5){
									$(imgUpload).parent().find('.god-img-list').append('<a class="cg-img product-img" id="img-pro'+doc_id+'"><img src='+ctx +'/file/preview.do?doc_id='+ doc_id+' doc_id='+doc_id+' width="128px" height="128px"><em onclick="delimg(\''+doc_id+'\')"></em></a>');
								}
								$("#imglist").show();
							}
							if(idname == 'imgdetaillist'){
								if(len < 10){
									$(imgUpload).parent().find('.god-img-list').append('<a class="cg-img product-img" id="img-pro'+doc_id+'"><img src='+ctx +'/file/preview.do?doc_id='+ doc_id+' doc_id='+doc_id+' width="128px" height="128px"><em onclick="delimg(\''+doc_id+'\')"></em></a>');
								}
								$("#imgdetaillist").show();
							}
							
						},
						UploadComplete: function(up, file) {
							$.each(up.files, function (i, fil) {
	                            up.removeFile(fil);
	                          });
						}
					}
				});
				uploader.init();
			});
		}
		
   });
   
   
    //移除图片事件
	function delimg(id){
		var parent = $('#img-pro'+id);
		parent.find('img').removeAttr('doc_id').removeAttr("src");
		parent.next('label').find('.add-img').show();
		parent.remove();
		var showimgdiv = $('#upload_img_div .conp').html();
		if (showimgdiv == '') {
			$("#imgshowdiv").hide();
		}
	}
	
	/***表单验证***/
var presupplier_form = $("#presupplier_form").Validform({
	tipSweep: true,
	tiptype:function(msg,o,cssctl){
		if(o.type == 3){
			M.alert(msg);
		}
	},
	beforeSubmit: function(curform){
		submit();
		return false;
	},
	datatype:{
		"validateLink":function(gets,obj,curform,regxp){
	        var flag = true;
			if(gets.length>255||gets.length<1){
				obj.attr('errormsg','商品链接1~255个字符之间！');
				flag = false;
			}
			var pic_url = $("#presupplier_form input[name='pic_url']").val();
			var getinfo = $.trim(pic_url);
			 $.ajax({
			        type: 'POST',
			        url: ctx + '/presupplier/valRecomm',
			        data: {'pic_url':getinfo},
			        async:false,
			        success: function(result) {
			            if (result.status == '1') {   //成功
			            	 obj.attr('errormsg','此商品链接已存在！');
							 flag = false;
			            }
			           }
			        });
			return flag;
		},
        "stocknum":function(gets,obj,curform,regxp){
        	var str=/^[1-9]{1}\d{2,8}$/;
			if(str.test(gets)){return true;}
			return false;
        },
		"maxPrice": function(gets,obj,curform,regxp){
			if(regxp.money.test(gets)){
				if(parseFloat(gets) < 0 || parseFloat(gets) > 9999999 ){
					obj.attr('errormsg','当前售价在1~9999999之间！');
					return false;
				}
				return true;
			}
			return false;
		},
		"setPrice": function(gets,obj,curform,regxp){
			if(regxp.money.test(gets)){
				var market_price_el = $("#presupplier_form input[name='market_price']");
				var market_price = market_price_el.val();
				var settled_price_el =  $("#presupplier_form input[name='settled_price']")
				var settled_price = settled_price_el.val();
				if(settled_price){
					if(parseFloat(gets) < 0 || parseFloat(gets) > 9999999 ){
						return false;
					}
					if(parseFloat(market_price) < parseFloat(settled_price)){
						obj.attr('errormsg','结算佣金不能大于当前售价！');
						return false;
					} 
				}else{
					obj.attr('errormsg','');
					return true;
				}
				return true;
			}
			return false;
		}

	}
});

/***提交表单**/
function submit(){
	  //验证成功、将上传的图片数据进行格式化
	var picInfoArray = new Array();
	//产品图片
	$("#imglist .product-img").each(function(){
		var img = {};
		img.path_id = $(this).find('img').attr("doc_id");
		img.title = "";
		if(img.path_id){
			picInfoArray.push(img);
		}
	});
	
	$("#pic_info").val(JSON.stringify(picInfoArray));
	//产品详情
	var picdetailArray = new Array();
	$("#imgdetaillist .product-img").each(function(){
		var img = {};
		img.path_id = $(this).find('img').attr("doc_id");
		img.title = "";
		if(img.path_id){
			picdetailArray.push(img);
		}
	});
	$("#pic_detail_info").val(JSON.stringify(picdetailArray));
	layer.confirm("是否确认提交？", function(index){
		layer.close(index);
		publish();
	});
	return false;
}
//推荐商品信息
function publish(){
	formatDeliveryArea();
	var loadIdContract = layer.load();
	var data = M.formatElement("#presupplier_form");
	M.post(ctx + '/presupplier/save', data, function(result){
		var resultData = result.data;
		var supplierid = resultData.split(",")[0];
		var activecode = resultData.split(",")[1];
		$("#goOnRecomm").attr("href",'recommend?supplier_id='+supplierid);
		$("#checkdetail").attr("href",ctx+'/presupplier/detail?supplier_id='+supplierid);
		 //成功
		layer.closeAll();
		$("#activecode").html('HD'+activecode);
	    $('.process-rel .tab-containe').hide();
		$('.abs-top4').show();
		$('.step-list').hide();
	}, function(result){
		layer.close(loadIdContract);
		M.alert(result.msg || '推荐失败!');
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
		$("#area_id").val(areaArray.join(",") || "100000");  //默认为全国
		return false;
	}
	
}
//下一步
function btnNext(index){
	if(index == '1'){
		var isagree = $("#agressbtn").attr('class');
		if(isagree != 'lbl-pack sel-pack') {
			return;
		}
	}
	var next = parseInt(index) + 1;
	var pre = parseInt(index) - 1;
	var currentInputDiv = '.abs-top' + index;
	var isValid = true;
	$(currentInputDiv).find('[datatype]').each(function(){
		isValid = presupplier_form.check(false, this);
		if(!isValid){
			if($(this).val()){
				//M.alert($(this).attr('errormsg'));
				  $(this).nextAll().remove();
				  $(this).css('borderColor','red');
				  $('<span class="Validform_checktip Validform_wrong">'+$(this).attr('errormsg')+'</span>').insertAfter($(this));
			} else{
				//M.alert($(this).attr('nullmsg') ||'不能为空！');
				$(this).nextAll().remove();
				$(this).css('borderColor','red');
				$('<span class="Validform_checktip Validform_wrong">'+$(this).attr('nullmsg')+'</span>').insertAfter($(this));
			}
			return false;
		}else{
			$(this).nextAll().remove();
			$(this).css('borderColor','#dddddd');
		}
	});
	if(isValid){
		if(index == '2'){
			var picInfoArray = new Array();
			$("#imglist .product-img").each(function(){
				var img = {};
				img.path_id = $(this).find('img').attr("doc_id");
				img.title = "";
				if(img.path_id){
					picInfoArray.push(img);
				}
			});
			if(picInfoArray.length < 1){
				M.alert('请至少上传一张商品图片');
				isValid = false;
				return false;
			}
			var picdetailArray = new Array();
			$("#imgdetaillist .product-img").each(function(){
				var img = {};
				img.path_id = $(this).find('img').attr("doc_id");
				img.title = "";
				if(img.path_id){
					picdetailArray.push(img);
				}
			});
			if(picdetailArray.length < 1){
				M.alert('请至少上传一张商品详情图片');
				isValid = false;
				return false;
			}
			
		}
		
		if(index == '3'){
			presupplier_form.submitForm(false);
		}else{
			$('.process-rel .tab-containe').hide();
			$('.abs-top'+next+'').show();
			$('.step-list li').eq(pre).addClass('sel');
			$('.step-list li').eq(index).removeClass('sel');
		}
	}
}

function validateNum(obj){
	  obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符   
	  obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的   
	  obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
	  obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数   
	  if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额  
	   obj.value= parseFloat(obj.value);  
	  }  
}

$("#agressbtn").on('click',function(){
	var classname = $(this).attr('class');
	if(classname == 'lbl-pack'){
		$('.btn-next1').css('background','#e95613');
		$('.btn-next1').css('borderColor','#e95613');
	}else if(classname == 'lbl-pack sel-pack'){
		$('.btn-next1').css('background','#736370');
		$('.btn-next1').css('borderColor','#736370');
	}
});
function protocolShow(){
	$(".pact-wrap").show();
}
$(".btn-yuedu").on('click',function(){
	$(".pact-wrap").hide();
})

function checktitle(obj){
	var objvalue = $.trim($(obj).val());
	if(objvalue.length>=8 && objvalue.length<=20){
		$(obj).css('borderColor','#dddddd');
	}else{
		$(obj).css('borderColor','red');
	}
}
function checkdesc(desc){
	$(desc).nextAll().remove();
	$(desc).css('borderColor','#dddddd');
}
$("#remarkval").on("input propertychange",function(){
	var reval = $(this).val();
	if(reval.length>500){
		  $(this).css('borderColor','red');
		  $('<span class="Validform_checktip Validform_wrong">'+$(this).attr('errormsg')+'</span>').insertAfter($(this));
	}else{
		$(this).nextAll().remove();
		$(this).css('borderColor','#dddddd');
	}
});
$(".tab-info input").on('focus',function(){
	$(this).nextAll().remove();
	$(this).css('borderColor','#dddddd');
})
   