package qiantai.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import qiantai.Model.CustomerBean;
import qiantai.MyBatisUtil.MyBatisUtil;
import qiantai.mapper.CommentMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/loginController")
public class LoginController {

    private CustomerBean customer;
    private String flags;

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public String getFlags() {
        return flags;
    }

    public void setFlags(String flags) {
        this.flags = flags;
    }

    private CustomerBean cus;
    private boolean code;

    public CustomerBean getCus() {
        return cus;
    }

    public void setCus(CustomerBean cus) {
        this.cus = cus;
    }

    public boolean isCode() {
        return code;
    }

    public void setCode(boolean code) {
        this.code = code;
    }

    @RequestMapping(value = "/execute")
    public String execute(@RequestParam("cus.cusId") String cusId,
                          @RequestParam("cus.cusPasswd") String cusPasswd,
                          @RequestParam("cus.cusCode") String cusCode,
                          @RequestParam("code") String s,
                          HttpServletRequest request,
                          HttpServletResponse response){
        System.out.println("cusId: " + cusId);
        System.out.println("cusPasswd: " + cusPasswd);
        System.out.println("cusCode: " + cusCode);
        System.out.println("code: " + s);
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        CustomerBean customerBean = sqlSession.getMapper(CommentMapper.class).getLogin(cusId, cusPasswd);
        System.out.println("查询出的cusId: " + customerBean.getCusId());
        System.out.println("查询出的image：" + customerBean.getCusImg());
        if (customerBean != null){
            SqlSession sqlSession1 = MyBatisUtil.getSqlSession();
            int bookSum = sqlSession1.getMapper(CommentMapper.class).getBookSum(cusId, "未完成");
            String One = String.valueOf(0);
            int reviewSum = sqlSession1.getMapper(CommentMapper.class).getRrviewSum(cusId, "已完成",One);
            request.getSession().setAttribute("cub", customerBean);
            request.getSession().setAttribute("bookSum", bookSum);
            request.getSession().setAttribute("reviewSum", reviewSum);
            try{
                response.getWriter().print("ok");

            }catch (IOException e){
                e.printStackTrace();
            }
        }

        return null;
    }

    @RequestMapping(value = "/register")
    public String register(HttpServletRequest request,
                           HttpServletResponse response){
        response.setContentType("text/plain; charset=utf-8");

        CustomerBean cub=new CustomerBean();

        return "/houtai/jsp/index.jsp";
    }
}
