/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataAccess;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java2.group3.TimeKeeper.DataObjects.Project;

/**
 *
 * @author Skyler Hiscock
 */
public class ProjectDAO {

    private String workingDirectory = System.getProperty("user.dir");
    private String fileName = workingDirectory + "/data/project_data.txt";

    public Project getProject(String id) throws IOException {
        Project returnProject = null;
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] splitString = line.split("\\|");
                if (id.equals(splitString[0])) {
                    int projectId = Integer.parseInt(splitString[0]);
                    String active = splitString[1];
                    String projectName = splitString[2];
                    String projectDescription = splitString[3];
                    returnProject = new Project(projectId, active, projectName, projectDescription);
                }
            }
            br.close();

        }
        return returnProject;
    }
}
