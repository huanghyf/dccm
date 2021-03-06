<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<script src="js/echarts.js"></script>
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
						<form action="classifier/list.do" method="post" name="staffForm" id="staffForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">请输入员工姓名：
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="请输入员工姓名" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
					            <td style="vertical-align:top;padding-left:2px;">
								 	 <select class="chosen-select form-control" name="label" id="label" data-placeholder="状态" style="vertical-align:top;width: 120px;">
									
									<option value="${pd.label}"></option>
									<option value="1">流失</option>
									<option value="0">未流失</option>
								  	</select>
								</td>
						
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if> --%>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<!--
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>-->
									<th class="center" style="width:50px;">序号</th>
									<th class="center">员工姓名</th>
									<th class="center">用户名</th>
									
									<th class="center">电话</th>
                                   <th class="center">是否流失</th>
									
									
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
											<td class='center'>${var.name}</td>
											<td class='center'>${var.username}</td>
											<td class='center'>${var.phone}</td>
											
									
											<td class='center'>
												<c:if test="${var.label==1}">是</c:if>
												<c:if test="${var.label==0}">否</c:if>
											</td>
											
										
											
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
												
												
													
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														
														
															
														</ul>
													</div>
												</div>
											</td>
										</tr>
						
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
							
					<div class="page-header position-relative">
					
						<div class="page-header position-relative">
									<table style="width:100%;">
										<tr>
											<td style="vertical-align:top;"><div class="pagination"
													style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
											</td>
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
		<div style="width:1000px;margin:0 auto;">			
			<div id="bb" style="height:150px;"></div>
				<div id="liushigroups"
					style="text-align:center; float:left; width: 825px;height:450px;margin:50px 50px 50px 100px"></div>				
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
$(top.hangge());

//检索
function searchs(){
	top.jzts();
	$("#staffForm").submit();
}
	
	
	//VIP客户数目变化
							var myChart2 = echarts.init(document
									.getElementById('liushigroups'));
							var liushigroups = eval('${liushigroups}');
							var xData = new Array();
							var yData = new Array();
							//var idData = new Array();
							for ( var x in liushigroups) {
								xData[x] = liushigroups[x].date;
								yData[x] = liushigroups[x].c;
								//idData[x] = cluster[x].groupId;
							}
							var option2 = {
							      title: {
								        text: '流失客户数目'
								    },
								xAxis: {
							     
							        data: xData
							    },
							    yAxis: {
							    },
								visualMap: {
							            top: 10,
							            right: 10,
							            pieces: [{
							                gt: 0,
							                lte: 5,
							                color: '#096'
							            }, {
							                gt: 5,
							                lte: 10,
							                color: '#ffde33'
							            }, {
							                gt: 10,
							                lte: 15,
							                color: '#ff9933'
							            }, {
							                gt: 15,
							                lte: 20,
							                color: '#cc0033'
							            }, {
							                gt: 20,
							                lte: 25,
							                color: '#660099'
							            }, {
							                gt: 25,
							                color: '#7e0023'
							            }],
							            outOfRange: {
							                color: '#999'
							            }
							        },
				
							    series: [{
							        data: yData,
							        type: 'line'
							    }]
							};

			                    // 使用刚指定的配置项和数据显示图表。
								//myChart1.setOption(option1);
								myChart2.setOption(option2);
							
							function ObjStory2(type,data) //声明对象
								{   
								    this.type= type;	    
								    this.data = data;
								}
</script>
</html>

