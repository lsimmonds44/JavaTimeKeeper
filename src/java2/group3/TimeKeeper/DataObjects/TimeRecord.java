/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataObjects;

import java.util.Date;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeRecord {
    private int projectId;
    private int personId;
    private char startOrStop;
    private Date dateTime;
    
    public TimeRecord(int projectId, int personId, char startOrStop, Date dateTime){
        this.projectId = projectId;
        this.personId = personId;
        this.startOrStop = startOrStop;
        this.dateTime = dateTime;
    }
    
    @Override
    public String toString(){
        return this.projectId + "|" + this.personId + "|" + this.startOrStop + "|" + this.dateTime;
    }
    
}
