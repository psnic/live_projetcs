package security;

//package security;
//
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.GenericFilterBean;

//@Component("blSessionFixationProtectionFilter")
public class SessionFixationProtectionFilter extends GenericFilterBean {

    private static final Log LOG = LogFactory.getLog(SessionFixationProtectionFilter.class);

    protected static final String SESSION_ATTR = "SFP-ActiveID";
    
//    @Resource(name = "blSessionFixationEncryptionModule")
//    protected EncryptionModule encryptionModule;

//    @Resource(name = "blCookieUtils")
//    protected CookieUtils cookieUtils;

    @Override
    public void doFilter(ServletRequest sRequest, ServletResponse sResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) sRequest;
        HttpServletResponse response = (HttpServletResponse) sResponse;
        HttpSession session = request.getSession(false);
        
        if (SecurityContextHolder.getContext() == null) {
            chain.doFilter(request, response);
        }
        String session_atr="";
        session_atr= (String) session.getAttribute(SESSION_ATTR);
        String activeIdSessionValue = (session == null) ? null : session_atr;
        
//        if (StringUtils.isNotBlank(activeIdSessionValue) ) {
////        if (StringUtils.isNotBlank(activeIdSessionValue) && request.isSecure()) {
//            // The request is secure and and we've set a session fixation protection cookie
//
//            String activeIdCookieValue = cookieUtils.getCookieValue(request, SessionFixationProtectionCookie.COOKIE_NAME);
//            String decryptedActiveIdValue = encryptionModule.decrypt(activeIdCookieValue);
//            
//            if (!activeIdSessionValue.equals(decryptedActiveIdValue)) {
//                abortUser(request, response);
//                LOG.info("Session has been terminated. ActiveID did not match expected value.");
//                return;
//            }
////        } else if (request.isSecure() && session != null) {
//        } else if (session != null) {
//            // If there is no session (session == null) then there isn't anything to worry about
//            
//            // The request is secure, but we haven't set a session fixation protection cookie yet
//            String token = null;
////            try {
////                token = RandomGenerator.generateRandomId("SHA1PRNG", 32);
////            } catch (NoSuchAlgorithmException e) {
//////                throw new ServletException(e);
////            }
//            
////            String encryptedActiveIdValue = encryptionModule.encrypt(token);
//            
//            session.setAttribute(SESSION_ATTR, token);
////            cookieUtils.setCookieValue(response, SessionFixationProtectionCookie.COOKIE_NAME, encryptedActiveIdValue, "/", -1, true);
//        }
                
        chain.doFilter(request, response);
    }

    protected void abortUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SecurityContextHolder.clearContext();
//        cookieUtils.invalidateCookie(response, SessionFixationProtectionCookie.COOKIE_NAME);
//        if (BLCRequestUtils.isOKtoUseSession(new ServletWebRequest(request))) {
            request.getSession().invalidate();
//        }
        response.sendRedirect("/"); 
    }

}