package com.aaa.entity;

public class Wexpresstype {
    private Integer exptypeid;
    private String   exptype;
    private String exptime;

    @Override
    public String toString() {
        return "Wexpresstype{" +
                "exptypeid=" + exptypeid +
                ", exptype='" + exptype + '\'' +
                ", exptime='" + exptime + '\'' +
                '}';
    }

    public Integer getExptypeid() {
        return exptypeid;
    }

    public void setExptypeid(Integer exptypeid) {
        this.exptypeid = exptypeid;
    }

    public String getExptype() {
        return exptype;
    }

    public void setExptype(String exptype) {
        this.exptype = exptype;
    }

    public String getExptime() {
        return exptime;
    }

    public void setExptime(String exptime) {
        this.exptime = exptime;
    }
}
