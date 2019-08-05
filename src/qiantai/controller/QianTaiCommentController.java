package qiantai.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import houtai.Model.PublicBean;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import qiantai.MyBatisUtil.MyBatisUtil;
import qiantai.mapper.CommentMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/qiantaiCommentController")
public class QianTaiCommentController {



    private String strValue;
    private PublicBean pb;
    private int pageSize = 2;


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

    @RequestMapping(value = "/qiantaiComment")
    @ResponseBody
    public String qiantaiComment(@RequestParam("pageNo") String pageNo,
                                 HttpServletRequest request,
                                 HttpServletResponse response){
        System.out.println("TestJAVA");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        System.out.println("pageNo:" + pageNo);
        System.out.println("pageSize:" + pageSize);
        int one = Integer.parseInt(String.valueOf(pageNo));
        ArrayList<PublicBean> list = sqlSession.getMapper(CommentMapper.class).getCommentList(one, this.pageSize);
        float curScore = sqlSession.getMapper(CommentMapper.class).queryPercent();//当前总分
        int allcount = sqlSession.getMapper(CommentMapper.class).getCommentCount();//总条数
        float percent=0;//百分比
        percent=curScore/(allcount*5);
            /**System.out.println("当前总分："+curScore);
            System.out.println("总条数"+allCount);
            System.out.println("百分比"+percent);*/
        int pageNum=allcount%pageSize==0?allcount/pageSize:allcount/pageSize+1; //总页数
//        request.getSession().setAttribute("list",list);
////        request.getSession().setAttribute("percents",percent);
////        request.getSession().setAttribute("pNo",pageNo);
////        request.getSession().setAttribute("pageNum",pageNum);
////        try {
////            response.getWriter().print("ok");
////        } catch (IOException e) {
////            e.printStackTrace();
////        }
        JSONObject json = new JSONObject();
        try{
            response.setContentType("text/html;charset=UTF-8");
            json.put("list", list);
            json.put("percents",percent);
            json.put("pNo",pageNo);
            json.put("pageNum",pageNum);
//            response.getWriter().print(json); //返回前台
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }catch (Exception e){
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
}
