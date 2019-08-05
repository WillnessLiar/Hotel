package qiantai.controller;

import houtai.Model.PublicBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import qiantai.MyBatisUtil.MyBatisUtil;
import qiantai.mapper.CommentMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping(value = "/publicReviewController")
public class PublicReviewController {

    private PublicBean publicBean;

    public PublicBean getPublicBean() {
        return publicBean;
    }

    public void setPublicBean(PublicBean publicBean) {
        this.publicBean = publicBean;
    }

    @RequestMapping(value = "/execute")
    public String execute(HttpServletRequest request,
                          HttpServletResponse response,
                          @RequestParam("publicbean.reviewId") String reviewId,
                          @RequestParam("publicbean.cusId") String cusId,
                          @RequestParam("publicbean.bookId") String bookId,
                          @RequestParam("publicbean.reviewType") String reviewType,
                          @RequestParam("publicbean.reviewScore") String reviewScore,
                          @RequestParam("publicbean.content") String content,
                          @RequestParam("publicbean.reviewDate") String reviewDate){

        System.out.println("reviewId: " + reviewId);
        System.out.println("cusId: " + cusId);
        System.out.println("bookId: " + bookId);
        System.out.println("reviewType: " + reviewType);
        System.out.println("reviewScore: " + reviewScore);
        System.out.println("content: " + content);
        System.out.println("reviewDate: " + reviewDate);

        SqlSession sqlSession = MyBatisUtil.getSqlSession();//插入              下面sql语句
        boolean flag = sqlSession.getMapper(CommentMapper.class).publicReview(reviewId, cusId, bookId, reviewType, reviewScore, content, reviewDate);
        if (flag){
            boolean finsh = sqlSession.getMapper(CommentMapper.class).finshReview(1,bookId); //更改订单状态，把状态改为已评论
            System.out.println("is finish? : " + finsh);
            String bookState = "已完成";
            String isReview = "0";
            int reviewSum = sqlSession.getMapper(CommentMapper.class).reviewSum(cusId, bookState, isReview); //更新待评价数
            System.out.println("reviewSum: " + reviewSum);
            request.getSession().setAttribute("reviewSum", reviewSum);  //待评价数
            sqlSession.commit();
            try{
                response.getWriter().print("ok");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}
