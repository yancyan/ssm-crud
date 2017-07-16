package com.sylg.ssm.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yancyan on 2017/7/16.
 *  通用的返回类， 包括操作的返回值
 *  对pageInfo进行封装
 */
public class Message {
    private int code; //状态码
    private String msg; //提示信息
    private Map<String, Object> extend = new HashMap<>(); //服务器返回给用户的信息


    public static Message success(){
        Message message = new Message();
        message.setCode(100);
        message.setMsg("处理成功！");
        return message;
    }
    public static Message fail(){
        Message message = new Message();
        message.setCode(200);
        message.setMsg("处理失败！");
        return message;
    }

    //支持链式操作 .success().add()
    public Message add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
