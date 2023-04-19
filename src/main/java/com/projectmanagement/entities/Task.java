package com.projectmanagement.entities;

import java.sql.Date;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Task {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "task_id")
	private int id;
	
	@Column(name = "task_name")
    private String taskName;
 
    @Column(name = "task_description")
    private String taskDesc;
    
    @Column(name = "task_start_date")
	private Date taskStartDate;

	@Column(name = "task_due_date")
	private Date taskDueDate;
	
	@Column(name = "task_completed_date")
	private Date taskCompletedDate;
	
	@Column(name = "task_priority")
	private String taskPriority;

	@Column(name = "task_status")
	private String taskStatus;
	
	@Column(name = "task_comment")
	private String taskComment;
	
	
	@Column(name = "task_remark")
	private String taskRemark;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_id_fk",nullable = false)
	private Project projectId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "emp_id_fk",nullable = false)
	private User employeeId;
	
	public Task() {
		// TODO Auto-generated constructor stub
	}

	public Task(String taskName, String taskDesc, Date taskStartDate, Date taskDueDate,Date taskCompletedDate, String taskStatus,String taskComment,String taskPriority,String taskRemark,
			Project projectId, User employeeId) {
		super();
		this.taskName = taskName;
		this.taskDesc = taskDesc;
		this.taskStartDate = taskStartDate;
		this.taskDueDate = taskDueDate;
		this.taskCompletedDate = taskCompletedDate;
		this.taskStatus = taskStatus;
		this.taskComment = taskComment;
		this.taskPriority = taskPriority;
		this.taskRemark= taskRemark;
		this.projectId = projectId;
		this.employeeId = employeeId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}

	public Date getTaskStartDate() {
		return taskStartDate;
	}

	public void setTaskStartDate(Date taskStartDate) {
		this.taskStartDate = taskStartDate;
	}

	public Date getTaskDueDate() {
		return taskDueDate;
	}

	public void setTaskDueDate(Date taskDueDate) {
		this.taskDueDate = taskDueDate;
	}
	
	

	public Date getTaskCompletedDate() {
		return taskCompletedDate;
	}

	public void setTaskCompletedDate(Date taskCompletedDate) {
		this.taskCompletedDate = taskCompletedDate;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	
	public String getTaskComment() {
		return taskComment;
	}

	public void setTaskComment(String taskComment) {
		this.taskComment = taskComment;
	}

	public String getTaskPriority() {
		return taskPriority;
	}

	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}

	public String getTaskRemark() {
		return taskRemark;
	}

	public void setTaskRemark(String taskRemark) {
		this.taskRemark = taskRemark;
	}

	public Project getProjectId() {
		return projectId;
	}

	public void setProjectId(Project projectId) {
		this.projectId = projectId;
	}

	public User getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(User employeeId) {
		this.employeeId = employeeId;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", taskName=" + taskName + ", taskDesc=" + taskDesc + ", taskStartDate="
				+ taskStartDate + ", taskDueDate=" + taskDueDate + ", taskStatus=" + taskStatus + ", projectId="
				+ projectId + ", employeeId=" + employeeId + "]";
	}
	
	

}
