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
	<link rel="stylesheet" href="../js/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

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

</style>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>权限管理<span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a class="btn btn-primary radius" href="javascript:;" onclick="edit(this,'',1)"><i class="Hui-iconfont">&#xe600;</i> 添加数据</a> </span></div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr>
					<th scope="col" colspan="6">角色管理</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" value="" name=""></th>
					<th width="40">ID</th>
					<th width="200">角色编码</th>
					<th width="200">角色名</th>
					<th>用户列表</th>
					<th width="300">描述</th>
					<th width="70">操作</th>
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
<script type="text/javascript" src="../js/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>


<article class="page-container" style="display: none;" id="addpage">
	<%--<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">--%>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色编码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input id="name" type="text" class="input-text" value="" placeholder=""  name="name">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input id="realname" type="text" class="input-text" value="" placeholder=""  name="realname">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">描述：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input id="password" type="text" class="input-text" value="" placeholder="" id name="password">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>菜单权限：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<ul class="ztree" id="rolelist">


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


</ul>
<script type="text/javascript">
	var selecturl = '/system/role/getRole';
	var delurl = "/system/role/delRole";
//	var disableUrl = "/system/user/disableUser";
//	var addurl = "/system/role/inserRole";
//	var batchdelurl ='/system/basedata/batchDelBasedata';
	var editRoleurl ='/system/role/editRole';
	var selectperurl = '/system/permission/getPermissionTree';
	var selectRolePerurl= '/system/permission/getRolePer';

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
                {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
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
                { data : "code" }, //
                { data : "name" }, //
                { data : "users" }, //
                { data : "remark" }, //
                { data : "id" ,
                    render: function (data, type, full, meta) {//meta包含当前行的索引,当前DataTables控件的setttings对象,当前DataTables控件的setttings对象,row,colsettings
                        return "<a title=\"编辑\" href=\"javascript:;\" onclick=\"edit(this,\'"+data+"\',2)\" class=\"ml-5\" style=\"text-decoration:none\">\n" +
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

	function  member_stop(obj,id) {
        var tr = $(obj).parents("tr");
        var input = tr.find("input");
        layer.confirm('确认要禁用吗？',function(index){
            $.ajax({
                'url' : disableUrl,
                'type' : 'post',
                'dataType' : 'json',
                'data' : {"id" : input.val()},
                'success' : function(data, statusText) {
                    if(data){
                        layer.msg("已禁用！");
                        table.ajax.reload();
                    }else{
                        layer.msg("禁用失败！");
                    }

                },
                'error' : function(xhr, e1, e2) {
                    layer.msg("系统错误！");
                }

            });

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



    var zNodes =[];

    var code;


  function inittree(){
      $("#rolelist").html("");
        $.fn.zTree.init($("#rolelist"), setting, zNodes);
    }
    function getCheck() {
        var zTreeOjb = $.fn.zTree.getZTreeObj("rolelist");  //ztree的Id  zTreeId
		var checked = "";
      //  获取复选框/单选框选中的节点：
		var checkedNodes = zTreeOjb.getCheckedNodes();

       // 获取光标选中的(selected)
       // var selectedNodes = zTreeObj.getSelectedNodes();

        //上面两个函数获取到的都是数组，你可以 console.log(checkedNodes) ，调试看一下。

		//alert("nodes:" + JSON.stringify(checkedNodes));  //查看
		checkedNodes.map(function(item,i){
		    checked+=item.id+",";
		})
		return checked;
    }


    var setting = {
        data:{//表示tree的数据格式
            simpleData:{
                enable:true,//表示使用简单数据模式
                idKey:"id",//设置之后id为在简单数据模式中的父子节点关联的桥梁
                pidKey:"pid",//设置之后pid为在简单数据模式中的父子节点关联的桥梁和id互相对应
                rootId:""//pid为null的表示根节点
            }
        },
        view:{//表示tree的显示状态
            selectMulti:false//表示禁止多选
        },
        check:{//表示tree的节点在点击时的相关设置
            enable:true,//是否显示radio/checkbox
            chkStyle:"checkbox",//值为checkbox或者radio表示
            checkboxType: {"Y": "ps", "N": "ps"}//表示父子节点的联动效果
        }
    }



    var editid='';



    /*修改信息*/
    function edit(obj,id,flag) {
		//初始化
        $('#name').val('');
        $('#realname').val('');
        $('#password').val('');
        //角色获取
        $.post(selectperurl,'',function (data) {
            var html = "";
            zNodes =[];
            $.each(data,function (i,item) {
                zNodes.push({id:item.id,pId:item.pid,name:item.name,open:true});
            })
            inittree();

			if(flag==2){
				//获取角色菜单
				$.post(selectRolePerurl,{id:id},function (data) {
					$.each(data.aaData,function (index,it) {
						zTree = $.fn.zTree.getZTreeObj("rolelist");//treeDemo界面中加载ztree的div
						var node = zTree.getNodeByParam("id",it.permissionId );
						zTree.checkNode(node);//将指定ID的节点选中
					});


				});
            }
        });

        editid=id;
        if(flag==2) {
            var parent_trs = $(obj).parents("tr");
            var parent_tr = parent_trs[0];
            var tds = parent_tr.cells;
            $('#name').val(tds[2].innerText);
            $('#realname').val(tds[3].innerText);
            $('#password').val(tds[5].innerText);
        }
        layer.open({
            type: 1,
            title: '修改',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['700px', '520px'],
            content: $('#addpage'),
            end: function () {

                //table.ajax.reload();

            }

        });
    }

    //编辑页面提交
    function submituser(){
        var perid = "";
        //意思是选择被选中的checkbox
        perid=getCheck();
        console.log(perid);
        if(isnull(perid)||isnull( $('#name').val())||isnull( $('#realname').val())){
            layer.msg("数据不完整");
            return;
        }

        $.ajax({
            'url' : editRoleurl,
            'type' : 'post',
            //   'dataType' : 'json',
            'data' : {code:$('#name').val(),remark:$('#password').val(),id:editid,
                name:$('#realname').val(),perid:perid},
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




</script>

</body>
</html>