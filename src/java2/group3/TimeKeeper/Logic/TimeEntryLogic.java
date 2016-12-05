/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java2.group3.TimeKeeper.DataAccess.ProjectDAO;
import java2.group3.TimeKeeper.DataAccess.TimeRecordDAO;
import java2.group3.TimeKeeper.DataObjects.Project;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeEntryLogic {

    private final TimeRecordDAO timeRecordDAO = new TimeRecordDAO();
    private final ProjectDAO projectDAO = new ProjectDAO();

    public boolean saveTimeRecord(int employeeId, int projectId, char startOrStop) throws IOException, SQLException, ClassNotFoundException {
        boolean success = false;
        try {
            //needs: int employeeID, int projectID, char startOrStop
            timeRecordDAO.appendTimeRecord(employeeId, projectId, startOrStop);
            success = true;
        } catch (IOException | SQLException | ClassNotFoundException e) {
            throw e;
        }
        return success;
    }

    public ArrayList<Object[]> getActiveProjects() throws IOException, SQLException, ClassNotFoundException {
        ArrayList<Object[]> rowsOfProjects = null;
        ArrayList<Project> activeProjects;
        try {
            activeProjects = projectDAO.getActiveProjects();
            if (activeProjects != null) {
                rowsOfProjects = new ArrayList<>();
                for (Project p : activeProjects) {
                    rowsOfProjects.add(new Object[]{p.getProjectId(), p.getProjectName(), p.getProjectDescription()});
                }
            }
        } catch (IOException | SQLException | ClassNotFoundException ex) {
            throw ex;
        }
        return rowsOfProjects;
    }
}
