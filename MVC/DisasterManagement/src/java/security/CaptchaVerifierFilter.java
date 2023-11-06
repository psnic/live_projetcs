package security;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class CaptchaVerifierFilter extends OncePerRequestFilter {

    String failureUrl;
    private String userResponseCaptcha;
    private String sessionCaptcha;
    static boolean errorFlag;
    private SimpleUrlAuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();

    @Override
    public void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        userResponseCaptcha = (String) request.getParameter("jcaptchalogin");
        sessionCaptcha = (String) request.getSession().getAttribute("CAPTCHA_KEY_LOGIN");
        errorFlag = false;
        //failureHandler.setDefaultFailureUrl(failureUrl);
        //failureHandler.onAuthenticationFailure(request, response, new BadCredentialsException("Captcha invalid!"));
        //System.out.println("CAPTCHA "+userResponseCaptcha+" -- "+sessionCaptcha);

        if (userResponseCaptcha != null) {
            if (sessionCaptcha != null && userResponseCaptcha.equals(sessionCaptcha)) {
                errorFlag = false;
            } else {
                errorFlag = true;
                failureHandler.setDefaultFailureUrl(failureUrl);
                failureHandler.onAuthenticationFailure(request, response, new BadCredentialsException("Captcha invalid!"));
            }
        }
        //System.out.println("CAPTCHA "+errorFlag+ " - "+request.getContextPath());
        if (!errorFlag) {
            if (userResponseCaptcha == null) {
                userResponseCaptcha = "132";
            }
            request.setAttribute("jcaptchalogin", userResponseCaptcha);
            chain.doFilter(request, response);
        }
    }

    public String getFailureUrl() {
        return failureUrl;
    }

    public void setFailureUrl(String failureUrl) {
        this.failureUrl = failureUrl;
    }
}
