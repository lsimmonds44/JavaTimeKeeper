/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataObjects;

import java.time.LocalDateTime;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeRecord {

    private int projectId;
    private int employeeId;
    private char startOrStop;
    private LocalDateTime dateTime;

    public TimeRecord() {
    }

    public TimeRecord(int projectId, int personId, char startOrStop, LocalDateTime dateTime) {
        this.projectId = projectId;
        this.employeeId = personId;
        this.startOrStop = startOrStop;
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        return this.getProjectId() + "|" + this.getEmployeeId() + "|" + this.getStartOrStop() + "|" + this.getDateTime();
    }

    /**
     * @return the projectId
     */
    public int getProjectId() {
        return projectId;
    }

    /**
     * @return the employeeId
     */
    public int getEmployeeId() {
        return employeeId;
    }

    /**
     * @return the startOrStop
     */
    public char getStartOrStop() {
        return startOrStop;
    }

    /**
     * @return the dateTime
     */
    public LocalDateTime getDateTime() {
        return dateTime;
    }

    /**
     * @param projectId the projectId to set
     */
    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    /**
     * @param employeeId the employeeId to set
     */
    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * @param startOrStop the startOrStop to set
     */
    public void setStartOrStop(char startOrStop) {
        this.startOrStop = startOrStop;
    }

    /**
     * @param dateTime the dateTime to set
     */
    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

}
