<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工修改</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div>
    <#list list as list>
    <form class="layui-form" lay-filter="demofrom" action="" method="post">
           <div class="layui-form-item">
                    <input type="hidden" name="id" id="id" value="${list.id}"  autocomplete="off" class="layui-input" style="width: 200px;">
                    <label class="layui-form-label">员工姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="truename" id="truename" required value="${list.truename}"  lay-verify="required" disabled autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>

                    <label class="layui-form-label">手机：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staphone" id="staphone" required  value="${list.staphone}" lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div>
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staaddress" id="staaddress" required value="${list.staaddress}"  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div>
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="staidcard" id="staidcard" required value="${list.staidcard}" lay-verify="required" disabled  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div>

                </div>

            <div class="layui-form-item">
                    <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="formDemo2">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
               </div>
        </form>
    </#list>
    </div>'
</body>
<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer', 'table','form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,form = layui.form
            ,select=layui.select;


        form.on('submit(formDemo2)', function(data){
            //alert(data.id);
            $.ajax({
                url:'/userEdit/edit',
                method:'post',
                data:{
                    id:$("#id").val(),
                    truename:$("#truename").val(),
                    staphone:$("#staphone").val(),
                    staaddress:$("#staaddress").val(),
                    staidcard:$("#staidcard").val(),
                    username:$("#username").val(),
                    password:$("#password").val()
                },
                dataType:'JSON',
                success:function(data){
                    if(data=="1"){
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        alert('修改成功！');
                    }
                    else{
                        alert('修改失败！');
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    }
                },
            }) ;
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        })


    });
</script>
</html>