package com.aaa.entity;

public class Wtranstype {
    private  Integer transid;
    private  String transtype;
    private  String transtime;

    @Override
    public String toString() {
        return "Wtranstype{" +
                "transid=" + transid +
                ", transtype='" + transtype + '\'' +
                ", transtime='" + transtime + '\'' +
                '}';
    }

    public Integer getTransid() {
        return transid;
    }

    public void setTransid(Integer transid) {
        this.transid = transid;
    }

    public String getTranstype() {
        return transtype;
    }

    public void setTranstype(String transtype) {
        this.transtype = transtype;
    }

    public String getTranstime() {
        return transtime;
    }

    public void setTranstime(String transtime) {
        this.transtime = transtime;
    }
}
