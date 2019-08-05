package houtai.mapper;

import houtai.Model.SuperManageBean;
import houtai.Model.WorkerBean;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface WorkerMapper {
    ArrayList<WorkerBean> getWorkerList(@Param("pagesNo") int pageNo, @Param("pageSize") int pageSize);

    ArrayList<WorkerBean> getWorkerList1();

    ArrayList<WorkerBean> getWorkerListWithLike(int pageNo, int pageSize, String strValue);

    int getWorkerCount();

    ArrayList<WorkerBean> getSearchesWorker(@Param("strValue") String strValue, @Param("pagesNo") int pagesNo, @Param("pageSize") int pageSize);

    int getWorkerCountWithLike(String strValue);

    SuperManageBean getSuperManage(String loginId, String passwd);

    int getRsualt(@Param("workerId") String workerId, @Param("workerName") String workerName, @Param("workerPhone") String workerPhone, @Param("address") String address, @Param("position") String position, @Param("workerSex") String workerSex, @Param("isWork") String isWork);

    int getDeleteRsualt(@Param("workerId") String workerId);

    int getInsertRsualt(@Param("workerId") String workerId, @Param("workerName") String workerName, @Param("workerPhone") String workerPhone, @Param("address") String address, @Param("position") String position, @Param("workerSex") String workerSex, @Param("inDate") String inDate, @Param("isWork") String isWork, @Param("status") String status);

    int insertData(WorkerBean workerBean);

}

