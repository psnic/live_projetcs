/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MT_userlogin;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.SessionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author user
 */
@SessionAttributes({"SALT", "LOGIN"})
@Controller
public class ReportController {

    @Autowired
    SessionFactory sessionFactory;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "statementofproposal.htm", method = RequestMethod.GET)
    public ModelAndView statementofproposal(@RequestParam(value = "fir_no", required = true) String fir_no, @RequestParam(value = "dateofincidence", required = true) String dateofincidence, @RequestParam(value = "reportid", required = true) String reportid, HttpServletResponse response, HttpServletRequest request, ModelMap mp) throws ServletException, IOException, ClassNotFoundException, SQLException {
        ModelAndView mv = new ModelAndView("nostampcert");
        ServletContext context = request.getSession().getServletContext();
        Session session = sessionFactory.openSession();
        SessionImpl sessionImpl = (SessionImpl) session;
        String reportName = "statementofproposal.jrxml";
        String res = "-1";

        try {
            String sr = context.getRealPath("/") + "reports/";
//            String logo = context.getRealPath("/") + "images/";
            JasperDesign jasperDesignMain = JRXmlLoader.load(sr + reportName);
            JasperReport jasperReportMain = JasperCompileManager.compileReport(jasperDesignMain);

            Map<String, Object> parameters = new HashMap<String, Object>();

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dateofincidence);
            java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(parsedDate);
            String monthName = new SimpleDateFormat("MMMM").format(calendar.getTime());

            parameters.put("fir_no", fir_no);
            parameters.put("reportid", reportid);
            parameters.put("dateofincidence", dateofincidence);
            parameters.put("month", monthName);

            System.out.println("dateofincidence: " + sqlDate);
            System.out.println("fir_no: " + fir_no);
            System.out.println("monthName: " + monthName);
//            parameters.put("dynamicpath", logo);

            JasperPrint jasperprint1 = JasperFillManager.fillReport(jasperReportMain, parameters, sessionImpl.connection());
            List<JasperPrint> jprintlist = new ArrayList<JasperPrint>();
            jprintlist.add(jasperprint1);
//            JRPdfExporter exporter = new JRPdfExporter();
//            exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT_LIST, jprintlist);
//            ServletOutputStream output = response.getOutputStream();
//            response.setHeader("Content-disposition", "inline; filename=\"Statement_Of_Proposal.pdf\"");
//            response.setContentType("application/pdf");
//            exporter.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, output);
//            exporter.exportReport();

            //For D-Sign
//            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
//            exporter.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, byteArrayOutputStream);

            //Convert the PDF to Base64
//            byte[] pdfBytes = byteArrayOutputStream.toByteArray();
//            String base64PDF = Base64.getEncoder().encodeToString(pdfBytes);
//            System.out.println("base64: " + base64PDF);

            byte[] pdfdata = JasperExportManager.exportReportToPdf(jasperprint1);

            res = Base64.getEncoder().encodeToString(pdfdata);
            
            System.out.println("res: "+res);
            mv.addObject("base64", res);

        } catch (Exception e) {
            System.out.println("report: " + e.toString());
        }
        return mv;
    }
    
    

    @RequestMapping(value = "view_agendanote.htm", method = RequestMethod.GET)
    public void view_agendanote(@RequestParam(value = "note_number", required = true) String note_number, HttpServletResponse response, HttpServletRequest request, ModelMap mp) throws ServletException, IOException, ClassNotFoundException, SQLException {
        ServletContext context = request.getSession().getServletContext();
        Session session = sessionFactory.openSession();
        SessionImpl sessionImpl = (SessionImpl) session;
        String reportName = "view_agendanote.jrxml";

        try {
            String sr = context.getRealPath("/") + "reports/";
//            String logo = context.getRealPath("/") + "images/";
            JasperDesign jasperDesignMain = JRXmlLoader.load(sr + reportName);
            JasperReport jasperReportMain = JasperCompileManager.compileReport(jasperDesignMain);

            Map<String, Object> parameters = new HashMap<String, Object>();

            parameters.put("note_number", note_number);
//            parameters.put("reportid", reportid);
//            parameters.put("dateofincidence", dateofincidence);
//            parameters.put("month", monthName);

//            System.out.println("dateofincidence: " + sqlDate);
//            System.out.println("fir_no: " + fir_no);
//            System.out.println("monthName: " + monthName);
//            parameters.put("dynamicpath", logo);
            JasperPrint jasperprint1 = JasperFillManager.fillReport(jasperReportMain, parameters, sessionImpl.connection());
            List<JasperPrint> jprintlist = new ArrayList<JasperPrint>();
            jprintlist.add(jasperprint1);
            JRPdfExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT_LIST, jprintlist);
            ServletOutputStream output = response.getOutputStream();
            response.setHeader("Content-disposition", "inline; filename=\"AgendaNote.pdf\"");
            response.setContentType("application/pdf");
            exporter.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, output);
            exporter.exportReport();
        } catch (Exception e) {
            System.out.println("report: " + e.toString());
        }
    }

    @RequestMapping(value = "agendanote.htm", method = RequestMethod.GET)
    public void agendanote(HttpServletResponse response, HttpServletRequest request, ModelMap mp) throws ServletException, IOException, ClassNotFoundException, SQLException {
        ServletContext context = request.getSession().getServletContext();
        Session session = sessionFactory.openSession();
        SessionImpl sessionImpl = (SessionImpl) session;
        String reportName = "agendanote.jrxml";

        try {
            String sr = context.getRealPath("/") + "reports/";
//            String logo = context.getRealPath("/") + "images/";
            JasperDesign jasperDesignMain = JRXmlLoader.load(sr + reportName);
            JasperReport jasperReportMain = JasperCompileManager.compileReport(jasperDesignMain);

            Map<String, Object> parameters = new HashMap<String, Object>();

//            parameters.put("dynamicpath", logo);
            JasperPrint jasperprint1 = JasperFillManager.fillReport(jasperReportMain, parameters, sessionImpl.connection());
            List<JasperPrint> jprintlist = new ArrayList<JasperPrint>();
            jprintlist.add(jasperprint1);
            JRPdfExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT_LIST, jprintlist);
            ServletOutputStream output = response.getOutputStream();
            response.setHeader("Content-disposition", "inline; filename=\"Agenda_Note.pdf\"");
            response.setContentType("application/pdf");
            exporter.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, output);
            exporter.exportReport();
        } catch (Exception e) {
            System.out.println("report: " + e.toString());
        }
    }
    
    @RequestMapping(value = "viewproposal.htm", method = RequestMethod.GET)
    public void viewproposal(@RequestParam(value = "fir_no", required = true) String fir_no, @RequestParam(value = "dateofincidence", required = true) String dateofincidence, @RequestParam(value = "reportid", required = true) String reportid, HttpServletResponse response, HttpServletRequest request, ModelMap mp) throws ServletException, IOException, ClassNotFoundException, SQLException {
        ServletContext context = request.getSession().getServletContext();
        Session session = sessionFactory.openSession();
        SessionImpl sessionImpl = (SessionImpl) session;
        String reportName = "statementofproposal.jrxml";

        try {
            String sr = context.getRealPath("/") + "reports/";
//            String logo = context.getRealPath("/") + "images/";
            JasperDesign jasperDesignMain = JRXmlLoader.load(sr + reportName);
            JasperReport jasperReportMain = JasperCompileManager.compileReport(jasperDesignMain);

            Map<String, Object> parameters = new HashMap<String, Object>();
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dateofincidence);
            java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(parsedDate);
            String monthName = new SimpleDateFormat("MMMM").format(calendar.getTime());

            parameters.put("fir_no", fir_no);
            parameters.put("reportid", reportid);
            parameters.put("dateofincidence", dateofincidence);
            parameters.put("month", monthName);

            System.out.println("dateofincidence: " + sqlDate);
            System.out.println("fir_no: " + fir_no);
            System.out.println("monthName: " + monthName);
//            parameters.put("dynamicpath", logo);

            JasperPrint jasperprint1 = JasperFillManager.fillReport(jasperReportMain, parameters, sessionImpl.connection());
            List<JasperPrint> jprintlist = new ArrayList<JasperPrint>();
            jprintlist.add(jasperprint1);
            JRPdfExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT_LIST, jprintlist);
            ServletOutputStream output = response.getOutputStream();
            response.setHeader("Content-disposition", "inline; filename=\"Statement_Of_Proposal.pdf\"");
            response.setContentType("application/pdf");
            exporter.setParameter(JRPdfExporterParameter.OUTPUT_STREAM, output);
            exporter.exportReport();
        } catch (Exception e) {
            System.out.println("report: " + e.toString());
        }
    }
}
