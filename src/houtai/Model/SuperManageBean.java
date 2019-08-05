package houtai.Model;

/**
 * Created by 我不管我最帅 on 2018/6/28.
 */
public class SuperManageBean {
    private String loginId;
    private String passwd;

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public SuperManageBean(String loginId, String passwd) {
        this.loginId = loginId;
        this.passwd = passwd;
    }

    public SuperManageBean() {
    }

    @Override
    public String toString() {
        return "SuperManageBean{" +
                "loginId='" + loginId + '\'' +
                ", passwd='" + passwd + '\'' +
                '}';
    }
}
