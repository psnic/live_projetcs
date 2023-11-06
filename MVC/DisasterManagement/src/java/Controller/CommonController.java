/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAOImpl.CommonDaoImpl;
import DAOImpl.ExgratiaDaoImpl;
import com.google.gson.Gson;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.AgendaNote;
import model.Beneficiary;
import model.Document_report;
import model.Document_type;
import model.Exgratia_norm;
import model.Fir;
import model.History_forwarding;
import model.MT_userlogin;
import model.M_block;
import model.M_districts;
import model.M_infrastructure;
import model.M_status;
import model.M_village;
import model.Proposal;
import model.Sequence;
import model.T_exgratia_form;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author user
 */
@SessionAttributes({"SALT", "LOGIN"})
@Controller
public class CommonController {

    @Autowired
    public CommonDaoImpl cdao;
    @Autowired
    public ExgratiaDaoImpl edao;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "fir.htm", method = RequestMethod.GET)
    public ModelAndView fir(@ModelAttribute("fir") Fir fir, ModelMap mp) {
        ModelAndView mv = new ModelAndView("fir");
        MT_userlogin userlogin = new MT_userlogin();
        userlogin = (MT_userlogin) mp.get("LOGIN");
        mv.addObject("ul", userlogin);
        mv.addObject("calamitylist", cdao.getAllCalamities());
        System.out.println("ul: " + userlogin.toString());
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }

    @RequestMapping(value = "campdetails.htm", method = RequestMethod.GET)
    public ModelAndView campDetails() {
        ModelAndView mv = new ModelAndView("campdetails");
        MT_userlogin userlogin = new MT_userlogin();
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }
    @RequestMapping(value = "registerdsc.htm", method = RequestMethod.GET)
    public ModelAndView registerDSC() {
        ModelAndView mv = new ModelAndView("RegisterDSC");
        MT_userlogin userlogin = new MT_userlogin();
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }
    
    @RequestMapping(value = "nostampcert.htm", method = RequestMethod.GET)
    public ModelAndView noStampCert() {
        ModelAndView mv = new ModelAndView("nostampcert");
        MT_userlogin userlogin = new MT_userlogin();
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }
    
    @RequestMapping(value = "index.htm", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");
        MT_userlogin userlogin = new MT_userlogin();
        try {
//            if (userlogin != null) {
                mv.addObject("pr_count", cdao.getCountPendingReport());
                mv.addObject("apv_count", cdao.getCountForwardedProposalsInCS());
                mv.addObject("ben", cdao.getCountRegisteredBeneficiaries());
//            }
        } catch (Exception e) {
            System.out.println("E: index: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "dailyreport.htm", method = RequestMethod.GET)
    public ModelAndView dailyReport() {
        ModelAndView mv = new ModelAndView("dailyreport");
        MT_userlogin userlogin = new MT_userlogin();
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }
    
    @RequestMapping(value = "sanctionedproposals.htm", method = RequestMethod.GET)
    public ModelAndView sanctionedProposals() {
        ModelAndView mv = new ModelAndView("sanctioned_proposals");
        MT_userlogin userlogin = new MT_userlogin();
//        try {
//            if (userlogin != null) {
//                mv.addObject("menuitems", "menuitems");
//            }
//        } catch (Exception e) {
//            System.out.println("E: getMenu: " + e.toString());
//        }
        return mv;
    }

    @RequestMapping(value = "/gratuitous.htm", method = RequestMethod.GET)
    public ModelAndView gratuitous(@ModelAttribute("beneficiary") Beneficiary beneficiary, ModelMap mp) {
        ModelAndView mv = new ModelAndView("gratuitous");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("financialyear", getCurrentFinancialYear());
                mv.addObject("villagelist", cdao.getvillagefromblock(userlogin.getBlockcode().getBlockcode()));
                mv.addObject("firlist", cdao.getAllFir());
                mv.addObject("datelist", cdao.getAllDateFromFir());
                mv.addObject("existingData", cdao.getBeneficiaryAssistance());
            }
        } catch (Exception e) {
            System.out.println("E: gratuitous: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/generatereport.htm", method = RequestMethod.GET)
    public ModelAndView generate_report(ModelMap mp) {
        ModelAndView mv = new ModelAndView("generate_report");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumbers());
            }
        } catch (Exception e) {
            System.out.println("E: generatereport: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/dc_pending.htm", method = RequestMethod.GET)
    public ModelAndView dc_pending(ModelMap mp) {
        ModelAndView mv = new ModelAndView("DC_pending");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getFirDetailsPendingInDC());
                mv.addObject("actionlist", cdao.getProcessFlowDC());
            }
        } catch (Exception e) {
            System.out.println("CommonController: dc_pending: " + e.toString());
        }
        return mv;
    }
    
    @RequestMapping(value = "/bdo_returned_proposals.htm", method = RequestMethod.GET)
    public ModelAndView bdoReturnedProposals(ModelMap mp) {
        ModelAndView mv = new ModelAndView("BDO_returned_proposals");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getFirDetailsPendingInBDO());
            }
        } catch (Exception e) {
            System.out.println("CommonController: bdoReturnedProposals: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/revenue_pending.htm", method = RequestMethod.GET)
    public ModelAndView revenue_pending(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_pending");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getFirDetailsPendingInRevenue());
                mv.addObject("actionlist", cdao.getProcessFlowRevenue());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_pending: " + e.toString());
        }
        return mv;
    }
    
    @RequestMapping(value = "/dc_returned_proposals.htm", method = RequestMethod.GET)
    public ModelAndView dcReturnedProposals(ModelMap mp) {
        ModelAndView mv = new ModelAndView("DC_returned_proposals");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getRejectedProposalsInDC());
                mv.addObject("actionlist", cdao.getProcessFlowDC());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_pending: " + e.toString());
        }
        return mv;
    }
    
    @RequestMapping(value = "/revenue_postfacto_pending.htm", method = RequestMethod.GET)
    public ModelAndView revenue_postfacto_pending(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_postfacto_pending");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getPostFactoFirDetails());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_postfacto_pending: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/revenue_agendanote.htm", method = RequestMethod.GET)
    public ModelAndView revenue_agendanote(ModelMap mp, @ModelAttribute("agendanote") AgendaNote agendanote) {
        ModelAndView mv = new ModelAndView("Revenue_agendanote");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("calamitylist", cdao.getAllCalamities());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("districtlist", cdao.getAllDistricts());
                mv.addObject("agendalist", cdao.getAllDetailsForAgendaNoteGeneration());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_agendanote: " + e.toString());
        }
        return mv;
    }
    
    @RequestMapping(value = "/revenue_sanction_approval.htm", method = RequestMethod.GET)
    public ModelAndView revenue_sanction_approval(ModelMap mp, @ModelAttribute("agendanote") AgendaNote agendanote) {
        ModelAndView mv = new ModelAndView("Revenue_sanction_approval");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("sanctionlist", cdao.getSanctionsForApproval());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_sanction_approval: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/revenue_sanction_report.htm", method = RequestMethod.GET)
    public ModelAndView revenue_sanction_report(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_sanction_report");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                List<Object[]> reportList = cdao.getSanctionReports();
                BigInteger totalAmount = (BigInteger) reportList.get(0)[7];
                mv.addObject("reportlist", cdao.getSanctionReports());
                mv.addObject("totalAmount", totalAmount); 
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_sanction_report: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/revenue_view_agendanote.htm", method = RequestMethod.GET)
    public ModelAndView revenue_view_agendanote(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_view_agendanote");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("agendalist", cdao.getAllGeneratedAgendaNotes());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_view_agendanote: " + e.toString());
        }
        return mv;
    }
    
    @RequestMapping(value = "/revenue_history.htm", method = RequestMethod.GET)
    public ModelAndView revenue_history(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_history");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("apv_cslist", cdao.getFirDetailsApprovedByCS());
                mv.addObject("pending_seclist", cdao.getProposalsPendingInSEC());
                mv.addObject("apv_seclist", cdao.getProposalsApprovedBySEC());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_history: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/cs_pending.htm", method = RequestMethod.GET)
    public ModelAndView cs_pending(ModelMap mp) {
        ModelAndView mv = new ModelAndView("CS_pending");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getDistinctFirNumberswithReportid());
                mv.addObject("astlist", cdao.getAllAssistanceHeads());
                mv.addObject("pendinglist", cdao.getFirDetailsPendingInCS());
            }
        } catch (Exception e) {
            System.out.println("CommonController: revenue_pending: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/bdoforwardedproposals.htm", method = RequestMethod.GET)
    public ModelAndView bdoforwardedproposals(ModelMap mp) {
        ModelAndView mv = new ModelAndView("bdo_forwarded_proposals");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getForwardedBdoProposals());
            }
        } catch (Exception e) {
            System.out.println("CommonController: bdoforwardedproposals: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/forwardedproposalsfromdctorevenue.htm", method = RequestMethod.GET)
    public ModelAndView forwardedproposalsfromdctorevenue(ModelMap mp) {
        ModelAndView mv = new ModelAndView("DC_forwarded");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getFirDetailsForwardedFromDcToRevenue());
            }
        } catch (Exception e) {
            System.out.println("CommonController: forwardedproposalsfromdctorevenue: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/forwardedproposalsfromrevtocs.htm", method = RequestMethod.GET)
    public ModelAndView forwardedproposalsfromrevenuetocs(ModelMap mp) {
        ModelAndView mv = new ModelAndView("Revenue_forwarded");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getFirDetailsForwardedFromRevToCS());
            }
        } catch (Exception e) {
            System.out.println("CommonController: forwardedproposalsfromrevenuetocs: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/approvedproposals.htm", method = RequestMethod.GET)
    public ModelAndView approvedproposals(ModelMap mp) {
        ModelAndView mv = new ModelAndView("approved_proposals");
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        try {
            if (userlogin != null) {
                mv.addObject("exlist", cdao.getFirDetailsApprovedByCS());
            }
        } catch (Exception e) {
            System.out.println("CommonController: approvedproposals: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "/exgratianorms.htm", method = RequestMethod.GET)
    @ResponseBody
    public String exgratianorms(HttpSession session, ModelMap mp) throws JSONException {
        String res = "";
        try {
            MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
            if (user != null) {
                List<Exgratia_norm> normslist = cdao.getAllExgratia_norms();
                res = new Gson().toJson(normslist);
            }
        } catch (Exception e) {
            System.out.println("E: exgratianorms: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/getAllInfrastructures.htm", method = RequestMethod.GET)
    @ResponseBody
    public String getAllInfrastructures(HttpSession session, ModelMap mp) throws JSONException {
        String res = "";
        try {
            MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
            if (user != null) {
                List<M_infrastructure> infralist = cdao.getAllInfrastructures();
                res = new Gson().toJson(infralist);
            }
        } catch (Exception e) {
            System.out.println("E|Controller: getAllInfrastructures: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/getvillagefromblock.htm", method = RequestMethod.GET)
    @ResponseBody
    public String getvillagefromblock(@RequestParam(value = "blockcode", required = false) String blockcode, HttpSession session, ModelMap mp) throws JSONException {
        String res = "";
        try {
            MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
            if (user != null) {
                List<M_village> villagelist = cdao.getvillagefromblock(Integer.parseInt(blockcode));
                res = new Gson().toJson(villagelist);
            }
        } catch (Exception e) {
            System.out.println("E|Controller: getvillagefromblock: " + e.toString());
        }
        return res;
    }

    @RequestMapping(value = "/generateagendanote.htm", method = RequestMethod.POST)
    @ResponseBody
    public String generateAgendaNote(ModelMap mp, @RequestBody List<Map<String, String>> selectedRows,
            HttpSession session, HttpServletRequest request) {
        String res = "-1";
        try {
            for (Map<String, String> row : selectedRows) {
                String calamity_name = row.get("calamity_name");
                String reportid = row.get("reportid");
                String proposalid = row.get("proposalid");
                String districtcodelgd = row.get("districtcodelgd");
                String remarks = row.get("remarks"); // Add remarks to the selected rows
                String note_number = row.get("note_number");

                MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");

                M_districts d = new M_districts();
                d.setDistrictcodelgd(districtcodelgd);
                Proposal p = new Proposal();
                p.setProposalid(proposalid);

                // Check if user login information is available
                if (userlogin != null) {
                    // Logic to update status in the Proposal table
                    M_status status = new M_status();
                    status.setStatuscode("AGN");

                    AgendaNote an = new AgendaNote();
                    an.setCalamity_name(calamity_name);
                    an.setDistrictcodelgd(d);
                    an.setNote_number(note_number);
                    an.setProposal(p);

                    res = cdao.saveAgendaNote(an);

                    edao.updateProposal(proposalid, status);

                    // Save the agenda note history
                    if (!res.equals("-1")) {
                        History_forwarding hf = new History_forwarding();
                        hf.setDateofforwarding(new Date());
                        hf.setRemarks(remarks);
//                        Proposal proposal = cdao.getProposalByProposalID(proposalid);
                        hf.setProposalid(p);
                        hf.setStatuscode(status);
                        hf.setUserid(userlogin);
                        cdao.saveHistoryForwarding(hf);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("CommonController|generateAgendaNote: " + e.toString());
        }
        return res;
    }

//    @RequestMapping(value = "/getfirdetailsbyassistancehead.htm", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Object[]> getFirDetailsByAssistanceHead(@RequestParam(value = "assistanceHeadCode") String assistanceHeadCode, HttpSession session, ModelMap mp) {
//        MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
//        List<Object[]> firDetailsList = null;
//        try {
//            if (user != null) {
//                firDetailsList = cdao.getFirDetailsByAssistanceHead(assistanceHeadCode);
//            }
//
//        } catch (Exception e) {
//            System.out.println("CommonController|getFirDetailsByAssistanceHead: " + e.toString());
//        }
//        return firDetailsList;
//    }
//    @RequestMapping(value = "/getfirdetailsbyassistanceheadrevenue.htm", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Object[]> getFirDetailsByAssistanceHeadRevenue(@RequestParam(value = "assistanceHeadCode") String assistanceHeadCode, HttpSession session, ModelMap mp) {
//        MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
//        List<Object[]> firDetailsList = null;
//        try {
//            if (user != null) {
//                firDetailsList = cdao.getFirDetailsByAssistanceHeadRevenue(assistanceHeadCode);
//            }
//
//        } catch (Exception e) {
//            System.out.println("CommonController|getFirDetailsByAssistanceHead: " + e.toString());
//        }
//        return firDetailsList;
//    }
//    @RequestMapping(value = "/getfirdetailsbyassistanceheadcs.htm", method = RequestMethod.GET)
//    @ResponseBody
//    public List<Object[]> getFirDetailsByAssistanceHeadCS(@RequestParam(value = "assistanceHeadCode") String assistanceHeadCode, HttpSession session, ModelMap mp) {
//        MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
//        List<Object[]> firDetailsList = null;
//        try {
//            if (user != null) {
//                firDetailsList = cdao.getFirDetailsByAssistanceHeadCS(assistanceHeadCode);
//            }
//
//        } catch (Exception e) {
//            System.out.println("CommonController|getFirDetailsByAssistanceHeadCS: " + e.toString());
//        }
//        return firDetailsList;
//    }
    @RequestMapping(value = "/getdocumenttypesforbeneficiary.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Document_type> getDocumentTypesforBeneficiary(ModelMap mp, @RequestParam(value = "norm_code") String norm_code) {
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        List<Document_type> documents = null;
        try {
            if (userlogin != null) {
                documents = cdao.getDocumentTypesForBeneficiary(Integer.valueOf(norm_code));
            }
        } catch (Exception e) {
            System.out.println("CommonController|getDocumentTypesforBeneficiary: " + e.toString());
        }
        return documents;
    }

    @RequestMapping(value = "/getdetailsforagendanote.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Object[]> getdetailsforagendanote(ModelMap mp, @RequestParam(value = "assistanceHeadCode") String assistanceHeadCode, @RequestParam(value = "calamityId") String calamityId, @RequestParam(value = "districtCode") String districtCode) {
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        List<Object[]> list = null;
        try {
            if (userlogin != null) {
                list = cdao.getDetailsForAgendaNote(assistanceHeadCode, calamityId, districtCode);
            }
        } catch (Exception e) {
            System.out.println("CommonController|getdetailsforagendanote: " + e.toString());
        }
        return list;
    }
    
    @RequestMapping(value = "/getbeneficiaries.htm", method = RequestMethod.GET)
    @ResponseBody
    public List<Object[]> getBeneficiaries(ModelMap mp, @RequestParam(value = "fir_no") String fir_no, @RequestParam(value = "reportid") String reportid) {
        MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
        List<Object[]> list = null;
        try {
            if (userlogin != null) {
                list = cdao.getBeneficiaryDetails(fir_no);
            }
        } catch (Exception e) {
            System.out.println("CommonController|getBeneficiaries: " + e.toString());
        }
        return list;
    }
    
    @RequestMapping(value = "/approveproposalsbysec.htm", method = RequestMethod.POST)
    @ResponseBody
    public String approveProposalBySec(ModelMap mp, @RequestBody List<Map<String, String>> selectedRows,
            HttpSession session, HttpServletRequest request) {
        String res = "-1";
        try {
            for (Map<String, String> row : selectedRows) {
                String proposalid = row.get("proposalid");
                String remarks = row.get("remarks"); // Add remarks to the selected rows

                MT_userlogin userlogin = (MT_userlogin) mp.get("LOGIN");
                Proposal p = new Proposal();
                p.setProposalid(proposalid);
                // Check if user login information is available
                if (userlogin != null) {
                    // Logic to update status in the Proposal table
                    M_status status = new M_status();
                    status.setStatuscode("APVSEC");
                    res=edao.updateProposal(proposalid, status);
                    if (!res.equals("-1")) {
                        History_forwarding hf = new History_forwarding();
                        hf.setDateofforwarding(new Date());
                        hf.setRemarks(remarks);
                        hf.setProposalid(p);
                        hf.setStatuscode(status);
                        hf.setUserid(userlogin);
                        cdao.saveHistoryForwarding(hf);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("CommonController|approveProposalBySec: " + e.toString());
        }
        return res;
    }

//    Local Functions
    public String getCurrentFinancialYear() {
        LocalDate currentDate = LocalDate.now();
        int currentYear = currentDate.getYear();
        int currentMonth = currentDate.getMonthValue();
        int financialYearStartMonth = Month.APRIL.getValue();
        int financialYear;
        if (currentMonth >= financialYearStartMonth) {
            financialYear = currentYear;
        } else {
            financialYear = currentYear - 1;
        }
        int nextYear = financialYear + 1;
        return financialYear + "-" + nextYear;
    }
}
