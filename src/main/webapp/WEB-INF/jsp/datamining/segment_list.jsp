﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>    
<!DOCTYPE html>
<html lang="en">

<head>
<base href="<%=basePath%>">
<!-- 引入 ECharts 文件 -->
<script src="js/echarts.js"></script>
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>

<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="cluster/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="姓名/手机号/备注" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								
								<%-- <td>&nbsp;&nbsp;创建时间：</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastStart" id="lastStart"  value="${pd.lastStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:68px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastEnd" name="lastEnd"  value="${pd.lastEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:68px;" placeholder="结束日期" title="结束日期"/></td> --%>
							<%--
								<td style="vertical-align:top;padding-left:15px;"><b>订单状态：</b>
								 	<select class="chosen-select form-control" name="ORDER_STATUS" id="id" data-placeholder="请选择订单状态" style="vertical-align:top;width: 120px;">	
									<option value="${pd.ORDER_STATUS}">全部</option>
									<option value="0">待支付</option>
									<option value="1">已关闭</option>
									
								  	</select>
								</td> --%>
							
								
							
								
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								
								<!--<td><div style="margin-left:50px;font-size:16px;color:red;">今日订单总额：${todayTotalMoney}</div></td>
								<td><div style="margin-left:30px;font-size:16px;color:red;">历史订单总额：${historyTotalMoney}<div></td>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>  -->
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									
									<th class="center">样本数</th>
									<th class="center">订单总额</th>
									<th class="center">退款总额</th>
									<th class="center">订单次数</th>
									<th class="center">退款次数</th>
									<th class="center">最大订单金额</th>
									<th class="center">最大退款金额</th>
									<th class="center">所属类别</th>
								
								
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
										<!--	<td class='center'>${var.label}</td>-->
											<td class='center'>${var.yangben}</td>
											
											<td class='center'>
												<fmt:formatNumber value="${var.ordermoney}" pattern="#,#00.00"/>
											</td>
											<td class='center'>
												<fmt:formatNumber value="${var.refundmoney}" pattern="#,#00.00"/>
												</td>
											<td class='center'>
												<fmt:formatNumber value="${var.cishu}" pattern="00"/>
											</td>
											<td class='center'>
												<fmt:formatNumber value="${var.cishu_refund}" pattern="00"/></td>
											<td class='center'>
												<fmt:formatNumber value="${var.ordermoney_max}" pattern="0.00"/></td>
											<td class='center'>
											    <fmt:formatNumber value="${var.refund_max}" pattern="0.00"/>
											</td>	
											<td class='center'>  ${var.level}</td>
											<%-- <td class='center'>${var.URL}</td> 
											<td class='center'>${var.RECOMMEND_TIME}</td>
										
											<td class='center'>${var.STAFF_NAME}</td>
											<td align='right'><fmt:formatNumber type="number" value="${var.ORDER_MONEY}" pattern="0.00" maxFractionDigits="2"/></td>
											<td align='right'><fmt:formatNumber type="number" value="${var.PROPORTION}" pattern="0.00" maxFractionDigits="2"/></td>
										
											<td class='center'>${var.DISCOUNT_ID}</td>
											<td align='right'><fmt:formatNumber type="number" value="${var.PAY_MONEY}" pattern="0.00" maxFractionDigits="2"/></td>
										--%>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													
													<a class="btn btn-xs btn-warning" title="查看明细" onclick="edit('${var.label}');">
														<i class="ace-icon fa fa-search bigger-120" title="查看明细"></i>
													</a>
													<a class="btn btn-xs btn-success" title="修改类别" onclick="updatelevel('${var.label}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改类别"></i>
													</a>
													
													
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="edit('${var.label}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<!--<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.ORDER_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>  -->
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
							<%-- 	<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" onclick="add();">新增</a>
									</c:if>
								</td> --%>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
				
						</form>
					
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
	
		</div>
		<!-- /.main-content -->
	<div style="width:1200px;margin:0 auto;">
	  <div id="bb" style="height:150px;"></div>
		<div id="VIPgroups"
			style="text-align:center; float:left; width: 905px;height:450px;margin:50px 50px 50px 100px"></div>		
	</div>
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
	//VIP客户数目变化
//							var myChart2 = echarts.init(document
//									.getElementById('VIPgroups'));
//							var VIPgroups = eval('${VIPgroups}');
//							var xData = new Array();
//							var yData = new Array();
//							//var idData = new Array();
//							for ( var x in VIPgroups) {
//								xData[x] = VIPgroups[x].date;
//								yData[x] = VIPgroups[x].c;
//								//idData[x] = cluster[x].groupId;
//							}
//							var option2 = {
//							      title: {
//								        text: 'VIP客户数目'
//								    },
//								xAxis: {
//							     
//							        data: xData
//							    },
//							    yAxis: {
//							    },
//								visualMap: {
//					            top: 10,
//					            right: 10,
//					            pieces: [{
//					                gt: 0,
//					                lte: 50,
//					                color: '#096'
//					            }, {
//					                gt: 50,
//					                lte: 100,
//					                color: '#ffde33'
//					            }, {
//					                gt: 100,
//					                lte: 150,
//					                color: '#ff9933'
//					            }, {
//					                gt: 150,
//					                lte: 200,
//					                color: '#cc0033'
//					            }, {
//					                gt: 200,
//					                lte: 250,
//					                color: '#660099'
//					            }, {
//					                gt: 250,
//					                color: '#7e0023'
//					            }],
//					            outOfRange: {
//					                color: '#999'
//					            }
//					        },
//		
//							    series: [{
//							        data: yData,
//							        type: 'line'
//							    }]
//							};
//
//			                    // 使用刚指定的配置项和数据显示图表。
//								
//								myChart2.setOption(option2);
//							
//							function ObjStory2(type,data) //声明对象
//								{   
//								    this.type= type;	    
//								    this.data = data;
//								}

		var myChart2 = echarts.init(document
									.getElementById('VIPgroups'));
							var VIPgroups = eval('${VIPgroups}');
							var Allgroups = eval('${Allgroups}');
							var xData = new Array();
							var yData = new Array();
							var y2Data = new Array();
							//var idData = new Array();
							for ( var x in VIPgroups) {
								xData[x] = VIPgroups[x].date;
								yData[x] = VIPgroups[x].c;				
							}	
								for ( var x in Allgroups) {					
								y2Data[x] = Allgroups[x].c;						
							}
var option2 = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            crossStyle: {
                color: '#999'
            }
        }
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['vip','总人数','平均温度']
    },
    xAxis: [
        {
            type: 'category',
            data: xData ,
            axisPointer: {
                type: 'shadow'
            }
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '总人数',
            min: 3000,
            max: 4000,
            interval: 250,
            axisLabel: {
                formatter: '{value} '
            }
        },
        {
            type: 'value',
            name: 'vip人数',
            min: 100,
            max: 300,
            interval: 50,
            axisLabel: {
                formatter: '{value} '
            }
        }
    ],
    series: [
        {
            name:'总人数',
            type:'bar',
            data:y2Data, 
			barWidth: 18,//barCategoryGap: '10%',
			//barMaxWidth: 100,
			//barMinHeight: 100,
		},
     
        {
            name:'vip',
            type:'line',
            yAxisIndex: 1,
            data:yData
        }, 
  
    ]
};
	myChart2.setOption(option2);
							
							function ObjStory2(type,data,name) //声明对象
								{   
								    this.type= type;	    
								    this.data = data;
									this.name = name;
								}
								
								
		function updatelevel(Id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改用户等级";
			 diag.URL = '<%=basePath%>cluster/golevel.do?label='+Id;
			 diag.Width = 450;
			 diag.Height = 200;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					  if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		
		}
		//查看明细
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看客户";
			 diag.URL = '<%=basePath%>cluster/goquery.do?label='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
			
					 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
					
				}
			 diag.close();
			 };
			 diag.show();
		
		}
		
		
	</script>


</body>
</html>