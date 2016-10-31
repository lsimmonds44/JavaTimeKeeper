/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.util.ResourceBundle;
import java2.group3.TimeKeeper.DataAccess.EmployeeDAO;
import java2.group3.TimeKeeper.DataObjects.Employee;
import java2.group3.TimeKeeper.Viewer.MainMenuFrame;

/**
 *
 * @author Skyler Hiscock
 */
public class LoginLogic {
    
    private EmployeeDAO employeeAccess = new EmployeeDAO();

    public Employee verifyAccount(String employeeId, String password) {
        Employee verifiedEmployee = null;
        try {
            Employee employee = employeeAccess.getEmployee(employeeId);
            if (employee != null)
                if(employee.getPassword().equals(password)) {
                verifiedEmployee = employeeAccess.getEmployee(employeeId);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return verifiedEmployee;
    }
}
