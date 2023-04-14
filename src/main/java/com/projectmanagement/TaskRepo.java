package com.projectmanagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.projectmanagement.entities.Task;
@Repository
public interface TaskRepo extends JpaRepository<Task, Integer> {

	@Query("SELECT t FROM Task t JOIN t.projectId p WHERE p.id = :projectId")
	public List<Task> taskOfProject(@Param("projectId") int projectId);
	
}
