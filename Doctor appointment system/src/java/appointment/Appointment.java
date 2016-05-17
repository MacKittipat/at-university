/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package appointment;
import java.sql.*;
import database.*;
/**
 *
 * @author Kittipat_Mac
 */
public class Appointment {
    private String patientId;
    private String doctorId;
    private String date;
    private String time;
    private String detail;
    private CreateConnection con;

    public Appointment() throws ClassNotFoundException, SQLException {
        con = new CreateConnection();
    }

    public Appointment(String appointmentId) throws ClassNotFoundException, SQLException {
        con = new CreateConnection();
        String sql = "SELECT patientId,doctorId,date,time,detail FROM appointment WHERE appointmentId=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, appointmentId);
        ResultSet result = pre.executeQuery();
        if(result.first()){
            this.patientId = result.getString("patientId");
            this.doctorId = result.getString("doctorId");
            this.date = result.getString("date");
            this.time = result.getString("time");
            this.detail = result.getString("detail");
        }
    }

    public boolean makeAppointment(String patientId, String doctorId, String date, String time, String detail) throws SQLException, SQLException {
        boolean ret = true;
        //เช็คว่ามีการ appointment ที่วันและเวลาที่เลือกไปหรือยัง ถ้ายังถึงจะทำการ appointment ได้
        String sql2 = "SELECT appointmentId FROM appointment WHERE patientId=? AND doctorId=? AND date=? AND time=?";
        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
        pre2.setString(1, patientId);
        pre2.setString(2, doctorId);
        pre2.setString(3, date);
        pre2.setString(4, time);
        ResultSet result2 = pre2.executeQuery();
        if(result2.first()){ //ไม่สามารถ appointment ได้
            ret = false;
        }else{ //ที่วัน เวลานี้ยังไม่ได้ถูก appointment จะ appointment ได้
            String sql = "INSERT INTO appointment(patientId,doctorId,date,time,detail) VALUES(?,?,?,?,?)";
            PreparedStatement pre = con.getConnection().prepareStatement(sql);
            pre.setString(1, patientId);
            pre.setString(2, doctorId);
            pre.setString(3, date);
            pre.setString(4, time);
            pre.setString(5, detail);
            pre.executeUpdate();
        }
        return ret;
    }

    public boolean editAppointment(String appointmentId, String patientId, String doctorId, String date, String time, String detail) throws SQLException {
        boolean ret = true;
        //เช็คว่ามีการ appointment ที่วันและเวลาที่เลือกไปหรือยัง ถ้ายังถึงจะทำการ appointment ได้
        String sql2 = "SELECT appointmentId FROM appointment WHERE patientId=? AND doctorId=? AND date=? AND time=?";
        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
        pre2.setString(1, patientId);
        pre2.setString(2, doctorId);
        pre2.setString(3, date);
        pre2.setString(4, time);
        ResultSet result2 = pre2.executeQuery();
        if(result2.first()){ //ไม่สามารถ appointment ได้
            ret = false;
        }else{ //ที่วัน เวลานี้ยังไม่ได้ถูก appointment จะ appointment ได้
            String sql = "UPDATE appointment SET doctorId=?, date=?, time=?, detail=? WHERE appointmentId=?";
            PreparedStatement pre = con.getConnection().prepareStatement(sql);
            pre.setString(1, doctorId);
            pre.setString(2, date);
            pre.setString(3, time);
            pre.setString(4, detail);
            pre.setString(5, appointmentId);
            pre.executeUpdate();
        }
        return ret;
    }

    public void deleteAppointment(String appointmentId) throws SQLException{
        String sql = "DELETE FROM appointment WHERE appointmentId=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, appointmentId);
        pre.executeUpdate();
    }

    /**
     * @return the patientId
     */
    public String getPatientId() {
        return patientId;
    }

    /**
     * @return the doctorId
     */
    public String getDoctorId() {
        return doctorId;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @return the time
     */
    public String getTime() {
        return time;
    }

    /**
     * @return the detail
     */
    public String getDetail() {
        return detail;
    }
}
