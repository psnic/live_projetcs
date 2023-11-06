/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import model.MT_userlogin;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes({"SALT", "LOGIN"})
@Controller
public class MenuController {

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "getmenu.htm", method = RequestMethod.GET)
    public ModelAndView getMenu() {
        ModelAndView mv = new ModelAndView("auth_nav_sidebar");
//        ModelAndView mv = new ModelAndView("sidebar");
        MT_userlogin userlogin = new MT_userlogin();
        try {
            if (userlogin != null) {
                mv.addObject("menuitems", "menuitems");
            }
        } catch (Exception e) {
            System.out.println("E: getMenu: " + e.toString());
        }
        return mv;
    }

}
