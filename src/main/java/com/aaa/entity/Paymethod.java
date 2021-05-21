package com.aaa.entity;

import lombok.Data;

//付款方式
@Data
public class Paymethod {
    private Integer payid;
    private String paytype;
    private String paynode;
    private String paytime;


}
