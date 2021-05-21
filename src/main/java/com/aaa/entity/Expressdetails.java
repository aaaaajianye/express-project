package com.aaa.entity;

import lombok.Data;

//运单详情表
@Data
public class Expressdetails {
    private Integer expdid;
    private String expnum;
    private String expoper;
    private String expoperipone;
    private String expdregion;
    private String expdregiontime;
    private Integer offtyid;

}
