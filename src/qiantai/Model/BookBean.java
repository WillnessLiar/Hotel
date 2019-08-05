package qiantai.Model;

/**
 * Created by 我不管我最帅 on 2018/6/24.
 */
public class BookBean {
    private String bookId;  //订单号
    private String roomId;  //房号
    private String cusId;   //用户id
    private String bookName;//预订人
    private String bookInNum;//入住人数
    private String bookPrice;//价格
    private String bookRemark;//备注
    private String bookDate;//订单生成日期
    private String inDate;//入住日期
    private String outDate;//离店日期
    private String bookPhone;//手机号
    private String bookState;//订单状态
    private String roomTypeId;//房间类型
    private String roomImg; //图片路径
    private String isReview;

    public BookBean(String bookId, String roomId, String cusId, String bookName, String bookInNum, String bookPrice, String bookRemark, String bookDate, String inDate, String outDate, String bookPhone, String bookState, String roomTypeId, String roomImg, String isReview) {
        this.bookId = bookId;
        this.roomId = roomId;
        this.cusId = cusId;
        this.bookName = bookName;
        this.bookInNum = bookInNum;
        this.bookPrice = bookPrice;
        this.bookRemark = bookRemark;
        this.bookDate = bookDate;
        this.inDate = inDate;
        this.outDate = outDate;
        this.bookPhone = bookPhone;
        this.bookState = bookState;
        this.roomTypeId = roomTypeId;
        this.roomImg = roomImg;
        this.isReview = isReview;
    }

    public BookBean() {
    }

    @Override
    public String toString() {
        return "BookBean{" +
                "bookId='" + bookId + '\'' +
                ", roomId='" + roomId + '\'' +
                ", cusId='" + cusId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookInNum='" + bookInNum + '\'' +
                ", bookPrice='" + bookPrice + '\'' +
                ", bookRemark='" + bookRemark + '\'' +
                ", bookDate='" + bookDate + '\'' +
                ", inDate='" + inDate + '\'' +
                ", outDate='" + outDate + '\'' +
                ", bookPhone='" + bookPhone + '\'' +
                ", bookState='" + bookState + '\'' +
                ", roomTypeId='" + roomTypeId + '\'' +
                ", roomImg='" + roomImg + '\'' +
                ", isReview='" + isReview + '\'' +
                '}';
    }

    public String getIsReview() {
        return isReview;
    }

    public void setIsReview(String isReview) {
        this.isReview = isReview;
    }

    public String getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(String roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookInNum() {
        return bookInNum;
    }

    public void setBookInNum(String bookInNum) {
        this.bookInNum = bookInNum;
    }

    public String getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(String bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookRemark() {
        return bookRemark;
    }

    public void setBookRemark(String bookRemark) {
        this.bookRemark = bookRemark;
    }

    public String getBookDate() {
        return bookDate;
    }

    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }

    public String getInDate() {
        return inDate;
    }

    public void setInDate(String inDate) {
        this.inDate = inDate;
    }

    public String getOutDate() {
        return outDate;
    }

    public void setOutDate(String outDate) {
        this.outDate = outDate;
    }

    public String getBookPhone() {
        return bookPhone;
    }

    public void setBookPhone(String bookPhone) {
        this.bookPhone = bookPhone;
    }

    public String getBookState() {
        return bookState;
    }

    public void setBookState(String bookState) {
        this.bookState = bookState;
    }
}
