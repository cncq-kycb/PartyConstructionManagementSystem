package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.vAttendance;

public interface AttendanceMapper {

	String total_time_by_student_id(String student_id);

	String total_duration_by_student_id(String student_id);

	ArrayList<vAttendance> select_all_by_student_id(String student_id);

	String total_duration_by_branch_id(String branch_id);

	String total_time_by_branch_id(String branch_id);

	ArrayList<vAttendance> select_all_by_branch_id(String branch_id);

	ArrayList<vAttendance> select_now_by_student_id(String student_id);

	void add_pic_for_attendance(@Param("student_id") String student_id, @Param("activity_id") String activity_id,
			@Param("attendance_pic") String attendance_pic);

	void absent_for_attendance(@Param("student_id") String student_id, @Param("activity_id") String activity_id);

	ArrayList<vAttendance> select_all_by_activity_id(String activity_id);

	int count_sign_in_num_by_activity_id(String activity_id);

	int count_total_num_by_activity_id(String activity_id);

}
