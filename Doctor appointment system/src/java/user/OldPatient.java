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
public class OldPatient extends Patient {

    public OldPatient() throws ClassNotFoundException, SQLException {
        super();
    }

    public OldPatient(String patientId) throws ClassNotFoundException, SQLException {
        String sql = "SELECT idNumber,name,lastname,birthdate,gender,weight,height,bloodGroup,address,telNumber,email,image FROM patient WHERE patientId=?";
        PreparedStatement pre = getCreateConnection().getConnection().prepareStatement(sql);
        pre.setString(1, patientId);
        ResultSet result = pre.executeQuery();
        if(result.first()){
            idNumber = result.getString("idNumber");
            name = result.getString("name");
            lastname = result.getString("lastname");
            birthdate = result.getString("birthdate");
            gender = result.getString("gender");
            weight = result.getFloat("weight");
            height = result.getFloat("height");
            bloodGroup = result.getString("bloodGroup");
            address = result.getString("address");
            telNumber = result.getString("telNumber");
            email = result.getString("email");
            image = result.getString("image");
        }
    }

    /*
    public void viewProfile(String username) throws SQLException {
        String sql = "SELECT patient.idNumber,patient.name,patient.lastname,patient.birthdate,patient.gender,patient.weight,patient.height,patient.bloodGroup,patient.address,patient.telNumber,patient.email,patient.image FROM patient,user WHERE user.username=? AND user.userId=patient.userId";
        PreparedStatement pre = getCreateConnection().getConnection().prepareStatement(sql);
        pre.setString(1, username);
        ResultSet result = pre.executeQuery();
        if(result.first()){
            idNumber = result.getString("idNumber");
            name = result.getString("name");
            lastname = result.getString("lastname");
            birthdate = result.getString("birthdate");
            gender = result.getString("gender");
            weight = result.getFloat("weight");
            height = result.getFloat("height");
            bloodGroup = result.getString("bloodGroup");
            address = result.getString("address");
            telNumber = result.getString("telNumber");
            email = result.getString("email");
            image = result.getString("image");
        }
    }
    */
    
    public String getIdNumber(){
        return idNumber;
    }
    
    public String getName(){
        return name;
    }

    public String getLastname(){
        return lastname;
    }

    public String getBirthdate(){
        return birthdate;
    }

    public String getGender(){
        return gender;
    }

    public float getWeight(){
        return weight;
    }

    public float getHeight(){
        return height;
    }

    public String getBloodGroup(){
        return bloodGroup;
    }

    public String getAddress(){
        return address;
    }

    public String getTelNumber(){
        return telNumber;
    }

    public String getEmail(){
        return email;
    }

    public String getImage(){
        return image;
    }

}
