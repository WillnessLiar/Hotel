package qiantai.Model;

public class RoomInfoBean {
    private String roomId;
    private String roomTypeId;
    private String roomState;
    private String roomLocation;

    public RoomInfoBean(String roomId, String roomTypeId, String roomState, String roomLocation) {
        this.roomId = roomId;
        this.roomTypeId = roomTypeId;
        this.roomState = roomState;
        this.roomLocation = roomLocation;
    }

    @Override
    public String toString() {
        return "RoomInfoBean{" +
                "roomId='" + roomId + '\'' +
                ", roomTypeId='" + roomTypeId + '\'' +
                ", roomState='" + roomState + '\'' +
                ", roomLocation='" + roomLocation + '\'' +
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

    public String getRoomState() {
        return roomState;
    }

    public void setRoomState(String roomState) {
        this.roomState = roomState;
    }

    public String getRoomLocation() {
        return roomLocation;
    }

    public void setRoomLocation(String roomLocation) {
        this.roomLocation = roomLocation;
    }

    public RoomInfoBean() {
    }
}
