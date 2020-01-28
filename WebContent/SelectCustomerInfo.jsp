<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>查看客户个人信息</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/ren1.css" rel="stylesheet" />
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
    <script src="js/jquery.js"></script>
	<script src="js/layer/layer.js"></script>
    <script >
	function del(){
	if(layer.confirm("确实要删除此客户吗?")){
		layer.alert("已经删除！");
	}else{
		layer.alert("已经取消了删除操作");
		}
	}
</script>
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
                             客户个人信息查询
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">客户信息查询与编辑</a>
						</li>
						<li class="active">查询客户个人信息</li>
					</ol>
				</div>
            <div id="page-inner">
             <form action="customerManageServlet?action=search" method="post" accept-charset="utf-8">
                <div class="row">
                
                    <div class="col-md-12 col-sm-12">
                        <div class="card  card-box">
                            <div class="row search">
                               
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            姓名：
                                        </label>
                                        <input id="name" type="text" class="validate" style="width: 80px; height: 30px" name="cusName">
                                    </div>
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            身份证号：
                                        </label>
                                        <input id="identity" type="text" class="validate" style="width: 80px; height: 30px" name="identity">
                                    </div>
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            状态：
                                        </label>
                                        <select id="status" class="browser-default" style="display:inline; width: 100px" name="cusStatus">
                                            <option value="all">全部</option>
                                            <option value="hasOrder">有订单</option>
                                            <option value="noOrder">无订单</option>
                                            <option value="deleted">已删除</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1">
                                   <!--  <a href="customerManageServlet?action=search"> -->
                                        <button class="btn btn-tbl-delete btn-xs" type="submit">
                                            <i class="fa fa-search "></i>
                                        </button>
                                       <!--  </a> -->
                                    </div>
                                    
                                    <div class="col-md-2">
                                     <a href="customerRegisterServlet?action=registration">
                                    <button class="add-btn" type="button"   >
                                        注册新客户
                                    </button></a>
                                </div>
                            </div>
                            <div class="card-body ">
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <table class="table display product-overview mb-30" id="support_table5">
                                            <thead>
                                                <tr>
                                                    <th>客户编号</th>
                                                    <th>姓名</th>
                                                    <th>身份证号</th>
                                                    <th>电话</th>
                                                    <th>邮箱</th>
                                                    <th>状态</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${resultList}" var="customer">
                                            <tr>
													<td>${customer.customerId}</td>
													<td>${customer.customerName}</td>
													<td>${customer.identity}</td>
													<td>${customer.telephone}</td>
													<td>${customer.email}</td>
													<c:if test="${customer.cusStatus eq '0'}">
																<td><span class="label label-sm label-warning">已删除</span>
																</td>
															</c:if>
															<c:if test="${customer.cusStatus eq '1'}">
																<td><span class="label label-sm label-success">无订单</span>
																</td>
															</c:if>
															<c:if test="${customer.cusStatus eq '2'}">
																<td><span class="label label-sm label-info">有订单</span></td>
															</c:if>
													<c:if test="${customer.cusStatus eq '0'}">
																<td><a href="editCustomerServlet?cusId=${customer.customerId}&action=edit" class="btn btn-tbl-edit btn-xs">
                                                                <i class="fa fa-pencil" style="margin-top: 3px"></i>
                                                            </a>
																</td>
													</c:if>
													<c:if test="${customer.cusStatus eq '1'}">
																<td>
																<a href="deleteCustomerServlet?cusId=${customer.customerId}&action=delete" class="btn btn-tbl-delete btn-xs" onclick=del() >
                                                           		 <i class="fa fa-trash-o " style="margin-top: 3px" ></i>
                                                      			 </a>
                                                      			 <a href="editCustomerServlet?cusId=${customer.customerId}&action=edit" class="btn btn-tbl-edit btn-xs">
                                                                <i class="fa fa-pencil" style="margin-top: 3px"></i>
                                                           		 </a>
																</td>
													</c:if>
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
                                    		<a href="customerManageServlet?action=pagenum&pageNum=${p}">${p }</a>
                                    	</c:if>
                                </c:forEach>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
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