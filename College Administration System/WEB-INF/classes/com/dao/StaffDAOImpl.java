/**
 * 
 */
package com.dao;

import java.net.UnknownHostException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.model.StaffModel;
import com.model.StudentModel;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

/**
 * @author Compaq
 * 
 */
public class StaffDAOImpl implements StaffDAO {

	@Override
	public void insertStaff(StaffModel staffModel) {

		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");

		/**** Insert ****/
		// create a document to store key and value
		BasicDBObject document = new BasicDBObject();
		document.put("staffId", staffModel.getStaffId());
		document.put("firstName", staffModel.getFirstName());
		document.put("middleName", staffModel.getMiddleName());
		document.put("lastName", staffModel.getLastName());
		document.put("contactNumber", staffModel.getMobileNumber());
		document.put("email", staffModel.getEmail());
		document.put("gender", staffModel.getGender());
		document.put("dob", staffModel.getDateOfBirth());
		document.put("address", staffModel.getAddress());
		document.put("department", staffModel.getDepartment());
		document.put("designation", staffModel.getDesignation());
		table.insert(document);
		mongo.close();
	}

	@Override
	public void updateStaff(StaffModel staffModel) {
		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");
		/**** Find and display ****/
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("staffId", staffModel.getStaffId());
		DBObject document = table.findOne(searchQuery);
		/**** Insert ****/
		if(document!=null){
			document.put("firstName", staffModel.getFirstName());
			document.put("middleName", staffModel.getMiddleName());
			document.put("lastName", staffModel.getLastName());
			document.put("contactNumber", staffModel.getMobileNumber());
			document.put("email", staffModel.getEmail());
			document.put("gender", staffModel.getGender());
			document.put("dob", staffModel.getDateOfBirth());
			document.put("address", staffModel.getAddress());
			document.put("department", staffModel.getDepartment());
			document.put("designation", staffModel.getDesignation());
		}
		table.update(searchQuery, document);
		mongo.close();

	}

	@Override
	public void deleteStaff(String staffId) {
		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");
		/**** Find and display ****/
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("staffId", staffId);
		DBObject document = table.findOne(searchQuery);
		table.remove(document);

	}

	@Override
	public List<StaffModel> getStaffs() {
		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");
		DBCursor cursor = table.find();
		List<StaffModel> staffModels = new LinkedList<StaffModel>();
		while (cursor.hasNext()) {
			StaffModel staffModel = new StaffModel();
			DBObject dbObject = cursor.next();
			if(dbObject!=null){
				staffModel.setStaffId((String) dbObject.get("staffId"));
				staffModel.setFirstName((String) dbObject.get("firstName"));
				staffModel.setMiddleName((String) dbObject.get("middleName"));
				staffModel.setLastName((String) dbObject.get("lastName"));
				staffModel.setMobileNumber((String) dbObject.get("contactNumber"));
				staffModel.setEmail((String) dbObject.get("email"));
				staffModel.setGender((String) dbObject.get("gender"));
				staffModel.setDateOfBirth((String) dbObject.get("dob"));
				staffModel.setAddress((String) dbObject.get("address"));
				staffModel.setDepartment((String) dbObject.get("department"));
				staffModel.setDesignation((String) dbObject.get("designation"));
				staffModels.add(staffModel);
			}

		}

		return staffModels;
	}

	@Override
	public StaffModel getStaffByStaff_ID(String staffId) {
		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("staffId", staffId);
		DBObject dbObject = table.findOne(searchQuery);
		if(dbObject!=null){
		StaffModel staffModel = new StaffModel();
		staffModel.setStaffId((String) dbObject.get("staffId"));
		staffModel.setFirstName((String) dbObject.get("firstName"));
		staffModel.setMiddleName((String) dbObject.get("middleName"));
		staffModel.setLastName((String) dbObject.get("lastName"));
		staffModel.setMobileNumber((String) dbObject.get("contactNumber"));
		staffModel.setEmail((String) dbObject.get("email"));
		staffModel.setGender((String) dbObject.get("gender"));
		staffModel.setDateOfBirth((String) dbObject.get("dob"));
		staffModel.setAddress((String) dbObject.get("address"));
		staffModel.setDepartment((String) dbObject.get("department"));
		staffModel.setDesignation((String) dbObject.get("designation"));
		return staffModel;
		}else{
			return null;
		}
	}
	@Override
	public List<StaffModel> getStaffsByDesignation(String designationName) {

		MongoClient mongo = null;
		try {
			mongo = new MongoClient("localhost", 27017);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/**** Get database ****/
		// if database doesn't exists, MongoDB will create it for you
		DB db = mongo.getDB("college_db");

		/**** Get collection / table from 'testdb' ****/
		// if collection doesn't exists, MongoDB will create it for you
		DBCollection table = db.getCollection("staff");
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("designation",designationName);
		DBCursor cursor = table.find(searchQuery);
		List<StaffModel> staffModels=new LinkedList<StaffModel>();
		while (cursor.hasNext()) {
						DBObject dbObject= cursor.next();
			StaffModel staffModel = new StaffModel();
			staffModel.setStaffId((String) dbObject.get("staffId"));
			staffModel.setFirstName((String) dbObject.get("firstName"));
			staffModel.setMiddleName((String) dbObject.get("middleName"));
			staffModel.setLastName((String) dbObject.get("lastName"));
			staffModel.setMobileNumber((String) dbObject.get("contactNumber"));
			staffModel.setEmail((String) dbObject.get("email"));
			staffModel.setGender((String) dbObject.get("gender"));
			staffModel.setDateOfBirth((String) dbObject.get("dob"));
			staffModel.setAddress((String) dbObject.get("address"));
			staffModel.setDepartment((String) dbObject.get("department"));
			staffModel.setDesignation((String) dbObject.get("designation"));
			staffModels.add(staffModel);
		
		}
		
		return staffModels;
	
	}
	

}
