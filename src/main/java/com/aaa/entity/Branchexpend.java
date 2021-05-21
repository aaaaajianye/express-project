package com.aaa.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Branchexpend {
    private Integer braexid;
    private String braexname;
    private Integer braexludannumber;
    private Integer braexrecnumber;
    private Integer braexsendnumber;
    private Integer bradaojiannumber;
    private Integer braextakenumber;
    private Integer brawentijiannumber;
    private Integer braexqiannumber;
    private Double braexludan;
    private Double braexaddress;
    private Double braexaddresser;
    private Double bradaojian;
    private Double braexdelivery;
    private Double brawentijian;
    private Double braexsign;
    private Double zongfeiyong;
    private Date braexdate;
    private Integer complaintsnumber;
    private Double complaintsmoney;

    public Integer getComplaintsnumber() {
        return complaintsnumber;
    }

    public void setComplaintsnumber(Integer complaintsnumber) {
        this.complaintsnumber = complaintsnumber;
    }

    public Double getComplaintsmoney() {
        return complaintsmoney;
    }

    public void setComplaintsmoney(Double complaintsmoney) {
        this.complaintsmoney = complaintsmoney;
    }

    public Branchexpend() {
    }

    @Override
    public String toString() {
        return "Branchexpend{" +
                "braexid=" + braexid +
                ", braexname='" + braexname + '\'' +
                ", braexludannumber=" + braexludannumber +
                ", braexrecnumber=" + braexrecnumber +
                ", braexsendnumber=" + braexsendnumber +
                ", bradaojiannumber=" + bradaojiannumber +
                ", braextakenumber=" + braextakenumber +
                ", brawentijiannumber=" + brawentijiannumber +
                ", braexqiannumber=" + braexqiannumber +
                ", braexludan=" + braexludan +
                ", braexaddress=" + braexaddress +
                ", braexaddresser=" + braexaddresser +
                ", bradaojian=" + bradaojian +
                ", braexdelivery=" + braexdelivery +
                ", brawentijian=" + brawentijian +
                ", braexsign=" + braexsign +
                ", zongfeiyong=" + zongfeiyong +
                ", braexdate=" + braexdate +
                '}';
    }

    public Branchexpend(Integer braexid, String braexname, Integer braexludannumber, Integer braexrecnumber, Integer braexsendnumber, Integer bradaojiannumber, Integer braextakenumber, Integer brawentijiannumber, Integer braexqiannumber, Double braexludan, Double braexaddress, Double braexaddresser, Double bradaojian, Double braexdelivery, Double brawentijian, Double braexsign, Double zongfeiyong, Date braexdate) {
        this.braexid = braexid;
        this.braexname = braexname;
        this.braexludannumber = braexludannumber;
        this.braexrecnumber = braexrecnumber;
        this.braexsendnumber = braexsendnumber;
        this.bradaojiannumber = bradaojiannumber;
        this.braextakenumber = braextakenumber;
        this.brawentijiannumber = brawentijiannumber;
        this.braexqiannumber = braexqiannumber;
        this.braexludan = braexludan;
        this.braexaddress = braexaddress;
        this.braexaddresser = braexaddresser;
        this.bradaojian = bradaojian;
        this.braexdelivery = braexdelivery;
        this.brawentijian = brawentijian;
        this.braexsign = braexsign;
        this.zongfeiyong = zongfeiyong;
        this.braexdate = braexdate;
    }


}
