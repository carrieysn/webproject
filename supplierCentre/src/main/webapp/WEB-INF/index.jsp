<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
       request.setAttribute("laytab", "index");
 %>
<%@ include file="/common/layout/header.jsp"%>
    <div class="login-min">
     <div class="login-min-box">
        <div class="login-wrap">
            <div class="ti">供应商登录</div>
            <form id="supplierLoginForm">
	            <div class="login-bor-wrap">
	                <div class="login-bor">
	                    <table>
	                        <tr>
	                            <td><label class="wth278 icon-phone"><input name="mobile" type="text" placeholder="手机号"></label></td>
	                        </tr>
	                        <tr>
	                            <td><label class="wth162 icon-yzm"><input  name="imageCode" type="text" placeholder="图形验证码"></label><img src="account/getImageValidCode" class="fr" height="42px" width="110px" style="cursor:pointer;"></td>
	                        </tr>
	                        <tr>
	                            <td><label class="wth162 icon-sjh"><input name="validCode" type="text" placeholder="手机验证码"></label><a href="javascript:void(0);" class="hq-yzm" cursor="pointer">获取验证码</a></td>
	                        </tr>
	                    </table>
	                    <label class="icon-jz"><input type="checkbox">两周内免登录</label>
	                    <a href="javascript:void(0);" ><input value="登录" class="btn-login" type="submit"  style="border:none;cursor:pointer;"></a>
	                </div>
	            </div>
            </form>
        </div>
      </div>
    </div>
    <div class="swiper-container banner" id="log-banner">
        <div class="swiper-wrapper">
            <div class="swiper-slide" id="banner" style="background:url(${ctx}/common/static/images/banner_min.jpg) no-repeat 50% 50%"></div>
            <div class="swiper-slide" style="background:url(${ctx}/common/static/images/banner02.jpg) no-repeat 50% 50%"></div>
            <div class="swiper-slide" style="background:url(${ctx}/common/static/images/banner03.jpg) no-repeat 50% 50%"></div>
        </div>

        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
    <div class="merchants-wrap">
        <div class="title">商家报名</div>
        <div class="merchants-slider">
            <div>
                <h3>
    			  	<img src="${ctx}/common/static/images/zs3.jpg">
    			  	<p class="btn-list-zs">
    					<a href="${ctx}/presupplier/recommend" class="tj">商品报名</a>
    					<a href="${ctx}/login">查看状态</a>
    				</p>
    	  		</h3>
    	  	</div>
            <a href="${ctx}/zsindex" class="btn-more">查看更多商家报名信息</a>
        </div>
    </div>
    <div class="content">
        <div class="title">资讯</div>
        <ul class="information-list">
            <li>
                <a href="${ctx}/newshow?zid=s">
                    <div class="list-img"><img src="${ctx}/common/static/images/20170422-2.jpg"></div>
                <div class="ti">每天惠大学南区分院揭牌仪式&业务落地发布会在湖南株洲举行</div>
                <div class="nr">4月22日，每天惠大学南区分院揭牌仪式暨业务落地发布会在湖南株洲正式举行。每天惠集团CEO阳明... </div></a>
            </li>
            <li>
                <a href="${ctx}/newshow?zid=r">
                    <div class="list-img"><img src="${ctx}/common/static/images/20170329-2.jpg"></div>
                <div class="ti">每天惠大学北区分院揭牌仪式&业务落地发布会在山东隆重举行 </div>
                <div class="nr">行业新领袖，荣耀再启程！2017年3月29日，时隔每天惠大学正式成立10天之后，每天惠大学北区分...</div></a>
            </li>
            <li>
                <a href="${ctx}/newshow?zid=t">
                    <div class="list-img"><img src="${ctx}/common/static/images/20170319-1.jpg"></div>
                <div class="ti">“连锁中国·实惠人民”每天惠品牌文化升级发布会&每天惠大学成立典礼</div>
                <div class="nr">每天惠之前品牌大胆采用“逆向思维”的创业逻辑，在业内创造了量的奇迹。但品牌的奇迹才刚开始...</div></a>
            </li>
        </ul>
        <a href="${ctx}/zxindex" class="btn-more tp0">查看更多资讯</a>
    </div>
<%@ include file="/common/layout/footer.jsp"%>
<script>
$(function() {
	$("#banner").css('background','url('+ctx+'/common/static/images/banner.jpg) no-repeat 50% 50%')

    //banner
    $('#log-banner').swiper({
        pagination: '#log-banner .swiper-pagination',
        paginationClickable: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false,

    });
    
	$('#supplierLoginForm').on('submit', function(){
		var params = M.formatElement('#supplierLoginForm');
		if(params.mobile && (/^1[3|4|5|7|8][0-9]{9}$/.test(params.mobile))){
			$('#supplierLoginForm .icon-phone').css('border','1px solid #dcdcdc');
			//if(params.validCode){
				$('#supplierLoginForm .icon-sjh').css('border','1px solid #dcdcdc');
				//验证登录
    			M.post('account/accountLogin', params, function(result){
    				window.location.href = '${param.return_url}' || '/partner';
    			}, function(result){
    				M.alert(result.msg || '登录失败！');
    			});
		    /* } else{
				$('#supplierLoginForm .icon-sjh').css('border','1px solid #F96116');
			}     */
		 } else{
			$('#supplierLoginForm .icon-phone').css('border','1px solid #F96116');
		} 
		return false;
	});
	
	//获取验证码
	bindGetValidCode();
	function bindGetValidCode(){
		$('#supplierLoginForm .hq-yzm').on('click', function(){
			getValidCode();
			time = 60;
		});
	}
	function getValidCode(){
		var mobile = $('#supplierLoginForm input[name="mobile"]').val();
		var imageCode = $('#supplierLoginForm input[name="imageCode"]').val();
		if(mobile && (/^1[3|4|5|7|8][0-9]{9}$/.test(mobile))){
			$('#supplierLoginForm .icon-phone').css('border','1px solid #dcdcdc');
			if(imageCode){
				$('#supplierLoginForm .icon-yzm').css('border','1px solid #dcdcdc');
				M.post('account/getValidCode',{'mobile': mobile, 'imageCode': imageCode}, function(result){
					//获取成功
    				$('#supplierLoginForm .hq-yzm').addClass('icon-invalid').off('click').html('60秒后获取');
    				interval = window.setInterval(function(){
    		    		time--;
    		    		if(time < 1){
    		    			window.clearInterval(interval);
    		    			$('#supplierLoginForm .hq-yzm').removeClass('icon-invalid').text('获取验证码');
    		    			bindGetValidCode();
    		    		} else{
	    		    		$('#supplierLoginForm .hq-yzm').text(time + '秒后获取');
    		    		}
    		    	 }, 1000);
    				//更改验证码
					//changeImageCode();
    			}, function(result){
    				M.alert(result.msg || '获取验证码失败！');
    				//更改验证码
					changeImageCode();
    			});
			} else{
				$('#supplierLoginForm .icon-yzm').css('border','1px solid #F96116');
			}
		} else{
			$('#supplierLoginForm .icon-phone').css('border','1px solid #F96116');
		}
	}
	
	//刷新图片验证码
	$('#supplierLoginForm .fr').on('click', function(){
		changeImageCode();
	});
	
	//更改验证码
	function changeImageCode(){
		$('#supplierLoginForm .fr').attr('src', 'account/getImageValidCode?r=' + (new Date()).getTime());
	}
    
})
</script>
