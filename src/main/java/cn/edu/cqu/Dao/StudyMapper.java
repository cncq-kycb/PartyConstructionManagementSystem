package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


import cn.edu.cqu.Model.Study;
import cn.edu.cqu.Model.vStudy;

public interface StudyMapper {

	void insert_study(@Param("study_title")String study_title, @Param("study_status")String study_status, @Param("study_content")String study_content);

	ArrayList<Study> select_all_study();

	ArrayList<vStudy> select_study_list(@Param("study_title")String study_title, @Param("study_status")String study_status);

	vStudy select_study_by_id(@Param("study_id")String study_id);

	void update_study(@Param("study_id")String study_id,@Param("study_title") String study_title, @Param("study_status")String study_status,@Param("study_content") String study_content);

	void delete_study(@Param("study_id")String study_id);
}
