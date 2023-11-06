<%-- 
    Document   : AUTH_TEMPLATE
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History | DRMS</title>
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
                            <h1 class="mt-4 mb-4">Proposal History</h1>
                            <!--Page Content Start-->
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-apcs-tab" data-bs-toggle="tab" data-bs-target="#nav-apcs" type="button" role="tab" aria-controls="nav-apcs" aria-selected="true">Approved Proposals By C.S</button>
                                    <button class="nav-link" id="nav-ppsec-tab" data-bs-toggle="tab" data-bs-target="#nav-ppsec" type="button" role="tab" aria-controls="nav-ppsec" aria-selected="false">Pending Proposals With SEC</button>
                                    <button class="nav-link" id="nav-apsec-tab" data-bs-toggle="tab" data-bs-target="#nav-apsec" type="button" role="tab" aria-controls="nav-apsec" aria-selected="false">Approved Proposals By SEC</button>
                                    <!--<button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>-->
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-apcs" role="tabpanel" aria-labelledby="nav-apcs-tab" tabindex="0">
                                    <div class="mt-1">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="">List of Proposals Approved By Commissioner Secretary</h5>
                                            </div>
                                            <div class="card-body">
                                                <div id="tableContainer" class="mt-4">
                                                    <table id="apvCSTable" class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No.</th>
                                                                <th>Proposal Id</th>
                                                                <th>Calamity</th>
                                                                <th>Assistance Head</th>
                                                                <th>Type of Assistance</th>
                                                                <th>Amount Proposed</th>
                                                                <th>Date of Incidence</th>
                                                                <th>District</th>
                                                                <th>Remarks</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBody">
                                                        <c:forEach varStatus="i" items="${apv_cslist}" var="p">
                                                            <tr data-block="<c:out escapeXml='true' value='${p[5]}' />" data-amount="<c:out escapeXml='true' value='${p[10]}' />">
                                                                <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[7]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[9]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[10]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                                <td>
                                                                    <button class="btn btn-secondary btn-sm btn-block" onclick="viewReport(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[11]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />'
                                                                                    )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-ppsec" role="tabpanel" aria-labelledby="nav-ppsec-tab" tabindex="0">
                                <div class="mt-1">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="">List of Proposals Pending With S.E.C</h5>
                                        </div>
                                        <div class="card-body">
                                            <div id="tableContainer" class="mt-4">
                                                <table id="pdgSECTable" class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl No.</th>
                                                            <th>Proposal Id</th>
                                                            <th>Calamity</th>
                                                            <th>Assistance Head</th>
                                                            <th>Type of Assistance</th>
                                                            <th>Amount Proposed</th>
                                                            <th>Date of Incidence</th>
                                                            <th>District</th>
                                                            <th>Remarks</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tableBody">
                                                        <c:forEach varStatus="i" items="${pending_seclist}" var="p">
                                                            <tr data-block="<c:out escapeXml='true' value='${p[5]}' />" data-amount="<c:out escapeXml='true' value='${p[10]}' />">
                                                                <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[7]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[9]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[10]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                                <td>
                                                                    <button class="btn btn-secondary btn-sm btn-block" onclick="viewReport(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[12]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />'
                                                                                    )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                                    <button class="btn btn-success btn-sm btn-block mt-2" onclick="viewAgendaNote(
                                                                                                    '<c:out escapeXml="true" value="${p[11]}" />',
                                                                                                    )">&nbsp;View Agenda Note&nbsp;</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-apsec" role="tabpanel" aria-labelledby="nav-apsec-tab" tabindex="0">
                                <div class="mt-1">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="">List of Proposals Approved By S.E.C</h5>
                                        </div>
                                        <div class="card-body">
                                            <div id="tableContainer" class="mt-4">
                                                <table id="apvSECTable" class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl No.</th>
                                                            <th>Proposal Id</th>
                                                            <th>Calamity</th>
                                                            <th>Assistance Head</th>
                                                            <th>Type of Assistance</th>
                                                            <th>Amount Proposed</th>
                                                            <th>Date of Incidence</th>
                                                            <th>District</th>
                                                            <th>Remarks</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tableBody">
                                                        <c:forEach varStatus="i" items="${apv_seclist}" var="p">
                                                            <tr>
                                                                <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[7]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[9]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[10]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                                <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                                <td>
                                                                    <button class="btn btn-secondary btn-sm btn-block" onclick="viewReport(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[12]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />'
                                                                                    )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                                    <button class="btn btn-success btn-sm btn-block mt-2" onclick="viewAgendaNote(
                                                                                    '<c:out escapeXml="true" value="${p[11]}" />',
                                                                                    )">&nbsp;View Agenda Note&nbsp;</button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">...</div>-->
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
                                                                            $('#apvCSTable').DataTable();
                                                                            $('#pdgSECTable').DataTable();
                                                                            $('#apvSECTable').DataTable();
                                                                        });

                                                                        function viewReport(fir_no, dateofincidence, reportid) {
                                                                            console.log("fir_no:: " + fir_no + "dateofincidence:: " + dateofincidence + "reportid:: " + reportid);
                                                                            var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                            window.open(url, '_blank');
                                                                        }

                                                                        function viewAgendaNote(note_number) {
                                                                            var url = "view_agendanote.htm?note_number=" + note_number;
                                                                            window.open(url, '_blank');
                                                                        }
        </script>
    </body>
</html>
