package com.aaa.entity;

import lombok.Data;

@Data
public class Wcomplaints {
    private Integer comid;
    private String combranch;
    private String comtuser;
    private String comexpnum;
    private Integer comfinemoney;
    private String comcontent;
    private String comdate;
    private String heiger;
    private String hname;

    @Override
    public String toString() {
        return "Wcomplaints{" +
                "comid=" + comid +
                ", combranch='" + combranch + '\'' +
                ", comtuser='" + comtuser + '\'' +
                ", comexpnum='" + comexpnum + '\'' +
                ", comfinemoney=" + comfinemoney +
                ", comcontent='" + comcontent + '\'' +
                ", comdate='" + comdate + '\'' +
                ", heiger='" + heiger + '\'' +
                ", hname='" + hname + '\'' +
                '}';
    }


}
