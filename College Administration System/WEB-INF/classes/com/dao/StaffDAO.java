/**
 * 
 */
package com.dao;

import java.util.List;

import com.model.StaffModel;
import com.model.StudentModel;

/**
 * @author Compaq
 *
 */
public interface StaffDAO {

	void insertStaff(StaffModel staffModel);
	void updateStaff(StaffModel staffModel);
	void deleteStaff(String staffId);
	List<StaffModel> getStaffs();
	StaffModel getStaffByStaff_ID(String Staff_ID);
	List<StaffModel> getStaffsByDesignation( String designationName);
}
