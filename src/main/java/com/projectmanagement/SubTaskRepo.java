package com.projectmanagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.projectmanagement.entities.Subtask;


@Repository
public interface SubTaskRepo extends JpaRepository<Subtask, Integer> {

	@Query("SELECT s FROM Subtask s JOIN s.taskId t WHERE t.id = :taskId")
	public List<Subtask> subtaskOfTask(@Param("taskId") int taskId);
	
	@Modifying
	@Query("DELETE FROM Subtask s WHERE s.id= :subTaskId")
	public void removeSubTask(@Param("subTaskId") int subTaskId);
	
}
