<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>签收单查询查看</title>
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
                            <input type="text" name="expnum" id="expnum" value="${list.expnum}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">客户级别：</label>
                    <div class="layui-input-block">
                        <input type="text" name="custrank" id="custrank" value="${list.custrank}" required disabled  lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">寄件网点：</label>
                    <div class="layui-input-block">
                        <input type="text" name="braname" id="braname" value="${list.braname}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                    </div><br/>

                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                            <input type="text" name="sender" id="sender" value="${list.sender}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 200px;">
                       </div><br/>
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                            <input type="text" name="sendphone" id="sendphone" value="${list.sendphone}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                        </div><br/>

                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-block">
                             <input type="text" name="sendidcard" id="sendidcard" value="${list.sendidcard}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">寄件人省：</label>
                    <div class="layui-input-block">
                        <input type="text" name="sendprovince" id="sendprovince" value="${list.sendprovince}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div><br/>
                    <label class="layui-form-label">寄件人市：</label>
                    <div class="layui-input-block">
                        <input type="text" name="sendcity" id="sendcity" value="${list.sendcity}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
                    </div>
               <label class="layui-form-label">寄件人区：</label>
               <div class="layui-input-block">
                   <input type="text" name="sendcounty" id="sendcounty" value="${list.sendcounty}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">详细地址：</label>
               <div class="layui-input-block">
                   <input type="text" name="senddetailaddress" id="senddetailaddress" value="${list.senddetailaddress}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               收件人信息
               <hr class="layui-bg-red">

               <label class="layui-form-label">姓名：</label>
               <div class="layui-input-block">
                   <input type="text" name="recipient" id="recipient" value="${list.recipient}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">电话：</label>
               <div class="layui-input-block">
                   <input type="text" name="recphone" id="recphone" value="${list.recphone}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人省：</label>
               <div class="layui-input-block">
                   <input type="text" name="recprovince" id="recprovince" value="${list.recprovince}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人市：</label>
               <div class="layui-input-block">
                   <input type="text" name="reccity" id="reccity" value="${list.reccity}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">收件人区：</label>
               <div class="layui-input-block">
                   <input type="text" name="reccounty" id="reccounty" value="${list.reccounty}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">详细地址：</label>
               <div class="layui-input-block">
                   <input type="text" name="recdetailaddress" id="recdetailaddress" value="${list.recdetailaddress}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">物品类型：</label>
               <div class="layui-input-block">
                   <input type="text" name="itemtype" id="itemtype" value="${list.itemtype}" required  lay-verify="required" disabled autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">重量(kg)：</label>
               <div class="layui-input-block">
                   <input type="text" name="itemweight" id="itemweight" value="${list.itemweight}" required  lay-verify="required" disabled autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">保价金额：</label>
               <div class="layui-input-block">
                   <input type="text" name="offerprice" id="offerprice" value="${list.offerprice}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">保价应付：</label>
               <div class="layui-input-block">
                   <input type="text" name="offerprices" id="offerprices" value="${list.offerprices}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">付款方式：</label>
               <div class="layui-input-block">
                   <input type="text" name="paytype" id="paytype" value="${list.paytype}" required  lay-verify="required" disabled autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">快递类型：</label>
               <div class="layui-input-block">
                   <input type="text" name="exptype" id="exptype" value="${list.exptype}" required  lay-verify="required" disabled autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">下单备注：</label>
               <div class="layui-input-block">
                   <input type="text" name="expremark" id="expremark" value="${list.expremark}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">运费：</label>
               <div class="layui-input-block">
                   <input type="text" name="expprice" id="expprice" value="${list.expprice}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">总金额：</label>
               <div class="layui-input-block">
                   <input type="text" name="gogalprice" id="gogalprice" value="${list.gogalprice}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">寄件时间：</label>
               <div class="layui-input-block">
                   <input type="text" name="exptime" id="exptime" value="${list.itemtype}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>
               <label class="layui-form-label">快递员：</label>
               <div class="layui-input-block">
                   <input type="text" name="truename" id="truename" value="${list.truename}" required disabled lay-verify="required"  autocomplete="off" class="layui-input" style="width: 300px;">
               </div>

                </div>


        </form>
</#list>
</div>
</body>

</html>