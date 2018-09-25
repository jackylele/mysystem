<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>`
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="Bookmark" href="/favicon.ico" >
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="../js/html5shiv.js"></script>
	<script type="text/javascript" src="../js/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="../js/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title></title>
	<meta name="keywords" content="">
	<meta name="description" content="">
</head>
<body>

	<div>
		<strong> welcome,${sessionScope.user.name}! </strong>
	</div>
	<%--this is success page!--%>

	<%--<a href="/system/user/anotherpage">点我跳到另一个页面</a>--%>

	<%--<form action="/system/user/outLogin">--%>
		<%--<table>--%>
			<%--<tr>--%>
				<%--<td><input type="submit" value="退出登录"></td>--%>
			<%--</tr>--%>
		<%--</table>--%>
	<%--</form>--%>
	<header class="navbar-wrapper">
		<div class="navbar navbar-fixed-top">
			<div class="container-fluid cl"> <%--<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml"></a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a>--%>
				<span class="logo navbar-slogan f-l mr-10 hidden-xs" style="font-size: 18px;">超声波测距应用系统</span>
				<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
				<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
					<ul class="cl">
						<li>${session.user.trueName}</li>
						<li class="dropDown dropDown_hover">
							<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
								<li><a href="/system/user/outLogin">切换账户</a></li>
								<li><a href="/system/user/outLogin">退出</a></li>
							</ul>
						</li>
						<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
							<ul class="dropDown-menu menu radius box-shadow">
								<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
								<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
								<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
								<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
								<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
								<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<aside class="Hui-aside">
		<div class="menu_dropdown bk_2">
			<shiro:hasPermission name="用户管理">
			<dl id="menu-member">
				<dt><i class="Hui-iconfont">&#xe60d;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="用户列表">
						<li><a data-href="/system/user/user" data-title="用户列表" href="javascript:;">用户列表</a></li>
						</shiro:hasPermission>

					</ul>
				</dd>
			</dl>
			</shiro:hasPermission>
			<shiro:hasPermission name="权限管理">
			<dl id="menu-admin">
				<dt><i class="Hui-iconfont">&#xe620;</i> 权限管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="角色管理">
						<li><a data-href="/system/role/role" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
						</shiro:hasPermission>
					</ul>
				</dd>
			</dl>
			</shiro:hasPermission>
			<shiro:hasPermission name="系统管理">
			<dl id="menu-system">
				<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="参数配置">
						<li><a data-href="/system/config/config" data-title="参数配置" href="javascript:void(0)">参数设置</a></li>
						</shiro:hasPermission>

					</ul>
				</dd>
			</dl>
			</shiro:hasPermission>
			<shiro:hasPermission name="基础数据管理">
			<dl id="menu-base">
				<dt><i class="Hui-iconfont">&#xe616;</i> 基础数据管理 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="基础数据">
						<li><a data-href="/system/basedata/basedata" data-title="基础数据" href="javascript:void(0)">基础数据</a></li>
						</shiro:hasPermission>
					</ul>
				</dd>
			</dl>
			</shiro:hasPermission>
			<shiro:hasPermission name="实时监控">
			<dl id="menu-see">
				<dt><i class="Hui-iconfont">&#xe622;</i> 实时监控 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<shiro:hasPermission name="实时监控可视化">
						<li><a data-href="/system/html/storechart.html" data-title="实时监控可视化" href="javascript:void(0)">基础数据</a></li>
						</shiro:hasPermission>

					</ul>
				</dd>
			</dl>
			</shiro:hasPermission>
		</div>
	</aside>
	<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active">
						<span title="我的桌面" data-href="welcome.html">我的桌面</span>
						<em></em></li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display:none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0" src="../html/welcome.html"></iframe>
			</div>
		</div>
	</section>

	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前 </li>
			<li id="closeall">关闭全部 </li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="../js/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript">
        $(function(){
            /*$("#min_title_list li").contextMenu('Huiadminmenu', {
                bindings: {
                    'closethis': function(t) {
                        console.log(t);
                        if(t.find("i")){
                            t.find("i").trigger("click");
                        }
                    },
                    'closeall': function(t) {
                        alert('Trigger was '+t.id+'\nAction was Email');
                    },
                }
            });*/
        });
        /*个人信息*/
        function myselfinfo(){
            layer.open({
                type: 1,
                area: ['300px','200px'],
                fix: false, //不固定
                maxmin: true,
                shade:0.4,
                title: '查看信息',
                content: '<div>管理员信息</div>'
            });
        }

        /*资讯-添加*/
        function article_add(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*图片-添加*/
        function picture_add(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*产品-添加*/
        function product_add(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*用户-添加*/
        function member_add(title,url,w,h){
            layer_show(title,url,w,h);
        }


	</script>







</body>
</html>