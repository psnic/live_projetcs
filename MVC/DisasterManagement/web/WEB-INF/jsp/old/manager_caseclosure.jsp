<%-- 
    Document   : manager_caseclosure
    Created on : 8 Nov, 2022, 4:52:32 PM
    Author     : joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style>
            .rowclick {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container-fluid px-4">
                        <div class="card mt-4">
                            <div class="card-header bg-purple text-center"><h4 class="text-white py-2">Centre Wise Total Number of Cases For Closure</h4></div>
                            <div class="card-body">
                                <table class="table table-bordered table-striped" id="closedCaseTable">
                                    <thead>
                                        <tr>
                                            <th>Sl. No.</th>
                                            <th>Case Center</th>
                                            <th>Closure Type Description</th>
                                            <th>No. of Cases Closed</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="v" items="${caseclosure}" varStatus="i">
                                            <tr class="rowclick" onclick="loadCaseList('<c:out value="${v[0]}"></c:out>', '<c:out value="${v[2]}"></c:out>');">
                                                <td><c:out value="${i.count}"></c:out></td>
                                                <td><c:out value="${v[1]}"></c:out></td>
                                                <td><c:out value="${v[3]}"></c:out></td>
                                                <td><c:out value="${v[4]}"></c:out></td>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <script>
                                                $(document).ready(function () {
                                                    $('#closedCaseTable').DataTable({});
                                                });

                                                function loadCaseList(centreid, closuretypeid) {
//                                                    alert(centreid);
//                                                    alert(closuretypeid);

//                                                    $.confirm({
//                                                        content: function () {
//                                                            var self = this;
//                                                            return $.ajax({
//                                                                url: './getclosurelistbyclosuretype.htm',
//                                                                data: 'centreid=' + centreid + '&closuretypeid=' + closuretypeid,
//                                                                method: 'GET'
//                                                            }).done(function (response) {
//                                                                console.log(response);
//                                                                self.close();
//                                                            }).fail(function () {
//                                                                self.setTitle('');
//                                                                self.setContent('Something went wrong.');
//                                                            });
//                                                        }
//                                                    });

                                                }
        </script>
    </body>
</html>
