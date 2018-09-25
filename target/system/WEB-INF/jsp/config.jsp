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
	<link rel="stylesheet" href="../js/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 参数配置 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<table class="table">
	<tr>
		<td width="200" class="va-t"><ul id="treeDemo" class="ztree"></ul></td>
		<td class="va-t">
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
				<tr class="text-c">
					<th width="35"><input type="checkbox" name="" value=""></th>
					<th width="50">序号</th>
					<th width="100">参数</th>
					<th width="150">参数名</th>
					<th width="90">参数值</th>
					<th width="90">备注</th>
					<th width="60">操作</th>

				</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</td>
	</tr>
</table>
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
<%--新增--%>
<div class="page-container" id="addpage" style="display: none;width: 80%">
	<%--<form action="/system/basedata/inserBasedata" method="post">--%>
 		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>参数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="id" name="id">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>参数名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>参数值：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="value" name="value">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="marks" name="marks">
			</div>
		</div>
		<div class="row cl">

		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button onclick="adddata()" class="btn btn-success radius" id="datasave" name="adatasave"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>

</div>

<script type="text/javascript">
	var selecturl = '/system/config/getConfig';
	var delurl = "/system/basedata/delBasedata";
	var addurl = "/system/config/updataConfig";//添加更新
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
                var json = {id:selectTreeId};
                $.ajax({
					//"dataType": 'json',
					"type": "POST",
					"url": selecturl,
					"contentType": "application/json; charset=utf-8",
					"data": JSON.stringify(json),
					"success": function (data) {
                        fnCallback(data);
                        zNodes=[
                            { id:1, pId:0, name:"系统参数配置", open:true}
                        ];
                        $.each(data.aaData,function (i,item) {
                            zNodes.push({id:item.id,pId:1,name:item.name});
                        })
						initTree();

					}
				});
			},

        "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,6]}// 制定列不参与排序
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
                        return '<input type="checkbox" name="productCheckBox" value="' + data + '" />';
                    }
                },
                { data : "id" },
                { data : "id" },
                { data : "name" }, //
                { data : "value" },
                { data : "marks" }, //价格
                { data : "id" ,
                    render: function (data, type, full, meta) {//meta包含当前行的索引,当前DataTables控件的setttings对象,当前DataTables控件的setttings对象,row,colsettings
                        return "<a title=\"编辑\" href=\"javascript:;\" onclick=\"edit(this,\'"+data+"\')\" class=\"ml-5\" style=\"text-decoration:none\">\n" +
                            "\t\t\t\t\t<i class=\"Hui-iconfont\">&#xe6df;</i></a>";
                    }} //库存

            ]
        });
    }
    $(document).ready(initTable());
	//搜索按钮
    $("#search").click(function () {
        table.ajax.reload();
    });

    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },onclick:{
            beforeClick:function (treeId,treeNode) {
                selectTreeId = treeId;
                table.ajax.reload();
            }
		}
    };
	var selectTreeId='';
    var zNodes;

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }

  function initTree(){
        var t = $("#treeDemo");
        t = $.fn.zTree.init(t, setting, zNodes);
        demoIframe = $("#testIframe");
        //demoIframe.on("load", loadReady);
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //zTree.selectNode(zTree.getNodeByParam("id",'11'));
    }



    //表单点击

    $('.table-sort tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) { //如果有这个样式
            $(this).removeClass('selected'); //删除selected
        }  else {//如果没有这个样式
            $('tr.selected').removeClass('selected'); //删除样式
            $(this).addClass('selected'); //增加样式
        }
    });



    //判断是否为空
    function isnull(obj) {
		if(obj==null || obj == ''){
		    return true;
		}else{
		    return false;
		}
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


    function adddata() {
        var id = $('#id').val();
        var name = $('#name').val();
        var value = $('#value').val();
        var marks = $('#marks').val();
        console.log(json);
        if(isnull(id)||isnull(name)||isnull(value)){
            layer.msg("数据不完整");
            return;
		}

        var json = {'id':id,
			'name':name,
            'value':value,
			'marks':marks
        };


        $.ajax({
            'url' : addurl,
            'type' : 'post',
         //   'dataType' : 'json',
            "contentType": "application/json; charset=utf-8",
            'data' : JSON.stringify(json),
            'success' : function(data, statusText) {
                if(data){
                    layer.closeAll();
                    layer.msg("更新成功！");
                    table.ajax.reload();
                }else{
                    layer.msg("更新失败！");
                }

            },
            'error' : function(xhr, e1, e2) {
                layer.msg("系统错误！");
            }

        });

    }


    /*修改信息*/

    function edit(obj,id){
        var parent_trs = $(obj).parents("tr");
        var parent_tr = parent_trs[0];
        var tds = parent_tr.cells;
        $("#id").val(id);
        $('#name').val(tds[3].innerText);
        $('#value').val(tds[4].innerText);
        $('#marks').val(tds[5].innerText);
        $("#id").attr('readonly','readonly');
        layer.open({
            type: 1,
            title: '修改',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['600px' , '420px'],
            content: $('#addpage'),
            end: function () {

                table.ajax.reload();

            }

        });

    }



</script>

</body>
</html>