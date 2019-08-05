package qiantai.mapper;

import houtai.Model.PublicBean;
import org.apache.ibatis.annotations.Param;
import qiantai.Model.BookBean;
import qiantai.Model.CustomerBean;
import qiantai.Model.RoomBean;
import qiantai.Model.RoomInfoBean;

import java.util.ArrayList;

public interface CommentMapper {
    /**
     * 前台点击 酒店评论 查询所有酒店评论 和 分页查询 都使用下面这条sql语句
     * */
    ArrayList<PublicBean> getCommentList(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);

    /**
     * 返回 reviewinfo 里的 reviewScore 的 sum值
     */
    int queryPercent();

    /**
     * 查询所有酒店评论条数
     * */
    int getCommentCount();


    /**
     * 主页登陆  特殊情况  放在这里
     * */
    CustomerBean getLogin(@Param("cusId") String cusId, @Param("cusPasswd") String cusPasswd);

    /**
     * 主页登陆-查询评价是否完成   特殊情况  放在这里
     * */
    int getBookSum(@Param("cusId") String cusId, @Param("bookState") String bookState);

    int getRrviewSum(@Param("cusId") String cusId, @Param("bookState") String bookState, @Param("isReview") String isReview);

    /**
     * 以上
     * */

    /**
     * 查询订单，已完成未评价   对应在在exclusive 的personal.java的BookDao里。三表联合查询，分解为三个查询语句。赶时间
     * */

    ArrayList<BookBean> showBook(@Param("cusId") String cusId, @Param("bookState") String bookState, @Param("isReview") String isReview);
    RoomInfoBean showRoomType(@Param("roomId") String roomId);
    RoomBean showOrder(@Param("roomTypeId") String roomTypeId);

    /**
     * 在 待评价 点击后  加入评价 sql语句
     * */
    boolean publicReview(@Param("reviewId") String reviewId, @Param("cusId") String cusId, @Param("bookId") String bookId, @Param("reviewType") String reviewType, @Param("reviewScore") String reviewScore, @Param("content") String content, @Param("reviewDate") String reviewDate);

    /**
     * (修改)未评价--到已评价  上面方法的函数体中
     * */
    boolean finshReview(@Param("isReview") int isReview, @Param("bookId") String bookId);

    /**
     * 查询订单待评价的条数 (已完成（1）但还没评价（0）)
     * */
    int reviewSum(@Param("cusId") String cusId, @Param("bookState") String bookState, @Param("isReview") String isReview);
}
