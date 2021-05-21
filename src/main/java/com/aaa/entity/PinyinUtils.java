package com.aaa.entity;

import net.sourceforge.pinyin4j.PinyinHelper;

public class PinyinUtils {
    /**
     * 提取首个字符的首字母，其他返回*
     *
     * @param str
     * @return String
     */
    public static String getFirstPinYinHeadChar(String str) {
        StringBuffer pybf = new StringBuffer();
        char word = str.charAt(0);
        // 提取汉字的首字母
        String[] pinyinArray;
        // 是否是因为字母
        if (word > 128) {
            pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            // 如果不是汉字，就返回*
            if (pinyinArray != null) {
                pybf.append(pinyinArray[0].charAt(0));
            } else {
                pybf.append("*");
            }
        } else {
            // 是字母直接返回，不是返回*
            if (Character.isLetter(word)) {
                pybf.append(word);
            } else {
                pybf.append("*");
            }
        }
        // 返回大写
        return pybf.toString().toUpperCase();
    }
    //public static void main(String[] args) {
        //PinyinUtils pinyinUtils=new PinyinUtils();
        //System.out.println(pinyinUtils.getFirstPinYinHeadChar("被南省新乡市红旗区"));
    //}
}
