package model;
import java.io.Serializable;
import java.sql.Date;
public class EM implements Serializable {
    private String em_id;
    private String em_name;
    private String em_gender;
    private int em_age;
    private String em_position;
    private String em_department;
    private String em_phone;
    private String em_email;

    public String getEm_id() {
        return em_id;
    }

    public void setEm_id(String em_id) {
        this.em_id = em_id;
    }

    public String getEm_name() {
        return em_name;
    }

    public void setEm_name(String em_name) {
        this.em_name = em_name;
    }

    public String getEm_gender() {
        return em_gender;
    }

    public void setEm_gender(String em_gender) {
        this.em_gender = em_gender;
    }

    public int getEm_age() {
        return em_age;
    }

    public void setEm_age(int em_age) {
        this.em_age = em_age;
    }

    public String getEm_position() {
        return em_position;
    }

    public void setEm_position(String em_position) {
        this.em_position = em_position;
    }

    public String getEm_department() {
        return em_department;
    }

    public void setEm_department(String em_department) {
        this.em_department = em_department;
    }

    public String getEm_phone() {
        return em_phone;
    }

    public void setEm_phone(String em_phone) {
        this.em_phone = em_phone;
    }

    public String getEm_email() {
        return em_email;
    }

    public void setEm_email(String em_email) {
        this.em_email = em_email;
    }
}

