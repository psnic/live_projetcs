/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAOImpl.CommonDaoImpl;
import DAOImpl.FirDaoImpl;
import it.sauronsoftware.jave.EncoderException;
import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Document;
import model.Exgratia_norm;
import model.Fir;
import model.MT_userlogin;
import model.M_block;
import model.M_districts;
import model.M_infrastructure;
import model.T_Property_Damaged;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author user
 */
@SessionAttributes({"SALT", "LOGIN"})
@Controller
public class FirController {

    @Autowired
    public CommonDaoImpl cdao;
    @Autowired
    public FirDaoImpl fdao;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/savefir.htm", method = RequestMethod.POST)
    @ResponseBody
    public String savefir(ModelMap mp,
            @ModelAttribute("fir") Fir fir,
            @RequestParam("time_occurrence") String timeOccurrence,
            @RequestParam("photos") MultipartFile[] files,
            @RequestParam(value = "infrastructure[]", required = false) String[] infrastructures,
            @RequestParam(value = "damagedInfra[]", required = false) String[] damagedInfra,
            BindingResult result, HttpSession session, HttpServletRequest request) throws IOException, IllegalArgumentException, EncoderException {

        String res = "-1";
        String doc = "-1";

        try {
            // Parse timeOccurrence to java.sql.Time
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            java.util.Date parsedDate = timeFormat.parse(timeOccurrence);
            Time time = new Time(parsedDate.getTime());
            // Set the time in the Fir object
            fir.setTime_of_calamity_occurence(time);
            fir.setLogdate(new Date());
            res = fdao.saveFir(fir);
            
            if (res != null && !res.equals("-1")) {
                // Check if infrastructure and damagedInfra arrays have data
                if (infrastructures != null && damagedInfra != null && infrastructures.length == damagedInfra.length) {
                    // Save infrastructure damage data
                    for (int i = 0; i < infrastructures.length; i++) {
                        String infrastructureId = infrastructures[i];
                        int totalDamage = Integer.parseInt(damagedInfra[i]);

                        M_infrastructure infrastructure = new M_infrastructure();
                        infrastructure.setInfrastructure_id(Integer.parseInt(infrastructureId));

                        T_Property_Damaged propertyDamaged = new T_Property_Damaged();
                        propertyDamaged.setInfrastructure_id(infrastructure);
                        propertyDamaged.setTotal_damage(totalDamage);
                        propertyDamaged.setFir_no(fir);

                        doc = fdao.savePropertyDamaged(propertyDamaged);
                    }
                }

                // Save multiple files
                for (MultipartFile file : files) {
                    if (!file.isEmpty()) {
                        Document document = new Document();
                        document.setDocumentName(file.getOriginalFilename());
                        document.setFiletype(file.getContentType());
                        document.setFilestored(file.getBytes());
                        document.setFir_no(fir);

                        fdao.saveDocument(document);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("FirController|savefir: " + e.toString());
        }

        return res;
    }
}
