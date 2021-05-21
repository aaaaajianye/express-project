<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工添加</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div>
<#--<#list list as list>-->
    <form class="layui-form" action="" method="post">
          <div class="layui-form-item">
                    <label class="layui-form-label">所属网点：</label>
                    <div class="layui-input-block"  style="width: 200px;">
                        <select name="type" lay-verify="required" id="type" lay-search="">
                            <option value="" >请选择网点</option>
                        </select>
                        <#--<input type="text" value="${list.braname}" name="braname" id="braname" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">-->

                    </div>
                    <label class="layui-form-label">员工姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="truename" id="truename" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>

                    <label class="layui-form-label">用户账号：</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" id="username" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>

                    <#--<label class="layui-form-label">用户密码：</label>-->
                    <#--<div class="layui-input-block">-->
                        <#--<input  name="password" id="password" type="password" required  lay-verify="pass"  autocomplete="off" class="layui-input" style="width: 200px;">-->
                    <#--</div>-->

                    <label class="layui-form-label">手机：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staphone" id="staphone" required  lay-verify="required|phone"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div>
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staaddress" id="staaddress" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div>
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staidcard" id="staidcard" required  lay-verify="identity"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div>

                </div>

            <div class="layui-form-item">
                    <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
               </div>
        </form>
<#--</#list>-->
    </div>
</body>
<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer', 'table','form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,form = layui.form
            ,select=layui.select;

        $.ajax({
            url:"/userEdit/selBra",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#type').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }})
        form.on('submit(formDemo)', function(data){

            $.ajax({
                url:'/userEdit/toInsert',
                method:'post',
                data:{
                    braid:$("#type").val(),
                    truename:$("#truename").val(),
                    staphone:$("#staphone").val(),
                    staaddress:$("#staaddress").val(),
                    staidcard:$("#staidcard").val(),
                    username:$("#username").val()
                    //password:$("#password").val()
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
                        layer.msg('添加失败,该账号已存在！',{
                            icon:5,
                            time:1000
                        });
                    }
                    else if (data==3){
                        layer.msg('添加失败,该身份证号已注册！',{
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