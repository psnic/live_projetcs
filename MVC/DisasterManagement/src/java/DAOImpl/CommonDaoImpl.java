/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.AgendaNote;
import model.Assistance_head;
import model.Document_beneficiary;
import model.Document_report;
import model.Document_type;
import model.Exgratia_norm;
import model.Fir;
import model.History_forwarding;
import model.M_calamity;
import model.M_districts;
import model.M_infrastructure;
import model.M_processflow;
import model.M_village;
import model.Proposal;
import model.Reports;
import model.Sequence;
import model.T_exgratia_form;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Repository("CommonDaoImpl")
@Transactional
public class CommonDaoImpl {

    @Autowired
    public SessionFactory sessionFactory = null;

    public Sequence getSequence(String sequenceid) {
        Session session = sessionFactory.openSession();
        try {
            return (Sequence) session.get(Sequence.class, sequenceid);
        } finally {
            session.close();
        }
    }

    public List<Assistance_head> getAllAssistanceHeads() {
        Session session = sessionFactory.openSession();
        List<Assistance_head> astlist = null;
        try {
            session.beginTransaction();
            String hql = "from Assistance_head";
            Query query = session.createQuery(hql);
            astlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllAssistanceHeads: " + e.toString());
        }
        return astlist;
    }

    public List<M_processflow> getAllProcessFlow() {
        Session session = sessionFactory.openSession();
        List<M_processflow> astlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_processflow";
            Query query = session.createQuery(hql);
            astlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllProcessFlow: " + e.toString());
        }
        return astlist;
    }

    public List<M_processflow> getProcessFlowDC() {
        Session session = sessionFactory.openSession();
        List<M_processflow> astlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_processflow WHERE from_processid = '2' ORDER BY processflowid";
            Query query = session.createQuery(hql);
            astlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getProcessFlowDC: " + e.toString());
        }
        return astlist;
    }

    public List<M_processflow> getProcessFlowRevenue() {
        Session session = sessionFactory.openSession();
        List<M_processflow> astlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_processflow WHERE from_processid = '7' ORDER BY processflowid";
            Query query = session.createQuery(hql);
            astlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getProcessFlowRevenue: " + e.toString());
        }
        return astlist;
    }

    public List<M_processflow> getProcessFlowRevenuePostFacto() {
        Session session = sessionFactory.openSession();
        List<M_processflow> astlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_processflow WHERE from_processid = '12' ORDER BY processflowid";
            Query query = session.createQuery(hql);
            astlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getProcessFlowRevenuePostFacto: " + e.toString());
        }
        return astlist;
    }

    public List<M_calamity> getAllCalamities() {
        Session session = sessionFactory.openSession();
        List<M_calamity> calamitylist = null;
        try {
            session.beginTransaction();
            String hql = "from M_calamity";
            Query query = session.createQuery(hql);
            calamitylist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllCalamities: " + e.toString());
        }
        return calamitylist;
    }

    public List<M_districts> getAllDistricts() {
        Session session = sessionFactory.openSession();
        List<M_districts> districtlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_districts";
            Query query = session.createQuery(hql);
            districtlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllDistricts: " + e.toString());
        }
        return districtlist;
    }

    public M_calamity getCalamityByFir(String fir_no) {
        Session session = sessionFactory.openSession();
        M_calamity calamitylist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT calamity_id from Fir WHERE fir_no=:fir_no";
            Query query = session.createQuery(hql);
            query.setParameter("fir_no", fir_no);
            calamitylist = (M_calamity) query.uniqueResult();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getCalamityByFir: " + e.toString());
        }
        return calamitylist;
    }

    public List<Exgratia_norm> getAllExgratia_norms() {
        Session session = sessionFactory.openSession();
        List<Exgratia_norm> normlist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT ON (norm_code)\n"
                    + "    norm_code,\n"
                    + "    description,\n"
                    + "    losstype,\n"
                    + "    option,\n"
                    + "    value,\n"
                    + "    minimum_value,\n"
                    + "    assistance_head_code\n"
                    + "FROM drms.exgratia_norm\n"
                    + "WHERE assistance_head_code = 'AH-GR'\n"
                    + "ORDER BY norm_code;";
            Query query = session.createSQLQuery(hql);
            normlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllExgratia_norms: " + e.toString());
        }
        return normlist;
    }

    public List<M_infrastructure> getAllInfrastructures() {
        Session session = sessionFactory.openSession();
        List<M_infrastructure> normlist = null;
        try {
            session.beginTransaction();
            String hql = "from M_infrastructure";
            Query query = session.createQuery(hql);
            normlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllInfrastructures: " + e.toString());
        }
        return normlist;
    }

    public List<Fir> getAllFir() {
        Session session = sessionFactory.openSession();
        List<Fir> firlist = null;
        try {
            session.beginTransaction();
            String hql = "from Fir";
            Query query = session.createQuery(hql);
            firlist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllFir: " + e.toString());
        }
        return firlist;
    }

    public List<String> getAllDateFromFir() {
        Session session = sessionFactory.openSession();
        List<String> formattedDateList = new ArrayList<>();
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT date_of_calamity_occurence FROM Fir";
            Query query = session.createQuery(hql);
            List<java.sql.Date> sqlDateList = query.list();

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            for (java.sql.Date sqlDate : sqlDateList) {
                formattedDateList.add(dateFormat.format(sqlDate));
            }

            session.close();
        } catch (Exception e) {
            System.out.println("E|getAllDateFromFir: " + e.toString());
        }
        return formattedDateList;
    }

    public List<Object[]> getBeneficiaryAssistance() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String sql = "SELECT b.beneficiary_name, en.description, en.losstype, en.option, f.amount "
                    + "FROM drms.beneficiary b "
                    + "JOIN drms.t_exgratia_form f ON b.beneficiary_id = f.beneficiary_id "
                    + "JOIN drms.exgratia_norm en ON f.norm_code = en.norm_code where f.reportid is null ";

            Query query = session.createSQLQuery(sql);
            datalist = query.list();

            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("E|getBeneficiaryAssistance: " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<M_village> getvillagefromblock(int blockcode) {
        Session session = sessionFactory.openSession();
        List<M_village> villagelist = null;
        try {
            session.beginTransaction();
            String hql = "from M_village where blockcode.blockcode=:blockcode";
            Query query = session.createQuery(hql);
            query.setParameter("blockcode", blockcode);
            villagelist = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getvillagefromblock: " + e.toString());
        }
        return villagelist;
    }

    public List<Fir> getDistinctFirNumbers() {
        Session session = sessionFactory.openSession();
        List<Fir> distinctFirNumbers = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT e.fir_no FROM T_exgratia_form e WHERE e.reportid IS NULL";
            Query query = session.createQuery(hql);
            distinctFirNumbers = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("Error in retrieving distinct fir numbers: " + e.toString());
        }
        return distinctFirNumbers;
    }

    public List<Fir> getDistinctFirNumberswithReportid() {
        Session session = sessionFactory.openSession();
        List<Fir> distinctFirNumbers = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT e.fir_no FROM T_exgratia_form e WHERE e.reportid IS NOT NULL";
            Query query = session.createQuery(hql);
            distinctFirNumbers = query.list();
            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl|getDistinctFirNumberswithReportid: " + e.toString());
        }
        return distinctFirNumbers;
    }

    public List<Object[]> getForwardedBdoProposals() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
                    + "r.reportid "
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN f.blockcode mb "
                    + "JOIN mb.districtcodelgd md "
                    + "JOIN tef.reportid r "
                    + "WHERE tef.reportid IS NOT NULL";

            Query query = session.createQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getForwardedBdoProposals: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getFirDetailsPendingInDC() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    r.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    //+ "LEFT JOIN\n"
                    //+ "    drms.history_forwarding hf ON r.reportid = hf.reportid\n"
                    //+ "        AND hf.statuscode = 'PDC'\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.statuscode = 'PDC' AND r.proposalid IS NULL;";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsPendingInDC: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getPostFactoFirDetails() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    r.proposalid,\n"
                    + "    r.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN\n"
                    + "    drms.history_forwarding hf ON r.reportid = hf.reportid\n"
                    + "        AND hf.statuscode = 'FWPFO'\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.statuscode = 'FWPFO';";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsPendingInDC: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getFirDetailsPendingInBDO() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    hf.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN\n"
                    + "    drms.history_forwarding hf ON r.reportid = hf.reportid\n"
                    + "        AND hf.statuscode = 'PBDO'\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.statuscode = 'PBDO' AND r.proposalid IS NULL;";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsPendingInBDO: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

