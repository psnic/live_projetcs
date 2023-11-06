<%-- 
    Document   : templateforallpages
    Created on : 8 Nov, 2022, 4:52:32 PM
    Author     : joshua
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
        <title>Quarterly Meetings & Orientation Programs</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container px-5">
                        <div class="card">
                            <div class="card-header bg-purple"><h4 class="text-white text-center fw-bold font-size-lg">Count No. of Calls</h4></div>
                            <div class="card-body">
                                <div class="row mt-2 justify-content-center">
                                    <div class="col-md-3">
                                        <div class="form-floating">
                                            <select name="year" id="inputYear" class="form-control"> 
                                                <option value="" disabled="true" selected="true">Select Year</option>
                                                <c:forEach items="${yearlist}" var="y">
                                                    <c:set var="cy" value="0"/>
                                                    <c:set var="current_year" value="${currentyear}"/>
                                                    <c:choose>
                                                        <c:when test="${y==current_year}">
                                                            <c:set var="cy" value="1"/>
                                                            <option value="${y}"><c:out escapeXml="true" value="${y}"/></option>
                                                        </c:when>  
                                                        <c:otherwise>
                                                            <c:set var="cy" value="0"/>
                                                            <option value="${y}"><c:out escapeXml="true" value="${y}"/></option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <%--<c:if test="${cy eq 0}">--%>
                                                    <!--<option value="${currentyear}"><c:out escapeXml="true" value="${currentyear}"/></option>-->
                                                <%--</c:if>--%>
                                            </select>
                                            <label for="inputYear">Count calls by year</label>
                                        </div>
                                    </div>
                                </div>
                                <div id="count_call_container" class="d-none">
                                    <div class="row mt-2" style="margin-left:25px;">
                                        <h5>Total No of calls of the entire year  </h5>
                                        <table class='table table-striped table-bordered' >
                                            <thead>
                                            <th>
                                                Total No. of calls for the year <span id="spanyear"></span>
                                            </th>
                                            </thead>
                                            <tbody id="tbtotal">
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row mt-2" style="margin-left:25px;">
                                        <h5>Total Number of Calls in a month </h5>
                                        <table class='table table-striped table-bordered' >
                                            <thead>
                                            <th>
                                                Month
                                            </th>
                                            <th>
                                                No. of calls
                                            </th>
                                            </thead>
                                            <tbody id="tbmonth">
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row mt-2" style="margin-left:25px;">
                                        <h5>Total Number of Calls with type of calls</h5>
                                        <table class='table table-striped table-bordered' >
                                            <thead>
                                            <th>
                                                Month
                                            </th>
                                            <th>
                                                Call Type
                                            </th>
                                            <th>
                                                No of calls
                                            </th>
                                            </thead>
                                            <tbody id="tbtype">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
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
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {

                document.getElementById("inputYear").addEventListener("change", function () {
                    var selectedYear = this.value;
                    var spanyear = document.getElementById("spanyear");
                    spanyear.textContent = selectedYear;
                });

                $('#inputYear').change(function () {
                    $('#count_call_container').show();
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                url: "./countcalls.htm",
                                data: 'year=' + $('#inputYear').val(),
                                method: 'get'
                            }).done(function (response) {
                                var res = JSON.parse(response);

                                var call_type = JSON.parse(res.call_type);
                                var call_month = JSON.parse(res.call_month);
                                var call_total = JSON.parse(res.call_total);

                                var markup_total = "";
                                var markup_month = "";
                                var markup_type = "";

                                markup_total += '<tr><td>' + call_total + '</td></tr>';
                                $('#tbtotal').html('');
                                $('#tbtotal').append(markup_total);

                                for (var i = 0; i < call_month.length; i++) {
                                    markup_month += '<tr><td>' + call_month[i][0] + '</td>' +
                                            '<td>' + call_month[i][1] + '</td></tr>';
                                }
                                $('#tbmonth').html('');
                                $('#tbmonth').append(markup_month);

                                for (var i = 0; i < call_type.length; i++) {
                                    markup_type += '<tr><td>' + call_type[i][0] + '</td>' +
                                            '<td>' + call_type[i][1] + '</td>' +
                                            '<td>' + call_type[i][2] + '</td></tr>';
                                }
                                $('#tbtype').html('');
                                $('#tbtype').append(markup_type);
                                $('#count_call_container').removeClass('d-none');
                                self.close();
                            }).fail(function () {
                                self.setContent('Something went wrong.');
                            });
                        }
                    });
                });
            });
        </script>
    </body>
</html>
