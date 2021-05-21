package com.aaa.entity;

import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class BaseQuery {
	private Integer page=1;
    private Integer limit=10;
    private String q;
    

    
}