//    public List<Object[]> getFirDetailsPendingInDC() {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
//                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
//                    + "r.reportid "
//                    + "FROM T_exgratia_form tef "
//                    + "JOIN tef.fir_no f "
//                    + "JOIN f.calamity_id mc "
//                    + "JOIN tef.norm_code nc "
//                    + "JOIN nc.assistance_head_code ah "
//                    + "JOIN f.blockcode mb "
//                    + "JOIN mb.districtcodelgd md "
//                    + "JOIN tef.reportid r "
//                    + "WHERE tef.reportid IS NOT NULL "
//                    + "AND r.proposalid IS NULL ";
//            Query query = session.createQuery(hql);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsByAssistanceHead: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
//    public List<Object[]> getFirDetailsByAssistanceHead(String assistanceHeadCode) {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
//                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
//                    + "r.reportid "
//                    + "FROM T_exgratia_form tef "
//                    + "JOIN tef.fir_no f "
//                    + "JOIN f.calamity_id mc "
//                    + "JOIN tef.norm_code nc "
//                    + "JOIN nc.assistance_head_code ah "
//                    + "JOIN f.blockcode mb "
//                    + "JOIN mb.districtcodelgd md "
//                    + "JOIN tef.reportid r "
//                    + "WHERE tef.reportid IS NOT NULL "
//                    + "AND r.proposalid IS NULL "
//                    + "AND ah.assistance_head_code = :assistanceHeadCode ";
//            Query query = session.createQuery(hql);
//            query.setParameter("assistanceHeadCode", assistanceHeadCode);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsByAssistanceHead: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
//    public List<Object[]> getFirDetailsPendingInRevenue() {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
//                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
//                    + "r.reportid, p.proposalid " // Include proposalid
//                    + "FROM T_exgratia_form tef "
//                    + "JOIN tef.fir_no f "
//                    + "JOIN f.calamity_id mc "
//                    + "JOIN tef.norm_code nc "
//                    + "JOIN nc.assistance_head_code ah "
//                    + "JOIN f.blockcode mb "
//                    + "JOIN mb.districtcodelgd md "
//                    + "JOIN tef.reportid r "
//                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
//                    + "WHERE tef.reportid IS NOT NULL "
//                    + "AND r.proposalid IS NOT NULL "
//                    + "AND p.statuscode = 'FWPRD' ";
//
//            Query query = session.createQuery(hql);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsPendingInRevenue: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
    public List<Object[]> getFirDetailsPendingInRevenue() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;

        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    r.proposalid,\n"
                    + "    r.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    //+ "LEFT JOIN\n"
                    //+ "    drms.proposal p ON r.proposalid = p.proposalid\n"
                    // + "LEFT JOIN\n"
                    //+ "    drms.history_forwarding hf ON p.proposalid = hf.proposalid\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.proposalid IS NOT NULL\n"
                    + "    AND r.statuscode = 'FWPRD';";
            //+ "    AND hf.statuscode = 'FWPRD';"; // Check statuscode in History_forwarding

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsPendingInRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getRejectedProposalsInDC() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;

        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    r.proposalid,\n"
                    + "    r.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    //+ "LEFT JOIN\n"
                    //+ "    drms.proposal p ON r.proposalid = p.proposalid\n"
                    //+ "LEFT JOIN\n"
                    //+ "    drms.history_forwarding hf ON p.proposalid = hf.proposalid\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.proposalid IS NOT NULL\n"
                    //+ "    AND p.statuscode = 'RJPDC'\n"
                    + "    AND r.statuscode = 'RJPDC';"; // Check statuscode in History_forwarding

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsPendingInRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

