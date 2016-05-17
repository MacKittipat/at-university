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
public class Patient {
    
    protected String idNumber;
    protected String name;
    protected String lastname;
    protected String birthdate;
    protected String gender;
    protected float weight;
    protected float height;
    protected String bloodGroup;
    protected String address;
    protected String telNumber;
    protected String email;
    protected String image;
    protected String username;
    protected String password;
    private CreateConnection createConnection;
    
    public Patient() throws ClassNotFoundException, SQLException {
        createConnection = new CreateConnection();
    }

    public Patient(String idNumber, String name, String lastname, String birthdate, String gender, float weight, float height, String bloodGroup, String address, String telNumber, String email, String image, String username, String password) throws ClassNotFoundException, SQLException {
        this.idNumber = idNumber;
        this.name = name;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.gender = gender;
        this.weight = weight;
        this.height = height;
        this.bloodGroup = bloodGroup;
        this.address = address;
        this.telNumber = telNumber;
        this.email = email;
        this.image = image;
        this.username = username;
        this.password = password;
        createConnection = new CreateConnection();
    }

    /**
     * @return the createConnection
     */
    public CreateConnection getCreateConnection() {
        return createConnection;
    }
   
}
