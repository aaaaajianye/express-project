package com.aaa.entity;

import lombok.Data;

import java.util.List;

@Data
public class LayuiResult<T> {
  private int code;
  private String msg;
  private int count;
  private List<T> data;
  

  
}