//    public List<Object[]> getFirDetailsByAssistanceHeadRevenue(String assistanceHeadCode) {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
//                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
//                    + "r.reportid, p.proposalid " // Include proposalid
//                    + "FROM T_exgratia_form tef "
//                    + "JOIN tef.fir_no f "
//                    + "JOIN f.calamity_id mc "
//                    + "JOIN tef.norm_code nc "
//                    + "JOIN nc.assistance_head_code ah "
//                    + "JOIN f.blockcode mb "
//                    + "JOIN mb.districtcodelgd md "
//                    + "JOIN tef.reportid r "
//                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
//                    + "WHERE tef.reportid IS NOT NULL "
//                    + "AND r.proposalid IS NOT NULL "
//                    + "AND ah.assistance_head_code = :assistanceHeadCode "
//                    + "AND p.statuscode <> 'FWPCS' AND p.statuscode <> 'APV' ";
//
//            Query query = session.createQuery(hql);
//            query.setParameter("assistanceHeadCode", assistanceHeadCode);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsByAssistanceHead: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
    public List<Object[]> getFirDetailsForwardedFromDcToRevenue() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;

        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, "
                    + "tef.fir_no.date_of_calamity_occurence, md.districtname, mb.blockname, "
                    + "r.reportid, p.proposalid, p.statuscode.status_desc " // Include proposalid
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN f.blockcode mb "
                    + "JOIN mb.districtcodelgd md "
                    + "JOIN tef.reportid r "
                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
                    + "WHERE tef.reportid IS NOT NULL "
                    + "AND r.proposalid IS NOT NULL "
                    + "AND p.statuscode = 'FWPRD' ";

            Query query = session.createQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsForwardedFromDcToRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getFirDetailsPendingInCS() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    f.fir_no AS fir_number,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description AS assistance_head_description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    mb.blockname,\n"
                    + "    r.reportid,\n"
                    + "    p.proposalid,\n"
                    + "    hf.remarks\n"
                    + "FROM\n"
                    + "    drms.t_exgratia_form tef\n"
                    + "JOIN\n"
                    + "    drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN\n"
                    + "    drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN\n"
                    + "    drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN\n"
                    + "    drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN\n"
                    + "    drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN\n"
                    + "    drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN\n"
                    + "    drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN\n"
                    + "    drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "LEFT JOIN\n"
                    + "    drms.history_forwarding hf ON p.proposalid = hf.proposalid\n"
                    + "WHERE\n"
                    + "    tef.reportid IS NOT NULL\n"
                    + "    AND r.proposalid IS NOT NULL\n"
                    + "    AND p.statuscode = 'FWPCS'\n"
                    + "    AND hf.statuscode = 'FWPCS';";

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsByAssistanceHeadCS: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }
//    public List<Object[]> getFirDetailsPendingInCS() {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description,\n"
//                    + "       f.date_of_calamity_occurence, md.districtname, mb.blockname,\n"
//                    + "       r.reportid, p.proposalid\n"
//                    + "FROM T_exgratia_form tef\n"
//                    + "JOIN tef.fir_no f\n"
//                    + "JOIN f.calamity_id mc\n"
//                    + "JOIN tef.norm_code nc\n"
//                    + "JOIN nc.assistance_head_code ah\n"
//                    + "JOIN f.blockcode mb\n"
//                    + "JOIN mb.districtcodelgd md\n"
//                    + "JOIN tef.reportid r\n"
//                    + "LEFT JOIN r.proposalid p\n"
//                    + "WHERE tef.reportid IS NOT NULL\n"
//                    + "AND r.proposalid IS NOT NULL\n"
//                    + "AND p.statuscode = 'FWPCS'";
//
//            Query query = session.createQuery(hql);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsByAssistanceHeadCS: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
//    public List<Object[]> getFirDetailsByAssistanceHeadCS(String assistanceHeadCode) {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description,\n"
//                    + "       f.date_of_calamity_occurence, md.districtname, mb.blockname,\n"
//                    + "       r.reportid, p.proposalid\n"
//                    + "FROM T_exgratia_form tef\n"
//                    + "JOIN tef.fir_no f\n"
//                    + "JOIN f.calamity_id mc\n"
//                    + "JOIN tef.norm_code nc\n"
//                    + "JOIN nc.assistance_head_code ah\n"
//                    + "JOIN f.blockcode mb\n"
//                    + "JOIN mb.districtcodelgd md\n"
//                    + "JOIN tef.reportid r\n"
//                    + "LEFT JOIN r.proposalid p\n"
//                    + "WHERE tef.reportid IS NOT NULL\n"
//                    + "AND r.proposalid IS NOT NULL\n"
//                    + "AND ah.assistance_head_code = :assistanceHeadCode\n"
//                    + "AND p.statuscode = 'FWPCS'";
//
//            Query query = session.createQuery(hql);
//            query.setParameter("assistanceHeadCode", assistanceHeadCode);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("E|getFirDetailsByAssistanceHeadCS: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }

    public List<Object[]> getFirDetailsForwardedFromRevToCS() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description,\n"
                    + "       f.date_of_calamity_occurence, md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, p.statuscode.status_desc\n"
                    + "FROM T_exgratia_form tef\n"
                    + "JOIN tef.fir_no f\n"
                    + "JOIN f.calamity_id mc\n"
                    + "JOIN tef.norm_code nc\n"
                    + "JOIN nc.assistance_head_code ah\n"
                    + "JOIN f.blockcode mb\n"
                    + "JOIN mb.districtcodelgd md\n"
                    + "JOIN tef.reportid r\n"
                    + "LEFT JOIN r.proposalid p\n"
                    + "WHERE tef.reportid IS NOT NULL\n"
                    + "AND r.proposalid IS NOT NULL\n"
                    + "AND p.statuscode = 'FWPCS'";

            Query query = session.createQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsByAssistanceHeadCS: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getFirDetailsApprovedByCS() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no AS fir_no, mc.calamity_name, ah.description,\n"
                    + "       to_char(f.date_of_calamity_occurence,'DD/MM/YYYY' ) as date_of_calamity_occurence, md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks, \n"
                    + "       STRING_AGG(\n"
                    + "	CONCAT_WS(' ', nc.description, nc.losstype, \n"
                    + "          CASE WHEN nc.option IN ('NA', 'N.A') THEN '' ELSE nc.option END),\n"
                    + "    ', '\n"
                    + ") AS assistance,\n"
                    + "(\n"
                    + "  SELECT SUM(tef_inner.amount)\n"
                    + "  FROM drms.t_exgratia_form tef_inner\n"
                    + "  WHERE tef_inner.reportid = r.reportid\n"
                    + ") as amount, f.date_of_calamity_occurence AS incidence_date\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "WHERE tef.reportid IS NOT NULL\n"
                    + "AND r.proposalid IS NOT NULL\n"
                    + "AND hf.statuscode = 'APV'\n"
                    + "GROUP BY\n"
                    + "tef.fir_no, mc.calamity_name, ah.description, f.date_of_calamity_occurence,md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks;";

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getFirDetailsByAssistanceHeadCS: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getProposalsPendingInSEC() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no AS fir_no, mc.calamity_name, ah.description,\n"
                    + "       to_char(f.date_of_calamity_occurence,'DD/MM/YYYY' ) as date_of_calamity_occurence, md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks, \n"
                    + "       STRING_AGG(\n"
                    + "	CONCAT_WS(' ', nc.description, nc.losstype, \n"
                    + "          CASE WHEN nc.option IN ('NA', 'N.A') THEN '' ELSE nc.option END),\n"
                    + "    ', '\n"
                    + ") AS assistance,\n"
                    + "(\n"
                    + "  SELECT SUM(tef_inner.amount)\n"
                    + "  FROM drms.t_exgratia_form tef_inner\n"
                    + "  WHERE tef_inner.reportid = r.reportid\n"
                    + ") as amount, an.note_number, f.date_of_calamity_occurence AS incidence_date\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "JOIN drms.agendanote an ON an.proposalid = p.proposalid\n"
                    + "WHERE tef.reportid IS NOT NULL\n"
                    + "AND r.proposalid IS NOT NULL\n"
                    + "AND hf.statuscode = 'AGN'\n"
                    + "GROUP BY\n"
                    + "tef.fir_no, mc.calamity_name, ah.description, f.date_of_calamity_occurence,md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks, an.note_number;";

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getProposalsPendingInSEC: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getProposalsApprovedBySEC() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT tef.fir_no AS fir_no, mc.calamity_name, ah.description,\n"
                    + "       to_char(f.date_of_calamity_occurence,'DD/MM/YYYY' ) as date_of_calamity_occurence, md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks, \n"
                    + "       STRING_AGG(\n"
                    + "	CONCAT_WS(' ', nc.description, nc.losstype, \n"
                    + "          CASE WHEN nc.option IN ('NA', 'N.A') THEN '' ELSE nc.option END),\n"
                    + "    ', '\n"
                    + ") AS assistance,\n"
                    + "(\n"
                    + "  SELECT SUM(tef_inner.amount)\n"
                    + "  FROM drms.t_exgratia_form tef_inner\n"
                    + "  WHERE tef_inner.reportid = r.reportid\n"
                    + ") as amount, an.note_number, f.date_of_calamity_occurence AS incidence_date\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON f.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm nc ON tef.norm_code = nc.norm_code\n"
                    + "JOIN drms.assistance_head ah ON nc.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.m_block mb ON f.blockcode = mb.blockcode\n"
                    + "JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "JOIN drms.agendanote an ON an.proposalid = p.proposalid\n"
                    + "WHERE tef.reportid IS NOT NULL\n"
                    + "AND r.proposalid IS NOT NULL\n"
                    + "AND hf.statuscode = 'APVSEC'\n"
                    + "GROUP BY\n"
                    + "tef.fir_no, mc.calamity_name, ah.description, f.date_of_calamity_occurence,md.districtname, mb.blockname,\n"
                    + "       r.reportid, p.proposalid, hf.remarks, an.note_number;";

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("E|getProposalsApprovedBySEC: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public Integer getCountPendingReport() {
        Long count = 0L; // Use Long type for the result
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            String hql = "SELECT COUNT(reportid) FROM Reports";
            Query query = session.createQuery(hql);
            count = (Long) query.uniqueResult(); // Cast to Long

            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl| getCountPendingReport: " + e.toString());
        }

        return count.intValue(); // Convert Long to Integer
    }

