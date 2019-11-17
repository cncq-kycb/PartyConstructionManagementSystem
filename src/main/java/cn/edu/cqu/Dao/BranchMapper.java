package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Branch;

public interface BranchMapper {

	void insert(Branch branch);

	ArrayList<Branch> select(@Param("branch_name") String branch_name);

	void delete(String branch_id);

	void update(Branch branch);

	String select_name_by_id(String branch_id);

	ArrayList<String> select_id_by_name(String branch_name);

}
