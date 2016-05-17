/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package user;
import database.*;
import java.sql.*;

/**
 *
 * @author Kittipat_Mac
 */
public class Doctor {
    private String name;
    private String lastname;
    private String gender;
    private String departmentId;
    private String departmentName;
    private String telNumber;
    private String email;
    private String image;
    private String[] workTime;
    private CreateConnection con;

    public Doctor(String doctorId) throws ClassNotFoundException, SQLException {
        con = new CreateConnection();
        String sql = "SELECT doctor.name,doctor.lastname,doctor.gender,doctor.telNumber,doctor.email,doctor.image,doctor.departmentId,department.departmentName FROM doctor,department WHERE doctor.doctorId=? AND doctor.departmentId=department.departmentId" ;
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, doctorId);
        ResultSet result = pre.executeQuery();
        if(result.first()){
            this.name = result.getString("doctor.name");
            this.lastname = result.getString("doctor.lastname");
            this.gender = result.getString("doctor.gender");
            this.departmentId = result.getString("doctor.departmentId");
            this.departmentName = result.getString("department.departmentName");
            this.telNumber = result.getString("doctor.telNumber");
            this.email = result.getString("doctor.email");
            this.image = result.getString("doctor.image");    
        }
        //หาจำนวน worktime ของ doctor
        int countWorktime = 0;
        String sql2 = "SELECT COUNT(worktimeId) AS count FROM worktime WHERE doctorId=?";
        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
        pre2.setString(1, doctorId);
        ResultSet result2 = pre2.executeQuery();
        if(result2.first()){
            countWorktime = result2.getInt("count");
        }
        workTime = new String[countWorktime];
        String sql3 = "SELECT time FROM worktime WHERE doctorId=?";
        PreparedStatement pre3 = con.getConnection().prepareStatement(sql3);
        pre3.setString(1, doctorId);
        ResultSet result3 = pre3.executeQuery();
        int i = 0;
        while(result3.next()){
            workTime[i] = result3.getString("time");
            i++;
        }
        
    }   
    
    public Doctor(String name, String lastname, String gender, String departmentId, String[] workTime, String telNumber, String email, String image) throws ClassNotFoundException, SQLException {
        con = new CreateConnection();
        this.name = name;
        this.lastname = lastname;
        this.gender = gender;
        this.departmentId = departmentId;
        this.workTime = workTime;
        this.telNumber = telNumber;
        this.email = email;
        this.image = image;
    }
    
    public void registerDoctor() throws ClassNotFoundException, SQLException {
        //Insert to doctor
        String sql = "INSERT INTO doctor(name,lastname,gender,departmentId,telNumber,email,image) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1,getName());
        pre.setString(2,getLastname());
        pre.setString(3,getGender());
        pre.setString(4,getDepartmentId());
        pre.setString(5,getTelNumber());
        pre.setString(6,getEmail());
        pre.setString(7,getImage());
        pre.executeUpdate();
        
        //Select doctorId
        String doctorId = "";
        String sql2 = "SELECT doctorId FROM doctor WHERE image=?";
        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
        pre2.setString(1,getImage());
        ResultSet result2 = pre2.executeQuery();
        if(result2.first()){
            doctorId = result2.getString("doctorId");
        }

        //Insert to worktime
        for(String data : getWorkTime()){
        String sql3 = "INSERT INTO worktime(doctorId,time) VALUES(?,?)";
            PreparedStatement pre3 = con.getConnection().prepareStatement(sql3);
            pre3.setString(1, doctorId);
            pre3.setString(2, data);
            pre3.executeUpdate();
        }
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @return the departmentId
     */
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     * @return the telNumber
     */
    public String getTelNumber() {
        return telNumber;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @return the workTime
     */
    public String[] getWorkTime() {
        return workTime;
    }

    /**
     * @return the departmentName
     */
    public String getDepartmentName() {
        return departmentName;
    }
}
