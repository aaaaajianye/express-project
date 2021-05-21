<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>车辆添加</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div><#--<#list list as list>-->
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">
                    <label class="layui-form-label">所属网点：</label>
                    <div class="layui-input-block" style="width: 200px;">
                        <select name="braname" lay-verify="required" id="braname" lay-search="">
                        <option value="" >请选择网点</option>
                        </select>

                    </div><br/>
                    <label class="layui-form-label">司机姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehdirver" id="vehdirver" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">司机电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehphone" id="vehphone" required  lay-verify="required|phone"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <#--<label class="layui-form-label">车辆编号：</label>-->
                    <#--<div class="layui-input-block">-->
                        <#--<input type="text" name="vehids" id="vehids" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">-->
                    <#--</div><br/>-->

                    <label class="layui-form-label">车牌号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehnum" id="vehnum" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div><br/>
                    <label class="layui-form-label">车辆型号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehmodal" id="vehmodal" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div><br/>
                    <label class="layui-form-label">运输类型：</label>
                    <div class="layui-input-block"  style="width: 200px;">
                        <select name="type" lay-verify="" id="type">
                            <option value="" >请选择运输类型</option>
                        </select>

                    </div><br/>
                    <label class="layui-form-label">油耗：</label>
                    <div class="layui-input-block">
                             <input type="text" name="vehilo" id="vehilo" placeholder="升/公里" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">创建时间：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehtime" id="vehtime" required disabled   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>

                    <label class="layui-form-label">车辆状态：</label>
                    <div class="layui-input-block" id="zhuangtai">
                        <input type="radio" name="t" value="0" title="空闲" checked>
                        <input type="radio" name="t" value="1" title="运输中" disabled>
                    </div><br/>
                    <label class="layui-form-label">核定载重：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehtunnage" id="vehtunnage" placeholder="单位：吨" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehnode" id="vehnode" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>
                </div>

            <div class="layui-form-item">
                    <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
               </div>
        </form>
<#--</#list></div>-->
</body>
<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer', 'table','form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,form = layui.form
            ,select=layui.select;

        laydate.render({
            elem: '#vehtime',
            value:new Date(),

        });
        $.ajax({
            url:"/carEdit/selBraname",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#braname').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }})
        $.ajax({
            url:"/carEdit/selType",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#type').append(new Option( item.typename,item.transid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }})

    form.on('submit(formDemo)', function(data){

            $.ajax({
                url:'/carEdit/toAdd',
                method:'post',
                data:{
                    braid:$("#braname").val(),
                    vehdirver:$("#vehdirver").val(),
                    vehphone:$("#vehphone").val(),
                    //vehids:$("#vehids").val(),
                    vehnum:$("#vehnum").val(),
                    vehmodal:$("#vehmodal").val(),
                    vehilo:$("#vehilo").val(),
                    vehtime:$("#vehtime").val(),
                    vehnode:$("#vehnode").val(),
                    vehstate:$('#zhuangtai input[name="t"]:checked ').val(),
                    vehtunnage:$("#vehtunnage").val(),
                    transid:$("#type").val(),
                },
                dataType:'JSON',
                success:function(data){
                    if(data=="1"){
                        layer.msg("添加成功",{
                            icon:1,
                            time:1000
                        },function () {
                            parent.window.location.reload()
                        });
                    }
                    else if(data==2){
                        layer.msg("添加失败，该车已存在！",{
                            icon:5,
                            time:1000
                        });
                    }
                },

            }) ;
        return false;

        })


    });
</script>
</html>