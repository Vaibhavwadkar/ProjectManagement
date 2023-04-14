package com.projectmanagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.projectmanagement.entities.User;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
	
	@Query("SELECT u FROM com.projectmanagement.entities.User u where u.email=?1 AND u.password=?2")
	public User validateUser(String unm, String pwd);
	
	@Query("FROM com.projectmanagement.entities.User u where u.role='employee'")
	public List<User> empList();
	
	@Query("FROM com.projectmanagement.entities.User u where u.role='employee' AND u.status='free'")
	public List<User> freeEmpList();
	
	

}
