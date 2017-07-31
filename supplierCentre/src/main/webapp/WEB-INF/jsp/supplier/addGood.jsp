<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
       request.setAttribute("laytab", "attract");
       request.setAttribute("laytabs", "goodindex");
 %>
<%@ include file="/common/layout/header.jsp"%>
<div class="process-wrap process-js1">
		<div class="process-rel">
			<div class="step-wrap background-none">
				<div class="step">
					<p class="fl current">每天惠商家中心 > 商家报名 > 商品报名</p>
					<ul class="step-list">
						<li class="${empty preSupplier ? '':'sel'}"><i>1</i>商家资料</li>
						<li class="${empty preSupplier ? 'sel':''}"><i>2</i>商品资料</li>
						<li class="sel"><i>3</i>合作方案</li>
					</ul>
				</div>
			</div>
			<form id="presupplier_form" onsubmit="return false;">
			<div class="tab-containe abs-top1" style="display: ${empty preSupplier ? '':'none'}">
				<div class="tab-wrap">
					<table class="tab-info">
						<tr>
							<td align="right"><em>*</em>店铺名称：</td>
							<td><input type="text" class="k430" placeholder="请输入店铺名称，不超过25个字" name="supplier_name" value="${preSupplier.supplier_name}" nullmsg="请输入店铺名称！" dataType="*1-25" errormsg="店铺名称不超过25个字！" maxlength="50"></td>
						</tr>
						<tr>
							<td align="right"><em>*</em>联系人名：</td>
							<td><input type="text" placeholder="请输入联系人姓名" class="k430" name="contact_person" value="${preSupplier.contact_person}"  datatype="*1-30" nullmsg="请输入联系人姓名！" errormsg="联系人不超过30个字！" maxlength="50"></td>
						</tr>
						
						<tr>
							<td align="right"><em>*</em>联系人手机号：</td>
							<td><input type="text" placeholder="请输入联系人手机号" class="k430" name="contact_tel" value="${preSupplier.contact_tel}"  datatype="m"  nullmsg="请输入联系人手机号！" errormsg="请输入正确手机号！"></td>
						</tr>

						<tr>
							<td align="right">介绍人名：</td>
							<td><input type="text" placeholder="请输入介绍人姓名" class="k430" name="introducer"  value="${preSupplier.introducer}"  datatype="*1-30"  errormsg="介绍人不超过30个字！" ignore="ignore" maxlength="50">
							     <input type="hidden" name="introducerTel" value="${preSupplier.introducerTel}"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><label class="lbl-pack sel-pack" id ="agressbtn">我已经仔细阅读并同意</label><a onclick="protocolShow()" style="font-size: 12px;color: #0078fe;cursor:pointer;">《商家合作协议》</a></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="#header-wrap"  name="header-wrap" class="btn-x btn btn-next1" onclick="btnNext(1);">下一步</a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="tab-containe abs-top2" style="display: ${empty preSupplier ? 'none':''}"  >
				<div class="tab-wrap">
					<table class="tab-info" style="margin-left:217px;margin-bottom:0px;">
						<tr>
							<td align="right" width="120"><em>*</em>商品名称：</td>
							<td><input type="text" class="k430" placeholder="请输入商品名称，8~20个字"  name="title"  datatype="*8-20" nullmsg="请输入商品名称！" errormsg="商品名称8~20个字！" maxlength="20"></td>
						</tr>
						<tr>
							<td align="right" valign="top" width="120"><em class="middle">*</em>商品链接：</td>
							<td><input type="text" class="k430" placeholder="请输入商品链接，如淘宝、天猫链接" name="pic_url"  datatype="validateLink" nullmsg="请输入商品链接！" id="picurl_input" errormsg="商品链接1~255个字符之间！" maxlength="255"></td>
						</tr>
						<tr>
							<td align="right" valign="top" width="120"><em>*</em>商品图片：</td>
							<td>
							    <input type="hidden" name="pic_info" id="pic_info">
								<a class="add-img" >上传图片</a>
								<div class="god-img-list" style="display: none;" id="imglist">
							      <!-- 		<a class="cg-img product-img"><img src="images/img.jpg"><em></em></a> -->
									
								</div>
								<p class="txt-point">上传尺寸800x800，大小不超过200KB的JPG、PNG格式图片，最多5张</p>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" width="120"><em>*</em>商品详情：</td>
							<td>
							    <input type="hidden" name="pic_detail_info" id="pic_detail_info">
								<a class="add-img" >上传图片</a>
								<div class="god-img-list" style="display: none;" id="imgdetaillist">
									<!-- <a class="cg-img product-img"><img src="images/img.jpg"><em></em></a> -->
								</div>
								<p class="txt-point">上传宽750-800，高度不限，大小不超过200KB的JPG、PNG格式图片，最多10张</p>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" width="120"><em class="middle">*</em>商品描述：</td>
							<td><textarea  class="k430" placeholder="请输入商品描述" onfocus="checkdesc(this);" name="desc1"  datatype="*20-120" nullmsg="请输入商品描述！" errormsg="商品描述20-120个字！" maxlength="120"></textarea></td>
						</tr>
				       </table>
						<div style="border-bottom:1px solid #eee;height:1px;width:800px;margin-left:150px;margin-top:15px;margin-bottom:15px;"></div>
						<table class="tab-info" style="margin-left:225px;margin-top:10px;">
						<tr>
							<td align="right"><em>*</em>类目：</td>
							<td>
							<select class="k430" name="category" datatype="*" nullmsg="请选择类目！" onfocus="checkdesc(this);" >
								<option value="">选择类目</option>
					            <c:forEach items="${appEnumList}" var="appEnum" varStatus="enumStatus">
										<c:forEach items="${appEnum.app_display_area_list}" var="displayArea" varStatus="status">
											<option value="${displayArea.display_area}">${displayArea.display_area}</option>
										</c:forEach>
								</c:forEach>
							</select>
							</td>
						</tr>
						<tr>
							<td align="right"><em>*</em>规格：</td>
							<td><input type="text" placeholder="如：200ML 或 3米" class="k430" name="specification"  datatype="*1-20" nullmsg="请输入规格！" errormsg="商品规格1~20个字符之间！" maxlength="20"></td>
						</tr>
						<tr>
							<td align="right"><em>*</em>库存：</td>
							<td><input type="text" placeholder="请输入库存数，最低100" class="k430" name="stock_qty"  datatype="stocknum" nullmsg="请输入库存量！" errormsg="请输入正确库存,库存最小值为100！" maxlength="9" ></td>
						</tr>
						<tr>
							<td align="right">标签：</td>
							<td><input type="text" placeholder="多个标签用“空格”隔开" class="k430"  name="label"  datatype="*1-200" errormsg="标签1~200个字符之间！" ignore="ignore" onkeyup="value=value.replace(/[!@#$%^&*]/,'') " maxlength="200"></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="#header-wrap"  name="header-wrap" class="btn-s btn btn-Previous2">上一步</a><a href="#header-wrap"  name="header-wrap" class="btn-x btn btn-next2" id="addBut" onclick="btnNext(2);">下一步</a></td>
						</tr>
					</table>
					
				</div>
			</div>
			<div class="tab-containe abs-top3" style="display: none;">
				<div class="tab-wrap">
					<table class="tab-info" style="margin-left:180px;">
						<tr>
							<td align="right"><em>*</em>当前售价：</td>
							<td><input type="text" placeholder="商品的当前销售价格，最多两位小数。如：23.50" class="k430" name="market_price" datatype="maxPrice" nullmsg="请输入当前售价！" errormsg="当前售价在1~9999999之间！"  onkeyup="validateNum(this)" maxlength="7"></td>
						</tr>
						
						<tr>
							<td align="right"><em>*</em>结算佣金：</td>
							<td><input type="text" placeholder="商家与平台每单结算佣金，最多两位小数。如：15.60" class="k430" name="settled_price"  datatype="setPrice"  nullmsg="请输入结算佣金！" onkeyup="validateNum(this)" errormsg="结算佣金在1~9999999之间！" maxlength="7"></td>
						</tr>
						
						<tr>
							<td align="right" valign="top">备注：</td>
							<td><textarea  class="k430" placeholder="如：商品优势、卖点、基本属性等，不超过500个字" name="remark"  id="remarkval" datatype="*1-500"  errormsg="备注不超过500个字！" ignore="ignore"   onfocus="checkdesc(this);"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td><a href="#header-wrap"  name="header-wrap" class="btn-s btn btn-Previous3">上一步</a><a href="#header-wrap"  name="header-wrap" class="btn-x btn btn-refer" onclick="btnNext(3);">提交</a></td>
						</tr>
					</table>
				</div>
			</div>
			</form>
			<div class="tab-containe abs-top4" style="display: none;">
				<div class="tab-wrap">
					<div class="submit-bor">
						<div class="ft40">报名成功</div>
						<div class="bianma">商品活动编码：<small id="activecode"></small></div>
						<div class="ft18">工作人员将在<i>1-3个工作日</i>对该商品进行审核，请耐心等待！
							您可以在首页或者商家报名页面——领了么广告区点击<small>“查看状态”</small>按钮查询审核状态</div>
						<div class="tab-info" style="width:605px;"><a class="btn-s btn" id="checkdetail">查看商品详情</a><a class="btn-x btn" id="goOnRecomm">继续报名商品</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="pact-wrap">
		<div class="ti">每天惠平台商家合作协议</div>
		<ul>
			<li>
				<div>供应商合作协议：</div>
			</li>
			<li>
				<div>甲方：深圳市金惠优选贸易有限公司</div>
				<div>乙方：合作商家 </div>
				<p style="margin-left: 0;">甲乙双方在诚实守信、平等互利的原则下，依据《合同法》、《侵权责任法》、《消费者权益保护法》、《产品质量法》、《商标法》、《网络商品交易及有关服务行为管理暂行办法》等法律法规，经友好协商，就乙方成为甲方产品供应商事宜达成以下合作协议。</p>
				<p style="margin-left: 0;">名词释义：如未特别声明，协议内名词及用语，与汉语的书面用语意义相同。</p>
				<p style="margin-left: 0;">产品：包括但不限于产品本身、附件、配件、促销礼品、赠品、售后服务等。</p>
				<p style="margin-left: 0;">消费者：特指通过“领了么”购买产品的消费者。</p>
			</li>
			<li>
				<div>第一条：合作内容</div>
				<p>1：乙方提供商品信息在甲方平台进行推广。</p>
				<p>2：甲方在授权范围内通过自身平台，向消费者推广乙方的产品及服务 ，由甲方代乙方将约定的推广费用返还给消费者。协议有效期为   1  年， 自报名</p>
				<p>3：审核通过后顺延。协议有效期届满前，如任一方提出不再续约，则协议到期后自动终止。</p>
			</li>
			<li>
				<div>第二条：双方权利与义务</div>
				<p>1：乙方向甲方提供的产品，须在乙方的经营范围内，且由乙方生产或经销的符合国家质量标准且不侵犯任何第三方知识产权和合法权益，如因侵犯第三</p>
				<p>2：方权益导致追责，则一律由乙方承担所有责任，而与甲方无关，如甲方由此导致任何损失的，则由乙方负责全额赔偿。</p>
				<p>3：乙方须向甲方提供产品的详细描述信息，包括但不限于产品图片、介绍文字、构成成分、使用方式、使用功能、有效期限以及样品等，并对该信息的</p>
				<p>4：真实性、有效性承担连带保证责任。如因乙方所提供的信息出现错误或偏差，则乙方承担全部责任，与甲方无关。乙方应在24小时内将甲方推广的产</p>
				<p>5：品订单及时发货，并对产品的质量、售后服务负责，如因产品的发货时效、质量、售后问题，导致消费者投诉，甲方将追究乙方责任并对有争议的订</p>
				<p>6：单处以100元/单的罚款，或在其处理完争议后再行结算，乙方必须保证提供的产品在线数量与报名活动数量相符。</p>
				<p>7：甲方须按协议约定推广乙方产品，在推广过程中，不夸大或扭曲产品介绍、功能、服务等不符合乙方产品真实信息等内容。</p>
				<p>8：如乙方提供的产品，产生大量质量安全问题、消费者群体投诉或产生其他任何重大社会影响，则甲方有权立即暂停该产品或乙方所有产品的合作，并</p>
				<p>9：立即通知乙方全面介入处理。乙方必须立即组建专门的危机处理团队，全面应对并处理该等问题或危机，并切实保障甲方权益不受任何损害或影响，</p>
				<p>10：否则甲方有权追究乙方的全部违约责任并要求赔偿全部损失。</p>
				<p>11：双方在对外宣传时，不夸大、扭曲双方的合作关系、合作内容，如因此造成一方名誉或经济损失，对方有权追究其法律责任和损失。</p>
			</li>
			<li>
				<div>第三条：发货与结算</div>
				<p>1：如因临时产品不足或其他原因无法及时发货，须立即向甲方说明情况，并在24小时内补齐差货或加急安排发货，否则视为乙方违约，由此给甲方造成的
