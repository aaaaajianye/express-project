package com.aaa.entity;

public class Wstaffdetails {
    private Integer staid;
    private String  Staphone;
    private String  staaddress;
    private String   staidcard;
    private String  stapic1;
    private String   stapic2;
    private Integer  braid;
    private Integer   id;

    @Override
    public String toString() {
        return "Wstaffdetails{" +
                "staid=" + staid +
                ", Staphone='" + Staphone + '\'' +
                ", staaddress='" + staaddress + '\'' +
                ", staidcard='" + staidcard + '\'' +
                ", stapic1='" + stapic1 + '\'' +
                ", stapic2='" + stapic2 + '\'' +
                ", braid=" + braid +
                ", id=" + id +
                '}';
    }

    public Integer getStaid() {
        return staid;
    }

    public void setStaid(Integer staid) {
        this.staid = staid;
    }

    public String getStaphone() {
        return Staphone;
    }

    public void setStaphone(String staphone) {
        Staphone = staphone;
    }

    public String getStaaddress() {
        return staaddress;
    }

    public void setStaaddress(String staaddress) {
        this.staaddress = staaddress;
    }

    public String getStaidcard() {
        return staidcard;
    }

    public void setStaidcard(String staidcard) {
        this.staidcard = staidcard;
    }

    public String getStapic1() {
        return stapic1;
    }

    public void setStapic1(String stapic1) {
        this.stapic1 = stapic1;
    }

    public String getStapic2() {
        return stapic2;
    }

    public void setStapic2(String stapic2) {
        this.stapic2 = stapic2;
    }

    public Integer getBraid() {
        return braid;
    }

    public void setBraid(Integer braid) {
        this.braid = braid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
