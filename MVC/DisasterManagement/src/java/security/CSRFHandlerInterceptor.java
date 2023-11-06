
package security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class CSRFHandlerInterceptor extends HandlerInterceptorAdapter 
{
    
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception 
//    {
//        String header = request.getHeader("X-Requested-With");
//        String header2 = request.getHeader("X-Request");
//       //("header : "+header);
//       //("header2 : "+header2);
//        if (!"XMLHttpRequest".equals(header)) {
//            // Use this filter
//            return true;
//        } else {
//            // This is a POST request - need to check the CSRF token
//            String sessionToken = response.getHeader("X-CSRF-TOKEN");
//            String requestToken = request.getHeader("X-CSRF-TOKEN");   
//           //("sessionToken : "+sessionToken);
//           //("requestToken : "+requestToken);
//            if (sessionToken.equals(requestToken)) {
//                return true;
//            } else {
//               //("Bad or missing CSRF value");
//                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bad or missing CSRF value");
//                return false;
//            }
//        }
//    }    
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception 
    {
        String header = request.getHeader("X-Requested-With");
        String header2 = request.getHeader("X-Request");
        String sessionToken = response.getHeader("X-CSRF-TOKEN");
        String requestToken = request.getHeader("X-CSRF-TOKEN");        
        
//       //("csrf url : "+request.getRequestURI());
        
        
//       //("header : "+header);
//       //("header2 : "+header2);   
//       //("sessionToken : "+sessionToken);
//       //("requestToken : "+requestToken);        
//        System.out.println("1");
        if ("XMLHttpRequest".equals(header) || "XMLHttpRequest".equals(header2)) {            
            // This is a POST request - need to check the CSRF token
            if (sessionToken.equals(requestToken)) {
                return true;
            } else {
//               //("Bad or missing CSRF value");
//                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bad or missing CSRF value");
                return false;
            }            
        } else {
            // Use this filter
            return true;
        }
    }
}
