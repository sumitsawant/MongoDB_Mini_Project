/**
 * 
 */
package com.dao;

import java.util.List;

import com.model.StudentModel;

/**
 * @author Compaq
 *
 */
public interface StudentDAO {
	
	void insertStudent(StudentModel studentModel);
	void updateStudent(StudentModel studentModel);
	void deleteStudent(String studentId);
	List<StudentModel> getStudents();
	StudentModel getStudentByRollNumber(String rollNumber);
	List<StudentModel> getStudentsByDeptName( String deptName);
}
