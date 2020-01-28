/**
 * 
 */
window.onload = function() {
	
	$.ajax({
				url : "addressServlet?action=getProvince",//请求的URL地址
				async : true,// 是否异步，默认异步true
				dataType : "json",//返回格式为json
				type : "POST",//请求方式
				success : function(data) {
					var content = "";
					for (var i = 0; i < data.length; i++) {
						content += '<option value="' + data[i].provinceId + '">'
								+'--'+ data[i].provinceName +'--'+ '</option>';
					}
					document.getElementById("adProvince").innerHTML = content;
				},
				error : function() {
					
					console.log("请求失败");
				},
				
			});
}

	function test(){
	
	var id = document.getElementById("adProvince").value;
	$.ajax({
		
		url : "addressServlet?action=getCity",//请求的URL地址
		async : true,// 是否异步，默认异步true
		type : "POST",//请求方式
		data: { "adProvince": id },    //参数值
		success : function(data) {
			var content = "";
			for (var i = 0; i < data.length; i++) {
				content += '<option value="' + data[i].cityId + '">'
						+'--'+ data[i].cityName +'--'+ '</option>';
			}
			document.getElementById("adCity").innerHTML = content;
		},
		error : function() {
			console.log("请求失败");
		},
		dataType : "json"//返回格式为json
	});
}

