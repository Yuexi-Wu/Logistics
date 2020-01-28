<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>客户订单查询</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="assets/css/ren1.css" rel="stylesheet" />
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
                             查询客户订单
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">客户信息查询与编辑</a>
						</li>
						<li class="active">查看客户订单</li>
					</ol>
				</div>
            
            <div id="page-inner">
                <div class="row">
                 <form action="rreturnManageServlet?action=all" method="post" accept-charset="utf-8">
                    <div class="col-md-12 col-sm-12">
                        <div class="card  card-box">
                            <div class="row search">
                               
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            客户姓名：
                                        </label>
                                        <input id="name" type="text" class="validate" style="width: 80px; height: 30px" name="cusName">
                                    </div>
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            身份证号：
                                        </label>
                                        <input id="identity" type="text" class="validate" style="width: 80px; height: 30px" name="identity">
                                    </div>
                                   
                                    <div class="col-md-1">
                                        <button class="btn btn-tbl-delete btn-xs">
                                            <i class="fa fa-search "></i>
                                        </button>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                
                            </div>
                            <div class="card-body ">
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <table class="table display product-overview mb-30" id="support_table5">
                                            <thead>
                                                <tr>
                                                    <th>订单编号</th>
                                                    <th>客户姓名</th>
                                                    <th>商品名称</th>
                                                    <th>购买数量</th>
                                                    <th>单价</th>
                                                    <th>总价</th>
                                                    <th>订单状态</th>
                                                    <th>订单类型</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${orderList}" var="order">
                                            <tr>
													<td>${order.id}</td>
													<td>${order.customerName}</td>
													<td>${order.productName}</td>
													<td>${order.amount}</td>
													<td>${order.buyingPrice}</td>
													<td>${order.totalPrice}</td>
													<td>
                                                        <span class="label label-sm label-success">${order.status}</span>
                                                    </td>
                                                    <td>${order.type}</td>
												</tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="page-number">
                                <div class="col-md-4">
                                    <label style="color: #696969">
                                        每页显示数：
                                    </label>
                                    <select id="page-size" class="browser-default" style="display:inline; width: 50px" name="pageSize">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                    </select>
                                </div>
                                <div class="col-md-8">
                                <c:forEach begin="1" end="${pagecount}" var="p">
                                <c:if test="${p==pageNum}">
                                    		${p}
                                    	</c:if>
                                    	<c:if test="${p!=pageNum}">
                                    		<a href="customerManageServlet?pageNum=${p}">${p}</a>
                                    	</c:if>
                                </c:forEach>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    </form>
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