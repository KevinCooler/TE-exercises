package com.techelevator.projects.model.jdbc;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.projects.model.Project;
import com.techelevator.projects.model.ProjectDAO;

public class JDBCProjectDAO implements ProjectDAO {

	private JdbcTemplate jdbcTemplate;

	public JDBCProjectDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Project> getAllActiveProjects() {
		List<Project> projects = new ArrayList<Project>();
		
		String sqlSelectActiveProjects = "select * from project where (from_date is not null) and (from_date < current_date) and (to_date > current_date or to_date is null)";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectActiveProjects);
		while(result.next()) {
			projects.add(mapRowToProject(result));
		}
		return projects;
		
	}

	@Override
	public void removeEmployeeFromProject(Long projectId, Long employeeId) {
		String sqlDeleteEmployeeProjectConnection = "delete from project_employee where project_id = ? and employee_id = ?";
		jdbcTemplate.update(sqlDeleteEmployeeProjectConnection, projectId, employeeId);
	}

	@Override
	public void addEmployeeToProject(Long projectId, Long employeeId) {
		String sqlInsertEmployeeProjectConnection = "insert into project_employee (project_id, employee_id) values (?, ?)";
		jdbcTemplate.update(sqlInsertEmployeeProjectConnection, projectId, employeeId);
	}
	
	private Project mapRowToProject(SqlRowSet result) {
		Project project = new Project();
		
		project.setId(result.getLong("project_id"));
		project.setName(result.getString("name"));
		if(result.getDate("from_date") == null) {
			project.setStartDate(null);
		}
		else {
			project.setStartDate(result.getDate("from_date").toLocalDate());
		}
		if(result.getDate("to_date") == null) {
			project.setEndDate(null);
		}
		else {
			project.setEndDate(result.getDate("to_date").toLocalDate());
		}
		
		return project;
	}

}
