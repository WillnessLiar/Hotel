package houtai.Model;

/**
 * Created by 我不管我最帅 on 2018/6/25.
 */
public class PublicBean {
    private String reviewId;
    private String cusId;
    private String bookId;
    private String reviewType;
    private String reviewScore;
    private String content;
    private String reviewDate;
    private String cusImg;

    public String getCusImg() {
        return cusImg;
    }

    public void setCusImg(String cusImg) {
        this.cusImg = cusImg;
    }

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public String getCusId() {
        return cusId;
    }

    public void setCusId(String cusId) {
        this.cusId = cusId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getReviewType() {
        return reviewType;
    }

    public void setReviewType(String reviewType) {
        this.reviewType = reviewType;
    }

    public String getReviewScore() {
        return reviewScore;
    }

    public void setReviewScore(String reviewScore) {
        this.reviewScore = reviewScore;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public PublicBean(String reviewId, String cusId, String bookId, String reviewType, String reviewScore, String content, String reviewDate, String cusImg) {
        this.reviewId = reviewId;
        this.cusId = cusId;
        this.bookId = bookId;
        this.reviewType = reviewType;
        this.reviewScore = reviewScore;
        this.content = content;
        this.reviewDate = reviewDate;
        this.cusImg = cusImg;
    }

    public PublicBean() {
    }

    @Override
    public String toString() {
        return "PublicBean{" +
                "reviewId='" + reviewId + '\'' +
                ", cusId='" + cusId + '\'' +
                ", bookId='" + bookId + '\'' +
                ", reviewType='" + reviewType + '\'' +
                ", reviewScore='" + reviewScore + '\'' +
                ", content='" + content + '\'' +
                ", reviewDate='" + reviewDate + '\'' +
                ", cusImg='" + cusImg + '\'' +
                '}';
    }
}
