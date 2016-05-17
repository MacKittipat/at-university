/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package user;
import java.sql.*;

/**
 *
 * @author Kittipat_Mac
 */
public class NewPatient extends Patient {
    
    public NewPatient() throws ClassNotFoundException, SQLException {
        //con = new CreateConnection();
    }
    //เรียกใช้ Constructor ของ Class Patient
    public NewPatient(String idNumber, String name, String lastname, String birthdate, String gender, float weight, float height, String bloodGroup, String address, String telNumber, String email, String image, String username, String password) throws ClassNotFoundException, SQLException {
        super(idNumber, name, lastname, birthdate, gender, weight, height, bloodGroup, address, telNumber, email, image, username, password);
        //con = new CreateConnection();
    }

    public void register() throws SQLException {
        String sql = "INSERT INTO user(username,password,type) VALUES(?,?,?)";
        PreparedStatement pre = getCreateConnection().getConnection().prepareStatement(sql);
        pre.setString(1, username);
        pre.setString(2, password);
        pre.setString(3, "patient");
        pre.executeUpdate();
        
        String sql2 = "SELECT userId FROM user WHERE username=?";
        PreparedStatement pre2 = getCreateConnection().getConnection().prepareStatement(sql2);
        pre2.setString(1, username);
        ResultSet result2 = pre2.executeQuery();
        result2.first();
        String userId = result2.getString("userId");

        String sql3 = "INSERT INTO patient(idNumber, name, lastname, birthdate, gender, weight, height, bloodGroup, address, telNumber, email, image, userId) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pre3 = getCreateConnection().getConnection().prepareStatement(sql3);
        pre3.setString(1, idNumber);
        pre3.setString(2, name);
        pre3.setString(3, lastname);
        pre3.setString(4, birthdate);
        pre3.setString(5, gender);
        pre3.setFloat(6, weight);
        pre3.setFloat(7, height);
        pre3.setString(8, bloodGroup);
        pre3.setString(9, address);
        pre3.setString(10, telNumber);
        pre3.setString(11, email);
        pre3.setString(12, image);
        pre3.setString(13, userId); //userId มาจาก table user
        pre3.executeUpdate();

    }
    
    public boolean checkUsername(String username) throws SQLException {
        String sql = "SELECT userId FROM user WHERE username=?";
        PreparedStatement pre = getCreateConnection().getConnection().prepareStatement(sql);
        pre.setString(1, username);
        ResultSet result = pre.executeQuery();
        boolean ret = false;
        if(result.first()){ //ถ้ามี username นี้อยู่แล้วจะ return false
            ret = false;
        }else{
            ret = true;
        }
        return ret;
    }
}
