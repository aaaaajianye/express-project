package com.aaa.entity;

public class Wrecord {
    private Integer id;
    private String name;
    private String iphone;
    private String address;
    private String agobranch;
    private String nowbranch;
    private String shijian;
    private String braname;

    @Override
    public String toString() {
        return "Wrecord{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", iphone='" + iphone + '\'' +
                ", address='" + address + '\'' +
                ", agobranch='" + agobranch + '\'' +
                ", nowbranch='" + nowbranch + '\'' +
                ", shijian='" + shijian + '\'' +
                ", braname='" + braname + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIphone() {
        return iphone;
    }

    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAgobranch() {
        return agobranch;
    }

    public void setAgobranch(String agobranch) {
        this.agobranch = agobranch;
    }

    public String getNowbranch() {
        return nowbranch;
    }

    public void setNowbranch(String nowbranch) {
        this.nowbranch = nowbranch;
    }

    public String getShijian() {
        return shijian;
    }

    public void setShijian(String shijian) {
        this.shijian = shijian;
    }

    public String getBraname() {
        return braname;
    }

    public void setBraname(String braname) {
        this.braname = braname;
    }
}
