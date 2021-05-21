<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>问题件查看页面</title>
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
               寄件人信息
               <hr class="layui-bg-red">
                    <label class="layui-form-label">运单编号：</label>
                    <div class="layui-input-block">
                            <input type="text" name="expnum" id="expnum" value="${list.expnum}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">客户级别：</label>
                    <div class="layui-input-block">
                        <input type="text" name="custrank" id="custrank" value="${list.custrank}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">寄件网点：</label>
                    <div class="layui-input-block">
                        <input type="text" name="braname" id="braname" value="${list.braname}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="sender" id="sender" value="${list.sender}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div><br/>
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                            <input type="text" name="sendphone" id="sendphone" value="${list.sendphone}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div><br/>

                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                             <input type="text" name="sendidcard" id="sendidcard" value="${list.sendidcard}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">寄件人省：</label>
                    <div class="layui-input-block">
                        <input type="text" name="sendprovince" id="sendprovince" value="${list.sendprovince}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">寄件人市：</label>
                    <div class="layui-input-block">
                        <input type="text" name="sendcity" id="sendcity" value="${list.sendcity}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>
               <label class="layui-form-label">寄件人区：</label>
               <div class="layui-input-block">
                   <input type="text" name="sendcounty" id="sendcounty" value="${list.sendcounty}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">详细地址：</label>
               <div class="layui-input-block">
                   <input type="text" name="senddetailaddress" id="senddetailaddress" value="${list.senddetailaddress}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               收件人信息
               <hr class="layui-bg-red">

               <label class="layui-form-label">姓名：</label>
               <div class="layui-input-block">
                   <input type="text" name="recipient" id="recipient" value="${list.recipient}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">电话：</label>
               <div class="layui-input-block">
                   <input type="text" name="recphone" id="recphone" value="${list.recphone}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人省：</label>
               <div class="layui-input-block">
                   <input type="text" name="recprovince" id="recprovince" value="${list.recprovince}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人市：</label>
               <div class="layui-input-block">
                   <input type="text" name="reccity" id="reccity" value="${list.reccity}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人区：</label>
               <div class="layui-input-block">
                   <input type="text" name="reccounty" id="reccounty" value="${list.reccounty}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">详细地址：</label>
               <div class="layui-input-block">
                   <input type="text" name="recdetailaddress" id="recdetailaddress" value="${list.recdetailaddress}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">物品类型：</label>
               <div class="layui-input-block">
                   <input type="text" name="itemtype" id="itemtype" value="${list.itemtype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">重量(kg)：</label>
               <div class="layui-input-block">
                   <input type="text" name="itemweight" id="itemweight" value="${list.itemweight}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">保价金额：</label>
               <div class="layui-input-block">
                   <input type="text" name="offerprice" id="offerprice" value="${list.offerprice}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">保价应付：</label>
               <div class="layui-input-block">
                   <input type="text" name="offerprices" id="offerprices" value="${list.offerprices}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">付款方式：</label>
               <div class="layui-input-block">
                   <input type="text" name="paytype" id="paytype" value="${list.paytype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">快递类型：</label>
               <div class="layui-input-block">
                   <input type="text" name="exptype" id="exptype" value="${list.exptype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">下单备注：</label>
               <div class="layui-input-block">
                   <input type="text" name="expremark" id="expremark" value="${list.expremark}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">运费：</label>
               <div class="layui-input-block">
                   <input type="text" name="expprice" id="expprice" value="${list.expprice}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">总金额：</label>
               <div class="layui-input-block">
                   <input type="text" name="gogalprice" id="gogalprice" value="${list.gogalprice}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">寄件时间：</label>
               <div class="layui-input-block">
                   <input type="text" name="exptime" id="exptime" value="${list.itemtype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">快递员：</label>
               <div class="layui-input-block">
                   <input type="text" name="truename" id="truename" value="${list.truename}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               问题信息
               <hr class="layui-bg-red">
               <label class="layui-form-label">问题类型：</label>
               <div class="layui-input-block">

                   <input type="text" name="protype" id="protype" value="${list.protype}" disabled required  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
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