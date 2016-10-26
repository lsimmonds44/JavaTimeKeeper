/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java2.group3.TimeKeeper.DataAccess;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java2.group3.TimeKeeper.DataObjects.TimeRecord;

/**
 *
 * @author Skyler Hiscock
 */
public class TimeRecordDAO {

    private final String workingDirectory = System.getProperty("user.dir");
    private final String fileName = workingDirectory + "/data/time_record_data.txt";

    public void appendTimeRecord(TimeRecord timeRecord) throws IOException {
        try (FileWriter fw = new FileWriter(fileName, true);
                BufferedWriter bw = new BufferedWriter(fw);
                PrintWriter out = new PrintWriter(bw)) {
            String output = timeRecord.toString();
            out.println(output);
        }
    }

    public String currentTime() {
        return LocalDateTime.now().toString();
    }
}
