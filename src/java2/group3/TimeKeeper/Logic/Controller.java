/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.Logic;

import java.util.Locale;
import java2.group3.TimeKeeper.Viewer.LoginPanel;
import java2.group3.TimeKeeper.Viewer.MainMenuPanel;
import java2.group3.TimeKeeper.Viewer.TimeEntryPanel;
import java2.group3.TimeKeeper.Viewer.TimeKeeper;

/**
 *
 * @author Skyler Hiscock
 */
public class Controller {
    
    
        public static void main(String[] args) {
        String bundleName = "java2.group3.TimeKeeper.Resources.TimeKeeper";
        Locale currentLocale = Locale.ENGLISH;
        TimeKeeper timeKeeper = new TimeKeeper(currentLocale, bundleName);
        timeKeeper.setCurrentPanel("loginPanel");
        timeKeeper.setVisible(true);
    }
}
