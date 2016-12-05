/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java2.group3.TimeKeeper.DataAccess.ProjectDAO;
import java2.group3.TimeKeeper.DataObjects.Employee;
import java2.group3.TimeKeeper.DataObjects.Project;
import java2.group3.TimeKeeper.DataObjects.TimeRecord;
import java2.group3.TimeKeeper.Viewer.TimeEntryFrame;

/**
 *
 * @author Skyler Hiscock
 */
public class MainMenuLogic {

    /**
     * This only exists because we don't store Project Name in the Time Record
     * object Returns the name of the project stored in the time record
     *
     * @param timeRecord
     * @return projectName
     * @throws java.io.IOException
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public String getProjectName(TimeRecord timeRecord) throws IOException, SQLException, ClassNotFoundException {
        String projectName = null;
        ProjectDAO projectDAO = new ProjectDAO();
        try {
            Project project = projectDAO.getProject(timeRecord.getProjectId());
            if (project != null) {
                projectName = project.getProjectName();
            }
        } catch (IOException | SQLException | ClassNotFoundException e) {
            throw e;
        }
        return projectName;
    }
}
