<%-- 
    Document   : templateforallpages
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
        <title>Superuser Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <!--<link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>-->
        <!--<link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="suantonsing/jquery-mini-event-calendar/mini-event-calendar.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container-fluid mt-4 px-4">
                        <div class="row">
<!--                            <div class="col-sm-12 col-md-3">
                                <div class="card bg-purple">
                                    <div class="card-body">
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>-->
                            <div class="col-sm-12 col-md-9">
                                <div class="card">
                                    <div class="card-header bg-purple">
                                        <h5 class="card-title text-center fw-bold text-white mb-0"><i class="fa-solid fa-gauge-high"></i>&nbsp;&nbsp;System Information&nbsp;&nbsp;<i class="fa-solid fa-gauge-high"></i></h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col">
                                                <div class="card">
                                                    <div class="card-header">
                                                        Server Time
                                                        <input id="sysdate" hidden="true" value="<c:out escapeXml="true" value="${sysdate}" />" />
                                                        <input id="timeZoneOffset" hidden="true" value="<c:out escapeXml="true" value="${timeZoneOffset}" />" />
                                                    </div>
                                                    <div class="card-body">
                                                        The time on the server is:<br/>
                                                        <h4 id="servdate"></h4>
                                                        <h4 id="servtime"></h4>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row d-flex justify-content-between">
                                            <div class="col">
                                                <div class="card text-center">
                                                    <div class="card-header">
                                                        Registered Users & Agents
                                                    </div>
                                                    <div class="card-body">
                                                        Total Registrations:<br/>
                                                        <h1><c:out escapeXml="true" value="${usersCount}" /></h1>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="card text-center">
                                                    <div class="card-header">
                                                        Registered Police Stations
                                                    </div>
                                                    <div class="card-body">
                                                        Total Registrations:<br/>
                                                        <h1><c:out escapeXml="true" value="${policeStationCount}" /></h1>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="card text-center">
                                                    <div class="card-header">
                                                        Registered Agencies
                                                    </div>
                                                    <div class="card-body">
                                                        Total Registrations:<br/>
                                                        <h1><c:out escapeXml="true" value="${registeredAgenciesCount}" /></h1>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="card text-center">
                                                    <div class="card-header">
                                                        Contact Person for Agencies
                                                    </div>
                                                    <div class="card-body">
                                                        Total Registrations:<br/>
                                                        <h1><c:out escapeXml="true" value="${contactPersonCount}" /></h1>
                                                    </div>
                                                </div>
                                            </div>  
                                        </div>
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
        <!--<script src="suantonsing/js/sha256.js" type="text/javascript"></script>-->
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <!--<script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>-->
        <script src="suantonsing/jquery-mini-event-calendar/mini-event-calendar.min.js" type="text/javascript"></script>
        <script>
            $("#calendar").MEC();

            $(document).ready(function () {
                var st = $('#sysdate').val();
                var tzo = $('#timeZoneOffset').val();
                var myVar = setInterval(function () {
                    myTimer();
                }, 1000);
                var jsVar = st;
                var timeZoneOffset = tzo;
                jsVar = parseInt(jsVar) + parseInt(timeZoneOffset);
                function myTimer() {
                    jsVar = jsVar + 1000;
                    var d = new Date(jsVar);
                    var sd = d.toLocaleDateString("en-IN");
                    var hh = d.getUTCHours();
                    var mm = d.getUTCMinutes();
                    var ss = d.getUTCSeconds();
                    var ampm = (hh >= 12) ? "PM" : "AM";
                    if (hh > 12) {
                        hh -= 12;
                    } else if (hh === 0) {
                        hh = 12;
                    }
                    mm = (mm <= 9) ? "0" + mm : mm;
                    ss = (ss <= 9) ? "0" + ss : ss;
                    $('#servdate').html(sd);
                    $('#servtime').html(hh + ":" + mm + ":" + ss + " " + ampm);
                }
            });
        </script>
    </body>
</html>
