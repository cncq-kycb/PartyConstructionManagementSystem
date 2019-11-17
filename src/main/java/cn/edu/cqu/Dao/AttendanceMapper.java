package cn.edu.cqu.Dao;

import java.util.ArrayList;

import cn.edu.cqu.Model.vAttendance;

public interface AttendanceMapper {

	String total_time_by_student_id(String student_id);

	String total_duration_by_student_id(String student_id);

	ArrayList<vAttendance> select_all_by_student_id(String student_id);

	String total_duration_by_branch_id(String branch_id);

	String total_time_by_branch_id(String branch_id);

	ArrayList<vAttendance> select_all_by_branch_id(String branch_id);

	ArrayList<vAttendance> select_now_by_student_id(String student_id);

}
