package com.projectmanagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.projectmanagement.entities.Project;
import com.projectmanagement.entities.User;

@Repository
public interface ProjectRepo extends JpaRepository<Project, Integer> {
	
	@Query("SELECT p FROM Project p JOIN p.manager m WHERE m.id= :managerId")
	public List<Project> allProjectsofmgr(@Param("managerId") int managerId);
	
	@Query("SELECT u FROM User u JOIN u.project_id p WHERE p.id = :projectId")
	public List<User> empListforproject(@Param("projectId") int projectId);
	
	@Query("SELECT p FROM Project p JOIN p.manager m WHERE p.projectStatus = 'pending' AND m.id= :managerId")
	public List<Project> projetListPending(@Param("managerId") int managerId);
	
	@Query("SELECT p FROM Project p JOIN p.manager m WHERE p.projectStatus = 'completed' AND m.id= :managerId")
	public List<Project> projetListCompleted(@Param("managerId") int managerId);
	
	@Query("SELECT p FROM Project p JOIN p.employee_id e WHERE e.id = :employeeId")
	public List<Project> findProjectsByEmployeeId(@Param("employeeId") int employeeId);
	
//	@Modifying
//	@Query("DELETE p.employee_id FROM Project p WHERE p.id = :projectId AND :employeeId MEMBER OF p.employee_id")
//	public void removeAssignedEmp(@Param("projectId") int projectId, @Param("employeeId") int employeeId);

	@Modifying
	@Query(value = "delete from project_employee_id where employee_id_user_id= :employeeId",nativeQuery = true)
	public void removeAssignedEmp(@Param("employeeId") int employeeId);
	
}
