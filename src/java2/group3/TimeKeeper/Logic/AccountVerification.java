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
public class AccountVerification {

    EmployeeDAO employeeAccess = new EmployeeDAO();

    /**
     * Return true/false if supplied password if valid/invalid
     *
     * @param employeeId
     * @param password
     * @return true/false
     */
    public boolean verifyAccount(String employeeId, String password) {
        boolean result = false;
        Employee lookupEmployee = null;
        try {
            lookupEmployee = employeeAccess.getEmployee(employeeId);

        } catch (Exception e) {
            System.out.println(e);
        }

        if (lookupEmployee != null) {
            if (lookupEmployee.getPassword().equals(password)) {
                result = true;
            }
        }

        return result;
    }

    /**
     * Returns an Employee object if supplied password is valid
     *
     * @param employeeId
     * @param password
     * @return verifiedEmployee
     */
    /*
    public Employee verifyAccount(String employeeId, String password) {
        Employee verifiedEmployee = null;
        try {
            if (employeeAccess.getEmployee(employeeId).getPassword().equals(password)) {
                verifiedEmployee = employeeAccess.getEmployee(employeeId);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return verifiedEmployee;
    }
     */
}
