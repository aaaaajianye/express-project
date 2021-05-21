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
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">
                    <label class="layui-form-label">所属网点：</label>
                    <div class="layui-input-block" style="width: 200px;">
                        <select name="braname" lay-verify="required" id="braname" lay-search="" lay-filter="braname">
                        <option value="" >请选择网点</option>
                        </select>

                    </div><br/>
               <label class="layui-form-label">投诉员工：</label>
               <div class="layui-input-block" style="width: 200px;">
                   <div class="layui-form" lay-filter="custom">
                   <select name="truename" lay-verify="required" id="truename" lay-search="" lay-filter="truename">
                       <option value="" >请选择员工</option>
                   </select>
                   </div>
               </div><br/>
                    <label class="layui-form-label">投诉单号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="comexpnum" id="comexpnum" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">罚款金额：</label>
                    <div class="layui-input-block">
                        <input type="number" name="comfinemoney" id="comfinemoney" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                   <label class="layui-form-label">投诉内容：</label>
                    <div class="layui-input-block">
                            <input type="text" name="comcontent" id="comcontent" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div><br/>


            <div class="layui-form-item">
                    <div class="layui-input-block">
                           <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
               </div>
        </form>

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
            url:"/carEdit/selBraname",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#braname').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }})


        form.on('select(braname)',function(data){

            console.info(data.value);
            var braid=data.value;

            $.ajax({
                url:'/userEdit/seluserBraid?braid='+braid,
                method:'post',

                dataType:'JSON',
                success:function(data){
                    $("#truename").find("option:not(:first)").remove();
                    $.each(data, function (index, item) {
                        $('#truename').append(new Option( item.truename,item.id));// 下拉菜单里添加元素
                    });

                    layui.form.render('select','custom');//重新渲染 固定写法
                }

            }) ;
            return false;
        })

    form.on('submit(formDemo)', function(data){

            $.ajax({
                url:'/complaintsEdit/insert',
                method:'post',
                data:{
                    braname:$("#braname option:selected").text(),
                    truename:$("#truename option:selected").text(),
                    comexpnum:$("#comexpnum").val(),
                    comfinemoney:$("#comfinemoney").val(),
                    comcontent:$("#comcontent").val()
                },
                dataType:'JSON',
                success:function(data){
                    if(data==1){
                        layer.msg("添加成功",{
                            icon:1,
                            time:1000
                        },function () {
                            parent.window.location.reload()
                        });
                    }
                    else if(data==0){
                        layer.msg("添加失败，该员工没有操作过此单号！",{
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