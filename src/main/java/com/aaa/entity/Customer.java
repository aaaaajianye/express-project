package com.aaa.entity;

import lombok.Data;

//客户表
@Data
public class Customer {
    private Integer custid;
    private String custnickname;
    private String custphone;
    private String custname;
    private String custidcord;
    private String custemail;
    private Integer brandid;
    private Integer custrank;

}
