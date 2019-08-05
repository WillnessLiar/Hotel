package houtai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/tiaozhuanController")
public class TiaoZhuanController {
    @RequestMapping(value = "/goSuperLogin")
    public String goSuperLogin(HttpServletRequest request,
                               HttpServletResponse response){
        request.getSession().removeAttribute("user");
        return "/houtai/jsp/superlogin.jsp";
    }
}
