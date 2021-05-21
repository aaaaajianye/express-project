package com.aaa.entity;

public class Wquestion {
    private Integer expid;
    private String expnum;//运单编号
    private String custrank;//寄件人客户级别(1,普通客户2.Vip客户)
    private Integer  braid;//外键(连接branch表)  查询出来所属网点 寄件人网点
    private String sender;//寄件人姓名
    private String sendphone;//寄件人电话
    private String sendidcard;//寄件人身份证号
    private String sendprovince;//寄件人省
    private String sendcity;//寄件人市
    private String sendcounty;//寄件人区(县)
    private String senddetailaddress;//寄件人详细地址
    private String recipient;//收件人姓名
    private String recphone;//收件人电话
    private String recprovince;//收件人省
    private String reccity;//收件人市
    private String reccounty;//收件人区(县)
    private String recdetailaddress;//收件人详细地址
    private String itemtype;//物品类型
    private Integer itemweight;//重量(kg)
    private Integer offerprice;//保价金额
    private Integer offerprices;//保价应付金额
    private String  paytype;//付款方式(现付。到付)
    private String exptype;//快递类型(普通件,快件)
    private String expremark;//下单备注
    private Integer expprice;//运费(报价运费)
    private Integer gogalprice;//总金额(运费+保价应付金额)
    private String exptime;//寄件时间(操作时间)
    private Integer Expstate;//运单状态(0.代抢单1.(已抢单)我的单 2.（运输中）未完成，3.已签收，4.问题单)
    private Integer Id;//外键（连接t_user表的id）抢单的快递员
    private Integer penfuprice;
    private String truename;
    private String protype;
    private String braname;
    private String managetime;
    private String wentibranch;
    private String braexname;

    @Override
    public String toString() {
        return "Wquestion{" +
                "expid=" + expid +
                ", expnum='" + expnum + '\'' +
                ", custrank='" + custrank + '\'' +
                ", braid=" + braid +
                ", sender='" + sender + '\'' +
                ", sendphone='" + sendphone + '\'' +
                ", sendidcard='" + sendidcard + '\'' +
                ", sendprovince='" + sendprovince + '\'' +
                ", sendcity='" + sendcity + '\'' +
                ", sendcounty='" + sendcounty + '\'' +
                ", senddetailaddress='" + senddetailaddress + '\'' +
                ", recipient='" + recipient + '\'' +
                ", recphone='" + recphone + '\'' +
                ", recprovince='" + recprovince + '\'' +
                ", reccity='" + reccity + '\'' +
                ", reccounty='" + reccounty + '\'' +
                ", recdetailaddress='" + recdetailaddress + '\'' +
                ", itemtype='" + itemtype + '\'' +
                ", itemweight=" + itemweight +
                ", offerprice=" + offerprice +
                ", offerprices=" + offerprices +
                ", paytype='" + paytype + '\'' +
                ", exptype='" + exptype + '\'' +
                ", expremark='" + expremark + '\'' +
                ", expprice=" + expprice +
                ", gogalprice=" + gogalprice +
                ", exptime='" + exptime + '\'' +
                ", Expstate=" + Expstate +
                ", Id=" + Id +
                ", penfuprice=" + penfuprice +
                ", truename='" + truename + '\'' +
                ", protype='" + protype + '\'' +
                ", braname='" + braname + '\'' +
                ", managetime='" + managetime + '\'' +
                ", wentibranch='" + wentibranch + '\'' +
                ", braexname='" + braexname + '\'' +
                '}';
    }

    public Integer getExpid() {
        return expid;
    }

    public void setExpid(Integer expid) {
        this.expid = expid;
    }

    public String getExpnum() {
        return expnum;
    }

    public void setExpnum(String expnum) {
        this.expnum = expnum;
    }

    public String getCustrank() {
        return custrank;
    }

    public void setCustrank(String custrank) {
        this.custrank = custrank;
    }

    public Integer getBraid() {
        return braid;
    }

