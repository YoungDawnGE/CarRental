package util;

import java.io.Serializable;

/**
 * Create By
 * Ge YangChen
 * 2018/7/5~
 **/
public class ResponseEntity<T> implements Serializable {
    int code;
    T data;
    String message;

    public ResponseEntity(int code, T data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
