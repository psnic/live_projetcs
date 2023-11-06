<%-- 
    Document   : nav_side
    Created on : 8 Nov, 2022, 5:25:05 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="home.htm">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-house-user"></i></div>
                            Home
                        </a>

                        <c:choose>
                            <c:when test="${LOGIN.m_usertype.usertypeid == '2'}">
                                <!--<div class="sb-sidenav-menu-heading">Interface</div>-->
                                <%--<c:forEach items="${modules}"  var="x" varStatus="rowCounter">--%>
                                    <%--<c:if test="${x.processes.module.modulecode == '1'}">--%>
                                        <!--<a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">-->
                                            <!--<div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>-->
                                                <%--<c:out escapeXml="true" value="${x.processes.processname}" />--%>
                                        <!--</a>-->
                                    <%--</c:if>--%>
                                <%--</c:forEach>--%>
                                <div class="sb-sidenav-menu-heading">Cases</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '2'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:when test="${LOGIN.m_usertype.usertypeid == '3'}">
                                <!--<div class="sb-sidenav-menu-heading">Interface</div>-->
                                <%--<c:forEach items="${modules}"  var="x" varStatus="rowCounter">--%>
                                    <%--<c:if test="${x.processes.module.modulecode == '1'}">--%>
                                        <!--<a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">-->
                                            <!--<div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>-->
                                                <%--<c:out escapeXml="true" value="${x.processes.processname}" />--%>
                                        <!--</a>-->
                                    <%--</c:if>--%>
                                <%--</c:forEach>--%>
                                <div class="sb-sidenav-menu-heading">Cases</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '2'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:when test="${LOGIN.m_usertype.usertypeid == '5'}">
                                <div class="sb-sidenav-menu-heading">Users</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '3'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                                <div class="sb-sidenav-menu-heading">Master Data</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '4'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:when test="${LOGIN.m_usertype.usertypeid == '4'}">
                                <div class="sb-sidenav-menu-heading">Meetings</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '6'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                                <div class="sb-sidenav-menu-heading">Reports</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '7'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                                <div class="sb-sidenav-menu-heading">Calls</div>
                                <c:forEach items="${modules}"  var="x" varStatus="rowCounter">
                                    <c:if test="${x.processes.module.modulecode == '8'}">
                                        <a class="nav-link" href="<c:out escapeXml="true" value="${x.processes.pageurl}" />">
                                            <div class="sb-nav-link-icon"><i class="<c:out escapeXml="true" value="${x.processes.faicon}" />"></i></div>
                                                <c:out escapeXml="true" value="${x.processes.processname}" />
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        <!--<div class="sb-sidenav-menu-heading">Interface</div>-->
                        <!--                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                                    Layouts
                                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                                </a>-->
                        <!--                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                                    <nav class="sb-sidenav-menu-nested nav">
                                                        <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                                        <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                                    </nav>
                                                </div>-->
                        <!--                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                                    Pages
                                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                                </a>-->
                        <!--                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                                            Authentication
                                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                                        </a>
                                                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                                            <nav class="sb-sidenav-menu-nested nav">
                                                                <a class="nav-link" href="login.html">Login</a>
                                                                <a class="nav-link" href="register.html">Register</a>
                                                                <a class="nav-link" href="password.html">Forgot Password</a>
                                                            </nav>
                                                        </div>
                                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                                            Error
                                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                                        </a>
                                                        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                                            <nav class="sb-sidenav-menu-nested nav">
                                                                <a class="nav-link" href="401.html">401 Page</a>
                                                                <a class="nav-link" href="404.html">404 Page</a>
                                                                <a class="nav-link" href="500.html">500 Page</a>
                                                            </nav>
                                                        </div>
                                                    </nav>
                                                </div>-->

                        <!--<a class="nav-link" href="tables.html">-->
                        <!--<div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>-->
                        <!--Tables-->
                        <!--</a>-->


                        <!--<a class="nav-link" href="searchcase.htm">-->
                        <!--<div class="sb-nav-link-icon"><i class="fa-solid fa-magnifying-glass"></i></div>-->
                        <!--Search Case Number-->
                        <!--</a>-->
                        <!--<a class="nav-link" href="caseclosuredesk.htm">-->
                        <!--<div class="sb-nav-link-icon"><i class="fa-solid fa-rectangle-xmark"></i></div>-->
                        <!--Case Closure Desk-->
                        <!--</a>-->
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    <c:out escapeXml="true" value="${loggedinuser}" />
                </div>
            </nav>
        </div>
    </body>
</html>
