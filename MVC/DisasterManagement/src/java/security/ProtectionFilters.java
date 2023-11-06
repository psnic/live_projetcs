/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "ProtectionFilters", urlPatterns = {"/*"})
public class ProtectionFilters implements Filter {

    //private static final Logger log = LoggerFactory.getLogger(ProtectionFilters.class);
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
            FilterChain filterChain) throws IOException, ServletException {
//        System.out.println("X-XSS-Protection header added to response");
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.addHeader("X-XSS-Protection", "1; mode=block");
        response.addHeader("X-Content-Type-Options", "nosniff");
        response.addHeader("X-Frame-Options", "SAMEORIGIN");
//        response.addHeader("Content-Security-Policy", "default-src data: 'self'  'unsafe-inline' 'unsafe-eval' ws:;"
//                + " style-src  'self' 'unsafe-inline';font-src 'self' data:;"
//                + " script-src  'self' 'unsafe-inline' 'unsafe-eval' ;");
//        response.addHeader("Content-Security-Policy", "default-src  'self'  'unsafe-inline' 'unsafe-eval' ws:;"
//                + " style-src  'self' 'unsafe-inline';font-src 'self' data:;"
//                + " script-src  'self' 'unsafe-inline' 'unsafe-eval';");
        response.addHeader("Strict-Transport-Security", "max-age=31556926; includeSubDomains");
        response.addHeader("Cache-Control", "no-cache, must-revalidate, max-age=0, no-store");
        response.addDateHeader("Expires", -1);
//        response.setHeader("Content-Security-Policy-Report-Only", "default-src 'self'; ");
        response.addHeader("X-Content-Type-Options", "nosniff");

        filterChain.doFilter(servletRequest, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }
}
