/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAOImpl.CommonDaoImpl;
import DAOImpl.ExgratiaDaoImpl;
import DAOImpl.FirDaoImpl;
import com.google.gson.Gson;
import it.sauronsoftware.jave.EncoderException;
import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Beneficiary;
import model.Document;
import model.Document_beneficiary;
import model.Document_report;
import model.Exgratia_norm;
import model.Fir;
import model.History_forwarding;
import model.MT_userlogin;
import model.M_block;
import model.M_calamity;
import model.M_districts;
import model.M_infrastructure;
import model.M_status;
import model.Proposal;
import model.Reports;
import model.T_Property_Damaged;
import model.T_exgratia_form;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
public class ExgratiaController {

    @Autowired
    public CommonDaoImpl cdao;
    @Autowired
    public FirDaoImpl fdao;
    @Autowired
    public ExgratiaDaoImpl edao;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/saveexgratia.htm", method = RequestMethod.POST)
    @ResponseBody
    public String saveexgratia(ModelMap mp,
            @ModelAttribute("beneficiary") Beneficiary beneficiary,
            @RequestParam("fir_no") String fir_no,
            @RequestParam("files") MultipartFile[] files,
            String ageCategory,
            String gender,
            @RequestParam("fin_year") String fin_year,
            @RequestParam("normSelect") String normSelect,
            String amountpayable,
            String remarks,
            BindingResult result, HttpSession session, HttpServletRequest request) throws IOException, IllegalArgumentException, EncoderException {

        String res = "-1";
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                beneficiary.setAge_category(ageCategory);
                beneficiary.setGender(gender);
                res = edao.saveBeneficiary(beneficiary);
                if (res != null && !res.equals("-1")) {
                    //save for the transactional beneficiary and ex gratia form
                    T_exgratia_form tf = new T_exgratia_form();
                    M_calamity calamity = cdao.getCalamityByFir(fir_no);
                    tf.setBeneficiary_id(beneficiary);
                    tf.setFin_year(fin_year);
                    Fir fir = new Fir();
                    fir.setFir_no(fir_no);
                    tf.setFir_no(fir);
                    tf.setLogdate(new Date());
                    Exgratia_norm en = new Exgratia_norm();
                    en.setNorm_code(Integer.parseInt(normSelect));
                    tf.setNorm_code(en);
                    tf.setRemarks(remarks);
                    tf.setAmount(Integer.parseInt(amountpayable));
                    tf.setUserid(userlogin);
                    tf.setCalamity_id(calamity);
                    edao.saveBeneficiaryExgratia(tf);
                    // Save multiple files
                    for (MultipartFile file : files) {
                        if (!file.isEmpty()) {
                            Document_beneficiary document = new Document_beneficiary();
                            document.setDocumentName(file.getOriginalFilename());
                            document.setFiletype(file.getContentType());
                            document.setFilestored(file.getBytes());
                            document.setBeneficiary_id(beneficiary);
                            cdao.saveDocumentBeneficiary(document);
                            //fdao.saveDocument(document);
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|saveexgratia: " + e.toString());
        }

        return res;
    }

//    @RequestMapping(value = "/getexgratiafromfir.htm", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Map<String, Object>> getexgratiafromfir(ModelMap mp, @RequestParam String firNo) {
//        List<Map<String, Object>> tableData = new ArrayList<>();
//        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
////        JSONArray requireddocs = new JSONArray();
//        String added = "";
//        try {
//            if (userlogin != null) {
//                List<T_exgratia_form> exgratiaForms = edao.getExgratiaFormsByFir(firNo);
//
//                for (T_exgratia_form form : exgratiaForms) {
//                    Map<String, Object> row = new HashMap<>();
//                    List<Map<String, Object>> requireddocs = new ArrayList<>();
//                    String assistance = form.getNorm_code().getDescription() + " " + form.getNorm_code().getLosstype() + " ";
//
//                    String option = form.getNorm_code().getOption();
//                    String formattedOption = (option != null && !option.equalsIgnoreCase("N.A") && !option.equalsIgnoreCase("NA")) ? option : "";
//
//                    assistance += formattedOption;
//
//                    List<Object[]> doclist = edao.getRequiredDocsListByNormcode(form.getNorm_code().getNorm_code());
//
//                    for (Object[] objects : doclist) {
//                        if (added.contains(objects[0].toString())) {
//                        } else {
//                            Map<String, Object> doc = new HashMap<>();
//                            doc.put("documentid", objects[0]);
//                            doc.put("document_name", objects[1]);
//                            requireddocs.add(doc);
//                            added += "," + objects[0].toString();
//                        }
//                    }
//
//                    row.put("beneficiaryName", form.getBeneficiary_id().getBeneficiary_name());
//                    row.put("village", form.getBeneficiary_id().getVillagecode().getVillagename());
//                    row.put("amount", form.getAmount());
//                    row.put("assistance", assistance);
//                    row.put("remarks", form.getRemarks());
//                    String reportid = form.getReportid() != null ? form.getReportid().getReportid() : "";
//                    row.put("reportid", reportid);
//                    tableData.add(row);
//                }
//
//                tableData.add("requireddocs", requireddocs);
//            }
//        } catch (Exception e) {
//            System.out.println("Error retrieving table data: " + e.toString());
//        }
//        return tableData;
//    }
    @RequestMapping(value = "/getexgratiafromfirwithreport.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> getexgratiafromfirwithreport(ModelMap mp, @RequestParam String firNo) {
        List<Map<String, Object>> tableData = new ArrayList<>();
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                List<T_exgratia_form> exgratiaForms = edao.getExgratiaFormsByFirWithReport(firNo);

                for (T_exgratia_form form : exgratiaForms) {
                    Map<String, Object> row = new HashMap<>();
                    String assistance = form.getNorm_code().getDescription() + " " + form.getNorm_code().getLosstype() + " ";

                    String option = form.getNorm_code().getOption();
                    String formattedOption = (option != null && !option.equalsIgnoreCase("N.A") && !option.equalsIgnoreCase("NA")) ? option : "";

                    assistance += formattedOption;

                    row.put("beneficiaryName", form.getBeneficiary_id().getBeneficiary_name());
                    row.put("village", form.getBeneficiary_id().getVillagecode().getVillagename());
                    row.put("amount", form.getAmount());
                    row.put("assistance", assistance);
                    row.put("remarks", form.getRemarks());
                    String reportid = form.getReportid() != null ? form.getReportid().getReportid() : "";
                    row.put("reportid", reportid);
                    tableData.add(row);
                }
            }
        } catch (Exception e) {
            System.out.println("Error retrieving table data: " + e.toString());
        }
        return tableData;
    }

