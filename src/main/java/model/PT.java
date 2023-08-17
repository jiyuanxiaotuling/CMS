package model;
import java.io.Serializable;
public class PT implements Serializable{


    private String cs_id;
    private String ac_id;
    public String getAc_id() {
        return ac_id;
    }

    public void setAc_id(String ac_id) {
        this.ac_id = ac_id;
    }
    public String getCs_id() {
        return cs_id;
    }

    public void setCs_id(String cs_id) {
        this.cs_id = cs_id;
    }

}
