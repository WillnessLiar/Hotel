package houtai.Model;


public class WorkerBean {
    private String workerId;   //员工编号
    private String workerName;  //姓名
    private String workerPhone;  //电话
    private String address;     //住址
    private String position;    //职位
    private String workerSex;  //性别
    private String inDate;  //入职日期
    private String isWork;  //是否在职
    private String status;  //是否被删

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsWork() {
        return isWork;
    }

    public void setIsWork(String isWork) {
        this.isWork = isWork;
    }

    public String getWorkerId() {
        return workerId;
    }

    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    public String getWorkerName() {
        return workerName;
    }

    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

    public String getWorkerPhone() {
        return workerPhone;
    }

    public void setWorkerPhone(String workerPhone) {
        this.workerPhone = workerPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getWorkerSex() {
        return workerSex;
    }

    public void setWorkerSex(String workerSex) {
        this.workerSex = workerSex;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public WorkerBean(String workerId,String workerName,String workerPhone,String address,String position,String workerSex,String inDate,String isWork,String status){
        this.status = status;
        this.isWork = isWork;
        this.workerId = workerId;
        this.workerName = workerName;
        this.workerPhone = workerPhone;
        this.address = address;
        this.position = position;
        this.workerSex = workerSex;
        this.inDate = inDate;
    }
    public WorkerBean(){
    }

    @Override
    public String toString(){
        return "WorkerBean{"+
                "workerId='"+ workerId + '\'' +
                ",workerName='"+workerName + '\'' +
                ",workerPhone='"+ workerPhone + '\'' +
                ",address='"+ address + '\'' +
                ",position='"+ position + '\'' +
                ",workerSex='"+ workerSex + '\'' +
                ",inDate='"+ inDate + '\'' +
                ",isWork='"+ isWork + '\'' +
                ",status='" + status + '\'' +
                '}';
    }
}
