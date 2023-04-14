package com.projectmanagement.entities;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

@Entity
public class Project {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_id")
	private int id;
	
	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_description")
	private String projectDesc;

	@Column(name = "project_start_date")
	private Date projectStartDate;

	@Column(name = "project_due_date")
	private Date projectDueDate;

	@Column(name = "project_status")
	private String projectStatus;
	
	@Column(name = "project_remark")
	private String projectRemark;
	
	@ManyToOne
	@JoinColumn(name = "manager_id")
	private User manager;
	
	@ManyToMany
	private List<User> employee_id;
	
	public Project() {
		// TODO Auto-generated constructor stub
	}

	

	public Project(String projectName, String projectDesc, Date projectStartDate, Date projectDueDate,
			String projectStatus, String projectRemark, User manager, List<User> employee_id) {
		super();
		this.projectName = projectName;
		this.projectDesc = projectDesc;
		this.projectStartDate = projectStartDate;
		this.projectDueDate = projectDueDate;
		this.projectStatus = projectStatus;
		this.projectRemark = projectRemark;
		this.manager = manager;
		this.employee_id = employee_id;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDesc() {
		return projectDesc;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}

	public Date getProjectStartDate() {
		return projectStartDate;
	}

	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}

	public Date getProjectDueDate() {
		return projectDueDate;
	}

	public void setProjectDueDate(Date projectDueDate) {
		this.projectDueDate = projectDueDate;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	
	

	public String getProjectRemark() {
		return projectRemark;
	}



	public void setProjectRemark(String projectRemark) {
		this.projectRemark = projectRemark;
	}



	public User getManager() {
		return manager;
	}

	public void setManager(User manager) {
		this.manager = manager;
	}

	public List<User> getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(List<User> employee_id) {
		this.employee_id = employee_id;
	}



	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName + ", projectDesc=" + projectDesc
				+ ", projectStartDate=" + projectStartDate + ", projectDueDate=" + projectDueDate + ", projectStatus="
				+ projectStatus + ", projectRemark=" + projectRemark + ", manager=" + manager + ", employee_id="
				+ employee_id + "]";
	}

	
	
	
	
}
