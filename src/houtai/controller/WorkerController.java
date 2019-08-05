package houtai.controller;


import com.alibaba.fastjson.JSONObject;
import houtai.Model.WorkerBean;
import houtai.MyBatisUtil.MyBatisUtil;
import houtai.mapper.WorkerMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/WorkerController")
public class WorkerController {
    private int pagesNo;
    private String strValue;
    private WorkerBean wb;
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

    public WorkerBean getWb() { return wb; }

    public void setWb(WorkerBean wb) { this.wb = wb; }

    public static Logger logger = Logger.getLogger("WorkerController");

    @RequestMapping(value = "/goWorker.html")
    public String goWorker(@RequestParam(value = "pagesNo")String pagesNo,
                            HttpServletRequest request,
                            HttpServletResponse response){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int ONE = (Integer.parseInt(String.valueOf(pagesNo))-1)*pageSize;
        ArrayList<WorkerBean> list = sqlSession.getMapper(WorkerMapper.class).getWorkerList(ONE,pageSize);
        int count = sqlSession.getMapper(WorkerMapper.class).getWorkerCount();
        int pageSum = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
        //这里是计算总页数
        request.getSession().setAttribute("pageNo", pagesNo);
        request.getSession().setAttribute("pageNum", pageSum);
        request.getSession().setAttribute("list", list);
        System.out.println("pagesNo:" +pagesNo);
        for (WorkerBean workerBean:
                list) {
            logger.debug("" + workerBean);
        }
        System.out.println(pageSum);
        return "/houtai/jsp/workerinfo.jsp";
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
        ArrayList<WorkerBean> list = sqlSession.getMapper(WorkerMapper.class).getWorkerList(ONE,pageSize);
        int count = sqlSession.getMapper(WorkerMapper.class).getWorkerCount();
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

    @RequestMapping(value = "/updWorker",produces="text/html;charset=UTF-8")
    public String updWorker(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestParam(value = "workerId") String workerId,
                            @RequestParam(value = "workerName") String workerName,
                            @RequestParam(value = "workerPhone") String workerPhone,
                            @RequestParam(value = "address") String address,
                            @RequestParam(value = "position") String position,
                            @RequestParam(value = "workerSex") String workerSex,
                            @RequestParam(value = "isWork") String isWork){
        response.setContentType("text/html;charset=UTF-8");

        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        System.out.println("workerId: " + workerId);
        System.out.println("workerName: " + workerName);
        System.out.println("workerPhone: " + workerPhone);
        System.out.println("address: " + address);
        System.out.println("position: " + position);
        System.out.println("workerSex: " + workerSex);
        System.out.println("isWork: " + isWork);
        //String转型int
//        int one = Integer.parseInt(workerId);

        int flag = sqlSession.getMapper(WorkerMapper.class).getRsualt(workerId, workerName, workerPhone,address,position,workerSex,isWork);
        System.out.println("flag: " + flag);
        sqlSession.commit();
        //mybatis默认从缓存里读取数据，需要提交事务。
        JSONObject json = new JSONObject();
        if (flag==1){
            ArrayList<WorkerBean> list = sqlSession.getMapper(WorkerMapper.class).getWorkerList(1,pageSize);
            request.getSession().setAttribute("list", list);
            try{
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().print("ok");

            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping(value = "/addWorker")
    public void  addWorker(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestParam(value = "workerId") String workerId,
                            @RequestParam(value = "workerName") String workerName,
                            @RequestParam(value = "workerPhone") String workerPhone,
                            @RequestParam(value = "address") String address,
                            @RequestParam(value = "position") String position,
                            @RequestParam(value = "workerSex") String workerSex,
                            @RequestParam(value = "inDate") String inDate,
                            @RequestParam(value = "isWork") String isWork,
                            @RequestParam(value = "status") String status) throws UnsupportedEncodingException {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        WorkerBean wb = new WorkerBean();
        wb.setWorkerId(workerId);
        wb.setWorkerName(workerName);
        wb.setWorkerPhone(workerPhone);
        wb.setAddress(address);
        wb.setPosition(position);
        wb.setWorkerSex(workerSex);
        wb.setInDate(inDate);
        wb.setIsWork(isWork);
        wb.setStatus(status);
        System.out.println(wb.toString());
        System.out.println(workerId);
        System.out.println("--------"+wb.getWorkerId());
        System.out.println("--------"+wb.getWorkerName());
        System.out.println("--------"+wb.getWorkerPhone());
        System.out.println("--------"+wb.getAddress());
        System.out.println("--------"+wb.getPosition());
        System.out.println("--------"+wb.getWorkerSex());
        System.out.println("--------"+wb.getInDate());
        System.out.println("--------"+wb.getIsWork());
        System.out.println("--------"+wb.getStatus());
        int flag = sqlSession.getMapper(WorkerMapper.class).getInsertRsualt(workerId, workerName, workerPhone,address,position,workerSex,inDate,isWork,status);
        System.out.println("flag: " + flag);
        sqlSession.commit();
        System.out.println(flag);
        if (flag==1) {
            try {
                response.getWriter().print("ok");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    @RequestMapping(value = "/deleteWorker")
    public String deleteWorker(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestParam(value = "wb.workerId") String workerId){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int flag = sqlSession.getMapper(WorkerMapper.class).getDeleteRsualt(workerId);
        System.out.println("delete-flag: " + flag);
        sqlSession.commit();
        if (flag == 1){
            ArrayList<WorkerBean> list = sqlSession.getMapper(WorkerMapper.class).getWorkerList(1,pageSize);
            request.getSession().setAttribute("list", list);
            //更新页数
            int count = sqlSession.getMapper(WorkerMapper.class).getWorkerCount();
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

    @RequestMapping(value = "/searchesWorker")
    public String searchesWorker(HttpServletRequest request,
                                  HttpServletResponse response,
                                  @RequestParam("strValue") String strValue,
                                  @RequestParam("pagesNo") String pagesNo) {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        int pageNo = Integer.parseInt(String.valueOf(pagesNo));
        String strV = "%" + strValue + "%";
        ArrayList<WorkerBean> list = sqlSession.getMapper(WorkerMapper.class).getSearchesWorker(strV, pageNo, pageSize);
        int count = sqlSession.getMapper(WorkerMapper.class).getWorkerCount();
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
