<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="../js/html5shiv.js"></script>
	<script type="text/javascript" src="../js/respond.min.js"></script>
	<![endif]-->
	<link href="../static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="../static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
	<link href="../static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../js/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>超声波测距应用系统</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"><span style="    color: ghostwhite;font-size: 27px;">基于超声波的测距应用系统</span></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" action="checkLogin" method="post">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="name" name="name" type="text" placeholder="账户" class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
					</div>
				</div>
				<%--<div class="row cl">--%>
					<%--<div class="formControls col-xs-8 col-xs-offset-3">--%>
						<%--<input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">--%>
						<%--<img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>--%>
				<%--</div>--%>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online">
							<input type="checkbox" name="online" id="online" value="">
							使我保持登录状态</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="register" name="" type="" class="btn btn-default radius size-L" >&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;
						</a><%--type="reset"--%>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright 南京邮电大学 by guanxing</div>
	<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>


</body>
</html>