全部损失由乙方承担，同时乙方按照甲方该笔订单额的 10 %向甲方支付违约金，甲方并有权要求乙方继续提供不足部分商品。</p>
				<p>2：双方按日结方式进行结算，即乙方应在甲方推广订单产生后24小时内进行结算并将相应推广费支付至甲方指定账户，甲方代收推广费后通过甲方平台将
推广费返还消费者。如乙方未按时结算并支付，甲方可直接从诚信保证金中扣除。</p>
				<p>3：活动期间产生的退款、漏单及其它违约罚款在活动结束后统一进行结算。</p>
				<p>4：乙方应当在本合同签订后  3 日内，应向甲方交纳诚信保证金  0  元。合同履行过程中，如因乙方原因导致诚信保证金不足  0  元，乙方应当予以补足。
合作期满或双方约定终止协议 2 个月后，甲方可向乙方退还保证金。</p>
			</li>
			<li>
				<div>第四条：质量保障与售后服务</div>
				<p>1：乙方须向甲方提供产品的质量检验合格证书或其他相应的资质或资格证照，其复印件加盖乙方单位公章作为本协议附件。乙方向甲方保证其所提供的</p>
				<p>2：全部产品必须是全新、正版、原装产品，符合国家或行业质量标准和安全标准，不存在假冒伪劣、以次充好、以旧充新等情形，否则一律由乙方承担</p>
				<p>3：全部责任，与甲方无关。</p>
				<p>4：如消费者收到的产品与订购的产品不符，或产品质量有问题，经甲方确认后，乙方须及时补发此产品；乙方在甲方平台推广的产品，需按照法律规定</p>
				<p>5：向消费者提供退换货或维修等三包服务。 如乙方提供的单款产品，出现超过3次的质量问题或消费者投诉，甲方有权暂停此产品的合作，并在甲方平</p>
				<p>6：台下架此产品，如乙方提供的所有产品，出现累计超过6次的质量问题或消费者投诉，甲方有权暂停此产品的合作，并在甲方平台下架此产品。    </p>
			</li>
			<li>
				<div>第五条：发货规范</div>
				<p>1：空单处理；如乙方快递单号给出48小时后还查不到物流信息的视为空单，每笔空单按100元/单处罚，罚金直接从当月诚信保证金中扣除。</p>
				<p>2：退换货运费处理；因乙方问题导致客户退换货的，运费均由乙方承担。
