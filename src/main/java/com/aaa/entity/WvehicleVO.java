package com.aaa.entity;

public class WvehicleVO {
    private Integer vehid;
    private String vehids;
    private String vehnum;
    private String  vehmodal;
    private Integer transid;
    private Integer vehtunnage;
    private Integer vehilo;
    private String   vehdirver;
    private String vehphone;
    private String  vehtime;
    private String vehnode;
    private Integer vehstate;
    private Integer braid;
    private String typename;//运输类型
    private String braname;//网点名称
    private String state;
    private String heiger;
    private String hname;

    @Override
    public String toString() {
        return "WvehicleVO{" +
                "vehid=" + vehid +
                ", vehids='" + vehids + '\'' +
                ", vehnum='" + vehnum + '\'' +
                ", vehmodal='" + vehmodal + '\'' +
                ", transid=" + transid +
                ", vehtunnage=" + vehtunnage +
                ", vehilo=" + vehilo +
                ", vehdirver='" + vehdirver + '\'' +
                ", vehphone='" + vehphone + '\'' +
                ", vehtime='" + vehtime + '\'' +
                ", vehnode='" + vehnode + '\'' +
                ", vehstate=" + vehstate +
                ", braid=" + braid +
                ", typename='" + typename + '\'' +
                ", braname='" + braname + '\'' +
                ", state='" + state + '\'' +
                ", heiger='" + heiger + '\'' +
                ", hname='" + hname + '\'' +
                '}';
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

    public Integer getVehid() {
        return vehid;
    }

    public void setVehid(Integer vehid) {
        this.vehid = vehid;
    }

    public String getVehids() {
        return vehids;
    }

    public void setVehids(String vehids) {
        this.vehids = vehids;
    }

    public String getVehnum() {
        return vehnum;
    }

    public void setVehnum(String vehnum) {
        this.vehnum = vehnum;
    }

    public String getVehmodal() {
        return vehmodal;
    }

    public void setVehmodal(String vehmodal) {
        this.vehmodal = vehmodal;
    }

    public Integer getTransid() {
        return transid;
    }

    public void setTransid(Integer transid) {
        this.transid = transid;
    }

    public Integer getVehtunnage() {
        return vehtunnage;
    }

    public void setVehtunnage(Integer vehtunnage) {
        this.vehtunnage = vehtunnage;
    }

    public Integer getVehilo() {
        return vehilo;
    }

    public void setVehilo(Integer vehilo) {
        this.vehilo = vehilo;
    }

    public String getVehdirver() {
        return vehdirver;
    }

    public void setVehdirver(String vehdirver) {
        this.vehdirver = vehdirver;
    }

    public String getVehphone() {
        return vehphone;
    }

    public void setVehphone(String vehphone) {
        this.vehphone = vehphone;
    }

    public String getVehtime() {
        return vehtime;
    }

    public void setVehtime(String vehtime) {
        this.vehtime = vehtime;
    }

    public String getVehnode() {
        return vehnode;
    }

    public void setVehnode(String vehnode) {
        this.vehnode = vehnode;
    }

    public Integer getVehstate() {
        return vehstate;
    }

    public void setVehstate(Integer vehstate) {
        this.vehstate = vehstate;
    }

    public Integer getBraid() {
        return braid;
    }

    public void setBraid(Integer braid) {
        this.braid = braid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getBraname() {
        return braname;
    }

    public void setBraname(String braname) {
        this.braname = braname;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
