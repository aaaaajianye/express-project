<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>网点负责人</title>
    <!--引入css文件-->
    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <!--引入js-->

    <script type="text/javascript" src="${basePath!}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/cache.js"></script>
    <script type="text/javascript" src="${basePath!}/static/js/jquery-2.1.3.min.js"></script>
</head>
<body>
<div><#list details1s as details1s>
    <form class="layui-form" action="" method="post">
           <div class="layui-form-item">
                    <label class="layui-form-label">网点名称：</label>
                    <div class="layui-input-block">

                           <input type="text"  name="braname" id="braname" value="${details1s.braname}" required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">

                    </div><br/>

                    <label class="layui-form-label">负责人：</label>
                    <div class="layui-input-block">
                        <input type="text" name="braprincipal " id="braprincipal" value="${details1s.braprincipal}"  required disabled   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>
               <label class="layui-form-label">负责人电话：</label>
               <div class="layui-input-block">
                   <input type="text" name="braphone" id="braphone" value="${details1s.braphone}" required disabled   lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
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


        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
        })


    });
</script>
</html>