如因甲方平台问题导致的退换货，运费由甲方承担。</p>
			</li>
			<li>
				<div>第六条：责任与免责条款</div>
				<p>1：如因一方违反协议约定，造成对方损失的行为，按照协议第二条双方权利与义务承担相应的损失和责任。</p>
				<p>2：如因乙方向甲方提供的产品、图文信息等问题，导致消费者投诉、第三方追责、政府处罚等对甲方造成名誉或经济损失的行为，甲方将依据实际的损</p>
				<p>3：失，向乙方索赔，并要求乙方解决此问题。</p>
				<p>4：不可抗力导致本协议无法履行或不能完全履行的，双方都不负法律责任，损失由双方自行承担。</p>
			</li>
			<li>
				<div>第七条：协议生效、变更、终止</div>
				<p>1：双方其他未尽事宜，可经双方协商签署补充协议，如补充协议与本协议冲突，以补充协议为准。</p>
				<p>2：甲乙双方任何一方的民事主体发生变化、一方严重违反合作协议或相关法律法规、因不可抗力因素导致合同内容不能继续履行、协议期满且双方不再</p>
				<p>3：继续合作，则协议终止，双方未完成的服务，双方协商处理。</p>
				<p>4：本协议壹式贰份，甲乙双方各持壹份，贰份协议具有同等法律效应。</p>
				<p>5：协议经甲乙双方签字盖章之日起生效。</p>
			</li>
			<li>
				<div>第八条：保密条款</div>
				<p>本协议以及合作过程中所涉及的信息、资料均为双方的商业机密，双方对此负有保密义务，未经对方书面许可，任何一方不得将其泄露、传播或公开给第三
