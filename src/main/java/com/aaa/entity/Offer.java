package com.aaa.entity;

import lombok.Data;

//快递报价表
@Data
public class Offer {
    private Integer offerid;
    private String offersend;
    private String offergoal;
    private double offerprice;
    private double offerprice2;
    private String offertime;
    private Integer custrank;
    private Integer offerday;
    private Integer transid;

}
