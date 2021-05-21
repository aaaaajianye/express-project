package com.aaa.entity;

public class Witemtype {
    private Integer itemid;
    private String  itemtype;
    private String itemtime;

    @Override
    public String toString() {
        return "Witemtype{" +
                "itemid=" + itemid +
                ", itemtype='" + itemtype + '\'' +
                ", itemtime='" + itemtime + '\'' +
                '}';
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public String getItemtype() {
        return itemtype;
    }

    public void setItemtype(String itemtype) {
        this.itemtype = itemtype;
    }

    public String getItemtime() {
        return itemtime;
    }

    public void setItemtime(String itemtime) {
        this.itemtime = itemtime;
    }
}
