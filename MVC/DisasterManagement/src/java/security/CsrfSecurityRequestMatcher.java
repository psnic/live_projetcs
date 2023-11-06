/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.web.util.RequestMatcher;

/**
 *
 * @author Donald
 */
public class CsrfSecurityRequestMatcher implements RequestMatcher {
    private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS)$");
//    private RegexRequestMatcher unprotectedMatcher = new RegexRequestMatcher("/rpa/*", null);
    private Pattern pattern = Pattern.compile("(billdeskresponse[.]htm|grasresponse[.]htm)");

    @Override
    public boolean matches(HttpServletRequest request) {     
        if(allowedMethods.matcher(request.getMethod()).matches()){
            return false;
        }
        return !pattern.matcher(request.getRequestURI()).find();
    }
}