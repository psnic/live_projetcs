/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Beneficiary;
import model.Document;
import model.Document_report;
import model.Document_type;
import model.Fir;
import model.MT_userlogin;
import model.M_block;
import model.M_status;
import model.M_village;
import model.Proposal;
import model.Reports;
import model.T_Property_Damaged;
import model.T_exgratia_form;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Repository("ExgratiaDaoImpl")
@Transactional
public class ExgratiaDaoImpl {

    @Autowired
    public SessionFactory sessionFactory = null;

    public String saveBeneficiary(Beneficiary beneficiary) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (beneficiary.getBeneficiary_id() == null || beneficiary.getBeneficiary_id().isEmpty() || beneficiary.getBeneficiary_id().equals("")) {
                String hql = "SELECT MAX(CAST(beneficiary_id AS int)) FROM Beneficiary";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                beneficiary.setBeneficiary_id(String.valueOf(id));
            }
            session.saveOrUpdate(beneficiary);
            session.getTransaction().commit();
            session.close();
            res = beneficiary.getBeneficiary_id();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveBeneficiary: " + e.toString());
        }
        return res;
    }

    public String saveBeneficiaryExgratia(T_exgratia_form t) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (t.getT_exgratia_form_id() == null || t.getT_exgratia_form_id().isEmpty() || t.getT_exgratia_form_id().equals("")) {
                String hql = "SELECT MAX(CAST(t_exgratia_form_id AS int)) FROM T_exgratia_form";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                t.setT_exgratia_form_id(String.valueOf(id));
            }
            session.saveOrUpdate(t);
            session.getTransaction().commit();
            session.close();
            res = t.getT_exgratia_form_id();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveBeneficiaryExgratia: " + e.toString());
        }
        return res;
    }

    public List<T_exgratia_form> getExgratiaFormsByFir(String firNo) {
        Session session = sessionFactory.openSession();
        List<T_exgratia_form> exlist = new ArrayList<>();
        try {
            session.beginTransaction();
            String hql = "from T_exgratia_form where fir_no.fir_no = :firNo AND reportid IS NULL";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);
            exlist = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|:getExgratiaFormsByFir " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return exlist;
    }

    public List<T_exgratia_form> getExgratiaFormsByFirWithReport(String firNo) {
        Session session = sessionFactory.openSession();
        List<T_exgratia_form> exlist = new ArrayList<>();
        try {
            session.beginTransaction();
            String hql = "from T_exgratia_form where fir_no.fir_no = :firNo";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);
            exlist = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|getExgratiaFormsByFirWithReport " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return exlist;
    }

    public String getExgratiaFormByFir(String firNo) {
        Session session = sessionFactory.openSession();
        String exlist = "";
        try {
            session.beginTransaction();
            String hql = "select distinct f.reportid.reportid from T_exgratia_form f where f.fir_no.fir_no = :firNo";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);
            exlist = (String) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|:getExgratiaFormByFir " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return exlist;
    }

    public Fir getFirByFirNo(String firNo) {
        Session session = sessionFactory.openSession();
        Fir exlist = new Fir();
        try {
            session.beginTransaction();
            String hql = "from Fir where fir_no = :firNo";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);
            exlist = (Fir) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|getFirByFirNo: " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return exlist;
    }

    public String savereport(Reports report) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (report.getReportid() == null || report.getReportid().isEmpty() || report.getReportid().equals("")) {
                String hql = "SELECT MAX(CAST(reportid AS int)) FROM Reports";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                report.setReportid(String.valueOf(id));
            }
            session.saveOrUpdate(report);
            session.getTransaction().commit();
            session.close();
            res = report.getReportid();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|savereport: " + e.toString());
        }
        return res;
    }

    public String saveproposal(Proposal proposal) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (proposal.getProposalid() == null || proposal.getProposalid().isEmpty() || proposal.getProposalid().equals("")) {
                String hql = "SELECT MAX(CAST(proposalid AS int)) FROM Proposal";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                proposal.setProposalid(String.valueOf(id));
            }
            session.saveOrUpdate(proposal);
            session.getTransaction().commit();
            session.close();
            res = proposal.getProposalid();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveproposal: " + e.toString());
        }
        return res;
    }
    
    public String updateProposal(String proposalid, M_status statuscode) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE Proposal SET statuscode=:statuscode WHERE proposalid=:proposalid";
            Query query = session.createQuery(hql);
            query.setParameter("proposalid", proposalid);
            query.setParameter("statuscode", statuscode);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateProposal: " + e.toString());
        }
        return res;
    }
    
    public String updateReport(String reportid, M_status statuscode, MT_userlogin userid) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE Reports SET statuscode=:statuscode, userid=:userid WHERE reportid=:reportid";
            Query query = session.createQuery(hql);
            query.setParameter("reportid", reportid);
            query.setParameter("statuscode", statuscode);
            query.setParameter("userid", userid);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateReport: " + e.toString());
        }
        return res;
    }
    
    public String updateReportDC(String reportid, M_status statuscode) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE Reports SET statuscode=:statuscode WHERE reportid=:reportid";
            Query query = session.createQuery(hql);
            query.setParameter("reportid", reportid);
            query.setParameter("statuscode", statuscode);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateReport: " + e.toString());
        }
        return res;
    }

    public String updateReportId(String fir_no, Reports report) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE T_exgratia_form SET reportid=:report WHERE fir_no.fir_no=:fir_no";
            Query query = session.createQuery(hql);
            query.setParameter("report", report);
            query.setParameter("fir_no", fir_no);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateReportId: " + e.toString());
        }
        return res;
    }

    public String updateProposalInReport(String reportid, Proposal proposal, M_status statuscode, MT_userlogin userid) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE Reports SET proposalid=:proposal, statuscode = :statuscode, userid = :userid WHERE reportid=:reportid";
            Query query = session.createQuery(hql);
            query.setParameter("reportid", reportid);
            query.setParameter("proposal", proposal);
            query.setParameter("statuscode", statuscode);
            query.setParameter("userid", userid);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateProposalInReport: " + e.toString());
        }
        return res;
    }

    public String updateProposalRevenueFWCS(String proposalid) {
        String res = "-1";
        Session session = sessionFactory.openSession();
        try {
            String hql = "UPDATE Proposal SET statuscode='FWPCS' WHERE proposalid=:proposalid";
            Query query = session.createQuery(hql);
            query.setParameter("proposalid", proposalid);
            query.executeUpdate();
            res = "1";
            session.close();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|updateProposalRevenueFWCS: " + e.toString());
        }
        return res;
    }

    public M_block getBlockFromFir(String firNo) {
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        M_block block = null;
        try {
            transaction = session.beginTransaction();

            String hql = "SELECT f.blockcode FROM Fir f WHERE f.fir_no = :firNo";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);

            block = (M_block) query.uniqueResult();

            transaction.commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|getBlockFromFir: " + e.toString());
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return block;
    }

    public List<Fir> getallfirfromdate(Date date) {
        List<Fir> firList = new ArrayList<>();
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            // Assuming date_of_calamity_occurence is a java.util.Date property
            String hql = "FROM Fir WHERE date_of_calamity_occurence = :date";
            Query query = session.createQuery(hql);
            query.setParameter("date", date);
            firList = query.list();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("E|getallfirfromdate: " + e.toString());
        }
        return firList;
    }

    public String saveDocumentReport(Document_report doc) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (doc.getRdocumentcode() == null || doc.getRdocumentcode().isEmpty() || doc.getRdocumentcode().equals("")) {
                String hql = "SELECT MAX(CAST(rdocumentcode AS int)) FROM Document_report";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                doc.setRdocumentcode(String.valueOf(id));
            }
            session.saveOrUpdate(doc);
            session.getTransaction().commit();
            session.close();
            res = doc.getRdocumentcode();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveDocumentReport: " + e.toString());
        }
        return res;
    }

    public List<Document_report> findDocumentReportByReportid(String reportid) {
        List<Document_report> docList = new ArrayList<>();
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            String hql = "FROM Document_report dr WHERE dr.reportid.reportid = :reportid";
            Query query = session.createQuery(hql);
            query.setParameter("reportid", reportid);
            docList = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|findDocumentReportByReportid: " + e.toString());
        }
        return docList;
    }

    public List<Object[]> getRequiredDocsListByNormcode(int normcode) {
        List<Object[]> res = null;
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            String hql = "SELECT documentcode, LOWER(document_name) "
                    + "FROM drms.document_type "
                    + "WHERE documentcode IN ( "
                    + "		SELECT distinct (documentcode) "
                    + "		FROM drms.lossnorm_document "
                    + "		WHERE norm_code=:normcode"
                    + ") "
                    + "AND is_specific is false";
            Query query = session.createSQLQuery(hql);
            query.setParameter("normcode", normcode);
            res = query.list();
        } catch (Exception e) {
            System.out.println("E: getRequiredDocsList: " + e.toString());
        }
        return res;
    }

}
