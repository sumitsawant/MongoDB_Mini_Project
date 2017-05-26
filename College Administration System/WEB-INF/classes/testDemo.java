import java.net.UnknownHostException;
import java.util.Date;
import java.util.Set;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;

/**
 * 
 */

/**
 * @author Compaq
 *
 */
public class testDemo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {


		try {

			/**** Connect to MongoDB ****/
			// Since 2.10.0, uses MongoClient
			MongoClient mongo = new MongoClient("localhost", 27017);

			/**** Get database ****/
			// if database doesn't exists, MongoDB will create it for you
			DB db = mongo.getDB("college_db");

			/**** Get collection / table from 'testdb' ****/
			// if collection doesn't exists, MongoDB will create it for you
			DBCollection table = db.getCollection("staff");

			/**** Insert ****/
			// create a document to store key and value
/*			BasicDBObject document = new BasicDBObject();
			document.put("name", "Shahaji");
			document.put("age", 15);
			document.put("createdDate", new Date());
			table.insert(document);*/

			/**** Find and display ****/
			BasicDBObject searchQuery = new BasicDBObject();
		
			//table.remove(searchQuery);
			DBCursor cursor = table.find();

			while (cursor.hasNext()) {
				DBObject dbObject= cursor.next();
				System.out.println("Name>>>:"+dbObject.get("firstName"));
				System.out.println("age>>>:"+dbObject.get("age"));
				table.remove(dbObject);
				System.out.println(".........");
				//Set<String> keys= cursor.next().keySet();
				
			}

			/**** Update ****/
			// search document where name="mkyong" and update it with new values
		/*	BasicDBObject query = new BasicDBObject();
			query.put("name", "Mahendra");

			BasicDBObject newDocument = new BasicDBObject();
			newDocument.put("name", "mkyong-updated");

//			BasicDBObject updateObj = new BasicDBObject();
//			updateObj.put("$set", newDocument);
			DBObject document= table.findOne(query);
			document.put("age", 100);
			table.update(query, document);*/

			/**** Find and display ****/
			/*BasicDBObject searchQuery2 
				= new BasicDBObject().append("name", "mkyong-updated");

			DBCursor cursor2 = table.find(searchQuery2);

			while (cursor2.hasNext()) {
				System.out.println(cursor2.next());
			}*/

			/**** Done ****/
			System.out.println("Done");

		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		}

	}

}