//    public Integer getCountPendingProposals() {
//        Long count = 0L; // Use Long type for the result
//        try {
//            Session session = sessionFactory.openSession();
//            session.beginTransaction();
//
//            String hql = "SELECT COUNT(reportid) FROM Reports WHERE proposalid.proposalid IS NOT NULL";
//            Query query = session.createQuery(hql);
//            count = (Long) query.uniqueResult(); // Cast to Long
//
//            session.close();
//        } catch (Exception e) {
//            System.out.println("CommonDaoImpl| getCountPendingProposals: " + e.toString());
//        }
//        return count.intValue(); // Convert Long to Integer
//    }
    public Integer getCountForwardedProposalsInDc() {
        Long count = 0L; // Use Long type for the result
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            String hql = "SELECT COUNT(proposalid) FROM Proposal WHERE statuscode.statuscode='FWPRD'";
            Query query = session.createQuery(hql);
            count = (Long) query.uniqueResult(); // Cast to Long

            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl| getCountForwardedProposals: " + e.toString());
        }

        return count.intValue(); // Convert Long to Integer
    }

    public Integer getCountForwardedProposalsInRevenue() {
        Long count = 0L; // Use Long type for the result
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            String hql = "SELECT COUNT(proposalid) FROM Proposal WHERE statuscode.statuscode='FWPCS'";
            Query query = session.createQuery(hql);
            count = (Long) query.uniqueResult(); // Cast to Long

            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl| getCountForwardedProposals: " + e.toString());
        }

        return count.intValue(); // Convert Long to Integer
    }

    public Integer getCountRegisteredBeneficiaries() {
        Long count = 0L; // Use Long type for the result
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            String hql = "SELECT COUNT(beneficiary_id) FROM T_exgratia_form WHERE reportid.reportid IS NOT NULL";
            Query query = session.createQuery(hql);
            count = (Long) query.uniqueResult(); // Cast to Long

            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl| getCountForwardedProposals: " + e.toString());
        }

        return count.intValue(); // Convert Long to Integer
    }

    public Integer getCountForwardedProposalsInCS() {
        Long count = 0L; // Use Long type for the result
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "COUNT(proposalid) FROM History_forwarding WHERE statuscode.statuscode='APVSEC'";
            Query query = session.createQuery(hql);
            count = (Long) query.uniqueResult(); // Cast to Long

            session.close();
        } catch (Exception e) {
            System.out.println("CommonDaoImpl| getCountForwardedProposals: " + e.toString());
        }

        return count.intValue(); // Convert Long to Integer
    }

    public String getReportidByFirNo(String firNo) {
        Session session = sessionFactory.openSession();
        String res = "";
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT e.reportid.reportid FROM T_exgratia_form e WHERE e.fir_no.fir_no=:firNo";
            Query query = session.createQuery(hql);
            query.setParameter("firNo", firNo);
            res = (String) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("CommonDao|getReportidByFirNo: " + e.toString());
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return res;
    }

    public String getDistrictShortNameByBlockCode(int blockcode) {
        Session session = sessionFactory.openSession();
        String res = "";
        try {
            session.beginTransaction();
            String hql = "SELECT districtshortname \n"
                    + "FROM drms.m_districts d\n"
                    + "JOIN drms.m_block b ON b.districtcodelgd = d.districtcodelgd\n"
                    + "WHERE b.blockcode = :blockcode";
            Query query = session.createSQLQuery(hql);
            query.setParameter("blockcode", blockcode);
            res = (String) query.uniqueResult();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println("CommonDao|getDistrictShortNameByBlockCode: " + e.toString());
        } finally {
            session.close();
        }
        return res;
    }

    public Integer getCountPendingProposals() {
        Session session = sessionFactory.openSession();
        Integer count = 0;
        try {
            session.beginTransaction();
            String hql = "SELECT COUNT(DISTINCT tef.fir_no.fir_no) "
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN tef.reportid r "
                    + "WHERE tef.reportid IS NOT NULL "
                    + "AND r.proposalid IS NULL "
                    + "AND r.statuscode = 'PDC'";

            Query query = session.createQuery(hql);
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            System.out.println("E|getCountPendingProposalsByAssistanceHead: " + e.toString());
        } finally {
            session.close();
        }

        return count;
    }

    public Integer getCountPendingProposalsInRevenue() {
        Session session = sessionFactory.openSession();
        Integer count = 0;

        try {
            session.beginTransaction();
            String hql = "SELECT COUNT(DISTINCT tef.fir_no.fir_no) "
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN f.blockcode mb "
                    + "JOIN mb.districtcodelgd md "
                    + "JOIN tef.reportid r "
                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
                    + "WHERE tef.reportid IS NOT NULL "
                    + "AND r.proposalid IS NOT NULL "
                    + "AND p.statuscode = 'FWPRD' ";

            Query query = session.createQuery(hql);
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            System.out.println("E|getCountPendingProposalsInRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return count;
    }

    public Integer getCountPostFactoProposalsInRevenue() {
        Session session = sessionFactory.openSession();
        Integer count = 0;

        try {
            session.beginTransaction();
            String hql = "SELECT COUNT(DISTINCT tef.fir_no.fir_no) "
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN f.blockcode mb "
                    + "JOIN mb.districtcodelgd md "
                    + "JOIN tef.reportid r "
                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
                    + "WHERE tef.reportid IS NOT NULL "
                    + "AND r.proposalid IS NOT NULL "
                    + "AND p.statuscode = 'FWPFO' ";

            Query query = session.createQuery(hql);
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            System.out.println("E|getCountPendingProposalsInRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return count;
    }

    public Integer getCountPendingProposalsInCS() {
        Session session = sessionFactory.openSession();
        Integer count = 0;

        try {
            session.beginTransaction();
            String hql = "SELECT COUNT(DISTINCT tef.fir_no.fir_no) "
                    + "FROM T_exgratia_form tef "
                    + "JOIN tef.fir_no f "
                    + "JOIN f.calamity_id mc "
                    + "JOIN tef.norm_code nc "
                    + "JOIN nc.assistance_head_code ah "
                    + "JOIN f.blockcode mb "
                    + "JOIN mb.districtcodelgd md "
                    + "JOIN tef.reportid r "
                    + "LEFT JOIN r.proposalid p " // Left join with Proposal table
                    + "WHERE tef.reportid IS NOT NULL "
                    + "AND r.proposalid IS NOT NULL "
                    + "AND p.statuscode = 'FWPCS' ";

            Query query = session.createQuery(hql);
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            System.out.println("E|getCountPendingProposalsInRevenue: " + e.toString());
        } finally {
            session.close();
        }
        return count;
    }

    public List<Document_type> getDocumentTypesForBeneficiary(int normCode) {
        Session session = sessionFactory.openSession();
        List<Document_type> documents = null;

        try {
            session.beginTransaction();
            String sql = "SELECT LOWER(dt.document_name)\n"
                    + "FROM drms.document_type dt\n"
                    + "JOIN drms.lossnorm_document ld ON dt.documentcode = ld.documentcode\n"
                    + "JOIN drms.exgratia_norm en ON ld.norm_code = en.norm_code\n"
                    + "WHERE en.norm_code = :normCode\n"
                    + "AND dt.is_specific = true;";

            Query query = session.createSQLQuery(sql);
            query.setParameter("normCode", normCode);
            documents = query.list();
        } catch (Exception e) {
            System.out.println("E|getDocumentTypesForBeneficiary: " + e.toString());
        } finally {
            session.close();
        }

        return documents;
    }

    public String saveDocumentBeneficiary(Document_beneficiary doc) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (doc.getBdocumentcode() == null || doc.getBdocumentcode().isEmpty() || doc.getBdocumentcode().equals("")) {
                String hql = "SELECT MAX(CAST(bdocumentcode AS int)) FROM Document_beneficiary";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                doc.setBdocumentcode(String.valueOf(id));
            }
            session.saveOrUpdate(doc);
            session.getTransaction().commit();
            session.close();
            res = doc.getBdocumentcode();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveDocumentBeneficiary: " + e.toString());
        }
        return res;
    }

    public String saveHistoryForwarding(History_forwarding history) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (history.getHistoryid() == null || history.getHistoryid().isEmpty() || history.getHistoryid().equals("")) {
                String hql = "SELECT MAX(CAST(historyid AS int)) FROM History_forwarding";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                history.setHistoryid(String.valueOf(id));
            }
            session.saveOrUpdate(history);
            session.getTransaction().commit();
            session.close();
            res = history.getHistoryid();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveHistoryForwarding: " + e.toString());
        }
        return res;
    }

    public String saveAgendaNote(AgendaNote agn) {
        String res = "-1";
        try {
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            if (agn.getNoteid() == null || agn.getNoteid().isEmpty() || agn.getNoteid().equals("")) {
                String hql = "SELECT MAX(CAST(noteid AS int)) FROM AgendaNote";
                Query hqlquery = session.createQuery(hql);
                Integer id = (Integer) hqlquery.uniqueResult();
                if (id == null) {
                    id = 1;
                } else {
                    id = id + 1;
                }
                agn.setNoteid(String.valueOf(id));
            }
            session.saveOrUpdate(agn);
            session.getTransaction().commit();
            session.close();
            res = agn.getNoteid();
        } catch (Exception e) {
            System.out.println("ExgratiaDaoImpl|saveAgendaNote: " + e.toString());
        }
        return res;
    }

    public Proposal getProposalByProposalID(String proposalid) {
        Session session = sessionFactory.openSession();
        Proposal proposal = null;
        try {
            session.beginTransaction();
            String hql = "from Proposal WHERE proposalid=:proposalid";
            Query query = session.createQuery(hql);
            query.setParameter("proposalid", proposalid);
            proposal = (Proposal) query.uniqueResult();
            session.close();
        } catch (Exception e) {
            System.out.println("E|getProposalByProposalID: " + e.toString());
        }
        return proposal;
    }

