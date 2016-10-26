/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataAccess;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java2.group3.TimeKeeper.DataObjects.Employee;

/**
 *
 * @author Skyler Hiscock
 */
public class EmployeeDAO {

    private final String workingDirectory = System.getProperty("user.dir");
    private final String fileName = workingDirectory + "/data/person_data.txt";

    public Employee getEmployee(String id) throws IOException {
        Employee returnEmployee = null;
        try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] splitString = line.split("\\|");
                String foundId = splitString[0];
                if (id.equals(foundId)) {
                    int empId = Integer.parseInt(foundId);
                    String firstName = splitString[1];
                    String lastName = splitString[2];
                    String password = splitString[3];
                    String role = splitString[4];
                    returnEmployee = new Employee(empId, firstName, lastName, password, role);
                }
            }
            br.close();
        }
        return returnEmployee;
    }
}
