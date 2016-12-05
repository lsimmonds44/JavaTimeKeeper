package java2.group3.TimeKeeper.DataAccess;

import java.io.IOException;
import java.io.Reader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Locale;
import java.util.ResourceBundle;
import java2.group3.TimeKeeper.DataObjects.DatabaseConnectionBuilderMySQL;
import java2.group3.TimeKeeper.DataObjects.TimeRecord;

/**
 *
 * @author Nicholas Mikus
 */
public class TimeRecordDAO {

    ResourceBundle resourceBundle;

    public TimeRecordDAO() {
        resourceBundle = ResourceBundle.getBundle("java2.group3.TimeKeeper.Resources.TimeKeeper");
    }

    public TimeRecord appendTimeRecord(int employeeID, int projectID, char startOrStop) throws IOException, SQLException, ClassNotFoundException {

        /**
         * build new TimeRecord
         */
        TimeRecord timeRecord = new TimeRecord();

        /**
         * build the connection string
         */
        String databaseUrl = resourceBundle.getString("db_url");
        String databaseName = resourceBundle.getString("db_name");
        String databaseUserName = resourceBundle.getString("db_user_name");
        String databaseUserPassword = resourceBundle.getString("db_user_password");
        /**
         * build the connection
         */
        Connection conn = DatabaseConnectionBuilderMySQL.getConnection(databaseName, databaseUserName, databaseUserPassword);

        /**
         * build callable statement
         */
        CallableStatement callableStatement = conn.prepareCall("{call tsp_AddTimeRecord(?,?,?)}");
        callableStatement.setInt(1, projectID);
        callableStatement.setInt(2, employeeID);
        callableStatement.setString(3, "" + startOrStop);

        /**
         * execute the callable statement
         */
        ResultSet resultSet = callableStatement.executeQuery();

        /**
         * handle the result set
         */
        if (resultSet.next()) {

            /**
             * convert the result into a Reader Object that can have its char
             * value read
             */
            Timestamp dateResult = resultSet.getTimestamp(1);

            /**
             * apply the result set values to the time record being returned
             */
            timeRecord.setEmployeeId(employeeID);
            timeRecord.setProjectId(projectID);
            timeRecord.setStartOrStop(startOrStop);
            timeRecord.setDateTime(dateResult.toLocalDateTime());

        }
        conn.close();
        return timeRecord;
    }
}
