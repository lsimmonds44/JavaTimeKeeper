/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

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
     */
    public String getProjectName(TimeRecord timeRecord) {
        String projectName = null;
        ProjectDAO projectDAO = new ProjectDAO();
        try {
            Project project = projectDAO.getProject(Integer.toString(timeRecord.getProjectId()));
            if (project != null) {
                projectName = project.getProjectName();
            }
        } catch (Exception e) {
            // This catch only exists because converting an int to a string is unsafe.
            // But if the timeRecord ID can't be converted we'd have bigger problems.
            System.out.println(e.getMessage());
        }
        return projectName;
    }
}
