package houtai.controller;

import houtai.Model.PublicBean;
import houtai.MyBatisUtil.MyBatisUtil;
import houtai.mapper.CommentMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/CommentController")
public class CommentController {

    private int pagesNo;
    private String strValue;
    private PublicBean pb;
    private int pageSize = 2;

    public int getPagesNo() {
        return pagesNo;
    }

    public void setPagesNo(int pagesNo) {
        this.pagesNo = pagesNo;
    }

    public String getStrValue() {
        return strValue;
    }

    public void setStrValue(String strValue) {
        this.strValue = strValue;
    }

    public PublicBean getPb() {
        return pb;
    }

    public void setPb(PublicBean pb) {
        this.pb = pb;
    }

    public static Logger logger = Logger.getLogger("CommentController");

    @RequestMapping(value = "/goComment.html")
    public String goComment(@RequestParam(value = "pagesNo")String pagesNo,
                            HttpServletRequest request,
                            HttpServletResponse response){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int ONE = (Integer.parseInt(String.valueOf(pagesNo))-1)*pageSize;
        ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getCommentList(ONE,pageSize);

        


        int count = sqlSession.getMapper(CommentMapper.class).getCommentCount();
        int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        //这里是计算总页数
        request.getSession().setAttribute("pageNo", pagesNo);
        request.getSession().setAttribute("pageNum", pageSum);
        request.getSession().setAttribute("list", list);
        System.out.println("pagesNo:" +pagesNo);
        for (PublicBean publicBean:
             list) {
            logger.debug("评论：" + publicBean);
        }
        System.out.println(pageSum);
        return "/houtai/jsp/comment.jsp";
    }

    @RequestMapping(value = "/fenye")
    public String fenye(HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam(value = "pagesNo") String pagesNo){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        System.out.println(pagesNo);
        System.out.println("strvalue" + strValue);
        response.setContentType("text/html;charset=UTF-8");
        int ONE = (Integer.parseInt(String.valueOf(pagesNo))-1)*pageSize;
        ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getCommentList(ONE,pageSize);
        int count = sqlSession.getMapper(CommentMapper.class).getCommentCount();
        System.out.println("count:" + count);
        int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        request.getSession().setAttribute("pageNo",pagesNo);
        request.getSession().setAttribute("pageNum", pageSum);
        request.getSession().setAttribute("list", list);
        request.getSession().setAttribute("strValue", strValue);
        try{
            response.getWriter().print("ok");
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/updComment")
    public String updComment(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestParam(value = "content") String content,
                             @RequestParam(value = "reviewId") String reviewId){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        System.out.println("content: " + content);
        System.out.println("reviewId: " + reviewId);
       int flag = sqlSession.getMapper(CommentMapper.class).getRsualt(content, reviewId);
        System.out.println("flag: " + flag);
        sqlSession.commit();
        //mybatis默认从缓存里读取数据，需要提交事务。
        if (flag==1){
            ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getCommentList(1,pageSize);
            request.getSession().setAttribute("list", list);
            try{
                response.getWriter().print("ok");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping(value = "/deleteComment")
    public String deleteComment(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestParam(value = "pb.reviewId") String reviewId){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int flag = sqlSession.getMapper(CommentMapper.class).getDeleteRsualt(reviewId);
        System.out.println("delete-flag: " + flag);
        sqlSession.commit();
        if (flag == 1){
            ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getCommentList(1,pageSize);
            request.getSession().setAttribute("list", list);
            //更新页数
            int count = sqlSession.getMapper(CommentMapper.class).getCommentCount();
            int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            request.getSession().setAttribute("pageNo", 1);//刷新到第一页
            request.getSession().setAttribute("pageNum", pageSum);

            try{
                response.getWriter().print("ok");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping(value = "/searchesComment")
    public String searchesComment(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestParam("strValue") String strValue,
                                  @RequestParam("pagesNo") String pagesNo) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int pageNo = Integer.parseInt(String.valueOf(pagesNo));
        String strV = "%" + strValue + "%";
        ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getSearchesComment(strV, pageNo, pageSize);
        int count = sqlSession.getMapper(CommentMapper.class).getCommentCount();
        int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        request.getSession().setAttribute("pageNo", pagesNo);
        request.getSession().setAttribute("pageNum", pageSum);
        request.getSession().setAttribute("list", list);
        try{
            response.getWriter().print("ok");
        }catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

}
