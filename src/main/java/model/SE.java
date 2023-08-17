package model;

import java.io.Serializable;
import java.sql.Date;

public class SE implements Serializable {
    private String se_id;
    private Date se_time;
    private String se_kind;
    private String se_priority;
    private String se_status;
    private String se_content;
    private String se_feedback;
    private int se_satisfaction;
    private String cs_id;
    private String em_id;

    public String getSe_id() {
        return se_id;
    }

    public void setSe_id(String se_id) {
        this.se_id = se_id;
    }

    public Date getSe_time() {
        return se_time;
    }

    public void setSe_time(Date se_time) {
        this.se_time = se_time;
    }

    public String getSe_kind() {
        return se_kind;
    }

    public void setSe_kind(String se_kind) {
        this.se_kind = se_kind;
    }

    public String getSe_priority() {
        return se_priority;
    }

    public void setSe_priority(String se_priority) {
        this.se_priority = se_priority;
    }

    public String getSe_status() {
        return se_status;
    }

    public void setSe_status(String se_status) {
        this.se_status = se_status;
    }

    public String getSe_content() {
        return se_content;
    }

    public void setSe_content(String se_content) {
        this.se_content = se_content;
    }

    public String getSe_feedback() {
        return se_feedback;
    }

    public void setSe_feedback(String se_feedback) {
        this.se_feedback = se_feedback;
    }

    public int getSe_satisfaction() {
        return se_satisfaction;
    }

    public void setSe_satisfaction(int se_satisfaction) {
        this.se_satisfaction = se_satisfaction;
    }

    public String getCs_id() {
        return cs_id;
    }

    public void setCs_id(String cs_id) {
        this.cs_id = cs_id;
    }

    public String getEm_id() {
        return em_id;
    }

    public void setEm_id(String em_id) {
        this.em_id = em_id;
    }
}
