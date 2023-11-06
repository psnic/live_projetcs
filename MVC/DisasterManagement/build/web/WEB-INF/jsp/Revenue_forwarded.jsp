<%-- 
    Document   : generate_report
    Created on : 6 Jul, 2023, 3:00:55 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <sec:csrfMetaTags />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style type="text/css">
            body{
                background:#FAFAFB;
                margin-top: 20px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="auth_nav_navbar.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/getmenu.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4 mb-4">Forwarded Proposals From Revenue To Commissioner Secretary</h1>
                            <!--Page Content Start-->
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-center"></h5>
                            </div>
                            <div class="card-body">
                                <div id="tableContainer" class="mt-4">
                                    <table id="reportTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>Fir Number</th>
                                                <th>Calamity</th>
                                                <th>Type of Assistance</th>
                                                <th>Date of Incidence</th>
                                                <th>District</th>
                                                <th>Block</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${exlist}" var="p">
                                                <tr>
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[5]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                    <td>
                                                        <button class="btn btn-secondary btn-sm btn-block" onclick="viewReport(
                                                                        '<c:out escapeXml="true" value="${p[0]}" />',
                                                                        '<c:out escapeXml="true" value="${p[3]}" />',
                                                                        '<c:out escapeXml="true" value="${p[6]}" />'
                                                                        )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--<input type="submit" id="forwardButton" class="btn btn-success float-end mt-4" value="Forward Proposal to Revenue Dept" onclick="forwardReport()"/>-->
                                </div>
                            </div>
                        </div>
                        <!--Page Content End-->
                    </div>
                </main>

                <%@include file="auth_footer_content.jsp" %>

            </div>
        </div>
        <%@include file="auth_footer_import.jsp" %>
        <script src="jojo/DataTables/datatables.min.js" type="text/javascript"></script>
        <script>
                                                            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                            var csrfToken = $("meta[name='_csrf']").attr("content");
                                                            var reportid;
                                                            $(document).ready(function () {

                                                                $('#reportTable').DataTable();
                                                            });

                                                            function viewReport(fir_no, dateofincidence, reportid) {
                                                                console.log("fir_no:: " + fir_no + "dateofincidence:: " + dateofincidence + "reportid:: " + reportid);
                                                                var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                window.open(url, '_blank');
                                                            }



        </script>
    </body>
</html>
