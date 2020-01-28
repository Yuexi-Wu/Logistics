<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>客户注册</title>
		<style>
		span{font-size:9px} 
		</style>
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
		<script type ="text/javascript" src = "js/address.js"></script>
		<script type ="text/javascript" src="js/jquery.js"></script>
		<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
		
		<script type="text/javascript">  var req;
		function validateName(){
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveObject("Microsoft.XMLHTTP")
			}
			
			req.open("post","customerRegisterServlet?action=validate",false);
			
			req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			
			req.onreadystatechange = updatePage1;
			
			req.send("cusName="+document.getElementById("cusName").value);
			
		}
		function updatePage1(){
			if(req.readyState ==4){
				if(req.status ==200){
					var result = req.responseText;
					if(result=="true"){
						layer.alert("用户名重复");
						document.getElementById("cusName").value="";
					}
					if(document.getElementById("cusName").value==""){
						document.getElementById("checkUserNameResult").innerHTML = "*用户名不能为空";    
					}else{
						document.getElementById("checkUserNameResult").innerHTML ="";
					}
				}
			}
		}
		</script>
		<script type="text/javascript">
		function isnum(){
			var reg=/^1[0-9]{10}/;      
			if(!reg.test(document.getElementById("telephone").value)){        
				layer.alert("请正确填写手机号！");        
				document.getElementById("telephone").value=""; 
				}    
			if(document.getElementById("telephone").value==""){
				document.getElementById("checkTelephoneResult").innerHTML = "*电话号码不能为空";    
			}else{
				document.getElementById("checkTelephoneResult").innerHTML ="";
			}
		}
		</script>
		<script type="text/javascript">
		function validateAd(){
			
			if(document.getElementById("adDetail").value==""){
				
				document.getElementById("checkAddressResult").innerHTML = "*地址不能为空";    
			}else{
				document.getElementById("checkAddressResult").innerHTML ="";
			}
		}
		</script>
		<script src="js/jquery.js"></script>
		<script src="js/layer/layer.js"></script>
		<script type="text/javascript"> function isId(){
			var regIdNo = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			 if(!regIdNo.test(document.getElementById("identity").value)){
			   layer.alert('身份证号填写有误');
			   document.getElementById("identity").value=""; 
			 }
			 if(document.getElementById("identity").value==""){
				
					document.getElementById("checkIdentityResult").innerHTML = "*身份证号不能为空";    
				}else{
					document.getElementById("checkIdentityResult").innerHTML ="";
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
                             注册新客户
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li>
							<a href="#">客户管理</a>
						</li>
						<li class="active">客户注册</li>
					</ol>
				</div>
				<div id="page-inner">
					<div class="row">
					<form  action="customerRegisterServlet" method="post">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-action">
									客户基本信息填写
								</div>
								<div class="card-content">
								
									<div class="card-content">
										
											<div class="row">
												<div class="input-field col s3">
													<i class="material-icons prefix">account_circle</i>
													<input id="cusName" type="text" class="validate" name="cusName" onblur="validateName()" >
													<span id="res" style="color:red" ></span>
													<label for="cusName" data-error="wrong" data-success="right">客户姓名</label>
												</div>
												<div class="input-field col s3">
												<span id="checkUserNameResult" style="color: red "></span>
												</div>
												<div class="input-field col s3">
													<i class="material-icons prefix">phone</i>
													<input id="telephone" type="tel" class="validate" name="telephone" onblur="isnum(telephone)">
													<label for="telephone" data-error="wrong" data-success="right">联系电话(11位)</label>
												</div>
												<div class="input-field col s3">
												<span id="checkTelephoneResult" style="color: red "></span>
												</div>
											</div>
										
											<div class="row">
												<div class="input-field col s5">
													<input id="identity" type="text" class="validate" name="identity" onblur="isId()">
													<label for="identity">身份证号</label>
												</div>
												<div class="input-field col s2">
												<span id="checkIdentityResult" style="color: red "></span>
												</div>
												<div class="radio">
													<label style="color: #696969">性别：</label>
													<input name="gender" type="radio" id="male" value="male"/>
													<label for="male">男</label>
													<input name="gender" type="radio" id="female" value="female"/>
													<label for="female">女</label>
												</div>
											</div>
										
											<div class="row">
												<div class="input-field col s6">
													<input id="email" type="email" class="validate" name="email">
													<label for="email" data-error="wrong" data-success="right">邮箱地址</label>
												</div>
												<div class="input-field col s6">
													<input id="postcode" type="number" class="validate" name="postcode">
													<label for="postcode">邮编(6位)</label>
												</div>
											</div>
											<div class="col-md-6">
												<label style="color: #696969">
                                            所在省：
                                        		</label>
												<select id="adProvince" class="browser-default" style="display:inline; width: 200px" name="adProvince">
												</select>
											</div>
											<div class="col-md-6">
												<label style="color: #696969">
                                            所在市：
                                        		</label>
												<select id="adCity" class="browser-default" style="display:inline; width: 200px" name="adCity" onmouseover="test()">
												</select>
											</div>
											<div class="row">
												<div class="input-field col s9">
													<input id="adDetail" type="text" class="validate" name="adDetail" onblur="validateAd()">
													<label for="adDetail">详细地址</label>
												</div>
												<div class="input-field col s3">
												<span id="checkAddressResult" style="color: red "></span>
												</div>
											</div>
										
										
										<div class="col-md-2">
											<button class="add-btn" type="submit">
                                        提交</button>
										</div>
										<!-- <div class="col-md-2">
											<a href="home.html"></a>
											<button class="add-btn">
                                        返回</button>
										</div> -->
										<div class="clearBoth"></div>
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