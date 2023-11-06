/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import model.Document;
import model.Fir;
import model.M_districts;
import model.Sequence;
import model.T_Property_Damaged;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Repository("FirDaoImpl")
@Transactional
public class FirDaoImpl {

    @Autowired
    public SessionFactory sessionFactory = null;
    @Autowired
    public CommonDaoImpl cdao;

    public String saveFir(Fir fir) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            if (fir.getFir_no() == null || fir.getFir_no().isEmpty()) {
                Sequence sequence = cdao.getSequence("FIR");
                if (sequence != null) {
                    String pattern = sequence.getPattern();
                    int endseq = sequence.getEndseq();
                    // Construct the FIR number
                    String districtshortcode = cdao.getDistrictShortNameByBlockCode(fir.getBlockcode().getBlockcode());
                    Date calamityDate = fir.getDate_of_calamity_occurence();
                    String year = new SimpleDateFormat("yyyyMMdd").format(calamityDate);
                    String generatedFirNo = pattern + districtshortcode + "-" + year + "-" + (endseq + 1);
                    fir.setFir_no(generatedFirNo);
                    sequence.setEndseq(endseq + 1); 
                    session.update(sequence); // Update the sequence
                }
            }
            session.saveOrUpdate(fir);
            transaction.commit();
            res = fir.getFir_no();
        } catch (Exception e) {
            System.out.println("FirDaoImpl|saveFir: " + e.toString());
            transaction.rollback();
        } finally {
            session.close();
        }

        return res;
    }

    public String saveDocument(Document doc) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (doc.getDocumentcode() == null || doc.getDocumentcode().isEmpty() || doc.getDocumentcode().equals("")) {
                String hql = "SELECT MAX(CAST(documentcode AS int)) FROM Document";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                doc.setDocumentcode(String.valueOf(id));
            }
            session.saveOrUpdate(doc);
            session.getTransaction().commit();
            session.close();
            res = doc.getDocumentcode();
        } catch (Exception e) {
            System.out.println("FirDaoImpl|saveDocument: " + e.toString());
        }
        return res;
    }

    public String savePropertyDamaged(T_Property_Damaged propertyDamaged) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (propertyDamaged.getProperty_damage_id() == null || propertyDamaged.getProperty_damage_id().isEmpty() || propertyDamaged.getProperty_damage_id().equals("")) {
                String hql = "SELECT MAX(CAST(property_damage_id AS int)) FROM T_Property_Damaged";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                propertyDamaged.setProperty_damage_id(String.valueOf(id));
            }
            session.saveOrUpdate(propertyDamaged);
            session.getTransaction().commit();
            session.close();
            res = propertyDamaged.getProperty_damage_id();
        } catch (Exception e) {
            System.out.println("FirDaoImpl|savePropertyDamaged: " + e.toString());
        }
        return res;
    }

}
