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
        <title>View Agenda Note | DRMS</title>
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
                            <h1 class="mt-4 mb-4">View Agenda Notes</h1>
                            <!--Page Content Start-->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="text-center">List Of Prepared Agenda Notes</h5>
                                </div>
                                <div class="card-body">
                                    <div id="tableContainer" class="mt-4">
                                        <table id="reportTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Sl No.</th>
                                                    <th>Note Number</th>
                                                    <th>Calamity</th>
                                                    <th>Assistance Head</th>
                                                    <th>Type of Assistance</th>
                                                    <th>District</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${agendalist}" var="p">
                                                <tr>
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td>
                                                        <button class="btn btn-success btn-block" onclick="viewAgendaNote(
                                                                        '<c:out escapeXml="true" value="${p[3]}" />'
                                                                        )">&nbsp;Agenda Note&nbsp;</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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

                                                            function viewAgendaNote(note_number) {
                                                                var url = "view_agendanote.htm?note_number=" + note_number;
                                                                window.open(url, '_blank');
                                                            }




        </script>
    </body>
</html>
