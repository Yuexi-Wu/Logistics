<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>客户信息修改</title>

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
		<link href="assets/css/bootstrap.css" rel="stylesheet" />
		<link href="assets/css/font-awesome.css" rel="stylesheet" />
		<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
		<link href="assets/css/custom-styles.css" rel="stylesheet" />
		<script type ="text/javascript" src = "js/address.js"></script>
		<script type ="text/javascript" src="js/jquery.js"></script>
		<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
	</head>

	<body>
		<div id="wrapper">
			<nav class="navbar navbar-default top-navbar" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="home.html"><i class="large material-icons">track_changes</i> <strong>物流管理系统</strong></a>
                <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                  <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b><%=session.getAttribute("username")%></b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
			</nav>
			<ul id="dropdown1" class="dropdown-content">
				<li>
					<a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
				</li>
			</ul>
			<!--/. NAV TOP  -->
			<nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a class="active-menu waves-effect waves-dark" href="COHome.jsp"><i class="fa fa-home"></i>客户管理中心 </a>
                    </li>
                    <li>
                        <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 客户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="CustomerRegister.jsp"><i class="fa fa-user"></i>注册新客户</a>
								</li>
								<li>
									<a class="waves-effect waves-dark"><i class="fa fa-book"></i>客户信息查询与编辑<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li>
											<a href="customerManageServlet?action=tab"><i class="fa fa-search"></i>个人信息查询与编辑</a>
										</li>
										<li>
											<a href="ViewCustomerOrder.jsp"><i class="fa fa-list"></i>客户订单信息查询</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
						<li>
							<a class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 订单管理<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li>
									<a href="NewOrder.jsp"><i class="fa fa-user"></i>新订</a>
								</li>
								<li>
									<a href="SelectOrder.jsp"><i class="fa fa-user"></i>查询</a>
								</li>
								<li>
									<a href="CancelOrder.jsp"><i class="fa fa-user"></i>退订</a>
								</li>
								<li>
									<a class="waves-effect waves-dark"><i class="fa fa-bookmark"></i>退货<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">
										<li>
											<a href="SelectReturnOrder.jsp"><i class="fa fa-search"></i>选择已完成订单退货</a>
										</li>
										<li>
											<a href="returnOrderServlet?action=tab"><i class="fa fa-list"></i>查看所有退货单</a>
										</li>
									</ul>
								</li>
							</ul>
						</li>
                </ul>
            </div>
        </nav>
			<!-- /. NAV SIDE  -->
			<div id="page-wrapper">
				<div class="header">
					<h1 class="page-header">
                             客户信息修改
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">客户管理</a>
						</li>
						<li class="active">修改客户信息</li>
					</ol>
				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-action">
									修改客户基本信息
								</div>
								<div class="card-content">
									<div class="card-content">
										<form class="col s12" action="editCustomerServlet?action=update" method="post">
											<input type="hidden" name="cusId" value="${editCustomer.customerId}">
											<div class="row">
												<div class="input-field col s6">
													<i class="material-icons prefix">account_circle</i><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户姓名</span>
													<input id="icon_prefix" type="text" class="validate" name="cusName" value="${editCustomer.customerName}">
													<!--  <label for="icon_prefix">客户姓名</label>-->
												</div>
												<div class="input-field col s6">
													<i class="material-icons prefix">phone</i><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话</span>
													<input id="icon_telephone" type="tel" class="validate" name="telephone" value="${editCustomer.telephone}">
													<!-- <label for="icon_telephone">联系电话</label> -->
												</div>
											</div>
											<div class="row">
												<div class="input-field col s8">
												<span>身份证号</span>
													<input id="identity" type="text" class="validate" name="identity" value="${editCustomer.identity}">
													<!--  <label for="identity">身份证号</label>-->
												</div>
												<div>
													<label style="color: #696969">性别：</label>
													<input name="gender" type="radio" id="male" value="male"  <c:if test="${editCustomer.gender=='male'}">checked="checked"</c:if>/>
													<label for="male">男</label>
													<input name="gender" type="radio" id="female" value="female" <c:if test="${editCustomer.gender=='female'}">checked="checked"</c:if>/>
													<label for="female">女</label>
												</div>
											</div>
										
											<div class="row">
												<div class="input-field col s6">
												<span>邮箱地址</span>
													<input id="email" type="email" class="validate" name="email" value="${editCustomer.email}">
													<!-- <label for="email" data-error="wrong" data-success="right">邮箱地址</label> -->
												</div>
												<div class="input-field col s6">
												<span>邮编</span>
													<input id="postcode" type="text" class="validate" name="postcode" value="${editCustomer.postcode}">
													<!-- <label for="postcode">邮编</label> -->
												</div>
											</div>
										
										
										
										<div class="row">
										
											<div class="col-md-6">
												<label style="color: #696969">
                                            所在省：
                                        		</label>
												<select id="adProvince" class="browser-default" style="display:inline; width: 200px" name="adProvince">
													<option value="Liaoning" ${adProvince=="Liaoning"?'selected':''}>--辽宁省--</option>
													<option value="Neimeng" ${adProvince=="Neimeng"?'selected':''}>--内蒙--</option>
													<option value="Heilongjiang" ${adProvince=="Heilongjiang"?'selected':''}>--黑龙江--</option>
													<option value="Jilin" ${adProvince=="Jilin"?'selected':''}>--吉林--</option>
												</select>
											</div>
											<div class="col-md-6">
												<label style="color: #696969">
                                            所在市：
                                        		</label>
												<select id="adCity" class="browser-default" style="display:inline; width: 200px" name="adCity" onmouseover="test()">
													<option value="Shenyang" ${adCity=="Shenyang"?'selected':''}>--沈阳市--</option>
													<option value="Dalian" ${adCity=="Dalian"?'selected':''}>--大连市--</option>
													<option value="Anshan" ${adCity=="Anshan"?'selected':''}>--鞍山市--</option>
													<option value="Tieling" ${adCity=="Tieling"?'selected':''}>--铁岭市--</option>
												</select>
											</div>
											</div>
											
											<div class="row">
												<div class="input-field col s12">
												<span>详细地址</span>
													<input id="adDetail" type="text" class="validate" name="adDetail" value="${editCustomer.adDetail}">
													<!-- <label for="adDetail">详细地址</label> -->
												</div>
											</div>
										
										<div class="col-md-2">
											<button class="add-btn" type="submit">
                                        确认修改</button>
										</div>
										<div class="col-md-2">
											<a ></a>
											<button class="add-btn" >
                                        返回</button>
										</div>
										</form>
										<div class="clearBoth"></div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			</div>
			<script src="assets/js/jquery-1.10.2.js"></script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/materialize/js/materialize.min.js"></script>
			<script src="assets/js/jquery.metisMenu.js"></script>
			<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
			<script src="assets/js/morris/morris.js"></script>
			<script src="assets/js/easypiechart.js"></script>
			<script src="assets/js/easypiechart-data.js"></script>
			<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
			<script src="assets/js/custom-scripts.js"></script>
	</body>
</html>