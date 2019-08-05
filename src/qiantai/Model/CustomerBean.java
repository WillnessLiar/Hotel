package qiantai.Model;

/**
 * Created by 我不管我最帅 on 2018/6/19.
 */
public class CustomerBean {
    private String cusId;       /*用户名*/
    private String cusPasswd;   /*密码*/
    private String trueName;    /*真实姓名*/
    private String cusPhone;    /*手机号*/
    private String cusSex;      /*默认隐藏的字段（性别）*/
    private String cusImg;      /*隐藏字段（头像）*/
    private String cusCode;     /*验证码*/

    public CustomerBean(String cusId, String cusPasswd, String trueName, String cusPhone, String cusSex, String cusImg, String cusCode) {
        this.cusId = cusId;
        this.cusPasswd = cusPasswd;
        this.trueName = trueName;
        this.cusPhone = cusPhone;
        this.cusSex = cusSex;
        this.cusImg = cusImg;
        this.cusCode = cusCode;
    }

    public CustomerBean() {
    }

    @Override
    public String toString() {
        return "CustomerBean{" +
                "cusId='" + cusId + '\'' +
                ", cusPasswd='" + cusPasswd + '\'' +
                ", trueName='" + trueName + '\'' +
                ", cusPhone='" + cusPhone + '\'' +
                ", cusSex='" + cusSex + '\'' +
                ", cusImg='" + cusImg + '\'' +
                ", cusCode='" + cusCode + '\'' +
                '}';
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getCusPasswd() {
        return cusPasswd;
    }

    public void setCusPasswd(String cusPasswd) {
        this.cusPasswd = cusPasswd;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusSex() {
        return cusSex;
    }

    public void setCusSex(String cusSex) {
        this.cusSex = cusSex;
    }

    public String getCusImg() {
        return cusImg;
    }

    public void setCusImg(String cusImg) {
        this.cusImg = cusImg;
    }

    public String getCusCode() {
        return cusCode;
    }

    public void setCusCode(String cusCode) {
        this.cusCode = cusCode;
    }
}