方，否则应承担违约责任并赔偿由此给对方造成的损失。</p>
			</li>
			<li>
				<div>第九条：争议解决</div>
				<p>甲乙双发在履行协议时发生争议，应在友好互利的前提下协商处理；协商不成，则任一方均有权提交深圳仲裁委员会仲裁解决。</p>
			</li>
			<li>
				<div>第十条：协议附件</div>
				<p>1：产品网络销售授权书</p>
				<p>2：产品质量检验合格报告》复印件</p>
				<p>3：乙方公司的营业执照、税务登记证和组织机构代码证复印件（加盖公章）</p>
			</li>
		</ul>
		<a class="btn-yuedu" >我已认真阅读并同意</a>
	</div>
	            
<%@ include file="/common/layout/footer.jsp"%>
<script type="text/javascript" src="${static_resource_server}/common/third-part/plupload/plupload.full.min.js"></script>
	<script type="text/javascript" src="${ctx}/common/static/js/areaSelector.js"></script>
	<script type="text/javascript" src="${ctx}/common/static/js/thelper.js"></script>
	<script type="text/javascript">
		var goods_display_area = '${goods.display_area}', goods_pic_info = '${goods.pic_info}', goods_pic_detail_info = '${goods.pic_detail_info}';
	</script>
    <script type="text/javascript" src="${ctx}/common/static/goods/js/addGood.js"></script>

