package data;

public class UserBean {
    private String uid;
    private String uname;
    private String upwd;
    private String phone;
    private CardBean cardBean1;
    private CardBean cardBean2;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public CardBean getCardBean1() {
        return cardBean1;
    }

    public void setCardBean1(CardBean cardBean1) {
        this.cardBean1 = cardBean1;
    }

    public CardBean getCardBean2() {
        return cardBean2;
    }

    public void setCardBean2(CardBean cardBean2) {
        this.cardBean2 = cardBean2;
    }
}
