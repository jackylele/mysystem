<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
	<!--[if IE 6]>
	<script type="text/javascript" src="../js/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>超声波测距应用系统</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
</head>
<body>
<style type="text/css">
	.table-sort tr td{
		text-align:center;
	}
	#addpage label{
		text-align: right;
	}
	#addpage .row{
		margin:15px;
	}



	.mui-switch {
		width: 52px;
		height: 31px;
		position: relative;
		border: 1px solid #dfdfdf;
		background-color: #fdfdfd;
		box-shadow: #dfdfdf 0 0 0 0 inset;
		border-radius: 20px;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		background-clip: content-box;
		display: inline-block;
		-webkit-appearance: none;
		user-select: none;
		outline: none;
	}
	.mui-switch:before {
		content: '';
		width: 29px;
		height: 29px;
		position: absolute;
		top: 0px;
		left: 0;
		border-radius: 20px;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		background-color: #fff;
		box-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
	}
	.mui-switch:checked {
		border-color: #64bd63;
		box-shadow: #64bd63 0 0 0 16px inset;
		background-color: #4CD964;
	}
	.mui-switch:checked:before {
		left: 21px;
	}
	.mui-switch .mui-switch-animbg {
		transition: background-color ease 0.4s;
	}
	.mui-switch .mui-switch-animbg:before {
		transition: left 0.3s;
	}
	.mui-switch .mui-switch-animbg:checked {
		box-shadow: #dfdfdf 0 0 0 0 inset;
		background-color: #64bd63;
		transition: border-color 0.4s, background-color ease 0.4s;
	}
	.mui-switch .mui-switch-animbg:checked:before {
		transition: left 0.3s;
	}
	.mui-switch .mui-switch-anim {
		transition: border cubic-bezier(0, 0, 0, 1) 0.4s, box-shadow cubic-bezier(0, 0, 0, 1) 0.4s;
	}
	.mui-switch .mui-switch-anim:before {
		transition: left 0.3s;
	}
	.mui-switch .mui-switch-anim:checked {
		box-shadow: #64bd63 0 0 0 16px inset;
		background-color: #64bd63;
		transition: border ease 0.4s, box-shadow ease 0.4s, background-color ease 1.2s;
	}
	.mui-switch .mui-switch-anim:checked:before {
		transition: left 0.3s;
	}


</style>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>用户管理<span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr class="text-c">
				<th width="35"><input type="checkbox" name="" value=""></th>
				<th width="50">序号</th>
				<th width="150">用户名</th>
				<th width="150">真实名称</th>
				<th width="200">创建时间</th>
				<th width="200">最后修改时间</th>
				<th>最后登录时间</th>
				<th width="200">状态</th>
				<th width="60">操作</th>

			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../js/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../js/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../js/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="../js/core.js"></script>
<article class="page-container" style="display: none;" id="addpage">
	<%--<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">--%>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="name" type="text" class="input-text" value="" placeholder=""  name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="realname" type="text" class="input-text" value="" placeholder=""  name="realname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input id="password" type="text" class="input-text" value="" placeholder="" id name="password">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<ul class="permission-list" id="rolelist">


				</ul>

			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button onclick="submituser()" type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	<%--</form>--%>
</article>
<script type="text/javascript">
	var selecturl = '/system/user/getUser';
	var delurl = "/system/user/delUser";
	var disableUrl = "/system/user/disableUser";
    var selectroleurl = '/system/role/getRole';
    var selectuserroleurl = '/system/role/getUserRole';
    var editUserUrl="/system/user/editUser";


    //	var addurl = "/system/basedata/inserBasedata";
