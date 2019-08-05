package houtai.mapper;

import houtai.Model.SuperManageBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface SuperMapper {
    /**
     * 后台登陆验证 superManage 是否存在
     * */
    SuperManageBean getSuperManage(@Param("loginId") String loginId, @Param("passwd") String passwd);

    /**
     * 测试用
     * */
    ArrayList<SuperManageBean> getSuper();

}
