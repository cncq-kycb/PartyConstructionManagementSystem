package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Question;

public interface TestMapper {

	void insert_question(@Param("question_problem") String question_problem,
			@Param("question_option_a") String question_option_a, @Param("question_option_b") String question_option_b,
			@Param("question_option_c") String question_option_c, @Param("question_option_d") String question_option_d,
			@Param("question_answer") String question_answer);

	ArrayList<Question> select_all_question();

	void update_question(@Param("question_id") String question_id, @Param("question_problem") String question_problem,
			@Param("question_option_a") String question_option_a, @Param("question_option_b") String question_option_b,
			@Param("question_option_c") String question_option_c, @Param("question_option_d") String question_option_d,
			@Param("question_answer") String question_answer);

	void delete_question(@Param("question_id") String question_id);

	void insert_test(@Param("test_id") int test_id, @Param("test_name") String test_name,
			@Param("test_date_start") String test_date_start, @Param("test_date_end") String test_date_end);

	void insert_examination(@Param("test_id") String test_id, @Param("question_id") String question_id);

	int select_curr_test_id();

}