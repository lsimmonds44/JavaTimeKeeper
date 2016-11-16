/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper;

import java.util.Locale;
import java.util.ResourceBundle;
import java2.group3.TimeKeeper.Viewer.LoginFrame;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeKeeper {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String bundleName = "java2.group3.TimeKeeper.Resources.TimeKeeper";
        Locale currentLocale = Locale.FRANCE;
        ResourceBundle bundle = ResourceBundle.getBundle(bundleName, currentLocale);
        
        LoginFrame loginFrame = new LoginFrame(bundle);
        loginFrame.setVisible(true);
    }

}
