/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java2.group3.TimeKeeper.DataAccess.ProjectDAO;
import java2.group3.TimeKeeper.DataAccess.TimeRecordDAO;
import java2.group3.TimeKeeper.DataObjects.Project;
import java2.group3.TimeKeeper.DataObjects.TimeRecord;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeEntryLogic {

    private TimeRecordDAO timeRecordDAO = new TimeRecordDAO();
    private ProjectDAO projectDAO = new ProjectDAO();

    public boolean saveTimeRecord(TimeRecord timeRecord) throws IOException {
        boolean success = false;
        try {
            timeRecordDAO.appendTimeRecord(timeRecord);
            success = true;
        } catch (IOException e) {
            throw e;
        }
        return success;
    }

    public ArrayList<Object[]> getActiveProjects() throws IOException {
        ArrayList<Object[]> rowsOfProjects = null;
        ArrayList<Project> activeProjects = null;

        try {
            activeProjects = projectDAO.getActiveProjects();
            if (activeProjects != null) {
                rowsOfProjects = new ArrayList<>();
                for (Project p : activeProjects) {
                    rowsOfProjects.add(new Object[]{p.getProjectId(), p.getProjectName(), p.getProjectDescription()});
                }
            }
        } catch (IOException ioe) {
            throw ioe;
        }

        return rowsOfProjects;
    }
}
