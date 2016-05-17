package bpm;

import java.sql.*;
import java.util.*;

public class QueryData
{
  /*
    private final String SERVER_NAME = "s156.eatj.com:3307";
    private final String DB_NAME = "efitness";
    private final String USER = "efitness";
    private final String PASS = "password";
  */
    private final String SERVER_NAME = "localhost";
    private final String DB_NAME = "efitness";
    private final String USER = "root";
    private final String PASS = "password";

    private ArrayList param; // parameter ที่ส่งมา query
    private Connection connection;

    // เมื่อสร้าง object ของ QueryData จะ create connection ให้ทันที
    public QueryData() throws ClassNotFoundException, SQLException
    {
        //Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        //Create Connection
        connection = DriverManager.getConnection("jdbc:mysql://" + SERVER_NAME + "/" + DB_NAME + "?characterEncoding=utf-8", USER, PASS);
    }

    // สำหรับ select data
    public ResultSet selectData(String sql) throws ClassNotFoundException, SQLException
    {
        PreparedStatement pre = connection.prepareStatement(sql);
        ResultSet result = pre.executeQuery();
        return result;
    }

    // สำหรับ select data
    public ResultSet selectData(String sql , ArrayList param) throws ClassNotFoundException, SQLException
    {
        // เอา param ที่ส่งมากำหนดให้กับ param ใน QueryData
        setParam(param);
        PreparedStatement pre = connection.prepareStatement(sql);
        setParamPre(pre); //กำหนด parameter ในการ query ให้ pre
        ResultSet result = pre.executeQuery();
        getParam().clear();
        return result;
    }

    // สำหรับ insert / update / delete data
    public int queryData(String sql) throws SQLException
    {
        PreparedStatement pre = connection.prepareStatement(sql);
        int result = pre.executeUpdate();
        return result; // ถ้าสำเร็จ return 1
    }

    // สำหรับ insert / update / delete data
    public int queryData(String sql , ArrayList param) throws SQLException
    {
        setParam(param);
        PreparedStatement pre = connection.prepareStatement(sql);
        setParamPre(pre);
        int result = pre.executeUpdate();
        getParam().clear();
        return result;
    }

    // เอา param ที่ส่งมากำหนดให้กับ pre เพื่อเป็น parameter (?) ในการ query
    private void setParamPre(PreparedStatement pre) throws SQLException
    {
        for (int i = 0; i <= getParam().size() - 1; i++)
        {
            pre.setString(i + 1, getParam().get(i).toString()); // parameter ตัวแรกคือ 1
        }
    }
    
    @Override // เมื่อ object ของ QueryData ทำงานเสร็จจะ close connection
    public void finalize () throws SQLException
    {
        connection.close();
    }

    /**
     * @return the param
     */
    public ArrayList getParam()
    {
        return param;
    }

    /**
     * @param param the param to set
     */
    public void setParam(ArrayList param)
    {
        this.param = param;
    }
}
