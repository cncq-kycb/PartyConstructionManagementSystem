package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Activity;
import cn.edu.cqu.Model.ActivityStatusMap;
import cn.edu.cqu.Model.vActivity;

public interface ActivityMapper {

	ArrayList<ActivityStatusMap> select_activity_status_map();

	ArrayList<vActivity> select_vactivity(@Param("activity_name") String activity_name,
			@Param("activity_status_means") String activity_status_means, @Param("activity_date") String activity_date,
			@Param("activity_location") String activity_location);

	void update_activity_status(@Param("activity_id") String activity_id,
			@Param("activity_status") String activity_status);

	void insert_activity(@Param("activity_name") String activity_name, @Param("branch_id") String branch_id,
			@Param("activity_date") String activity_date, @Param("activity_location") String activity_location,
			@Param("activity_item") String activity_item, @Param("activity_duration") String activity_duration);

	vActivity select_activity_by_id(@Param("activity_id") String activity_id);

}
