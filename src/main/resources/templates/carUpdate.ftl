<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>车辆编辑</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div><#list list as list>
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">

                    <div class="layui-input-block">
                            <input type="hidden" name="vehid" id="vehid" value="${list.vehid}"   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div>
                    <label class="layui-form-label">司机姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehdirver" id="vehdirver" value="${list.vehdirver}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">司机电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehphone" id="vehphone" value="${list.vehphone}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>



                    <label class="layui-form-label">车牌号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehnum" id="vehnum" value="${list.vehnum}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div><br/>
                    <label class="layui-form-label">车辆型号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="vehmodal" id="vehmodal" value="${list.vehmodal}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div><br/>

                    <label class="layui-form-label">油耗：</label>
                    <div class="layui-input-block">
                             <input type="text" name="vehilo" id="vehilo" value="${list.vehilo}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">核定载重：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehtunnage" id="vehtunnage" value="${list.vehtunnage}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <input type="text" name="vehnode" id="vehnode" value="${list.vehnode}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
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
                url:'/carEdit/updateCar',
                method:'post',
                data:{
                    vehid:$("#vehid").val(),
                    vehdirver:$("#vehdirver").val(),
                    vehphone:$("#vehphone").val(),
                    vehids:$("#vehids").val(),
                    vehnum:$("#vehnum").val(),
                    vehilo:$("#vehilo").val(),
                    vehnode:$("#vehnode").val(),
                    //vehstate:$("#vehstate").val(),
                    vehtunnage:$("#vehtunnage").val(),
                    vehmodal:$("#vehmodal").val()
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

        })


    });
</script>
</html>