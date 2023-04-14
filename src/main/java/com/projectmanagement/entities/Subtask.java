package com.projectmanagement.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Subtask {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "subtask_id")
	private int id;
	
	@Column(name = "subtask_name")
    private String subtaskName;
    
    @Column(name = "subtask_description")
    private String subtaskDesc;
    
    @Column(name = "subtask_status")
    private String subtaskStatus;
    
    @ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "task_id_fk",nullable = false)
	private Task taskId;
    
    public Subtask() {
		// TODO Auto-generated constructor stub
	}

	public Subtask(String subtaskName, String subtaskDesc, String subtaskStatus, Task taskId) {
		super();
		this.subtaskName = subtaskName;
		this.subtaskDesc = subtaskDesc;
		this.subtaskStatus = subtaskStatus;
		this.taskId = taskId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubtaskName() {
		return subtaskName;
	}

	public void setSubtaskName(String subtaskName) {
		this.subtaskName = subtaskName;
	}

	public String getSubtaskDesc() {
		return subtaskDesc;
	}

	public void setSubtaskDesc(String subtaskDesc) {
		this.subtaskDesc = subtaskDesc;
	}

	public String getSubtaskStatus() {
		return subtaskStatus;
	}

	public void setSubtaskStatus(String subtaskStatus) {
		this.subtaskStatus = subtaskStatus;
	}

	public Task getTaskId() {
		return taskId;
	}

	public void setTaskId(Task taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "Subtask [id=" + id + ", subtaskName=" + subtaskName + ", subtaskDesc=" + subtaskDesc
				+ ", subtaskStatus=" + subtaskStatus + ", taskId=" + taskId + "]";
	}
    
    
}