//	var batchdelurl ='/system/basedata/batchDelBasedata';

    function timestampToTime(timestamp) {
        var oDate = new Date(timestamp );//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var time=oDate.getFullYear()+"-"+("0"+(oDate.getMonth()+1)).slice(-2)+"-"+("0"+oDate.getDate()).slice(-2)+" "+
            ("0"+oDate.getHours()).slice(-2)+":"+("0"+oDate.getMinutes()).slice(-2)+":"+("0"+oDate.getSeconds()).slice(-2);
        return time;
    }
    var table;

    function initTable(){
        table = $('.table-sort').DataTable({
//            "aaSorting": [[ 1, "asc" ]],//默认第几个排序
            //ajax":selecturl,
            "bProcessing" : false, //是否显示加载
            "sAjaxSource" : selecturl, //请求资源路径
			"fnServerData": function (sSource, aoData, fnCallback) {
                var json = {
                    "starttime":$("#datemin").val(),
                    "endtime": $("#datemax").val(),
					"realdistace":$("#realdistace").val()
                };
                $.ajax({
					//"dataType": 'json',
					"type": "POST",
					"url": selecturl,
					"contentType": "application/json; charset=utf-8",
					"data": JSON.stringify(json),
					"success": function (data) {
						fnCallback(data);
					}
				});
			},

        "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
            ],

            "fnDrawCallback"    : function(){
                this.api().column(1).nodes().each(function(cell, i) {
                    cell.innerHTML =  i + 1;
                });
            },
            "columns" : [
                {
                    data: "id",
                    render: function (data, type, full, meta) {//meta包含当前行的索引,当前DataTables控件的setttings对象,当前DataTables控件的setttings对象,row,colsettings
                        return '<input type="checkbox" class="productCheckBox" name="productCheckBox" value="' + data + '" />';
                    }
                },
                { data : "id" },
                { data : "name" }, //
                { data : "trueName" }, //
                { data : "createTime",render:function(data, type, full, meta){
                    return timestampToTime(data);
                }},
                { data : "modifyTime", render:function(data, type, full, meta){
                    return timestampToTime(data);
                }},
                { data : "lastLoginTime",
                    render:function(data, type, full, meta){
                        return timestampToTime(data);
                    }}, //价格
                { data : "status",
				render:function (data, type, full, meta){
                    var tem = "";
                    if(data==1){
                        //tem='<span class="label label-success radius">已启用</span>';
						tem='<input type="checkbox" checked="checked" class="mui-switch mui-switch-animbg" onclick="member_stop(this,1)" />';
					}else{
                       // tem='<span class="label label-fail radius">已禁用</span>';
						tem='<input type="checkbox" class="mui-switch mui-switch-animbg" onclick="member_stop(this,2)"/>';
					}
                    return tem;
				}},
                { data : "id" ,
                    render: function (data, type, full, meta) {//meta包含当前行的索引,当前DataTables控件的setttings对象,当前DataTables控件的setttings对象,row,colsettings
                        return "<a title=\"编辑\" href=\"javascript:;\" onclick=\"edituser(this,\'"+data+"\')\" class=\"ml-5\" style=\"text-decoration:none\">\n" +
                        "\t\t\t\t\t<i class=\"Hui-iconfont\">&#xe6df;</i></a>"+
							"&nbsp;<a title=\"删除\" href=\"javascript:;\" onclick=\"remove(this,\'"+data+"\')\" class=\"ml-5\" style=\"text-decoration:none\">\n" +
                            "\t\t\t\t\t<i class=\"Hui-iconfont\">&#xe6e2;</i></a>";
                    }} //库存

            ]
        });
    }
    $(document).ready(initTable());
	//搜索按钮
    $("#search").click(function () {
        table.ajax.reload();
    });



    //表单点击

    $('.table-sort tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) { //如果有这个样式
            $(this).removeClass('selected'); //删除selected
        }  else {//如果没有这个样式
            $('tr.selected').removeClass('selected'); //删除样式
            $(this).addClass('selected'); //增加样式
        }
    });



    /*删除*/
    function remove(obj,id){
        var tr = $(obj).parents("tr");
        var input = tr.find("input");
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                'url' : delurl,
                'type' : 'post',
                'dataType' : 'json',
                'data' : {"id" : input.val()},
                'success' : function(data, statusText) {
                    if(data){
                        layer.msg("删除成功！");
                        table.ajax.reload();
                    }else{
                        layer.msg("删除失败！");
                    }

                },
                'error' : function(xhr, e1, e2) {
                    layer.msg("系统错误！");
                }

            });

        });

    }

    /*批量删除*/
    function datadel(){
        layer.confirm('确认删除所选数据？',function(index){
            $.ajax({
                'url' : batchdelurl,
                'type' : 'post',
                'dataType' : 'json',
                'data' : {"productCheckBox":$('.productCheckBox:checked').serialize()},
                'success' : function(data, statusText) {
                    if(data){
                        layer.msg("删除成功！");
                        table.ajax.reload();
                    }else{
                        layer.msg("删除失败！");
                    }
                },
                'error' : function(xhr, e1, e2) {
                    layer.msg("系统错误！");
                }
            });
        });
    }


    //停用

	function  member_stop(obj,flag) {
        var tr = $(obj).parents("tr");
        var input = tr.find("input");
        var str = "确认要禁用吗？";
        var str1 = "已禁用！";
        var str2 ="禁用失败！";
        if(flag==2){
            str="确认要启用吗？";
            str1 = "已启用！";
            str2 ="启用失败！";
		}
        layer.confirm(str,function(index){
            $.ajax({
                'url' : disableUrl,
                'type' : 'post',
                'dataType' : 'json',
                'data' : {"id" : input.val(),"flag":flag+''},
                'success' : function(data, statusText) {
                    if(data){
                        layer.msg(str1);
                        table.ajax.reload();
                    }else{
                        layer.msg(str2);
                    }

                },
                'error' : function(xhr, e1, e2) {
                    layer.msg("系统错误！");
                }

            });

        });
    }
    var editid='';

    /*修改信息*/
    function edituser(obj,id) {

        //角色获取
        $.post(selectroleurl,'',function (data) {
            var html = "";
            $.each(data.aaData,function (i,item) {
                html+='<li>\n' +
                    '\t\t\t\t\t\t<label>\n' +
                    '\t\t\t\t\t\t\t<input type="checkbox" value=\"'+item.id+'\" name="user-Character-0" id="'+item.id+'" >\n' + item.name+
                    '</label>\n' +
                    '\t\t\t\t\t</li>';
            })
            $("#rolelist").html(html);
            //获取用户角色
            $.post(selectuserroleurl,{id:id},function (data) {
                $.each($("#rolelist li input"),function(i,item){
                    $.each(data.aaData,function (index,it) {
                        if(it.roleId==item.value){
                            $(item).attr("checked","checked");
						}
                    });
				})

            });
        });

        editid=id;
        var parent_trs = $(obj).parents("tr");
        var parent_tr = parent_trs[0];
        var tds = parent_tr.cells;
            $('#name').val(tds[2].innerText);
            $('#realname').val(tds[3].innerText);
//            $('#password').val(tds[5].innerText);
        layer.open({
            type: 1,
            title: '修改',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['600px', '420px'],
            content: $('#addpage'),
            end: function () {

                //table.ajax.reload();

            }

        });
    }

    //编辑页面提交
	function submituser(){
        var roleid = "";
        //意思是选择被选中的checkbox
        $.each($('input:checkbox:checked'),function(i,item){
           roleid += item.value+',';
        });
        console.log(roleid);
        if(isnull(roleid)||isnull( $('#name').val())||isnull( $('#realname').val())||isnull( $('#password').val())){
            layer.msg("数据不完整");
            return;
        }

        $.ajax({
            'url' : editUserUrl,
            'type' : 'post',
            //   'dataType' : 'json',
            'data' : {name:$('#name').val(),password:$('#password').val(),id:editid,
            realname:$('#realname').val(),roleid:roleid},
            'success' : function(data, statusText) {
                if(data){
                    layer.closeAll();
                    layer.msg("修改成功！");
                    table.ajax.reload();
                }else{
                    layer.msg("修改失败！");
                }

            },
            'error' : function(xhr, e1, e2) {
                layer.msg("系统错误！");
            }

        });

	}

    /*添加数据*/
    function add(){
        layer.open({
            type: 1,
            title: '添加数据',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['600px' , '420px'],
            content:$('#addpage')
			,
            end: function () {
                table.ajax.reload();
            }
        });

    }
    //判断是否为空
    function isnull(obj) {
		if(obj==null || obj == ''){
		    return true;
		}else{
		    return false;
		}
    }


//    $("#datasave").on('click',function(){adddata();});


    function adddata() {
        var elevation = $('#elevation').val();
        var distiance = $('#distiance').val();
        var sampletime = $('#sampletime').val();
        var marks = $('#marks').val();
        console.log(json);
        if(isnull(elevation)||isnull(sampletime)||isnull(distiance)){
            layer.msg("数据不完整");
            return;
		}

        var json = {'elevation':$('#elevation').val(),
			'distiance':$('#distiance').val(),
            'sampletime':$('#sampletime').val(),
			'marks':$('#marks').val()
        };


        $.ajax({
            'url' : addurl,
            'type' : 'post',
         //   'dataType' : 'json',
            'data' : json,
            'success' : function(data, statusText) {
                if(data){
                    layer.closeAll();
                    layer.msg("添加成功！");
                    table.ajax.reload();
                }else{
                    layer.msg("添加失败！");
                }

            },
            'error' : function(xhr, e1, e2) {
                layer.msg("系统错误！");
            }

        });



    }



</script>

</body>
</html>