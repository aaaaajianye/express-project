package com.aaa.entity;

import lombok.Data;

@Data
public class TuserTwo {
    private Integer id;
    private String bz;
    private String password;
    private String truename;
    private String username;
    private String remarks;

    @Override
    public String toString() {
        return "TuserTwo{" +
                "id=" + id +
                ", bz='" + bz + '\'' +
                ", password='" + password + '\'' +
                ", truename='" + truename + '\'' +
                ", username='" + username + '\'' +
                ", remarks='" + remarks + '\'' +
                '}';
    }


}

