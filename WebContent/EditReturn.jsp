<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>填写退货单信息</title>

		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
		<!-- Bootstrap Styles-->
		<link href="assets/css/bootstrap.css" rel="stylesheet" />
		<!-- FontAwesome Styles-->
		<link href="assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Morris Chart Styles-->
		<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
		<!-- Custom Styles-->
		<link href="assets/css/custom-styles.css" rel="stylesheet" />

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
                             编辑退货信息
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">订单管理</a>
						</li>
						<li class="active">退货</li>
					</ol>

				</div>

				<div id="page-inner">
             <form action="editReturnServlet?action=upload" method="post" accept-charset="utf-8">
                <div class="row">
                
                    <div class="col-md-12 col-sm-12">
                        <div class="card  card-box">
                            <div class="card-body ">
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <table class="table table-striped" id="support_table5">
										<thead>
											<tr>
												<th>商品名称</th>
												<th>购买数量</th>
												<th>单价</th>
												<th>总价</th>
											</tr>
										</thead>
										<tbody>
											<tr>
											<td>${returnOrder.productName}</td>
											<td>${returnOrder.amount}</td>
											<td>${returnOrder.buyingPrice}</td>
											<td>${returnOrder.totalPrice}</td>
											</tr>
										</tbody>
										</table>
                                    </div>
                               </div>	
										<input  type="hidden" name="id" value="${returnOrder.id}"/>
										<!-- <div class="input-field col s6">
											<input id="returnAmount" type="text" class="validate" name="returnAmount">
											<label for="returnAmount">退货数量</label>
										</div> -->
										<div class="row">
										<div class="input-field col s6">
        								<!-- <label for="finishDate">要求完成日期</label> -->
        								<span style="color: #696969">要求完成日期</span>
       									 <input type="text" class="validate" id="finishDate" name="finishDate" value="2018-07-22 00:00:00" min="2018-01-01" max="2018-12-31" />
   										 </div>
										
										<div class="col-md-4">
											<label style="color: #696969">
                                            退货原因：
                                        	</label>
											<select id="adCity" class="browser-default" style="display:inline; width: 200px" name="returnReason">
												<option value="1">--收到商品有破损--</option>
												<option value="2">--商品不符合描述--</option>
												<option value="3">--突然不喜欢了--</option>
												<option value="4">--质量问题--</option>
												<option value="5">--发错货--</option>
												<option value="6">--假冒品牌--</option>
											</select>
										</div>
									
										<div class="col-md-2">
										<!-- <a href="" > -->
										<button class="add-btn" type="submit">
                                        查看退货单</button><!-- </a> -->
										</div>
										</div>
										
										<!-- <div class="col-md-2">
											<a href="SelectReturnOrder.jsp"></a>
											<button class="add-btn">
                                        返回</button>
										</div> -->
										
										
                            </div>
								</div>
								</div>
								<div class="clearBoth"></div>
							</div>
							</form>
							</div>
							<!-- </div> -->
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