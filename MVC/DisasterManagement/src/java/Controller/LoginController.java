/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAOImpl.CommonDaoImpl;
import DAOImpl.LoginDAOImpl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.MT_userlogin;
import nl.captcha.Captcha;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import security.GenerateSalt;

/**
 *
 * @author Joshua
 */
@SessionAttributes({"SALT", "LOGIN"})
@Controller
public class LoginController {

    @Autowired
    public LoginDAOImpl logindao;

    @Autowired
    private CommonDaoImpl cdao;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "login.htm", method = RequestMethod.GET)
    public ModelAndView login(@ModelAttribute("login") MT_userlogin login, ModelMap mp, BindingResult result, HttpSession session) throws ParseException {
        ModelAndView model;
        model = new ModelAndView("login");
        String randomSaltValue = GenerateSalt.getSalt();
        mp.put("SALT", randomSaltValue);
        model.addObject("randomKey", randomSaltValue);
        return model;
    }

    @RequestMapping(value = "login.htm", method = RequestMethod.POST)
    public String login_post(@ModelAttribute("login") MT_userlogin login, ModelMap mp, BindingResult result, HttpSession session, HttpServletRequest request, @RequestHeader(value = "referer", required = false) final String referer) {
        String salt = mp.get("SALT").toString();
        String capcharesponse = ServletRequestUtils.getStringParameter(request, "captcha", "null");
        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        ModelAndView model1 = new ModelAndView("login");
        if (captcha == null || capcharesponse.isEmpty()) {
            model1.addObject("capchaerror", "Please enter the captcha");
            mp.addAttribute("msg", "Please enter the captcha");
            return "login";
        }
        if (captcha.isCorrect(capcharesponse)) {
            MT_userlogin res = logindao.authenticateuser(login.getUsername(), login.getUserpassword(), salt);
            if (res != null) {
                mp.put("LOGIN", res);
                request.setAttribute("Cookie", request.changeSessionId());
                return "redirect:home.htm";
            } else {
                String randomSaltValue = GenerateSalt.getSalt();
                mp.put("SALT", randomSaltValue);
                mp.addAttribute("randomKey", randomSaltValue);
                mp.addAttribute("loginerr", "Invalid Username/Password");
                mp.addAttribute("msg", "Invalid Username/Password");
                return "login";
            }
        }
        String randomSaltValue = GenerateSalt.getSalt();
        mp.put("SALT", randomSaltValue);
        mp.addAttribute("randomKey", randomSaltValue);
        mp.addAttribute("capchaerror", "Capcha does not match");
        mp.addAttribute("msg", "Capcha does not match");
        return "login";
    }

    @RequestMapping(value = "home.htm", method = RequestMethod.GET)
    public ModelAndView home(
            @ModelAttribute("login") MT_userlogin login,
            ModelMap mp, BindingResult result, HttpSession session) {
        ModelAndView mv = new ModelAndView("login");
        String randomSaltValue = GenerateSalt.getSalt();
        mp.put("SALT", randomSaltValue);
        mv.addObject("randomKey", randomSaltValue);
        try {
            MT_userlogin user = (MT_userlogin) mp.get("LOGIN");
            if (user != null) {
                switch (user.getRole_code().getRole_code()) {
                    case "1":
                        mv = new ModelAndView("home");
                        mv.addObject("calamitylist", cdao.getAllCalamities());
                        break;
                    case "2":
                        mv = new ModelAndView("auth_home");
                        break;
                    case "3":
                        mv = new ModelAndView("DC_home");
                        mv.addObject("pr_count", cdao.getCountPendingReport());
                        mv.addObject("pp_count", cdao.getCountPendingProposals());
                        mv.addObject("fp_count", cdao.getCountForwardedProposalsInDc());
                        mv.addObject("apv_count", cdao.getCountForwardedProposalsInCS());
                        break;
                    case "4":
                        mv = new ModelAndView("home");
                        mv.addObject("calamitylist", cdao.getAllCalamities());
                        break;
                    case "5":
                        mv = new ModelAndView("Revenue_home");
                        mv.addObject("pr_count", cdao.getCountPendingReport());
                        mv.addObject("pdc_count", cdao.getCountPendingProposals());
                        mv.addObject("pp_count", cdao.getCountPendingProposalsInRevenue());
                        mv.addObject("fp_count", cdao.getCountForwardedProposalsInRevenue());
                        mv.addObject("apv_count", cdao.getCountForwardedProposalsInCS());
                        mv.addObject("pf_count", cdao.getCountPostFactoProposalsInRevenue());
                        break;
                    case "6":
                        mv = new ModelAndView("CS_home");
                        mv.addObject("pr_count", cdao.getCountPendingReport());
                        mv.addObject("pp_count", cdao.getCountPendingProposalsInCS());
                        mv.addObject("prv_count", cdao.getCountPendingProposalsInRevenue());
                        mv.addObject("pdc_count", cdao.getCountPendingProposals());
                        mv.addObject("fp_count", cdao.getCountForwardedProposalsInCS());
                        mv.addObject("apv_count", cdao.getCountForwardedProposalsInCS());
                        break;
                }

            } else {
                mv = new ModelAndView("login");
                mv.addObject("msg", "Invalid Login / Session expired. Please login again.");
            }
        } catch (Exception e) {
            System.out.println("E: LoginController: home: " + e.toString());
        }
        return mv;
    }

    @RequestMapping(value = "logout.htm", method = RequestMethod.GET)
    @ResponseBody
    public String userlogin(HttpServletRequest req, ModelMap mp) {
        String res = "0";
        try {
            HttpSession session = req.getSession(false);
            req.setAttribute("Cookie", req.changeSessionId());
            mp.clear();
            if (session != null) {
                session.invalidate();
            }
            res = "1";
        } catch (Exception e) {
            res = "0";
            System.out.println("E: LoginController: userlogin: " + e.toString());
        }
        return res;
    }

//    @RequestMapping(value = "accountdetails.htm", method = RequestMethod.GET)
//    public ModelAndView accountdetails(ModelMap mp, HttpSession session, @ModelAttribute("userlogin") UserLogin userlogin) {
//        ModelAndView model;
//        model = new ModelAndView("accountdetails");
//        UserLogin user = (UserLogin) mp.get("LOGIN");
//        userlogin = user;
//        model.addObject("loggedinuser", user.getUsername());
//        model.addObject("userlogin", userlogin);
//        return model;
//    }
//
//    @RequestMapping(value = "/saveaccountdetails.htm", method = RequestMethod.POST)
//    @ResponseBody
//    public String saveaccountdetails(HttpServletRequest req, ModelMap mp, @ModelAttribute("userlogin") UserLogin userlogin) throws JSONException {
//        JSONObject res = new JSONObject();
////        try {
//        UserLogin olddetails = logindao.getUser(userlogin.getUserid().trim());
//        userlogin.setPassword(olddetails.getPassword());
//        String rest = logindao.saveUser(userlogin);
//        if (rest.equals("-1")) {
//            res.put("status", 0);
//            res.put("title", "Failed!");
//            res.put("msg", "Error occurred while updating account Information.");
//        } else {
//            res.put("status", 1);
//            res.put("title", "Success!");
//            res.put("msg", "Successfully update account Information.");
//            UserLogin user = logindao.getUser(userlogin.getUserid().trim());
//            mp.replace("LOGIN", user);
//        }
////        } catch (Exception e) {
////            System.out.println("E: saveaccountdetails: " + e.toString());
////        }
//        return res.toString();
//    }
}
