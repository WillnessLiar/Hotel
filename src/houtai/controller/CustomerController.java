package houtai.controller;

import houtai.MyBatisUtil.MyBatisUtil;
import houtai.mapper.CommentMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import qiantai.Model.CustomerBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;



@Controller
@RequestMapping(value = "/CustomerController")
public class CustomerController {
    private CustomerBean cub;
    private int pagesNo;
    private String strValue;
    private int pageSize = 2;

    public CustomerBean getCub() {
        return cub;
    }

    public void setCub(CustomerBean cub) {
        this.cub = cub;
    }

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


    public static Logger logger = Logger.getLogger("CustomerController");

    @RequestMapping(value = "/showAllCus")
    public String showAllCus(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestParam("pagesNo") String pagesNo){
        System.out.println("pagesNo : " + pagesNo);
        System.out.println("strValue : " + strValue);
        request.getSession().removeAttribute("strValue");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int ONE = (Integer.parseInt(String.valueOf(pagesNo))-1)*pageSize;
        ArrayList<CustomerBean> list = sqlSession.getMapper(CommentMapper.class).getCustomerList(ONE, pageSize);
        for (CustomerBean customerBean : list){
            logger.debug("用户 ： " + customerBean);
        }

        //这里是计算总页数
        int count = sqlSession.getMapper(CommentMapper.class).getCustomerCount();
        int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        request.getSession().setAttribute("pageNo", pagesNo);
        request.getSession().setAttribute("pageNum", pageSum);
        request.getSession().setAttribute("list", list);
        System.out.println("pagesNo:" +pagesNo);
        System.out.println("pageSum：" + pageSum);




        return "/houtai/jsp/customerinfo.jsp";
    }

    @RequestMapping(value = "/udpCus")
    public String udpCus(HttpServletRequest request,
                         HttpServletResponse response,
                         @RequestParam("cub.cusId") String cusId,
                         @RequestParam("cub.cusPasswd") String cusPasswd,
                         @RequestParam("cub.trueName") String trueName,
                         @RequestParam("cub.cusPhone" )String cusPhone,
                         @RequestParam("cub.cusSex") String cusSex,
                         @RequestParam("cub.cusImg") String cusImg){

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        System.out.println("cusId" + cusId);
        System.out.println("cusPasswd" + cusPasswd);
        System.out.println("trueName" + trueName);
        System.out.println("cusPhone" + cusPhone);
        System.out.println("cusSex" + cusSex);
        System.out.println("cusImg" + cusImg);

        int flag = sqlSession.getMapper(CommentMapper.class).getUpdate(cusPasswd, trueName, cusPhone, cusSex, cusImg, cusId);
        System.out.println("flag : " + flag);
        sqlSession.commit();
        if (flag == 1){
            ArrayList<CustomerBean> list = sqlSession.getMapper(CommentMapper.class).getCustomerList(1, pageSize);
            request.getSession().setAttribute("list", list);
            try {
                response.getWriter().print("ok");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
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
        ArrayList<CustomerBean> list = sqlSession.getMapper(CommentMapper.class).getCustomerList(ONE, pageSize);
        int count = sqlSession.getMapper(CommentMapper.class).getCustomerCount();
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

    @RequestMapping(value = "/deleteCus")
    public String deleteCustomer(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestParam(value = "cub.cusId") String cusId){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int flag = sqlSession.getMapper(CommentMapper.class).getDelete(cusId);
        System.out.println("delete-flag: " + flag);
        sqlSession.commit();
        if (flag == 1){

            ArrayList<CustomerBean> list = sqlSession.getMapper(CommentMapper.class).getCustomerList(1, pageSize);
            request.getSession().setAttribute("list", list);
            //更新页数
            int count = sqlSession.getMapper(CommentMapper.class).getCustomerCount();
            int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
            request.getSession().setAttribute("pageNo", 1);//刷新到第一页
            request.getSession().setAttribute("pageNum", pageSum);
            try {
                response.getWriter().print("ok");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return null;
    }
}
