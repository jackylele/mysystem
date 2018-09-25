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

</style>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>基础数据管理<span class="c-gray en">&gt;</span> 基础数据 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}',readOnly:true })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' ,readOnly:true})"  id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="实际距离" id="realdistace" name="">
		<button type="submit" class="btn btn-success" id="search" name=""><i class="Hui-iconfont">&#xe665;</i> 搜记录</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary radius" href="javascript:;" onclick="add()"><i class="Hui-iconfont">&#xe600;</i> 添加数据</a> </span></div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
			<tr class="text-c">
				<th width="35"><input type="checkbox" name="" value=""></th>
				<th width="50">序号</th>
				<th width="100">仰角</th>
				<th width="150">采样距离</th>
				<th width="90">高度</th>
				<th width="150">实际距离</th>
				<th>采样时间</th>
				<th width="150">备注</th>
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
<%--新增--%>
<div class="page-container" id="addpage" style="display: none;width: 80%">
	<%--<form action="/system/basedata/inserBasedata" method="post">--%>
 		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>仰角：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="elevation" name="elevation">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>采样距离：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="distiance" name="distiance">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>采样时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,maxDate:'%y-%M-%d' })" id="sampletime" name="sampletime" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="marks" id="marks" cols="marks" rows="" class="textarea valid" placeholder="说点什么..." ></textarea>
			</div>
		</div>
		<div class="row cl">

		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button onclick="adddata()" class="btn btn-success radius" id="datasave" name="adatasave"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	<%--</form>--%>
</div>
<!-- 分页标签 -->
<%--<div id="page1" class="pager"></div>--%>
<script type="text/javascript">
	var selecturl = '/system/basedata/getBasedata';
	var delurl = "/system/basedata/delBasedata";
	var addurl = "/system/basedata/inserBasedata";
	var batchdelurl ='/system/basedata/batchDelBasedata';

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
                { data : "elevation" }, //
                { data : "distance" }, //
                { data : "high" }, //
                { data : "realdistace" }, //
                { data : "sampletime",
                    render:function(data, type, full, meta){
                        return timestampToTime(data);
                    }}, //价格
                { data : "marks" }, //价格
                { data : "id" ,
                    render: function (data, type, full, meta) {//meta包含当前行的索引,当前DataTables控件的setttings对象,当前DataTables控件的setttings对象,row,colsettings
                        return "<a title=\"删除\" href=\"javascript:;\" onclick=\"remove(this,\'"+data+"\')\" class=\"ml-5\" style=\"text-decoration:none\">\n" +
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