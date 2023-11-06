package security;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.access.ExceptionTranslationFilter;

public class MyExceptionTranslationFilter extends ExceptionTranslationFilter {

    public MyExceptionTranslationFilter() {
        setAccessDeniedHandler(new MyAccessDeniedHandlerImpl());
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {


        // This filter is only for AJAX requests
        String header = ((HttpServletRequest) req).getHeader("X-Requested-With");
        String header2 = ((HttpServletRequest) req).getHeader("X-Request");

      

        if ("XMLHttpRequest".equals(header)) {
            if ("XMLHttpRequest".equals(header2)) {
                // Skip it
                chain.doFilter(req, res);
            }
            // Use this filter
            super.doFilter(req, res, chain);
        } else {
            // Skip it
            chain.doFilter(req, res);
        }
    }

    @Override
    public void afterPropertiesSet() {
        // do nothing
    }

    @Override
    protected void sendStartAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, AuthenticationException reason) throws ServletException, IOException {
//       //(" sendStartAuthentication url "+request.getRequestURI());
        response.getWriter().write("No active session. Expired maybe? Please login again.");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    }

    class MyAccessDeniedHandlerImpl extends AccessDeniedHandlerImpl {

        @Override
        public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
//           //(" MyAccessDeniedHandlerImpl url "+request.getRequestURI());
            response.getWriter().write("You are not authorized to do this.");
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
        }
    }

}
