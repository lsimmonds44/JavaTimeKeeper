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
import java.util.ArrayList;
import java.util.ResourceBundle;
import java2.group3.TimeKeeper.DataObjects.DatabaseConnectionBuilderMySQL;
import java2.group3.TimeKeeper.DataObjects.Project;

/**
 *
 * @author Laura Simmonds
 */
public class ProjectDAO {

    ResourceBundle resourceBundle;

    public ProjectDAO() {
        resourceBundle = ResourceBundle.getBundle("java2.group3.TimeKeeper.Resources.TimeKeeper");
    }

    public Project getProject(int id) throws IOException, SQLException, ClassNotFoundException {
        Project returnProject = null;

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
         * This callable statement takes two parameters: id and password. We set
         * the parameters by type and by position number. Remember, in SQL the
         * positions start with one and not zero.
         */
        CallableStatement callableStatement = conn.prepareCall("{call tsp_GetProjectById(?)}");
        callableStatement.setInt(1, id);

        /**
         * Get a result set from running the statement
         */
        ResultSet resultSet = callableStatement.executeQuery();

        /**
         * We use if instead of while because we should be after only one
         */
        if (resultSet.next()) {
            int projectId = resultSet.getInt(1);
            String active = resultSet.getString(2);
            String projectName = resultSet.getString(3);
            String projectDescription = resultSet.getString(4);

            returnProject = new Project(projectId, active, projectName, projectDescription);
        }
        conn.close();
        return returnProject;
    }

    public ArrayList<Project> getActiveProjects() throws IOException, SQLException, ClassNotFoundException {
        ArrayList<Project> activeProjects = new ArrayList<>();

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
         * This callable statement takes no parameters
         */
        CallableStatement callableStatement = conn.prepareCall("{call tsp_GetActiveProjects()}");

        /**
         * Get a result set from running the statement
         */
        ResultSet resultSet = callableStatement.executeQuery();

        /**
         * We use while instead of if because it should be returning multiple
         * rows
         */
        while (resultSet.next()) {
            int projectID = resultSet.getInt(1);
            String active = resultSet.getString(2);
            String projectName = resultSet.getString(3);
            String projectDescription = resultSet.getString(4);
            activeProjects.add(new Project(projectID, active, projectName, projectDescription));
        }
        conn.close();
        return activeProjects;
    }

}
