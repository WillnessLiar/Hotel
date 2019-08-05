package qiantai.Model;

/**
 * Created by 我不管我最帅 on 2018/6/22.
 */
public class RoomBean {
    private  String roomId;
    private  String roomTypeId;
    private  String roomLocation;
    private  String roomPrice;
    private  String bedSize;
    private  String bedType;
    private  String inNum;
    private  String roomImg;
    private  String roomLimit;
    private  String roomSize;
    private  String roomWifi;
    private  String roomWindow;

    public RoomBean(String roomId, String roomTypeId, String roomLocation, String roomPrice, String bedSize, String bedType, String inNum, String roomImg, String roomLimit, String roomSize, String roomWifi, String roomWindow) {
        this.roomId = roomId;
        this.roomTypeId = roomTypeId;
        this.roomLocation = roomLocation;
        this.roomPrice = roomPrice;
        this.bedSize = bedSize;
        this.bedType = bedType;
        this.inNum = inNum;
        this.roomImg = roomImg;
        this.roomLimit = roomLimit;
        this.roomSize = roomSize;
        this.roomWifi = roomWifi;
        this.roomWindow = roomWindow;
    }

    public RoomBean() {
    }

    @Override
    public String toString() {
        return "RoomBean{" +
                "roomId='" + roomId + '\'' +
                ", roomTypeId='" + roomTypeId + '\'' +
                ", roomLocation='" + roomLocation + '\'' +
                ", roomPrice='" + roomPrice + '\'' +
                ", bedSize='" + bedSize + '\'' +
                ", bedType='" + bedType + '\'' +
                ", inNum='" + inNum + '\'' +
                ", roomImg='" + roomImg + '\'' +
                ", roomLimit='" + roomLimit + '\'' +
                ", roomSize='" + roomSize + '\'' +
                ", roomWifi='" + roomWifi + '\'' +
                ", roomWindow='" + roomWindow + '\'' +
                '}';
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(String roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public String getRoomLocation() {
        return roomLocation;
    }

    public void setRoomLocation(String roomLocation) {
        this.roomLocation = roomLocation;
    }

    public String getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(String roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getBedSize() {
        return bedSize;
    }

    public void setBedSize(String bedSize) {
        this.bedSize = bedSize;
    }

    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }

    public String getInNum() {
        return inNum;
    }

    public void setInNum(String inNum) {
        this.inNum = inNum;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public String getRoomLimit() {
        return roomLimit;
    }

    public void setRoomLimit(String roomLimit) {
        this.roomLimit = roomLimit;
    }

    public String getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }

    public String getRoomWifi() {
        return roomWifi;
    }

    public void setRoomWifi(String roomWifi) {
        this.roomWifi = roomWifi;
    }

    public String getRoomWindow() {
        return roomWindow;
    }

    public void setRoomWindow(String roomWindow) {
        this.roomWindow = roomWindow;
    }
}