<script>
$(function(){
	$('.lbl-pack').click(function(){
		$(this).toggleClass('sel-pack');
	})
	var oHeight = $('.abs-top1').height();
	//$('.process-wrap').css('height',oHeight+220);
   /*  $('.btn-next1').click(function(){
		$('.process-rel .tab-containe').hide();
		$('.abs-top2').show();
		$('.step-list li').eq(0).addClass('sel');
		$('.step-list li').eq(1).removeClass('sel');
		var oHeight2 = $('.abs-top2').height();
		//$('.process-wrap').css('height',oHeight2+220);
	})
	 $('.btn-next2').click(function(){
		$('.process-rel .tab-containe').hide();
		$('.abs-top3').show();
		$('.step-list li').eq(1).addClass('sel');
		$('.step-list li').eq(2).removeClass('sel');
		var oHeight3 = $('.abs-top3').height();
		//$('.process-wrap').css('height',oHeight3+220);
	})       */
	$('.btn-Previous2').click(function(){
		$('.process-rel .tab-containe').hide();
		$('.abs-top1').show();
		$('.step-list li').eq(0).removeClass('sel');
		$('.step-list li').eq(1).addClass('sel');
		var oHeight = $('.abs-top1').height();
		//$('.process-wrap').css('height',oHeight+220);
	})
	$('.btn-Previous3').click(function(){
		$('.process-rel .tab-containe').hide();
		$('.abs-top2').show();
		$('.step-list li').eq(1).removeClass('sel');
		$('.step-list li').eq(2).addClass('sel');
		var oHeight2 = $('.abs-top2').height();
		//$('.process-wrap').css('height',oHeight2+220);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	})
	 /* $('.btn-refer').click(function(){
			$('.process-rel .tab-containe').hide();
			$('.abs-top4').show();
			$('.step-list').hide();
		})  */
	

})
</script>