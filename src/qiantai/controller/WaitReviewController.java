package qiantai.controller;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import qiantai.Model.BookBean;
import qiantai.Model.CustomerBean;
import qiantai.Model.RoomBean;
import qiantai.Model.RoomInfoBean;
import qiantai.MyBatisUtil.MyBatisUtil;
import qiantai.mapper.CommentMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/waitReviewController")
public class WaitReviewController {

    @RequestMapping(value = "/waitReview")
    public String waitReview(HttpServletRequest request,
                             HttpServletResponse response){
        //从session获取数据

        CustomerBean cus = (CustomerBean) request.getSession().getAttribute("cub");
        String cusId = cus.getCusId();
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        String bookState = "已完成";
        String isReview = "0";
        ArrayList<BookBean> bookBeans = sqlSession.getMapper(CommentMapper.class).showBook(cusId, bookState, isReview);
        ArrayList<BookBean> list = new ArrayList<>();
        for (BookBean bookBean : bookBeans){
            //实例化一个BookBean的list，然后添加


            RoomInfoBean roomInfoBean = sqlSession.getMapper(CommentMapper.class).showRoomType(bookBean.getRoomId());
            System.out.println("roomTypeId: " + roomInfoBean.getRoomTypeId());

            RoomBean roomBean = sqlSession.getMapper(CommentMapper.class).showOrder(roomInfoBean.getRoomTypeId());
            System.out.println("roomId: " + roomBean.getRoomId());
            System.out.println("bedType: " + roomBean.getBedType());
            System.out.println("roomImg: " + roomBean.getRoomImg());
            System.out.println("roomPrice: " + roomBean.getRoomPrice());

            BookBean bookList = new BookBean();
            bookList.setBookId(bookBean.getBookId());
            bookList.setRoomId(bookBean.getRoomId());
            bookList.setBookState(bookBean.getBookState());
            bookList.setInDate(bookBean.getInDate());
            bookList.setOutDate(bookBean.getOutDate());
            bookList.setBookName(bookBean.getBookName());
            bookList.setBookPhone(bookBean.getBookPhone());
            bookList.setBookDate(bookBean.getBookDate());
            bookList.setRoomTypeId(roomInfoBean.getRoomTypeId());
            bookList.setRoomImg(roomBean.getRoomImg());
            list.add(bookList);
        }
        for (BookBean bookBean:list){
            System.out.println(bookBean.getRoomId());
        }
        JSONObject json = new JSONObject();

        try{
            response.setContentType("text/html;charset=UTF-8");
            JSONArray jsonArray = new JSONArray(list);
            json.put("list",jsonArray);
            PrintWriter out = response.getWriter();
            out.print(json);
//            json.put("list", list);
        }catch (Exception e){
            e.printStackTrace();
        }



        return null;
    }
}
