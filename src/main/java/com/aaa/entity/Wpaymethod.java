package com.aaa.entity;

public class Wpaymethod {
    private Integer payid;
    private String  paytype;
    private String paynode;
    private String   paytime;

    @Override
    public String toString() {
        return "Wpaymethod{" +
                "payid=" + payid +
                ", paytype='" + paytype + '\'' +
                ", paynode='" + paynode + '\'' +
                ", paytime='" + paytime + '\'' +
                '}';
    }

    public Integer getPayid() {
        return payid;
    }

    public void setPayid(Integer payid) {
        this.payid = payid;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getPaynode() {
        return paynode;
    }

    public void setPaynode(String paynode) {
        this.paynode = paynode;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }
}
