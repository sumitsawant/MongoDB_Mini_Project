/**
 * 
 */
package com.dao;

import java.net.UnknownHostException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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
public class StudentDAOImpl implements StudentDAO{

	@Override
	public void insertStudent(StudentModel studentModel) {
		
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
		DBCollection table = db.getCollection("student");

		/**** Insert ****/
		// create a document to store key and value
		BasicDBObject document = new BasicDBObject();
		document.put("rollNumber", studentModel.getRollNumber());
		document.put("firstName", studentModel.getFirstName());
		document.put("middleName", studentModel.getMiddleName());
		document.put("lastName", studentModel.getLastName());
		document.put("contactNumber", studentModel.getMobileNumber());
		document.put("email", studentModel.getEmail());
		document.put("gender", studentModel.getGender());
		document.put("dob", studentModel.getDateOfBirth());
		document.put("address", studentModel.getAddress());
		document.put("department", studentModel.getDepartment());
		document.put("academicYear", studentModel.getAcademicYear());
		table.insert(document);
		mongo.close();
	}

	@Override
	public void updateStudent(StudentModel studentModel) {
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
		DBCollection table = db.getCollection("student");
		/**** Find and display ****/
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("rollNumber", studentModel.getRollNumber());
		DBObject document= table.findOne(searchQuery);
		if(document!=null){
			document.put("firstName", studentModel.getFirstName());
			document.put("middleName", studentModel.getMiddleName());
			document.put("lastName", studentModel.getLastName());
			document.put("contactNumber", studentModel.getMobileNumber());
			document.put("email", studentModel.getEmail());
			document.put("gender", studentModel.getGender());
			document.put("dob", studentModel.getDateOfBirth());
			document.put("address", studentModel.getAddress());
			document.put("department", studentModel.getDepartment());
			document.put("academicYear", studentModel.getAcademicYear());
		}
		table.update(searchQuery, document);
		mongo.close();
		
	}

	@Override
	public void deleteStudent(String rollNumber) {
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
		DBCollection table = db.getCollection("student");
		/**** Find and display ****/
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("rollNumber", rollNumber);
		DBObject document= table.findOne(searchQuery);
		table.remove(document);
		
	}

	@Override
	public List<StudentModel> getStudents() {
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
		DBCollection table = db.getCollection("student");
		DBCursor cursor = table.find();
		List<StudentModel> studentModels=new LinkedList<StudentModel>();
		while (cursor.hasNext()) {
			StudentModel studentModel=new StudentModel();
			DBObject dbObject= cursor.next();
			studentModel.setRollNumber((String)dbObject.get("rollNumber"));
			studentModel.setFirstName((String)dbObject.get("firstName"));
			studentModel.setMiddleName((String)dbObject.get("middleName"));
			studentModel.setLastName((String)dbObject.get("lastName"));
			studentModel.setMobileNumber((String)dbObject.get("contactNumber"));
			studentModel.setEmail((String)dbObject.get("email"));
			studentModel.setGender((String)dbObject.get("gender"));
			studentModel.setDateOfBirth((String)dbObject.get("dob"));
			studentModel.setAddress((String)dbObject.get("address"));
			studentModel.setDepartment((String)dbObject.get("department"));
			studentModel.setAcademicYear((String)dbObject.get("academicYear"));
			studentModels.add(studentModel);
		
		}
		
		return studentModels;
	}

	@Override
	public StudentModel getStudentByRollNumber(String rollNumber) {
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
		DBCollection table = db.getCollection("student");
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("rollNumber",rollNumber);
		DBObject dbObject = table.findOne(searchQuery);
		if(dbObject!=null){
			StudentModel studentModel=new StudentModel();
			studentModel.setRollNumber((String)dbObject.get("rollNumber"));
			studentModel.setFirstName((String)dbObject.get("firstName"));
			studentModel.setMiddleName((String)dbObject.get("middleName"));
			studentModel.setLastName((String)dbObject.get("lastName"));
			studentModel.setMobileNumber((String)dbObject.get("contactNumber"));
			studentModel.setEmail((String)dbObject.get("email"));
			studentModel.setGender((String)dbObject.get("gender"));
			studentModel.setDateOfBirth((String)dbObject.get("dob"));
			studentModel.setAddress((String)dbObject.get("address"));
			studentModel.setDepartment((String)dbObject.get("department"));
			studentModel.setAcademicYear((String)dbObject.get("academicYear"));
			return studentModel;
		}else{
			return null;
		}
		
	}

	@Override
	public List<StudentModel> getStudentsByDeptName(String deptName) {

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
		DBCollection table = db.getCollection("student");
		BasicDBObject searchQuery = new BasicDBObject();
		searchQuery.put("department",deptName);
		DBCursor cursor = table.find(searchQuery);
		List<StudentModel> studentModels=new LinkedList<StudentModel>();
		while (cursor.hasNext()) {
			StudentModel studentModel=new StudentModel();
			DBObject dbObject= cursor.next();
			studentModel.setRollNumber((String)dbObject.get("rollNumber"));
			studentModel.setFirstName((String)dbObject.get("firstName"));
			studentModel.setMiddleName((String)dbObject.get("middleName"));
			studentModel.setLastName((String)dbObject.get("lastName"));
			studentModel.setMobileNumber((String)dbObject.get("contactNumber"));
			studentModel.setEmail((String)dbObject.get("email"));
			studentModel.setGender((String)dbObject.get("gender"));
			studentModel.setDateOfBirth((String)dbObject.get("dob"));
			studentModel.setAddress((String)dbObject.get("address"));
			studentModel.setDepartment((String)dbObject.get("department"));
			studentModel.setAcademicYear((String)dbObject.get("academicYear"));
			studentModels.add(studentModel);
		
		}
		
		return studentModels;
	
	}
	

}
