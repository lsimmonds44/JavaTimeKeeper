/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java2.group3.TimeKeeper.DataAccess.EmployeeDAO;
import java2.group3.TimeKeeper.DataObjects.Employee;

/**
 *
 * @author Skyler Hiscock
 */
public class LoginLogic {
    
    private EmployeeDAO employeeAccess = new EmployeeDAO();

    public Employee verifyAccount(String employeeId, String password) {
        Employee verifiedEmployee = null;
        try {
            Employee employee = employeeAccess.getPersonByIdAndPassword(Integer.parseInt(employeeId), password);
            if (employee != null) {
                verifiedEmployee = employee;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return verifiedEmployee;
    }
}
