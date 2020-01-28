<%@ page language = "java" contentType="text/html; charset=utf-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<title>订单管理</title>
    <head>    
   		<meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <title>OrderHome</title>
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
		                <a class="navbar-brand waves-effect waves-dark" href="index.html"><i class="large material-icons">track_changes</i> <strong>客户服务中心</strong></a>
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
		        <!-- Dropdown Structure -->
		        <ul id="dropdown1" class="dropdown-content">
		            <li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
		            </li>
		            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
		            </li>
		            <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
        	</div>
        	<!-- /.WRAPPER -->
        	<div id="page-wrapper">
        		<div class="header" >
        			<h1 class="page-header">你好！欢迎来到订单管理</h1>
        		</div>
        		<div class="header">
        				
        				<ol class="breadcrumb">
        					<li><a href="#">客户服务中心</a></li>
        					<li class="active">订单管理</li>
        				</ol>
        			</div>
        		<div id="page-inner">
        			<div class="row">
        				<div class="col-md-3 col-sm-3">
        					<a href="CustomerRegister.jsp">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6594610579.jpg">
		        					</div>
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">注册新客户
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        					
		        				</div>
	        				</a>
        				</div>
	        			
        				<div class="row">
        				<div class="col-md-3 col-sm-3">
        					<a href="customerManageServlet?action=tab">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6290533191.jpg">
		        					</div>
		        					
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">查询客户信息
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        				</div>
	        				</a>
        				</div>
        				<div class="col-md-3 col-sm-3">
	        				<a href="ViewCustomerOrder.jsp">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6948729351.jpg">
		        					</div>
		        					
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">查询客户订单
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        				</div>
	        				</a>
        				</div>
        			</div>
        			</div>
        			<div class="row">
        				<div class="col-md-3 col-sm-3">
        					<a href="NewOrder.jsp">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6736049701.jpg">
		        					</div>
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">新订订单
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        					<div class="card-reveal">
		        						<span class="card-title grey-text text-darken-4">新订订单<i class="material-icons right">close</i></span>
		        						<p>对于收到货后想要退货的客户，戳此处退货</p>
		        					</div>
		        				</div>
	        				</a>
        				</div>
	        			
        				<div class="row">
        				<div class="col-md-3 col-sm-3">
        					<a href="CancelOrder.jsp">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6845799630.jpg">
		        					</div>
		        					
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">我要退订
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        					<div class="card-reveal">
		        						<span class="card-title grey-text text-darken-4">我要退订<i class="material-icons right">close</i></span>
		        						<p>对于有退订需求的客户，戳此处退订</p>
		        					</div>
		        				</div>
	        				</a>
        				</div>
        				<div class="col-md-3 col-sm-3">
	        				<a href="SelectReturnOrder.jsp">
		        				<div class="card">
		        					<div class="card-image waves-effect waves-block waves-light">
		        						<img class="activator" src="assets/QJ6290533191.jpg">
		        					</div>
		        					
		        					<div class="card-content">
		        						<span class="card-title activator grey-text text-darken-4">我要退货
		        							<i class="material-icons right">more_vert</i></span>
		        					</div>
		        					<div class="card-reveal">
		        						<span class="card-title grey-text text-darken-4">我要退货<i class="material-icons right">close</i></span>
		        						<p>对于收到货后想要退货的客户，戳此处退货</p>
		        					</div>
		        				</div>
	        				</a>
        				</div>
        			</div>
        			</div>
        			
		        	
		        	
        		</div>
        		<!-- /. PAGE INNER -->
        	</div>
        <!-- /. PAGE WRAPPER  -->
   
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- Bootstrap Js -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/materialize/js/materialize.min.js"></script>
        <!-- Metis Menu Js -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- Morris Chart Js -->
        <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="assets/js/morris/morris.js"></script>
        <script src="assets/js/easypiechart.js"></script>
        <script src="assets/js/easypiechart-data.js"></script>
        <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
        <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
        $(document).ready(function() {
            $('#dataTables-example').dataTable();
        });
        </script>
        <!-- Custom Js -->
        <script src="assets/js/custom-scripts.js"></script>

 	</body>
</html>