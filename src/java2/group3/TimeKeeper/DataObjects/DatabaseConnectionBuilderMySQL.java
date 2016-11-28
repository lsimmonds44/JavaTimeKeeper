/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataObjects;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Gets a SQL Connection object based on the parameters
 * 
 * @author Bob Trapp
 */
public class DatabaseConnectionBuilderMySQL {
    
    /**
     * The default host is localhost (127.0.0.1)
     */
    public static final String DEFAULT_URL = "localhost";
    
    /**
     * The default port for MySQL is 3306
     */
    public static final int DEFAULT_PORT = 3306;
    
    
    /**
     * This is the most basic form of the method.  It uses default values for 
     * the URL and port number.
     * @param databaseName
     * @param userName
     * @param password
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IllegalArgumentException 
     */
    public static Connection getConnection(String databaseName, String userName
                                    , String password) throws SQLException
                                    , ClassNotFoundException
                                    , IllegalArgumentException {
        /**
         * Call the more complex version of the method and supply the default
         * URL and port for those parameters
         */
        return getConnection(DEFAULT_URL, DEFAULT_PORT, databaseName
                            , userName, password);
    }
    
    /**
     * This version includes a parameter for the database URL
     * @param databaseUrl
     * @param databaseName
     * @param userName
     * @param password
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IllegalArgumentException 
     */
    public static Connection getConnection(String databaseUrl, String databaseName
                                    , String userName, String password) 
                                      throws SQLException
                                    , ClassNotFoundException
                                    , IllegalArgumentException {
        /**
         * Call the more complex version of the method and supply the default
         * port for that parameter
         */
        return getConnection(databaseUrl, DEFAULT_PORT, databaseName
                            , userName, password);
    }
    
    /**
     * This is the most complete version of the method and it requires a port
     * as well as the URL
     * @param databaseUrl
     * @param databasePort
     * @param databaseName
     * @param userName
     * @param password
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     * @throws IllegalArgumentException 
     */
    public static Connection getConnection(String databaseUrl, Integer databasePort
                                    , String databaseName, String userName
                                    , String password) throws SQLException
                                    , ClassNotFoundException
                                    , IllegalArgumentException {
        /**
         * Build the connection string to be used for the connection
         */
        String connectionString = "jdbc:mysql://" + databaseUrl + ":" 
                + databasePort
                + "/" + databaseName 
                + "?useSSL=false"
                +"&user=" + userName + "&password="
                + password;
        
        return DriverManager.getConnection(connectionString);
    }
    
}
