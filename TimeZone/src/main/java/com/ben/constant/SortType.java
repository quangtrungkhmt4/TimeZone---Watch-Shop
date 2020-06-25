package com.ben.constant;

import org.springframework.data.domain.Sort;

public class SortType {
    public static final int DATE_DESC = 1;
    public static final int DATE_ASC = 2;
    public static final int PRICE_DESC = 3;
    public static final int PRICE_ASC = 4;

    public static Sort getSort(int type){
        switch (type){
            case DATE_DESC:
                return new Sort(Sort.Direction.DESC, "createdDate");
            case DATE_ASC:
                return new Sort(Sort.Direction.ASC, "createdDate");
            case PRICE_DESC:
                return new Sort(Sort.Direction.DESC, "price");
            case PRICE_ASC:
                return new Sort(Sort.Direction.ASC, "price");
            default:
                return new Sort(Sort.Direction.DESC, "createdDate");
        }
    }
}