//    public List<Object[]> getDetailsForAgendaNote(String assistanceHeadCode, String calamityId, String districtCode) {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT tef.fir_no.fir_no, mc.calamity_name, ah.description, tef.fir_no.date_of_calamity_occurence, md.districtname, r.reportid, p.proposalid "
//                    + "FROM T_exgratia_form tef "
//                    + "JOIN tef.calamity_id mc "
//                    + "JOIN tef.norm_code nc "
//                    + "JOIN nc.assistance_head_code ah "
//                    + "JOIN tef.reportid r "
//                    + "LEFT JOIN r.proposalid p "
//                    + "LEFT JOIN r.blockcode mb "
//                    + "LEFT JOIN mb.districtcodelgd md "
//                    + "WHERE tef.t_exgratia_form_id IS NOT NULL "
//                    + "AND mc.calamity_id = :calamityId "
//                    + "AND ah.assistance_head_code = :assistanceHeadCode "
//                    + "AND (md.districtcodelgd = :districtCode OR mb.districtcodelgd = :districtCode) "
//                    + "AND p.statuscode = 'APV'";
//
//            Query query = session.createQuery(hql);
//            query.setParameter("calamityId", calamityId);
//            query.setParameter("assistanceHeadCode", assistanceHeadCode);
//            query.setParameter("districtCode", districtCode);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("Error: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
//    public List<Object[]> getDetailsForAgendaNote(String assistanceHeadCode, String calamityId, String districtCode) {
//        Session session = sessionFactory.openSession();
//        List<Object[]> datalist = null;
//        try {
//            session.beginTransaction();
//            String hql = "SELECT DISTINCT\n"
//                    + "    tef.fir_no,\n"
//                    + "    mc.calamity_name,\n"
//                    + "    ah.description,\n"
//                    + "    f.date_of_calamity_occurence,\n"
//                    + "    md.districtname,\n"
//                    + "    r.reportid,\n"
//                    + "    p.proposalid,\n"
//                    + "FROM drms.t_exgratia_form tef\n"
//                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
//                    + "JOIN drms.m_calamity mc ON tef.calamity_id = mc.calamity_id\n"
//                    + "JOIN drms.exgratia_norm en ON tef.norm_code = en.norm_code\n"
//                    + "JOIN drms.assistance_head ah ON en.assistance_head_code = ah.assistance_head_code\n"
//                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
//                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
//                    + "LEFT JOIN drms.m_block mb ON r.blockcode = mb.blockcode\n"
//                    + "LEFT JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
//                    + "WHERE\n"
//                    + "    tef.t_exgratia_form_id IS NOT NULL\n"
//                    + "    AND mc.calamity_id = :calamityId\n"
//                    + "    AND ah.assistance_head_code = :assistanceHeadCode\n"
//                    + "    AND (md.districtcodelgd = :districtCode OR mb.districtcodelgd = :districtCode)\n"
//                    + "    AND (p.statuscode = 'APV')\n"
//                    + "    AND NOT EXISTS (\n"
//                    + "        SELECT 1\n"
//                    + "        FROM drms.agendanote an\n"
//                    + "        WHERE an.proposalid = p.proposalid\n"
//                    + "    )";
//
//            Query query = session.createSQLQuery(hql);
//            query.setParameter("calamityId", calamityId);
//            query.setParameter("assistanceHeadCode", assistanceHeadCode);
//            query.setParameter("districtCode", districtCode);
//            datalist = query.list();
//        } catch (Exception e) {
//            System.out.println("Error: " + e.toString());
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
    public List<Object[]> getDetailsForAgendaNote(String assistanceHeadCode, String calamityId, String districtCode) {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    r.reportid,\n"
                    + "    p.proposalid,\n"
                    + "    STRING_AGG(\n"
                    + "    CONCAT_WS(' ', en.description, en.losstype, \n"
                    + "              CASE WHEN en.option IN ('NA', 'N.A') THEN '' ELSE en.option END),\n"
                    + "    ', '\n"
                    + ") AS assistance,\n"
                    + "    md.districtcodelgd\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON tef.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm en ON tef.norm_code = en.norm_code\n"
                    + "JOIN drms.assistance_head ah ON en.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "LEFT JOIN drms.m_block mb ON r.blockcode = mb.blockcode\n"
                    + "LEFT JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "WHERE\n"
                    + "    tef.t_exgratia_form_id IS NOT NULL\n"
                    + "    AND mc.calamity_id = :calamityId\n"
                    + "    AND ah.assistance_head_code = :assistanceHeadCode\n"
                    + "    AND (md.districtcodelgd = :districtCode OR mb.districtcodelgd = :districtCode)\n"
                    + "    AND (p.statuscode = 'APV')\n"
                    + "    AND NOT EXISTS (\n"
                    + "        SELECT 1\n"
                    + "        FROM drms.agendanote an\n"
                    + "        WHERE an.proposalid = p.proposalid\n"
                    + "    )\n"
                    + "GROUP BY\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    r.reportid,\n"
                    + "    md.districtcodelgd,\n"
                    + "    p.proposalid;";

            Query query = session.createSQLQuery(hql);
            query.setParameter("calamityId", calamityId);
            query.setParameter("assistanceHeadCode", assistanceHeadCode);
            query.setParameter("districtCode", districtCode);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getAllDetailsForAgendaNoteGeneration() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    r.reportid,\n"
                    + "    p.proposalid,\n"
                    + "    STRING_AGG(\n"
                    + "    CONCAT_WS(' ', en.description, en.losstype, \n"
                    + "              CASE WHEN en.option IN ('NA', 'N.A') THEN '' ELSE en.option END),\n"
                    + "    ', '\n"
                    + ") AS assistance,\n"
                    + "    md.districtcodelgd\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON tef.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm en ON tef.norm_code = en.norm_code\n"
                    + "JOIN drms.assistance_head ah ON en.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "LEFT JOIN drms.m_block mb ON r.blockcode = mb.blockcode\n"
                    + "LEFT JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "WHERE\n"
                    + "    tef.t_exgratia_form_id IS NOT NULL\n"
                    + "    AND (p.statuscode = 'APV')\n"
                    + "    AND NOT EXISTS (\n"
                    + "        SELECT 1\n"
                    + "        FROM drms.agendanote an\n"
                    + "        WHERE an.proposalid = p.proposalid\n"
                    + "    )\n"
                    + "GROUP BY\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    md.districtcodelgd,\n"
                    + "    r.reportid,\n"
                    + "    p.proposalid;";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error|getAllDetailsForAgendaNoteGeneration: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getBeneficiaryDetails(String fir_no) {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT\n"
                    + "    b.beneficiary_id,\n"
                    + "    b.beneficiary_name,\n"
                    + "    b.age_category,\n"
                    + "    b.gender,\n"
                    + "    d.districtname,\n"
                    + "    blk.blockname AS blockname,\n"
                    + "    v.villagename AS villagename,\n"
                    + "    b.bank_name,\n"
                    + "    b.branch_name,\n"
                    + "    b.ifsc,\n"
                    + "    b.ac_number,\n"
                    + "    c.calamity_name,\n"
                    + "    STRING_AGG(CONCAT_WS(' ', n.description, n.losstype,\n"
                    + "         CASE WHEN n.option IN ('NA', 'N.A') THEN '' ELSE n.option END),\n"
                    + "    ', ') AS assistance,\n"
                    + "    SUM(e.amount) AS amount\n"
                    + "FROM drms.beneficiary AS b\n"
                    + "JOIN drms.m_village AS v ON b.villagecode = v.villagecode\n"
                    + "JOIN drms.m_block AS blk ON v.blockcode = blk.blockcode\n"
                    + "JOIN drms.m_districts AS d ON blk.districtcodelgd = d.districtcodelgd\n"
                    + "LEFT JOIN drms.t_exgratia_form AS e ON b.beneficiary_id = e.beneficiary_id\n"
                    + "LEFT JOIN drms.exgratia_norm AS n ON e.norm_code = n.norm_code\n"
                    + "LEFT JOIN drms.m_calamity AS c ON e.calamity_id = c.calamity_id\n"
                    + "WHERE e.fir_no = :fir_no\n"
                    + "GROUP BY\n"
                    + "    b.beneficiary_id,\n"
                    + "    b.beneficiary_name,\n"
                    + "    b.age_category,\n"
                    + "    b.gender,\n"
                    + "    e.fir_no,\n"
                    + "    d.districtname,\n"
                    + "    blk.blockname,\n"
                    + "    v.villagename,\n"
                    + "    b.bank_name,\n"
                    + "    b.branch_name,\n"
                    + "    b.ifsc,\n"
                    + "    b.ac_number,\n"
                    + "    c.calamity_name";
            Query query = session.createSQLQuery(hql);
            query.setParameter("fir_no", fir_no);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error|getBeneficiaryDetails: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getAllGeneratedAgendaNotes() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    md.districtname AS districtname_agenda,\n"
                    + "    an.note_number,\n"
                    + "    STRING_AGG(\n"
                    + "        CONCAT_WS(' ', en.description, en.losstype, \n"
                    + "              CASE WHEN en.option IN ('NA', 'N.A') THEN '' ELSE en.option END),\n"
                    + "        ', '\n"
                    + "    ) AS assistance\n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON tef.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm en ON tef.norm_code = en.norm_code\n"
                    + "JOIN drms.assistance_head ah ON en.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "LEFT JOIN drms.m_block mb ON r.blockcode = mb.blockcode\n"
                    + "LEFT JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "LEFT JOIN drms.agendanote an ON p.proposalid = an.proposalid\n"
                    + "WHERE\n"
                    + "    tef.t_exgratia_form_id IS NOT NULL\n"
                    + "    AND p.statuscode = 'AGN'\n"
                    + "    AND an.proposalid IS NOT NULL\n"
                    + "GROUP BY\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    districtname_agenda,\n"
                    + "    an.note_number;";

            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error|getAllGeneratedAgendaNotes: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getSanctionReports() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "WITH TotalAmountCTE AS (\n"
                    + "    SELECT SUM(tef.amount) AS total_amount\n"
                    + "    FROM drms.agendanote an\n"
                    + "    JOIN drms.proposal p ON p.proposalid = an.proposalid\n"
                    + "    JOIN drms.reports r ON r.proposalid = p.proposalid\n"
                    + "    JOIN drms.t_exgratia_form tef ON tef.reportid = r.reportid\n"
                    + "    JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "    WHERE hf.statuscode = 'AGN'\n"
                    + ")\n"
                    + "SELECT DISTINCT\n"
                    + "    md.districtname,\n"
                    + "    an.calamity_name,\n"
                    + "    an.note_number,\n"
                    + "    p.proposalid,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    (\n"
                    + "        SELECT SUM(tef_inner.amount)\n"
                    + "        FROM drms.t_exgratia_form tef_inner\n"
                    + "        JOIN drms.reports r_inner ON tef_inner.reportid = r_inner.reportid\n"
                    + "        WHERE r_inner.proposalid = p.proposalid\n"
                    + "    ) as amount,\n"
                    + "    hf.remarks,\n"
                    + "    ta.total_amount,\n"
                    + "    to_char(f.date_of_calamity_occurence,'DD/MM/YYYY') as incidence_date\n"
                    + "FROM drms.agendanote an\n"
                    + "JOIN drms.proposal p ON p.proposalid = an.proposalid\n"
                    + "JOIN drms.reports r ON r.proposalid = p.proposalid\n"
                    + "JOIN drms.m_districts md ON md.districtcodelgd = an.districtcodelgd \n"
                    + "JOIN drms.t_exgratia_form tef ON tef.reportid = r.reportid \n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "CROSS JOIN TotalAmountCTE ta\n"
                    + "WHERE hf.statuscode = 'AGN'";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error|getSanctionReports: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Object[]> getSanctionsForApproval() {
        Session session = sessionFactory.openSession();
        List<Object[]> datalist = null;
        try {
            session.beginTransaction();
            String hql = "SELECT DISTINCT\n"
                    + "    an.note_number,\n"
                    + "    p.proposalid,\n"
                    + "    r.reportid,\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    ah.description,\n"
                    + "    STRING_AGG(\n"
                    + "    CONCAT_WS(' ', en.description, en.losstype, \n"
                    + "              CASE WHEN en.option IN ('NA', 'N.A') THEN '' ELSE en.option END),\n"
                    + "    ', '\n"
                    + "    ) AS assistance,\n"
                    + "    (\n"
                    + "	SELECT SUM(tef_inner.amount)\n"
                    + "	FROM drms.t_exgratia_form tef_inner\n"
                    + "	JOIN drms.reports r_inner ON tef_inner.reportid = r_inner.reportid\n"
                    + "	WHERE r_inner.proposalid = p.proposalid\n"
                    + "    ) as amount,\n"
                    + "    hf.remarks    \n"
                    + "FROM drms.t_exgratia_form tef\n"
                    + "JOIN drms.fir f ON tef.fir_no = f.fir_no\n"
                    + "JOIN drms.m_calamity mc ON tef.calamity_id = mc.calamity_id\n"
                    + "JOIN drms.exgratia_norm en ON tef.norm_code = en.norm_code\n"
                    + "JOIN drms.assistance_head ah ON en.assistance_head_code = ah.assistance_head_code\n"
                    + "JOIN drms.reports r ON tef.reportid = r.reportid\n"
                    + "LEFT JOIN drms.proposal p ON r.proposalid = p.proposalid\n"
                    + "LEFT JOIN drms.m_block mb ON r.blockcode = mb.blockcode\n"
                    + "LEFT JOIN drms.m_districts md ON mb.districtcodelgd = md.districtcodelgd\n"
                    + "JOIN drms.agendanote an ON an.proposalid = p.proposalid\n"
                    + "JOIN drms.history_forwarding hf ON hf.proposalid = p.proposalid\n"
                    + "WHERE\n"
                    + "    tef.t_exgratia_form_id IS NOT NULL\n"
                    + "    AND (p.statuscode = 'AGN')\n"
                    + "    AND hf.statuscode = 'AGN'\n"
                    + "GROUP BY\n"
                    + "    an.note_number,\n"
                    + "    hf.remarks,\n"
                    + "    tef.fir_no,\n"
                    + "    mc.calamity_name,\n"
                    + "    ah.description,\n"
                    + "    f.date_of_calamity_occurence,\n"
                    + "    md.districtname,\n"
                    + "    r.reportid,\n"
                    + "    p.proposalid;";
            Query query = session.createSQLQuery(hql);
            datalist = query.list();
        } catch (Exception e) {
            System.out.println("Error|getSanctionReports: " + e.toString());
        } finally {
            session.close();
        }
        return datalist;
    }

}
