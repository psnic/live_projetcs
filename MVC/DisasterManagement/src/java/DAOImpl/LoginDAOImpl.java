/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.List;
import model.MT_userlogin;
import model.M_userroles;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import security.SHA256;

@Transactional
@Repository
public class LoginDAOImpl {

    @Autowired
    public SessionFactory sessionFactory = null;

    public MT_userlogin authenticateuser(String username, String password, String salt) {
        MT_userlogin res = null;
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM MT_userlogin WHERE username=:username");
        query.setString("username", username);
        MT_userlogin user = (MT_userlogin) query.uniqueResult();
        if (user != null) {
            if (SHA256.getHash(user.getUserpassword() + salt).equals(password)) {
                res = user;
            } else {
                res = null;
            }
        } else {
            res = null;
        }
        user = null;
        session.close();
        return res;
    }

//    public List<M_userroles> getAllM_userroles() {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//        String hql = "from M_userroles";
//        Query query = session.createQuery(hql);
//        List<M_userroles> user_rolelist = query.list();
//        session.close();
//        return user_rolelist;
//    }

//    public UserLogin getUser(String userid) {
//        UserLogin res = new UserLogin();
////        try {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//        Query query = session.createQuery("FROM UserLogin WHERE userid=:userid");
//        query.setParameter("userid", userid);
//        res = (UserLogin) query.uniqueResult();
//        session.close();
////        } catch (Exception e) {
////            System.out.println("E: getUser: " + e.toString());
////        }
//        return res;
//    }

//    public String saveUser(UserLogin usr) {
//        String res = "-1";
////        try {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//        if (usr.getUserid() == null || "".equals(usr.getUserid())) {
//            String hql = "select max(cast(userid as int)) from UserLogin";
//            Query hqlquery = session.createQuery(hql);
//            Integer id = (Integer) hqlquery.uniqueResult();
//            if (id == null) {
//                id = 1;
//            } else {
//                id = id + 1;
//            }
//            usr.setUserid(id.toString());
//            res = id.toString();
//        } else {
//            res = usr.getUserid();
//        }
//        session.saveOrUpdate(usr);
//        session.getTransaction().commit();
//        session.close();
////        } catch (Exception e) {
////            System.out.println("E: saveUser: " + e.toString());
////        }
//        return res;
//    }
}
