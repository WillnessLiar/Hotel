package houtai.controller;

import houtai.Model.SuperManageBean;
import houtai.MyBatisUtil.MyBatisUtil;
import houtai.mapper.CommentMapper;
import houtai.mapper.SuperMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/SuperController")
public class SuperController {

    private String id;
    private String password;
    private SuperManageBean superManageBean;

    public SuperManageBean getSuperManageBean() {
        return superManageBean;
    }

    public void setSuperManageBean(SuperManageBean superManageBean) {
        this.superManageBean = superManageBean;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static Logger logger = Logger.getLogger("SuperController");

    @RequestMapping(value = "/goIndex")
    public String goIndex(@RequestParam("loginId") String loginId,
                          @RequestParam("passwd") String passwd,
                          HttpServletRequest request,
                          HttpServletResponse response){
        System.out.println("loginId:" + loginId + "passwd:" + passwd);
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        SuperManageBean superManageBean = sqlSession.getMapper(SuperMapper.class).getSuperManage(loginId, passwd);
        if (superManageBean != null){
            request.getSession().setAttribute("user",superManageBean);
            return "/houtai/jsp/index.jsp";
        }else {
            return "/houtai/jsp/superlogin.jsp";
        }




//        ArrayList<SuperManageBean> list = sqlSession.getMapper(SuperMapper.class).getSuper();
////        for (SuperManageBean s :
////                list) {
////            logger.debug("super:" + s);
////        }
//        request.getSession().removeAttribute("user");
//        id = list.iterator().next().getLoginId();
//        password = list.iterator().next().getPasswd();
//        if (loginId.equals(id) && passwd.equals(password)){
//            request.getSession().setAttribute("user",id);
//            return "/houtai/jsp/dw.jsp";
//        }else {
//            return "/houtai/jsp/superlogin.jsp";
//        }
    }
}