    @RequestMapping(value = "/getfirdetails.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> getFirDetails(@RequestParam("firNo") String firNo) {
        List<Map<String, Object>> result = new ArrayList<>();

        String exgratiaForms = edao.getExgratiaFormByFir(firNo);
        try {
            Fir fir = edao.getFirByFirNo(firNo);
            Map<String, Object> firDetails = new HashMap<>();
            firDetails.put("firNo", fir.getFir_no());
            firDetails.put("calamityType", fir.getCalamity_id().getCalamity_name());
            firDetails.put("dateOfIncidence", fir.getDate_of_calamity_occurence());
            firDetails.put("blockName", fir.getBlockcode().getBlockname());
            firDetails.put("reportid", exgratiaForms);
            result.add(firDetails);
        } catch (Exception e) {
            System.out.println("Error fetching FIR details: " + e.toString());
        }

        return result;
    }

    @RequestMapping(value = "/forwardreport.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardReport(ModelMap mp, @ModelAttribute("report") Reports report,
            @RequestParam("firNo") String firNo,
            @RequestParam("files") MultipartFile[] files,
            @RequestParam("remarks") String remarks,
            @RequestParam("no_of_family_affected") String no_of_family_affected,
            @RequestParam("no_of_village_affected") String no_of_village_affected,
            @RequestParam("no_of_population_affected") String no_of_population_affected,
            BindingResult result, HttpSession session, HttpServletRequest request) {
        System.out.println("Here");
        String res = "-1";
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
        try {
            // Logic to save in Reports table
            if (userlogin != null) {
                M_status status = new M_status();
                status.setStatuscode("PDC");
                report.setStatuscode(status);
                report.setBlockcode(block);
                report.setUserid(userlogin);
                report.setNo_of_population_affected(no_of_population_affected);
                report.setNo_of_family_affected(no_of_family_affected);
                report.setNo_of_village_affected(no_of_village_affected);
                report.setRemarks(remarks);
                edao.savereport(report);
                System.out.println("report: " + report.toString());
                edao.updateReportId(firNo, report);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setReportid(report);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                res = cdao.saveHistoryForwarding(hf);

                // Save multiple files
//                for (MultipartFile file : files) {
//                    if (!file.isEmpty()) {
//                        Document_report document = new Document_report();
//                        document.setDocumentName(file.getOriginalFilename());
//                        document.setFiletype(file.getContentType());
//                        document.setFilestored(file.getBytes());
//                        document.setReportid(report);
//                        res = edao.saveDocumentReport(document);
//                        System.out.println("NOT EMPTY");
//                    } else {
//                        System.out.println("EMPTY");
//                    }
//                }
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/forwardproposaltorevenue.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardProposaltoRevenue(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here");
        System.out.println("remarks: " + remarks);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        System.out.println("report1: " + reportid);
        try {
            // Logic to save in Proposal table
            if (userlogin != null) {
                Proposal proposal = new Proposal();
                M_status status = new M_status();
                status.setStatuscode("FWPRD");
                proposal.setStatuscode(status);
                proposal.setBlockcode(block);
                proposal.setUserid(userlogin);
                res = edao.saveproposal(proposal);
                edao.updateProposalInReport(reportid, proposal, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|forwardProposaltoRevenue: " + e.toString());
        }
        return res;
    }
    
    @RequestMapping(value = "/forwardtorevenuepostfacto.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardPostFactoProposaltoRevenue(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here");
        System.out.println("remarks: " + remarks);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        System.out.println("report1: " + reportid);
        try {
            // Logic to save in Proposal table
            if (userlogin != null) {
                Proposal proposal = new Proposal();
                M_status status = new M_status();
                status.setStatuscode("FWPFO");
                proposal.setStatuscode(status);
                proposal.setBlockcode(block);
                proposal.setUserid(userlogin);
                res = edao.saveproposal(proposal);
                edao.updateProposalInReport(reportid, proposal, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                Reports reports = new Reports();
                reports.setReportid(reportid);
                hf.setRemarks(remarks);
                hf.setReportid(reports);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|forwardProposaltoRevenue: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/forwardproposaltodc.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardProposaltoDCByBdo(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here");
        System.out.println("remarks: " + remarks);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        System.out.println("report1: " + reportid);
        try {
            // Logic to save in Proposal table
            if (userlogin != null) {
                M_status status = new M_status();
                Reports report = new Reports();
                report.setReportid(reportid);
                status.setStatuscode("PDC");
//                edao.savereport(report);
                res = edao.updateReport(reportid, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setReportid(report);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|forwardProposaltoRevenue: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/forwardproposaltocommsec.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardProposaltoCommSec(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            @RequestParam("proposalid") String proposalid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here: " + proposalid);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        System.out.println("report1: " + reportid);
        try {
            // Logic to update status in proposal table
            if (userlogin != null) {
                Proposal proposal = cdao.getProposalByProposalID(proposalid);
                M_status status = new M_status();
                status.setStatuscode("FWPCS");
//                proposal.setStatuscode(status);
//                proposal.setBlockcode(block);
//                proposal.setUserid(userlogin);
                res = edao.updateProposal(proposalid, status);
//                edao.updateProposalInReport(reportid, proposal);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|forwardProposaltoRevenue: " + e.toString());
        }
        return res;
    }
    
    @RequestMapping(value = "/forwardrejectedproposaltorevenue.htm", method = RequestMethod.POST)
    @ResponseBody
    public String forwardRejectedProposalToRevenue(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            @RequestParam("proposalid") String proposalid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here: " + proposalid);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
        try {
            // Logic to update status in proposal table
            if (userlogin != null) {
                Proposal proposal = cdao.getProposalByProposalID(proposalid);
                M_status status = new M_status();
                status.setStatuscode("FWPRD");
                res = edao.updateProposal(proposalid, status);
                edao.updateProposalInReport(reportid, proposal, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                Reports reports = new Reports();
                reports.setReportid(reportid);
                hf.setReportid(reports);
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|forwardRejectedProposalToRevenue: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/approveproposal.htm", method = RequestMethod.POST)
    @ResponseBody
    public String approveProposal(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            @RequestParam("proposalid") String proposalid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here: " + proposalid);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        try {
            // Logic to update status in proposal table
            if (userlogin != null) {
                Proposal proposal = cdao.getProposalByProposalID(proposalid);
                M_status status = new M_status();
                status.setStatuscode("APV");
//                Proposal p = new Proposal();
//                p.setProposalid(proposalid);

//                proposal.setStatuscode(status);
//                proposal.setBlockcode(block);
//                proposal.setUserid(userlogin);
                res = edao.updateProposal(proposalid, status);
                edao.updateProposalInReport(reportid, proposal, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|approveProposal: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/returnproposaltobdo.htm", method = RequestMethod.POST)
    @ResponseBody
    public String returnToBDO(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            HttpSession session, HttpServletRequest request) {
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        try {
            // Logic to update status in proposal table
            if (userlogin != null) {
                M_status status = new M_status();
                status.setStatuscode("PBDO");
                res = edao.updateReport(reportid, status, userlogin);

                //save in history table
                History_forwarding hf = new History_forwarding();
                Reports reports = new Reports();
                reports.setReportid(reportid);
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setReportid(reports);
//                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|returnToBDO: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/rejectproposal.htm", method = RequestMethod.POST)
    @ResponseBody
    public String rejectProposal(ModelMap mp, @ModelAttribute("LOGIN") MT_userlogin userlogin,
            @RequestParam("firNo") String firNo,
            @RequestParam("remarks") String remarks,
            @RequestParam("reportid") String reportid,
            @RequestParam("proposalid") String proposalid,
            HttpSession session, HttpServletRequest request) {
        System.out.println("Here: " + proposalid);
        String res = "-1";
        userlogin = (MT_userlogin) mp.get("LOGIN");
        M_block block = edao.getBlockFromFir(firNo);
//        String report = cdao.getReportidByFirNo(firNo);
        try {
            // Logic to update status in proposal table
            if (userlogin != null) {
                Proposal proposal = cdao.getProposalByProposalID(proposalid);
                M_status status = new M_status();
                status.setStatuscode("RJPDC");
//                proposal.setStatuscode(status);
//                proposal.setBlockcode(block);
//                proposal.setUserid(userlogin);
                res = edao.updateProposal(proposalid, status);
                edao.updateProposalInReport(reportid, proposal, status, userlogin);
//                edao.updateProposalInReport(reportid, proposal);

                //save in history table
                History_forwarding hf = new History_forwarding();
                Reports reports = new Reports();
                reports.setReportid(reportid);
                hf.setDateofforwarding(new Date());
                hf.setRemarks(remarks);
                hf.setReportid(reports);
                hf.setProposalid(proposal);
                hf.setStatuscode(status);
                hf.setUserid(userlogin);
                cdao.saveHistoryForwarding(hf);
            }
        } catch (Exception e) {
            System.out.println("ExgratiaController|rejectProposal: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/bulkapproveproposals.htm", method = RequestMethod.POST)
    @ResponseBody
    public String bulkApproveProposals(ModelMap mp, @RequestBody List<Map<String, String>> selectedRows,
            HttpSession session, HttpServletRequest request) {
        String res = "-1";
        try {
            for (Map<String, String> row : selectedRows) {
                String firNo = row.get("firNo");
                String reportid = row.get("reportid");
                String proposalid = row.get("proposalid");
                String remarks = row.get("remarks"); // Add remarks to the selected rows

                MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");

                M_block block = edao.getBlockFromFir(firNo);

                // Check if user login information is available
                if (userlogin != null) {
                    // Logic to update status in the Proposal table
                    M_status status = new M_status();
                    status.setStatuscode("APV");

                    res = edao.updateProposal(proposalid, status);

                    // Save the approval history for the bulk approval
                    if (!res.equals("-1")) {
                        History_forwarding hf = new History_forwarding();
                        hf.setDateofforwarding(new Date());
                        hf.setRemarks(remarks);
                        Proposal proposal = cdao.getProposalByProposalID(proposalid);
                        hf.setProposalid(proposal);
                        hf.setStatuscode(status);
                        hf.setUserid(userlogin);
                        cdao.saveHistoryForwarding(hf);
                    }
                    // Log the bulk approval for each proposal
                    System.out.println("Bulk Approved: FIR No - " + firNo + ", Proposal ID - " + proposalid);
                }
            }

        } catch (Exception e) {
            return "Error occurred during bulk approval.";
        }
        return res;
    }

    @RequestMapping(value = "/getallfirfromdate.htm", method = RequestMethod.GET)
    @ResponseBody
    public String getallfirfromdate(@RequestParam(value = "date", required = false) String dateString, ModelMap mp) throws JSONException {
        String res = "";

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(dateString);

            List<Fir> firList = edao.getallfirfromdate(date);
            res = new Gson().toJson(firList);
        } catch (Exception e) {
            System.out.println("E|getallfirfromdate: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/getdocumentsfromreportid.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Document_report> getDocumentsFromReportid(ModelMap mp, @RequestParam(value = "reportid") String reportid) {
        System.out.println("reportid: " + reportid);
        List<Document_report> documents = edao.findDocumentReportByReportid(reportid);
        return documents;
    }

    @RequestMapping(value = "/getexgratiafromfir.htm", method = RequestMethod.GET)
    @ResponseBody
    public String getexgratiafromfir(ModelMap mp, String firNo) {
//        List<Map<String, Object>> tableData = new ArrayList<>();
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
//        JSONArray requireddocs = new JSONArray();

        JSONArray res = new JSONArray();
        JSONArray beneficiaries = new JSONArray();
        JSONArray requireddocs = new JSONArray();

        String added = "";
        try {
            if (userlogin != null) {
                List<T_exgratia_form> exgratiaForms = edao.getExgratiaFormsByFir(firNo);

                for (T_exgratia_form form : exgratiaForms) {

                    JSONObject beneficiary = new JSONObject();
                    String assistance = form.getNorm_code().getDescription() + " " + form.getNorm_code().getLosstype() + " ";
                    String option = form.getNorm_code().getOption();
                    String formattedOption = (option != null && !option.equalsIgnoreCase("N.A") && !option.equalsIgnoreCase("NA")) ? option : "";
                    assistance += formattedOption;

                    beneficiary.put("beneficiaryName", form.getBeneficiary_id().getBeneficiary_name());
                    beneficiary.put("village", form.getBeneficiary_id().getVillagecode().getVillagename());
                    beneficiary.put("amount", form.getAmount());
                    beneficiary.put("assistance", assistance);
                    beneficiary.put("remarks", form.getRemarks());
                    String reportid = form.getReportid() != null ? form.getReportid().getReportid() : "";
                    beneficiary.put("reportid", reportid);
                    beneficiaries.add(beneficiary);

                    List<Object[]> doclist = edao.getRequiredDocsListByNormcode(form.getNorm_code().getNorm_code());

                    for (Object[] objects : doclist) {
                        if (added.contains(objects[0].toString())) {
                        } else {
                            JSONObject doc = new JSONObject();
                            doc.put("documentid", objects[0]);
                            doc.put("document_name", objects[1]);
                            requireddocs.add(doc);
                            added += "," + objects[0].toString();
                        }
                    }
                }

                JSONObject allbeneficiaries = new JSONObject();
                allbeneficiaries.put("beneficiaries", beneficiaries);

                JSONObject allrequireddocuments = new JSONObject();
                allrequireddocuments.put("documents", requireddocs);

                res.add(allbeneficiaries);
                res.add(allrequireddocuments);
            }
        } catch (Exception e) {
            System.out.println("Error retrieving table data: " + e.toString());
        }
        return res.toJSONString();
    }

}
