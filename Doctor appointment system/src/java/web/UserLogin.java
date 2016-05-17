/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;
import java.sql.*;
import database.*;
/**
 *
 * @author Kittipat_Mac
 */
public class UserLogin {
    private CreateConnection con;
    public UserLogin() throws ClassNotFoundException, SQLException {
        con = new CreateConnection();
    }

    public String[] login(String username, String password) throws SQLException{
        String sql = "SELECT userId,username,password,type FROM user WHERE username=? AND password=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, username);
        pre.setString(2, password);
        ResultSet result = pre.executeQuery();
        String[] ret = new String[4]; //เอาไว้ return ข้อมูล patient
        if(result.first()){ //มี username / password อยู่ใน table user
            if(result.getString("type").equals("patient")){ //type เป็น patient
                String sql2 = "SELECT image FROM patient WHERE userId=?";
                PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
                pre2.setString(1, result.getString("userId"));
                ResultSet result2 = pre2.executeQuery();
                result2.first();
                ret[0] = "true";
                ret[1] = result.getString("username");
                ret[2] = result2.getString("image");
                ret[3] = "patient";

            }else{ //type เป็น admin
                ret[0] = "true";
                ret[1] = result.getString("username");
                ret[2] = "images/admin.jpg";
                ret[3] = "admin";
            }
        }else{
            ret[0] = "false";
            ret[1] = "";
            ret[2] = "";
        }
        return ret;
   }

    public String[] checklogin(String username) throws SQLException{
        String sql = "SELECT userId,username,type FROM user WHERE username=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, username);
        ResultSet result = pre.executeQuery();
        String[] ret = new String[4];
        if(result.first()){
            if(result.getString("type").equals("patient")){ //type เป็น patient
                String sql2 = "SELECT image FROM patient WHERE userId=?";
                PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
                pre2.setString(1, result.getString("userId"));
                ResultSet result2 = pre2.executeQuery();
                result2.first();
                ret[0] = "true";
                ret[1] = result.getString("username");
                ret[2] = result2.getString("image");
                ret[3] = "patient";
            }else{ //type เป็น admin
                ret[0] = "true";
                ret[1] = result.getString("username");
                ret[2] = "images/admin.jpg";
                ret[3] = "admin";
            }
        }
        return ret;
    }

}
