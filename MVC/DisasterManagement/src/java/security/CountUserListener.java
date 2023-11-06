/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

/**
 *
 * @author acer
 */
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountUserListener implements HttpSessionListener{
    ServletContext ctx=null;
    static int  currentUserCount=0;
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent){
//        System.out.println("sessionCreated method has been called in "+this.getClass().getName());
        currentUserCount++;
        ctx=httpSessionEvent.getSession().getServletContext();
        ctx.setAttribute("currentusers", currentUserCount);
    }
    
    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent){
//        System.out.println("sessionDestroyed method has been called in "+this.getClass().getName());
         currentUserCount--;
         ctx.setAttribute("currentusers", currentUserCount);
    }
}
