package security;

//package Security;
//
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import model.AuditTrial;
//import models.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
//import services.UserServiceInterface;
import org.springframework.web.bind.annotation.SessionAttributes;
//import services.AuditTrailServiceInterface;
//import services.UploadDocServiceInterface;
//import services.UtilServiceInterface;

//@Component
//This is the class that get's called when user has successfully logged in login-screen
@SessionAttributes("sessionobject")
public class MyAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

//    @Autowired
//    private UserServiceInterface userservice;
    private String userResponseCaptcha;
    private String sessionCaptcha;
//    @Autowired
//    private AuditTrailServiceInterface atservices;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        userResponseCaptcha = (String) request.getAttribute("jcaptchalogin");
        sessionCaptcha = (String) request.getSession().getAttribute("CAPTCHA_KEY_LOGIN");

//           //("successfully login");
//             String emailid = SecurityContextHolder.getContext().getAuthentication().getName();
//             Login login=userservice.getUser(emailid);
//             
//             String usercode=login.getUsercode().toString();
//             if(usercode.matches(Patterns.PATTERN_NUMERIC) && usercode.length()<999)
//             {
//                 request.getSession().removeAttribute("hortihub_usercode");
//                 request.getSession().setAttribute("hortihub_usercode", Short.parseShort(usercode));
//             }
//             
//             
//             if(emailid.matches(Patterns.PATTERN_ALPHA_NUMERIC) && emailid.length()<=50)
//             {
//                 request.getSession().removeAttribute("hortihub_emailid");
//                 request.getSession().setAttribute("hortihub_emailid", emailid);
//             }
//             
//             String name=login.getFullname();
//             if(name.matches(Patterns.PATTERN_FULL_NAME) && name.length()<=100)
//             {
//                 request.getSession().removeAttribute("hortihub_name");
//                 request.getSession().setAttribute("hortihub_name",name );
//             }
//             String rolecode=login.getRole().getRolecode();
//             if(rolecode.matches(Patterns.PATTERN_NAME) && rolecode.length()<=1)
//             {
//                 request.getSession().removeAttribute("hortihub_role");
//                 request.getSession().setAttribute("hortihub_role",rolecode );
//             }
//             
//             String rolename=login.getRole().getRolename();
//             if(rolename.matches(Patterns.PATTERN_NAME) && rolename.length()<=50)
//             {
//                 request.getSession().removeAttribute("hortihub_rolename");
//                 request.getSession().setAttribute("hortihub_rolename",rolename );
//             }
//             
//             String districtcode=login.getDistrict().getDistrictcode().toString();
//             if(districtcode.matches(Patterns.PATTERN_NUMERIC) && districtcode.length()<=999)
//             {
//                 request.getSession().removeAttribute("hortihub_districtcode");
//                 request.getSession().setAttribute("hortihub_districtcode",Short.parseShort(districtcode) );
//             }
//             
//             String districtname=login.getRole().getRolename();
//             if(districtname.matches(Patterns.PATTERN_FULL_NAME) && districtname.length()<=255)
//             {
//                 request.getSession().removeAttribute("hortihub_districtname");
//                 request.getSession().setAttribute("hortihub_districtname",districtname );
//             }
//             
//             String designation=login.getDesignation().getDesignation();
//             if(designation.matches(Patterns.PATTERN_DESIGNATION) && designation.length()<=255)
//             {
//                 request.getSession().removeAttribute("hortihub_designation");
//                 request.getSession().setAttribute("hortihub_designation",designation );
//             }
//             
//             
//             Integer hubcode=userservice.getHubcodeForUser(login.getUsercode()+"");
//             
//             String hcode=hubcode.toString();
//             if(hcode.matches(Patterns.PATTERN_NUMERIC) && hcode.length()<999)
//             {
//                 request.getSession().removeAttribute("hortihub_hubcode");
//                 request.getSession().setAttribute("hortihub_hubcode", Short.parseShort(hcode));
//             }
//             
//            String hubname=userservice.getHubNameForUser(hubcode+"");
//             if(hubname.matches(Patterns.PATTERN_FULL_NAME) && hubname.length()<=50)
//             {
//                 request.getSession().removeAttribute("hortihub_hubname");
//                 request.getSession().setAttribute("hortihub_hubname",hubname );
//             }
//             
        //System.out.println("CAPTCHA "+userResponseCaptcha+" -- "+sessionCaptcha);
//        setDefaultTargetUrl("/login.htm");
//        if (sessionCaptcha != null && userResponseCaptcha.equals(sessionCaptcha)) {
            //Login Successful
//            AuditTrail audit = new AuditTrail();
////            Pages page = new Pages();
//            page.setPagecode(Short.parseShort("1"));
//            audit.setDescription("login successful");
//            audit.setIpaddress(request.getRemoteAddr());
//            audit.setFunxtion("logging in");
//            audit.setModules("Login ");
//            audit.setPage(page);
//            atservices.saveAuditTrail(audit);
            setDefaultTargetUrl("/p1_villagedetails.htm");
//        } else {
//            request.getSession().removeAttribute("hortihub_name");
//            request.getSession().removeAttribute("hortihub_emailid");
//            request.getSession().removeAttribute("hortihub_username");
//            request.getSession().removeAttribute("hortihub_role");
//            request.getSession().removeAttribute("sessionobject");
//            request.getSession().invalidate();
//        }

        super.onAuthenticationSuccess(request, response, authentication);
    }

}
