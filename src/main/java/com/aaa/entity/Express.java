package com.aaa.entity;
//运单详情表

import lombok.Data;

@Data
public class Express {
    private Integer expid;
    private String expnum;
    private String custrank;
    private String braid;
    private String sender;
    private String sendphone;
    private String sendidcard;
    private String sendprovince;
    private String sendcity;
    private String sendcounty;
    private String senddetailaddress;
    private String recipient;
    private String recphone;
    private String recprovince;
    private String reccity;
    private String reccounty;
    private String recdetailaddress;
    private String itemtype;
    private Integer itemweight;
    private Integer offerprice;
    private Integer offerprices;
    private String  paytype;
    private String exptype;
    private String expremark;
    private Integer expprice;
    private Integer gogalprice;
    private String exptime;
    private Integer Expstate;

}
