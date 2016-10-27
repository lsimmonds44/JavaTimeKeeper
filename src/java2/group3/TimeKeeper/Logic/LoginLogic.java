/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.util.Locale;
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
            if (employeeAccess.getEmployee(employeeId).getPassword().equals(password)) {
                verifiedEmployee = employeeAccess.getEmployee(employeeId);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return verifiedEmployee;
    }
    
    public void launchMainMenu(Locale locale, String bundleName, Employee employee){
        MainMenuFrame mainMenu = new MainMenuFrame(locale, bundleName, employee);
        mainMenu.setVisible(true);
    }
}
