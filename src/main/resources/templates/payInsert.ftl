<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>支付类型添加</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div>
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">

                           <input type="text"  name="paytype" id="paytype" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">

                    </div><br/>
               <label class="layui-form-label">备注：</label>
               <div class="layui-input-block">

                   <input type="text"  name="paynode" id="paynode" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">

               </div><br/>

                    <label class="layui-form-label">创建时间：</label>
                    <div class="layui-input-block">
                        <input type="text" name="paytime" id="paytime" required disabled   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>


                </div>

            <div class="layui-form-item">
                    <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
               </div>
        </form>
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

        laydate.render({
            elem: '#paytime',
            value:new Date(),

        });



    form.on('submit(formDemo)', function(data){

            $.ajax({
                url:'/payEdit/addPay',
                method:'post',
                data:{
                    paytype:$("#paytype").val(),
                    paynode:$("#paynode").val(),
                    paytime:$("#paytime").val()

                },
                dataType:'JSON',
                success:function(data){
                    if(data=="1"){
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        alert('添加成功！');
                    }
                    else{
                        alert('添加失败！');
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