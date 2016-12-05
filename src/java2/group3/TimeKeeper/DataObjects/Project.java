/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataObjects;

/**
 *
 * @author Skyler Hiscock
 */
public class Project implements Comparable<Project> {

    private int projectId;
    private String active;
    private String projectName;
    private String projectDescription;

    public Project(int projectId, String active, String projectName, String projectDescription) {
        this.projectId = projectId;
        this.active = active;
        this.projectName = projectName;
        this.projectDescription = projectDescription;
    }

    public int getProjectId() {
        return this.projectId;
    }

    public String getActive() {
        return this.active;
    }

    public String getProjectName() {
        return this.projectName;
    }

    public String getProjectDescription() {
        return this.projectDescription;
    }

    @Override
    public int compareTo(Project o) {
        Project p = (Project) o;
        return this.getProjectName().compareTo(p.getProjectName());
    }
}
