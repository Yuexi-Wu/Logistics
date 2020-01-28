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
	    <link rel="stylesheet" href="assets/css/custom-styles.css">
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
        			<h1 class="page-header">新订订单</h1>
        		</div>
        		<div class="header">
        				<ol class="breadcrumb">
        					<li><a href="">客户服务中心</a></li>
        					<li class="active">订单管理</li>
        				</ol>
        		</div>
	        	<div id="page-inner">
        			<div class="col-md-12 col-sm-12">
                        <div class="card  card-box">
                            <div class="row search">
                                <form method="post" accept-charset="utf-8" >
                                    <div class="col-md-3">
                                        <label style="color: #696969" class="">
                                            姓名：
                                        </label>
                                        <input id="customerName" name="cusName" type="text" class="validate" style="width: 100px; height: 30px">
                                    </div>
                                    <div class="col-md-3">
                                        <label style="color: #696969">
                                            身份证号：
                                        </label>
                                        <input id="identity" name="identity" type="text" class="validate" onblur="checkIdentity()" style="width: 100px; height: 30px">
                                    </div>
                                    <div class="col-md-1">
                                        <button class="btn btn-tbl-delete btn-xs" type="button" onclick="selectCustomer()">
                                            <i class="fa fa-search "></i>
                                        </button>
                                    </div>
                                </form>
	                   			
                                <span id="res" ></span>
                                <button class="add-btn" style="text-align: right;" onclick="customerRegister()">注册新客户</button>
                            </div>
                            <!-- 返回对应的客户信息 -->
                            <div id="customerInfo" class="card-body " style="display:none">
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <table class="table display product-overview mb-30">
                                            <thead>
                                                <tr>
                                                    <th>编号</th>
                                                    <th>姓名</th>
                                                    <th>身份证号</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${customerList}" var="customer">
	                                                <tr>
	                                                	
	                                                    <td>
		                                                    <div class="radio">
		                                                    	 <input type="radio" id="customerId" 
														         value="${customer.customerId}"> ${customer.customerId}
		                                                    </div>
	                                                    </td>
	                                                    <td>${customer.customerName}</td>
	                                                    <td>${customer.identity}</td>
	                                                    <td><a href="customerDetailServlet?customerId=${customer.customerId}">查看详细信息</a></td>
	                                                </tr>
	                                             </c:forEach>
	                                             
	                                        </tbody>
                                        </table>
                                    </div>
                               </div>
                               </div>
                               
                               <div class="radio">
									<label style="color: #696969">是否为收货人</label>
										<input name="judgeRcv" type="radio" id="isCustomer" value="true" />
	                               		<label for="isCustomer">是</label>
	                               		<input name="judgeRcv" type="radio" id="isOtherRcv" value="false"/>
	                               		<label for="isOtherRcv">否</label>
								</div>
								 <button class="add-btn" style="text-align: right;" type="button" onclick="showAddress()">确定</button>
                        </div>
                        
                    </div>
                    <!-- 商品信息 -->
        			<div class="col-md-12 col-sm-12">
                        <div class="card  card-box">
                        	<div class="card-action">
                        		<!-- 商品分类展示还没实现 -->
                               	<div class="col-md-3">
                               		<form action="productServlet?selectProductByClassification" method="post" accept-charset="utf-8">
			        					<label style="color:#696969">
			        							商品分类
			        					</label>
			        					<select id="p_id" name="type" class="browser-default" style="display:inline;width:100px">
			        						<option value="办公">办公</option>
				        					<option value="运动">运动</option>
				        					<option value="汽车">汽车</option>
			        					</select>
			        					<select id="s_id" name="type" class="browser-default" style="display:inline;width:100px">
			        						<option value="办公">办公</option>
				        					<option value="运动">运动</option>
				        					<option value="汽车">汽车</option>
			        					</select>
			        				</form>
			        			</div>
                                
                        	</div>
                          
                            <div class="card-body "  style="text-align: right;" >
                            	
                                <div class="table-wrap">
                                    <div class="table-responsive">
                                        <table class="table display product-overview mb-30" >
                                            <thead>
                                            	 <tr>
                                                    <th>编号</th>
                                                    <th>商品名</th>
                                                    <th>售价</th>
                                                    <th>折扣</th>
                                                    <th>选择数量</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items= "${products}"  var="product">
                                            		<tr>
                                            			<td><input type = "checkbox" value="${product.id}" id="productId"></td>
                                            		 	<td>${product.name}</td>
	                                                    <td><span style="font:bold;color:#BD380F">${product.price*product.discount}</span></td>
	                                                    <td>${product.discount}</td>
	                                                    <td>
	                                                    	<input id="amount" name="amount" type="number" onblur="checkAmount()"/>
	                                                    </td>
	                                                    <td><span id="lackOrNot"></span></td>
	                                                    <td><span id="selectAmount"></span></td>
	                                                </tr>
                                             	</c:forEach>
                                            </tbody>
                                          </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <!-- 订单确认其他信息 -->
                        <div class="col-md-12 col-sm-12">
                        <div class="card card-box">
                        	<form  class="col s12" method="post">
                        		<div class="row">
                        			<div class="radio">
										<label style="color: #696969">是否需要发票</label>
											<input name="bill" type="radio" id="needBill" value="needBill" />
			                        		<label for="needBill">是</label>
	                        				<input name="bill" type="radio" id="notNeedBill" value="notNeedBill" />
			                        		<label for="notNeedBill">否</label>
									</div>
                        		</div>
                        		<div class="row">
                        			<div class="col-md-6">
					        			<label style="color:#696969" for="finishDate" class="">
					        				请输入要求完成日期：					     
				        				<input type="date" id ="finishDate" onclick="checkAfterDate()" style="display: inline;width:150px;" required/>
					        		</div>
					        	</div>
                        	</form>
                        		
                        </div>
                     </div>
                     <!-- 确认收货人信息及地址 -->
                     <span style="font-size: large;">请确认收货人信息及地址</span>
						<div class="row">
						    <!-- 现有客户 -->
							<div class="card col-md-6" id="currentCustomer" style="display:none" >
								<div class="card-action" >现有客户</div>
								<div class="card-content"> 
		                        	<div class="table-responsive">
		                        		<table class="table-hover">
		                        			<thead></thead>
		                        			<tbody>
		                        				<tr>
		                        					<th>姓名</th>
		                        					<th>${customer.name}</th>
		                        				</tr>
		                        				<tr>
		                        					<th>电话</th>
		                        					<th>${customer.telephone}</th>
		                        				</tr>
		                        				<tr>
		                        					<th>邮编</th>
		                        					<th>${customer.postcode}</th>
		                        				</tr>
		                        				<tr>
		                        					<th>地址</th>
		                        					<th>${customer.adProvince.concat(customer.adCity).concat(customer.adDetail)}</th>
		                        				</tr>
		                        			</tbody>
		                        		</table>
		                        		<!-- 新增：此处可以编辑客户邮编和地址 -->
		                        	</div>
		                        		 
		                        	
		                        </div>
							</div>
							<!-- 其他收货人 -->
							<div class="card col-md-6" id="otherRcv" style="display:none">
							<div class="card-content"> 
	                        		<form class="col s12" method="post">
				        				<div class = "input-field col s3">
				        					<label for="first_name" class="active" class="">姓名</label>
				        					<input name="rcvName" type="text" class="validate" />
				        				</div>
				        				<div class="input-field col s3">
				        					<label for="telephone" class="">电话号码</label>
				        					<input name="rcvPhone" type="number" class="validate" onblur="checkTelephone()"/>
				        				</div>
				        				<div class = "input-field col s3">
				        					<label for="first_name" class="active" class="">邮编</label>
				        					<input name="rcvPostcode" type="number" class="validate" />
				        				</div>
				        				<div class = "input-field col s3">
				        					<label for="province" class="active" class="">省</label>
				        					<input name="rcvProvince" type="text" class="validate" />
				        				</div>
				        				<div class = "input-field col s3">
				        					<label for="city" class="active" class="">市</label>
				        					<input name="rcvCity" type="text" class="validate" />
				        				</div>
				        				
				        				<div class = "input-field col s3">
				        					<label for="detailAddress" class="active" class="">详细地址</label>
				        					<input name="rcvDetail" type="text" class="validate" />
				        				</div>
				        			</form>
	                        </div>
						</div>
                     <!-- 生成订单 -->
                     	<div class="col-md-5">
                     		<button class="add-btn" style="float: right;" onclick="submitOrder()">生成订单</button>
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
  		
  		<script>
  		function showAddress(){
  			var judgRcv[]=document.getElementsByName("judgeRcv");
  			if(judgeRcv[0].checked==true){
  				document.getElementById("currentCustomer").style.display='block';
  			}else if(judgeRcv[1].checked==true){
  				document.getElementById("otherRcv").style.display='block';
  			}
  		}
  		
  		window.onload = function() {
  			$.ajax({
  						url : "PrimaryClassificationManageServlet?action=doGetAllPrimaryClassification",//请求的URL地址
  						async : true,// 是否异步，默认异步true
  						type : "POST",//请求方式
  						success : function(data) {
  							var content = "";
  							for (var i = 0; i < data.length; i++) {
  								content += '<option value="' + data[i].id + '">'
  										+ data[i].name + '</option>';
  							}
  							document.getElementById("p_id").innerHTML = content;
  						},
  						error : function() {
  							console.log("请求失败");
  						},
  						dataType : "json"//返回格式为json
  					});
  		};
  		
  		function test(){
  			
  			var id = document.getElementById("p_id").value;
//  			alert(id);
  			$.ajax({
  				url : "SecondaryClassificationManageServlet?action=doGetSectionSecondaryClassification",//请求的URL地址
  				async : true,// 是否异步，默认异步true
  				type : "POST",//请求方式
  				data: { "p_id": id },    //参数值
  				success : function(data) {
  					var content = "";
  					for (var i = 0; i < data.length; i++) {
  						content += '<option value="' + data[i].id + '">'
  								+ data[i].name + '</option>';
  					}
  					document.getElementById("s_id").innerHTML = content;
  				},
  				error : function() {
  					console.log("请求失败");
  				},
  				dataType : "json"//返回格式为json
  			});
  		};
  		
  		
  		function selectCustomer() {// 查询有订购需求的客户
  		
  			if (window.XMLHttpRequest) {
  				req = new XMLHttpRequest();
  			} else {
  				req = new ActiveXObject("Microsoft.XMLHTTP");
  			}
  			req.open("post", "customerManageServlet?action=selectCustomerForNewOrder",
  					true);// 处理异步请求
  			req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  			req.onreadystatechange = updatePage;
  			req.send("customerName="+document.getElementById("customerName").value+"&identity="+document.getElementById("identity").value);
 
  		}
  		
  		function updatePage() {
  			if (req.readyState == 4) {
  				if (req.status == 200) {
  					var result = req.responseText;
  					if (result == "null") {
  						// 没有找到客户
						document.getElementById("res").innerHTML = "没有找到客户？点击注册";
  						
  					} else {
  						document.getElementById("customerInfo").style.display = "block";
  					}
  				}
  			}
  		}
  		function customerRegister() {
  			windows.location.href ='CustomerRegister.jsp';
  		}
  		

  		function submitOrder() {
  			var bill = document.getElementsByName("bill");
  			var needBill;
  			if (bill[0].checked == true) {
  				needBill = true;
  			} else if (bill[1].checked == false) {
  				needBill = false;
  			}
  			if (optionAd[0].checked == true) {
  				document.forms[0].action = "orderServlet?action=createNewOrder&way=post&new_id="+ id;
  				document.forms[0].submit();
  			} else if (optionAd[1].checked == true) {
  				var rcvName = document.getElementById("rcvName");
  				var rcvPhone = document.getElementById("rcvPhone");
  				var rcvPostcode = document.getElementById("rcvPostcode");
  				var rcvProvince = document.getElementById("rcvProvince");
  				var rcvCity = document.getElementById("rcvCity");
  				var rcvDetail = document.getElementById("rcvDetail");
  				document.forms[0].action = "orderServlet?action=createNewOrderWithrcvAd&way=post&new_id="
  						+ id;
  				document.forms[0].submit();
  			}
  		}
  		</script>
  		<script src="assets/js/NewOrder.js"></script>
 	</body>
</html>