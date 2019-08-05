package org.fkit.tst;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.fkit.MyBatisUtil.MyBatisUtil;
import org.fkit.domain.User;
import org.fkit.mapper.UserMapper;

import java.util.List;


public class MyBatisTestFac {

    public static Logger logger = Logger.getLogger("MyBatisTestFac");

    public static void getUserList(){
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        List<User> userList = sqlSession.getMapper(UserMapper.class).getUserList();

        for (User user : userList) {
            logger.debug("用户：" + user);
//            System.out.println(user.getId());
//            System.out.println(user.getName());
//            System.out.println(user.getSex());
//            System.out.println(user.getAge());

        }

    }

    public static void main(String[] args){
        getUserList();
    }
}
