package model;
import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

public class CS implements Serializable {
    private String cs_id;
    private String cs_name;
    private String cs_phone;
    private String cs_kind;
    private String cs_address;
    private String cs_remark;
    private String cs_email;
    private String cs_sex;
    private Date cs_addtime;

    public Date getCs_addtime() {
        return cs_addtime;
    }
    public void setCs_addtime(Date cs_addtime) {
        this.cs_addtime = cs_addtime;
    }

    public String getCs_sex() {
        return cs_sex;
    }

    public void setCs_sex(String cs_sex) {
        this.cs_sex = cs_sex;
    }

    public String getCs_id() {
        return cs_id;
    }

    public void setCs_id(String cs_id) {
        this.cs_id = cs_id;
    }

    public String getCs_name() {
        return cs_name;
    }

    public void setCs_name(String cs_name) {
        this.cs_name = cs_name;
    }

    public String getCs_phone() {
        return cs_phone;
    }

    public void setCs_phone(String cs_phone) {
        this.cs_phone = cs_phone;
    }

    public String getCs_kind() {
        return cs_kind;
    }

    public void setCs_kind(String cs_kind) {
        this.cs_kind = cs_kind;
    }

    public String getCs_address() {
        return cs_address;
    }

    public void setCs_address(String cs_address) {
        this.cs_address = cs_address;
    }

    public String getCs_remark() {
        return cs_remark;
    }

    public void setCs_remark(String cs_remark) {
        this.cs_remark = cs_remark;
    }

    public String getCs_email() {
        return cs_email;
    }

    public void setCs_email(String cs_email) {
        this.cs_email = cs_email;
    }
}

