<%-- 
    Document   : auth_sidebar
    Created on : 6 Jul, 2023, 1:44:22 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel Sidebar</title>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="jojo/fontawesome-free-6.4.0-web/js/all.js" type="text/javascript"></script>
    </head>
    <style>
        /* Style for the main menu item */

        /* Add the following CSS to fix the footer at the bottom of the sidebar and create a big space */
        /*        #layoutSidenav_nav {
                    display: flex;
                    flex-direction: column;
                    height: 100%;
                }*/

        /*        .sb-sidenav {
                    flex-grow: 1;
                    display: flex;
                    flex-direction: column;
                }*/

        /*        .sb-sidenav-menu {
                    flex-grow: 1;
                    padding-bottom: 50px;  Adjust the value to create a big space between Dashboard and footer 
                }*/

        /*        .sb-sidenav-footer {
                    position: fixed;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    background-color: #222;  Set the background color of the footer if needed 
                    padding: 10px;
                }*/

        /*        .sb-sidenav-footer-content {
                    text-align: center;
                }*/

    </style>
    <body>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                        <div class="sb-sidenav-footer">
                            <div class="">Logged in as:</div>
                            <c:out escapeXml="true" value="${LOGIN.username}" />
                        </div>

                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="home.htm">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color: #8f8f8f;"></i></div>
                            Home
                        </a>
                        <c:choose>
                            <c:when test="${(LOGIN.role_code.role_code == '4')}">
                                <a class="nav-link" href="fir.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-file-lines" style="color: #8f8f8f;"></i></i></div>
                                    First Information Report
                                </a>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Proposals
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="generatereport.htm"><div class="sb-nav-link-icon"><i class="fa-solid fa-file-contract" style="color: #8f8f8f;"></i></div>Generate Statement of Proposal</a>
                                        <a class="nav-link" href="bdoforwardedproposals.htm"><div class="sb-nav-link-icon"><i class="fa-solid fa-file-contract" style="color: #8f8f8f;"></i></div>Forwarded Proposals</a>
                                        <!--<a class="nav-link" href="dailyreport.htm"><div class="sb-nav-link-icon"><i class="fa-solid fa-file-contract" style="color: #8f8f8f;"></i></div>Daily Report</a>-->
                                        <!--<a class="nav-link" href="#"><div class="sb-nav-link-icon"><i class="fa-solid fa-file-contract" style="color: #8f8f8f;"></i></div>Overall Report</a>-->
                                    </nav>
                                </div>
                                <a class="nav-link" href="bdo_returned_proposals.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-rotate-left" style="color: #8f8f8f;"></i></div>
                                    Returned Proposals From DC
                                </a>
                            </c:when>
                            <c:when test="${(LOGIN.role_code.role_code == '3')}">
                                <a class="nav-link" href="bdoforwardedproposals.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-envelope-circle-check" style="color: #8f8f8f;"></i></div>
                                    Total Proposals Received
                                </a>
                                <a class="nav-link" href="dc_returned_proposals.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-rotate-left" style="color: #8f8f8f;"></i></div>
                                    Proposals Returned By Revenue Department
                                </a>
                                <a class="nav-link" href="sanctionedproposals.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-money-check" style="color: #8f8f8f;"></i></div>
                                    Sanctioned Proposals
                                </a>
                            </c:when>
                            <c:when test="${(LOGIN.role_code.role_code == '5')}">
                                <a class="nav-link" href="revenue_agendanote.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-file-lines" style="color: #8f8f8f;"></i></div>
                                    Prepare Agenda Note
                                </a>
                                <a class="nav-link" href="revenue_view_agendanote.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-rectangle-list" style="color: #8f8f8f;"></i></div>
                                    View Agenda Note
                                </a>
                                <a class="nav-link" href="revenue_sanction_approval.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-check-to-slot" style="color: #8f8f8f;"></i></div>
                                    Sanction Movement
                                </a>
                                <a class="nav-link" href="revenue_sanction_report.htm">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-book" style="color: #8f8f8f;"></i></div>
                                    Sanction Report
                                </a>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Proposals
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="revenue_history.htm">
                                            <div class="sb-nav-link-icon"><i class="fa-solid fa-book" style="color: #8f8f8f;"></i></div>
                                            Proposal History
                                        </a>
                                        <a class="nav-link" href="bdoforwardedproposals.htm">
                                            <div class="sb-nav-link-icon"><i class="fa-solid fa-envelope-circle-check" style="color: #8f8f8f;"></i></div>
                                            Total Proposals Received
                                        </a>
                                        <a class="nav-link" href="sanctionedproposals.htm">
                                            <div class="sb-nav-link-icon"><i class="fa-solid fa-money-check" style="color: #8f8f8f;"></i></div>
                                            Sanctioned Proposals
                                        </a>
                                    </nav>
                                </div>
                            </c:when>
                        </c:choose>
                        <!--                        <a class="nav-link" href="campdetails.htm">
                                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-tent" style="color: #8f8f8f;"></i></div>
                                                    Relief Camp
                                                </a>-->
                        <!--                        <a class="nav-link" href="dailyreport.htm">
                                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-file-contract" style="color: #8f8f8f;"></i></div>
                                                    Daily Report
                                                </a>-->

                        <!--<div class="sb-sidenav-menu-heading">Interface</div>-->
                        <!--<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">-->
                        <!--<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>-->
                        <!--Layouts-->
                        <!--<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>-->
                        <!--</a>-->
                        <!--<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">-->
                        <!--<nav class="sb-sidenav-menu-nested nav">-->
                        <!--<a class="nav-link" href="layout-static.html">Static Navigation</a>-->
                        <!--<a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>-->
                        <!--</nav>-->
                        <!--</div>-->
                        <!--<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">-->
                        <!--<div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>-->
                        <!--Pages-->
                        <!--<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>-->
                        <!--</a>-->
                        <!--<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">-->
                        <!--<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">-->
                        <!--<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">-->
                        <!--Authentication-->
                        <!--<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>-->
                        <!--</a>-->
                        <!--<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">-->
                        <!--<nav class="sb-sidenav-menu-nested nav">-->
                        <!--<a class="nav-link" href="login.html">Login</a>-->
                        <!--<a class="nav-link" href="register.html">Register</a>-->
                        <!--<a class="nav-link" href="password.html">Forgot Password</a>-->
                        <!--</nav>-->
                        <!--</div>-->
                        <!--<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">-->
                        <!--Error-->
                        <!--<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>-->
                        <!--</a>-->
                        <!--<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">-->
                        <!--<nav class="sb-sidenav-menu-nested nav">-->
                        <!--<a class="nav-link" href="401.html">401 Page</a>-->
                        <!--<a class="nav-link" href="404.html">404 Page</a>-->
                        <!--<a class="nav-link" href="500.html">500 Page</a>-->
                        <!--</nav>-->
                        <!--</div>-->
                        <!--</nav>-->
                        <!--</div>-->
                        <!--                        <div class="sb-sidenav-menu-heading">Addons</div>
                                                <a class="nav-link" href="charts.html">
                                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                                Charts
                                                </a>
                                                <a class="nav-link" href="tables.html">
                                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                                Tables
                                                </a>
                                                </div>-->
                    </div>

                </div>
            </nav>
        </div>
        <script src="jojo/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="jojo/js/scripts.js" type="text/javascript"></script>
    </body>
</html>
