<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
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
	<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>

	<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="../js/laypage/1.2/laypage.js"></script>


	<!--[if IE 6]>
	<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>超声波测距应用系统</title>
	<meta name="keywords" content="">
	<meta name="description" content="">

</head>

<body>
input type="hidden" id="TenantId" name="TenantId" value="" />
<%--<div class="header"><span style="    color: ghostwhite;font-size: 27px;">用户注册</span></div>--%>
<div class="loginWraper">
	<div id="loginform" class="loginBox">
		<%--<form class="form form-horizontal" action="${ctx }/user/registeruser" method="post">--%>
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
				<div class="formControls col-xs-8">
					<input id="name" name="name" type="text" placeholder="用户名" class="input-text size-L">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
				<div class="formControls col-xs-8">
					<input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
				<div class="formControls col-xs-8">
					<input id="passwordAgain" name="passwordAgain" type="password" placeholder="确认密码" class="input-text size-L">
				</div>
			</div>

			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<input id="register" name="" type="button" onclick="registeruser()" class="btn btn-success radius size-L" value="&nbsp;立即注册&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="login" name="" type="" class="btn btn-default radius size-L" >&nbsp;返回登录&nbsp;</a>
				</div>
			</div>
		<%--</form>--%>
	</div>
</div>
<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
    //判断是否为空
    function isnull(obj) {
        if(obj==null || obj == ''){
            return true;
        }else{
            return false;
        }
    }
    $("#name").blur(function () {
		if(isnull($("#name").val())){
		    layer.msg("用户名不能为空");
		}
    });
    $("#password").blur(function () {
        if(isnull($("#password").val())){
            layer.msg("密码不能为空");
        }
    });
    $("#passwordAgain").blur(function () {
        if(isnull($("#passwordAgain").val())){
            layer.msg("请再次输入密码");
            $("#passwordAgain").val("");
        }else if($("#password").val()!=$("#passwordAgain").val()){
            layer.msg("两次输入密码不同");
            $("#passwordAgain").val("");
		}
    });
    var register = '/system/user/registeruser';
    function registeruser() {
		if(isnull($("#name").val())||isnull($("#password").val())||isnull($("#passwordAgain").val())){
		    layer.msg("数据不完整！");
		    return;
		}
		var json = {'name':$('#name').val(),
            'password':$('#password').val()
        };
        $.ajax({
            'url' : register,
            'type' : 'post',
            //   'dataType' : 'json',
            'data' : json,
            'success' : function(data, statusText) {
				layer.closeAll();
				layer.msg(data.msg);


            },
            'error' : function(xhr, e1, e2) {
                layer.msg("系统错误！");
            }

        });
    }



</script>



</body>
</html>
