package no.itautomationapi.pages;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.testng.annotations.Test;
 
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
 
import static org.testng.AssertJUnit.assertTrue;

//Single Execution

//@RunWith(Karate.class)
//public class PagesRunner {
//}

//Parallel Execution

@KarateOptions(tags = { "~@ignore" })
public class PagesRunner {

	 @Test
	    public void testParallel() {
	        String karateOutputPath = "\\target\\cucumber-html-reports";
	        //FileUtils.cleanDirectory(System.getProperty("user.dir") + karateOutputPath);
	        
	        File file = new File(System.getProperty("user.dir") + karateOutputPath);      
	        String[] myFiles;    
	        if (file.isDirectory()) {
	            myFiles = file.list();
	            for (int i = 0; i < myFiles.length; i++) {
	                File myFile = new File(file, myFiles[i]); 
	                myFile.delete();
	            }
	        }
	        
	        KarateStats stats = CucumberRunner.parallel(getClass(), 1, karateOutputPath);
	        generateReport(karateOutputPath);
	        assertTrue("there are scenario failures", stats.getFailCount() == 0);
	    }
	 
	    private static void generateReport(String karateOutputPath) {
	        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
	        List jsonPaths = new ArrayList(jsonFiles.size());
	        for (File file : jsonFiles) {
	            jsonPaths.add(file.getAbsolutePath());
	        }
	        Configuration config = new Configuration(new File("target"), "IT Automation - Sample Project");
	        config.addClassifications("Environment", "Test - IT Automation");
	        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
	        reportBuilder.generateReports();
	    }

}