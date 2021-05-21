<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>问题件处理页面</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div ><#list list as list>
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">
               <div class="layui-input-block">
                   <input type="hidden" name="expid" id="expid" value="${list.expid}"   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
               </div>
               <label class="layui-form-label">问题网点：</label>
               <div class="layui-input-block">
                   <input type="text" name="braexname" id="braexname" value="${list.wentibranch}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">保价金额：</label>
               <div class="layui-input-block">
                   <input type="text" name="offerprice" id="offerprice" value="${list.offerprice}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">赔付应付：</label>
               <div class="layui-input-block">
                   <input type="number" name="offerpriceTwo" id="offerpriceTwo" value="${list.penfuprice}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>

               <label class="layui-form-label">问题类型：</label>
                <div class="layui-input-block">

                   <input type="text" name="protype" id="protype" value="${list.protype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                </div>
                </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

        </form>
</#list>
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




        form.on('submit(formDemo)', function(data){

            $.ajax({
                url:'/questionEdit/updateQuestion',
                method:'post',
                data:{
                    expid:$("#expid").val(),
                    braexname:$("#braexname").val(),
                    offerprice:$("#offerpriceTwo").val()

                },
                dataType:'JSON',
                success:function(data){
                    if(data=="1"){
                        layer.msg("处理成功！",{
                            icon:1,
                            time:1000
                        },function () {
                            parent.window.location.reload()
                        });

                    }
                    else{
                        alert('处理失败！');
                        layer.msg('处理失败！',{
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