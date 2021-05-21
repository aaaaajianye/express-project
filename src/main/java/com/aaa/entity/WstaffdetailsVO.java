package com.aaa.entity;

//员工细节
public class WstaffdetailsVO {
    private Integer staid;
    private String  staphone;
    private String  staaddress;
    private String   staidcard;
    private String  stapic1;
    private String   stapic2;
    private String  braname;
    private String   username;
    private String truename;
    private Integer braid;
    private Integer id;
    private String password;
    private String bracode;
    private String heiger;
    private String hname;
    private String tname;

    @Override
    public String toString() {
        return "WstaffdetailsVO{" +
                "staid=" + staid +
                ", staphone='" + staphone + '\'' +
                ", staaddress='" + staaddress + '\'' +
                ", staidcard='" + staidcard + '\'' +
                ", stapic1='" + stapic1 + '\'' +
                ", stapic2='" + stapic2 + '\'' +
                ", braname='" + braname + '\'' +
                ", username='" + username + '\'' +
                ", truename='" + truename + '\'' +
                ", braid=" + braid +
                ", id=" + id +
                ", password='" + password + '\'' +
                ", bracode='" + bracode + '\'' +
                ", heiger='" + heiger + '\'' +
                ", hname='" + hname + '\'' +
                ", tname='" + tname + '\'' +
                '}';
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getHeiger() {
        return heiger;
    }

    public void setHeiger(String heiger) {
        this.heiger = heiger;
    }

    public String getBracode() {
        return bracode;
    }

    public void setBracode(String bracode) {
        this.bracode = bracode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public Integer getStaid() {
        return staid;
    }

    public void setStaid(Integer staid) {
        this.staid = staid;
    }

    public String getStaphone() {
        return staphone;
    }

    public void setStaphone(String staphone) {
        this.staphone = staphone;
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

    public String getBraname() {
        return braname;
    }

    public void setBraname(String braname) {
        this.braname = braname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