    public void setBraid(Integer braid) {
        this.braid = braid;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSendphone() {
        return sendphone;
    }

    public void setSendphone(String sendphone) {
        this.sendphone = sendphone;
    }

    public String getSendidcard() {
        return sendidcard;
    }

    public void setSendidcard(String sendidcard) {
        this.sendidcard = sendidcard;
    }

    public String getSendprovince() {
        return sendprovince;
    }

    public void setSendprovince(String sendprovince) {
        this.sendprovince = sendprovince;
    }

    public String getSendcity() {
        return sendcity;
    }

    public void setSendcity(String sendcity) {
        this.sendcity = sendcity;
    }

    public String getSendcounty() {
        return sendcounty;
    }

    public void setSendcounty(String sendcounty) {
        this.sendcounty = sendcounty;
    }

    public String getSenddetailaddress() {
        return senddetailaddress;
    }

    public void setSenddetailaddress(String senddetailaddress) {
        this.senddetailaddress = senddetailaddress;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getRecphone() {
        return recphone;
    }

    public void setRecphone(String recphone) {
        this.recphone = recphone;
    }

    public String getRecprovince() {
        return recprovince;
    }

    public void setRecprovince(String recprovince) {
        this.recprovince = recprovince;
    }

    public String getReccity() {
        return reccity;
    }

    public void setReccity(String reccity) {
        this.reccity = reccity;
    }

    public String getReccounty() {
        return reccounty;
    }

    public void setReccounty(String reccounty) {
        this.reccounty = reccounty;
    }

    public String getRecdetailaddress() {
        return recdetailaddress;
    }

    public void setRecdetailaddress(String recdetailaddress) {
        this.recdetailaddress = recdetailaddress;
    }

    public String getItemtype() {
        return itemtype;
    }

    public void setItemtype(String itemtype) {
        this.itemtype = itemtype;
    }

    public Integer getItemweight() {
        return itemweight;
    }

    public void setItemweight(Integer itemweight) {
        this.itemweight = itemweight;
    }

    public Integer getOfferprice() {
        return offerprice;
    }

    public void setOfferprice(Integer offerprice) {
        this.offerprice = offerprice;
    }

    public Integer getOfferprices() {
        return offerprices;
    }

    public void setOfferprices(Integer offerprices) {
        this.offerprices = offerprices;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getExptype() {
        return exptype;
    }

    public void setExptype(String exptype) {
        this.exptype = exptype;
    }

    public String getExpremark() {
        return expremark;
    }

    public void setExpremark(String expremark) {
        this.expremark = expremark;
    }

    public Integer getExpprice() {
        return expprice;
    }

    public void setExpprice(Integer expprice) {
        this.expprice = expprice;
    }

    public Integer getGogalprice() {
        return gogalprice;
    }

    public void setGogalprice(Integer gogalprice) {
        this.gogalprice = gogalprice;
    }

    public String getExptime() {
        return exptime;
    }

    public void setExptime(String exptime) {
        this.exptime = exptime;
    }

    public Integer getExpstate() {
        return Expstate;
    }

    public void setExpstate(Integer expstate) {
        Expstate = expstate;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getPenfuprice() {
        return penfuprice;
    }

    public void setPenfuprice(Integer penfuprice) {
        this.penfuprice = penfuprice;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getProtype() {
        return protype;
    }

    public void setProtype(String protype) {
        this.protype = protype;
    }

    public String getBraname() {
        return braname;
    }

    public void setBraname(String braname) {
        this.braname = braname;
    }

    public String getManagetime() {
        return managetime;
    }

    public void setManagetime(String managetime) {
        this.managetime = managetime;
    }

    public String getWentibranch() {
        return wentibranch;
    }

    public void setWentibranch(String wentibranch) {
        this.wentibranch = wentibranch;
    }

    public String getBraexname() {
        return braexname;
    }

    public void setBraexname(String braexname) {
        this.braexname = braexname;
    }
}
