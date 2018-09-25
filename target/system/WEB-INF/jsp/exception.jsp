<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<!-- ------------------------------------------------------------------Head-------------------------------------------------------------------------------------- -->

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title></title>
<link rel="stylesheet" href="../resources/core/assets/css/bootstrap.css" />
<link rel="stylesheet" href="../resources/core/assets/css/font-awesome.css" />
<link rel="stylesheet" href="../resources/core/assets/css/ace-fonts.css" />
<link rel="stylesheet" href="../resources/core/assets/css/ace.css"	class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="../resources/core/js/select2.css" />

<script src="../resources/core/assets/js/ace-extra.js"></script>
<spring:url value="../resources/core/assets/js/jquery.js" var="jqueryJs" />

<script>
var _csrfName='${_csrf.parameterName}';
var _csrfValue='${_csrf.token}';
var dictURL = "${URL.dictURL}";
var baseURL = "${URL.baseURL}";
var sessionId = "${sessionId}";
var isSearch = "${isSearch}";
</script>
<script src="${jqueryJs}"></script>
<spring:url value="../resources/core/assets/js/bootstrap.js"	var="bootstrapJs" />
<script src="${bootstrapJs}"></script>
<spring:url value="../resources/core/js/checkBoxUtil.js"	var="checkBoxUtilJs" />

<script src="${checkBoxUtilJs}"></script>

<style type="text/css">
body {margin: 0px; padding:0px; font-family:"微软雅黑", Arial, "Trebuchet MS", Verdana, Georgia,Baskerville,Palatino,Times; font-size:16px;}
div{margin-left:auto; margin-right:auto;}
a {text-decoration: none; color: #1064A0;}
a:hover {color: #0078D2;}
img { border:none; }
h1,h2,h3,h4 {
/*	display:block;*/
	margin:0;
	font-weight:normal; 
	font-family: "微软雅黑", Arial, "Trebuchet MS", Helvetica, Verdana ; 
}
h1{font-size:44px; color:#0188DE; padding:20px 0px 10px 0px;}
h2{color:#0188DE; font-size:16px; padding:10px 0px 40px 0px;}

#page{width:910px; padding:20px 20px 40px 20px; margin-top:80px;}
.button{width:180px; height:28px; margin-left:0px; margin-top:10px; background:#009CFF; border-bottom:4px solid #0188DE; text-align:center;}
.button a{width:180px; height:28px; display:block; font-size:14px; color:#fff; }
.button a:hover{ background:#5BBFFF;}
</style>

</head>

<body>

	<script src="../resources/core/js/popup/classie.js"></script>
	<script src="../resources/core/js/popup/modalEffects.js"></script>
	<script type="text/javascript" src="../resources/core/js/style.js"></script>
	<script type="text/javascript" src="../resources/core/js/jquery.bigautocomplete.js"></script>
	<script type="text/javascript">
		var baseUrl="<%=basePath%>";
		// 根据屏幕分辨率不同给tbody加上合适的高度
		total = document.documentElement.clientHeight;
		colHeight = total - 110;
		document.getElementById("dictionary_body").style.height = colHeight + "px";
		// 拖拽、排序调用
		$(document).ready(function() {
			table("sample-table-2");
			
			
			tTDs("sample-table-2");
			function tTDs(id){
				var tTD;
			    var table = document.getElementById(id);
			    for (j = 0; j < table.rows[0].cells.length; j++) {
			        var d = document.getElementsByTagName("td");
			        var c = table.rows[0].cells[j];
			        var domi = document.createElement("i");
			        c.appendChild(domi);
			        var lc = c.lastChild;
			        lc.onmousedown = function (e) {
			        	var t = this,
			        		e = e||window.event;
			            tTD = t.parentNode;
			            tTD.mouseDown = true;
			            tTD.oldX = e.x;
			            tTD.oldWidth = tTD.offsetWidth;
			            document.onmousemove = function (e) {
			            	var me = e||window.event;
		                    if (tTD.oldWidth + (me.x - tTD.oldX) > 0)
		                        tTD.width = tTD.oldWidth + (me.x - tTD.oldX);
		                    tTD.style.width = tTD.width;
		                    table = tTD;
		                    while (table.tagName != 'TABLE') table = table.parentElement;
		                    for (j = 0; j < table.rows.length; j++) {
		                        table.rows[j].cells[tTD.cellIndex].width = tTD.width;
		                    }

			            };
			            document.onmouseup = function () {
			                document.onmousemove = null;
			            };
			        };
			    }
			    $("#"+id).find("thead td").css("position","relative");
			    $("#"+id).find("thead td i").css({
			        position: "absolute",
			        right: "0",
			        top: "0",
			        display:"block",
			        width: "10px",
			        height: "100%",
			        background: "#000",
			        cursor: "e-resize",
			        opacity:"0"
			    }).html(" ");
			}
		});
		
		function insertClose(){
		 clearData("insert");
		 $("#closeInsert").click();
		 
	  	}
		

	</script>
	
<div id="page" style="border-style:dashed;border-color:#e4e4e4;line-height:30px;background:url(sorry.png) no-repeat right;">
	<h1>抱歉，找不到此页面~</h1>
	<h2>Sorry, the site now can not be accessed. </h2>
	<font color="#666666">你请求访问的页面出错或未找到,错误提示:${msg }!</font><br /><br />
</div>

	
</body>
</html>
