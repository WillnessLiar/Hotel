package houtai.mapper;

import houtai.Model.PublicBean;
import houtai.Model.SuperManageBean;
import org.apache.ibatis.annotations.Param;
import qiantai.Model.CustomerBean;

import java.lang.reflect.Array;
import java.util.ArrayList;

public interface CommentMapper {

    /**
     * 查询全部酒店评论 和 分页查询 都使用下面这条sql语句
     * */
    ArrayList<PublicBean> getCommentList(@Param("pagesNo") int pageNo, @Param("pageSize") int pageSize);

    ArrayList<PublicBean> getCommentList1();

    /**
     * 条件查询酒店评论
     * 【已弃用】
     * */
    ArrayList<PublicBean> getCommentListWithLike(int pageNo,int pageSize,String strValue);

    /**
     * 查询所有酒店评论条数
     * */
    int getCommentCount();

    /**
     * 条件查询酒店评论条数
     * */
    int getCommentCountWithLike(String strValue);

    /**
     * 后台登陆验证是否存在 superManage
     * */
    SuperManageBean getSuperManage(String loginId, String passwd);

    /**
     * 后台修改更新评论，返回是否成功类型
     * */
   int getRsualt(@Param("content") String content, @Param("reviewId") String reviewId);

   /**
    * 后台删除 reviewId的 评论
    * */
   int getDeleteRsualt(@Param("reviewId") String reviewId);

   /**
    * 后台查询 搜索条件 strValue 的评论
    * */
   ArrayList<PublicBean> getSearchesComment(@Param("strValue") String strValue, @Param("pagesNo") int pagesNo, @Param("pageSize") int pageSize);

   /**
    * 后台查询所有用户信息  执行查询两条用户信息的sql语句
    * */
   ArrayList<CustomerBean> getCustomerList(@Param("pagesNo") int pagesNo, @Param("pageSize") int pageSize);

   /**
    * 后台修改用户信息  返回是否成功类型
    * */
   int getUpdate(@Param("cusPasswd") String cusPasswd, @Param("trueName") String trueName, @Param("cusPhone") String cusPhone, @Param("cusSex") String cusSex, @Param("cusImg") String cusImg, @Param("cusId") String cusId);

   /**
    * 后台删除cusId用户信息
    * */
   int getDelete(@Param("cusId") String cusId);

   /**
    * 查询所有用户数量
    * */
   int getCustomerCount();

   /**
    * 检测账号是否存在
    * */
   boolean checkCusId(@Param("cusId") String cusId);

   /**
    * 检测手机号是否存在
    * */

}
