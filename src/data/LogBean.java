package data;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogBean {
    private String cid1;
    private String cid2;
    private String type;
    private int amount;
    private Date date;
    private String time;


    public LogBean(String cid1, String c, String type, int amount, Date date) {
        this.cid1 = cid1;
        if (c==null){
            this.cid2="";
        }else {
            this.cid2 = c;
        }
        this.type = type;
        this.amount = amount;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss") ;
        this.time = dateFormat.format(date);
        this.date = date;
    }

    public String getCid1() {
        return cid1;
    }

    public String getCid2() {
        return cid2;
    }

    public String getType() {
        return type;
    }

    public int getAmount() {
        return amount;
    }

    public Date getDate() {
        return date;
    }


    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
