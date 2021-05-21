package com.aaa.entity;

public class Wproblemtype {
    private Integer proid;
    private String  protype;
    private String pronode;
    private String  protime;

    @Override
    public String toString() {
        return "Wproblemtype{" +
                "proid=" + proid +
                ", protype='" + protype + '\'' +
                ", pronode='" + pronode + '\'' +
                ", protime='" + protime + '\'' +
                '}';
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getProtype() {
        return protype;
    }

    public void setProtype(String protype) {
        this.protype = protype;
    }

    public String getPronode() {
        return pronode;
    }

    public void setPronode(String pronode) {
        this.pronode = pronode;
    }

    public String getProtime() {
        return protime;
    }

    public void setProtime(String protime) {
        this.protime = protime;
    }
}
