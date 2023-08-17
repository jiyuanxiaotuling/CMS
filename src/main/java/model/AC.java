package model;

import db.DB;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class AC implements Serializable {
    private String ac_id;
    private String ac_name;
    private String ac_kind;
    private String ac_content;
    private String ac_address;
    private Date ac_btime;
    private Date ac_etime;
    private Date ac_etime_specific;
    private Date ac_btime_specific;

    public Date getAc_etime_specific() {
        return ac_etime_specific;
    }

    public void setAc_etime_specific(Date ac_etime_specific) {
        this.ac_etime_specific = ac_etime_specific;
    }

    public Date getAc_btime_specific() {
        return ac_btime_specific;
    }

    public void setAc_btime_specific(Date ac_btime_specific) {
        this.ac_btime_specific = ac_btime_specific;
    }

    public String getAc_id() {
        return ac_id;
    }

    public void setAc_id(String ac_id) {
        this.ac_id = ac_id;
    }

    public String getAc_name() {
        return ac_name;
    }

    public void setAc_name(String ac_name) {
        this.ac_name = ac_name;
    }

    public String getAc_kind() {
        return ac_kind;
    }

    public void setAc_kind(String ac_kind) {
        this.ac_kind = ac_kind;
    }

    public String getAc_content() {
        return ac_content;
    }

    public void setAc_content(String ac_content) {
        this.ac_content = ac_content;
    }

    public String getAc_address() {
        return ac_address;
    }

    public void setAc_address(String ac_address) {
        this.ac_address = ac_address;
    }

    public Date getAc_btime() {
        return ac_btime;
    }

    public void setAc_btime(Date ac_btime) {
        this.ac_btime = ac_btime;
    }

    public Date getAc_etime() {
        return ac_etime;
    }

    public void setAc_etime(Date ac_etime) {
        this.ac_etime = ac_etime;
    }
    public String getEMId() {
        DB db = new DB();
        ArrayList<EM> emList = db.findEmfoAc(String.valueOf(ac_id));
        if (!emList.isEmpty()) {
            EM em = emList.get(0);
            return em.getEm_id();
        }
        return null; // 返回默认值，表示未找到匹配的 em_id
    }
    public String getCSId() {
        DB db = new DB();
        ArrayList<CS> csList = db.findCsInfo("ac_id", String.valueOf(ac_id));
        if (!csList.isEmpty()) {
            CS em = csList.get(0);
            return em.getCs_id();
        }
        return null; // 返回默认值，表示未找到匹配的 cs_id
    }
}
