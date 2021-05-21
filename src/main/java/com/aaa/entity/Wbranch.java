package com.aaa.entity;

import lombok.Data;

@Data
public class Wbranch {
    private Integer braid;
    private String bracode;
    private String braname;
    private String braprovince;
    private String bracity;
    private String bracounty;
    private String braaddress;
    private String brasuoshu;
    private Integer brarank;
    private String braprincipal;
    private String braphone;
    private String brapicture;
    private String braremark;
    private String bratime;
    private Integer staid;
    private String hname;

    @Override
    public String toString() {
        return "Wbranch{" +
                "braid=" + braid +
                ", bracode='" + bracode + '\'' +
                ", braname='" + braname + '\'' +
                ", braprovince='" + braprovince + '\'' +
                ", bracity='" + bracity + '\'' +
                ", bracounty='" + bracounty + '\'' +
                ", braaddress='" + braaddress + '\'' +
                ", brasuoshu='" + brasuoshu + '\'' +
                ", brarank=" + brarank +
                ", braprincipal='" + braprincipal + '\'' +
                ", braphone='" + braphone + '\'' +
                ", brapicture='" + brapicture + '\'' +
                ", braremark='" + braremark + '\'' +
                ", bratime='" + bratime + '\'' +
                ", staid=" + staid +
                ", hname='" + hname + '\'' +
                '}';
    }


}
