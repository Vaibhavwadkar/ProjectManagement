package com.projectmanagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.projectmanagement.entities.Task;
@Repository
public interface TaskRepo extends JpaRepository<Task, Integer> {

	@Query("SELECT t FROM Task t JOIN t.projectId p WHERE p.id = :projectId")
	public List<Task> taskOfProject(@Param("projectId") int projectId);
	
	@Query("SELECT t FROM Task t JOIN t.employeeId u WHERE u.id = :employeeId")
	public List<Task> taskOfEmployee(@Param("employeeId") int employeeId);
	
	@Modifying
	//@Query("delete from Task t join t.projectId p join t.employeeId e where p.id = :value1 and e.id = :value2")
	@Query(value = "delete t from task t join project on t.project_id_fk=project.project_id join user on t.emp_id_fk=user.user_id where project.project_id= :value1 and user.user_id= :value2",nativeQuery = true)
	public void removeTask(@Param("value1") int value1, @Param("value2") int value2);
	
	@Query("SELECT t FROM Task t JOIN t.employeeId e WHERE e.id = :employeeId AND taskStatus='pending'")
	public List<Task> taskOfEmp(@Param("employeeId") int employeeId);
	
	@Query("SELECT t FROM Task t JOIN t.employeeId e WHERE e.id = :employeeId AND taskStatus='ready-to-review'")
	public List<Task> taskOfEmpReview(@Param("employeeId") int employeeId);
	
	@Query("SELECT t FROM Task t JOIN t.employeeId e WHERE e.id = :employeeId AND taskStatus='completed'")
	public List<Task> taskOfEmpComplete(@Param("employeeId") int employeeId);
}
