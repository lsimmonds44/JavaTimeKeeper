/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataAccess;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java2.group3.TimeKeeper.DataObjects.DatabaseConnectionBuilderMySQL;
import java2.group3.TimeKeeper.DataObjects.Employee;

/**
 *
 * @author Skyler Hiscock
 */
public class EmployeeDAO {

    ResourceBundle resourceBundle;

    public EmployeeDAO() {
        resourceBundle = ResourceBundle.getBundle("java2.group3.TimeKeeper.Resources.TimeKeeper");
    }

    public Employee getPersonByIdAndPassword(int id, String password)
            throws IOException, SQLException, ClassNotFoundException {
        Employee employee = null;

        /**
         * Gather the connection information
         */
        String databaseUrl = resourceBundle.getString("db_url");
        String databaseName = resourceBundle.getString("db_name");
        String databaseUserName = resourceBundle.getString("db_user_name");
        String databaseUserPassword = resourceBundle.getString("db_user_password");

        /**
         * Get the connection
         */
        Connection conn = DatabaseConnectionBuilderMySQL.getConnection(databaseName, databaseUserName, databaseUserPassword);

        /**
         * This callable statement takes two parameters: id and password.
         */
        CallableStatement callableStatement = conn.prepareCall("{call tsp_GetPersonByIdAndPassword(?,?)}");
        callableStatement.setInt(1, id);
        callableStatement.setString(2, password);
        /**
         * Get a result set from running the statement
         */
        ResultSet resultSet = callableStatement.executeQuery();

        /**
         * We use if instead of while because we should be after only one
         */
        String lastName;
        String firstName;
        String role;
        if (resultSet.next()) {
            id = resultSet.getInt(1);
            lastName = resultSet.getString(2);
            firstName = resultSet.getString(3);
            role = resultSet.getString(4);
            employee = new Employee(id, firstName, lastName, role);
        }
        conn.close();
        return employee;
    }
}
