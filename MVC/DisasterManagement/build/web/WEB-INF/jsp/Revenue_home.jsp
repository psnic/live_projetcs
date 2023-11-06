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
        <title>Home | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <style type="text/css">
            body{
                background:#FAFAFB;
                margin-top: 20px;
            }

            .small-box {
                border-radius: 0.25rem;
                box-shadow: 0 0 1px rgba(0, 0, 0, 0.125), 0 1px 3px rgba(0, 0, 0, 0.2);
                position: relative;
                display: block;
                margin-bottom: 1.25rem;
            }
            .small-box > .inner {
                padding: 10px;
            }
            .small-box > .small-box-footer {
                position: relative;
                z-index: 10;
                display: block;
                padding: 3px 0;
                color: rgba(255, 255, 255, 0.8);
                text-align: center;
                text-decoration: none;
                background-color: rgba(0, 0, 0, 0.1);
            }
            .small-box > .small-box-footer:hover {
                color: #fff;
                background-color: rgba(0, 0, 0, 0.15);
            }
            .small-box h3, .small-box .h3 {
                font-size: calc(1.345rem + 1.14vw);
                padding: 0;
                margin: 0 0 10px;
                font-weight: 700;
                white-space: nowrap;
            }
            @media (min-width: 1200px) {
                .small-box h3, .small-box .h3 {
                    font-size: 2.2rem;
                }
            }
            @media (min-width: 992px) {
                .col-xl-2 .small-box h3, .col-xl-2 .small-box .h3, .col-lg-2 .small-box h3, .col-lg-2 .small-box .h3, .col-md-2 .small-box h3, .col-md-2 .small-box .h3 {
                    font-size: calc(1.285rem + 0.42vw);
                }
            }
            @media (min-width: 992px) and (min-width: 1200px) {
                .col-xl-2 .small-box h3, .col-xl-2 .small-box .h3, .col-lg-2 .small-box h3, .col-lg-2 .small-box .h3, .col-md-2 .small-box h3, .col-md-2 .small-box .h3 {
                    font-size: 1.6rem;
                }
            }
            @media (min-width: 992px) {
                .col-xl-3 .small-box h3, .col-xl-3 .small-box .h3, .col-lg-3 .small-box h3, .col-lg-3 .small-box .h3, .col-md-3 .small-box h3, .col-md-3 .small-box .h3 {
                    font-size: calc(1.285rem + 0.42vw);
                }
            }
            @media (min-width: 992px) and (min-width: 1200px) {
                .col-xl-3 .small-box h3, .col-xl-3 .small-box .h3, .col-lg-3 .small-box h3, .col-lg-3 .small-box .h3, .col-md-3 .small-box h3, .col-md-3 .small-box .h3 {
                    font-size: 1.6rem;
                }
            }
            @media (min-width: 1200px) {
                .col-xl-2 .small-box h3, .col-xl-2 .small-box .h3, .col-lg-2 .small-box h3, .col-lg-2 .small-box .h3, .col-md-2 .small-box h3, .col-md-2 .small-box .h3 {
                    font-size: calc(1.345rem + 1.14vw);
                }
            }
            @media (min-width: 1200px) and (min-width: 1200px) {
                .col-xl-2 .small-box h3, .col-xl-2 .small-box .h3, .col-lg-2 .small-box h3, .col-lg-2 .small-box .h3, .col-md-2 .small-box h3, .col-md-2 .small-box .h3 {
                    font-size: 2.2rem;
                }
            }
            @media (min-width: 1200px) {
                .col-xl-3 .small-box h3, .col-xl-3 .small-box .h3, .col-lg-3 .small-box h3, .col-lg-3 .small-box .h3, .col-md-3 .small-box h3, .col-md-3 .small-box .h3 {
                    font-size: calc(1.345rem + 1.14vw);
                }
            }
            @media (min-width: 1200px) and (min-width: 1200px) {
                .col-xl-3 .small-box h3, .col-xl-3 .small-box .h3, .col-lg-3 .small-box h3, .col-lg-3 .small-box .h3, .col-md-3 .small-box h3, .col-md-3 .small-box .h3 {
                    font-size: 2.2rem;
                }
            }
            .small-box p {
                font-size: 1.3rem;
            }
            .small-box p > small, .small-box p > .small {
                display: block;
                margin-top: 5px;
                font-size: 0.9rem;
                color: #f8f9fa;
            }
            .small-box h3, .small-box .h3,
            .small-box p {
                z-index: 5;
            }
            .small-box .icon {
                z-index: 0;
                color: rgba(0, 0, 0, 0.15);
            }
            .small-box .icon > i {
                position: absolute;
                top: 15px;
                right: 15px;
                font-size: 90px;
                transition: transform 0.3s linear;
            }
            @media (prefers-reduced-motion: reduce) {
                .small-box .icon > i {
                    transition: none;
                }
            }
            .small-box .icon > i.inner-icon {
                top: 20px;
                font-size: 70px;
            }
            .small-box .icon svg {
                position: absolute;
                top: 15px;
                right: 15px;
                font-size: 70px;
                transition: transform 0.3s linear;
            }
            @media (prefers-reduced-motion: reduce) {
                .small-box .icon svg {
                    transition: none;
                }
            }
            .small-box:hover {
                text-decoration: none;
            }
            .small-box:hover .icon > i, .small-box:hover .icon > i.inner-icon {
                transform: scale(1.1);
            }
            .small-box:hover .icon > svg {
                transform: scale(1.1);
            }

            @media (max-width: 575.98px) {
                .small-box {
                    text-align: center;
                }
                .small-box .icon {
                    display: none;
                }
                .small-box p {
                    font-size: 12px;
                }
            }
            .bg-blue {
                background-color: #27A0D8 !important;
            }
            .bg-green {
                background-color: #6bab54 !important;
            }
            .bg-orange {
                background-color: #a27bbb !important;
            }
            .bg-whatev {
                background-color: #5c8ba3 !important;
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
                            <h1 class="mt-4 mb-4">Home</h1>
                            <!--Page Content Start-->
                            <div class="row d-flex">
<!--                                <div class="col-lg-3 col-6">
                                     small box 
                                    <div class="small-box bg-blue">
                                        <div class="inner">
                                            <h3 class="text-light">${pr_count}</h3>
                                        <p class="text-light">Received Statement Of Proposals</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa-solid fa-rectangle-list"></i>
                                    </div>
                                    <a href="bdoforwardedproposals.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>-->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-whatev">
                                    <div class="inner">
                                        <h3 class="text-light">${pp_count}</h3>
                                        <p class="text-light">Pending Proposals in Revenue Dept.</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa-solid fa-clipboard-list"></i>
                                    </div>
                                    <a href="revenue_pending.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-whatev">
                                    <div class="inner">
                                        <h3 class="text-light">${pdc_count}</h3>
                                        <p class="text-light">Pending Proposals With DC</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa-solid fa-clipboard-list"></i>
                                    </div>
                                    <a href="dc_pending.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3 class="text-light">${apv_count}</h3>
                                        <p class="text-light">Approved Proposals By SEC</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa-solid fa-thumbs-up"></i>
                                    </div>
                                    <a href="approvedproposals.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3 class="text-light">${pf_count}</h3>
                                        <p class="text-light">Post-Facto Pending Proposals</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa-solid fa-calendar-check"></i>
                                    </div>
                                    <a href="revenue_postfacto_pending.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!--                                <div class="col-lg-3 col-6">
                                                                 small box 
                                                                <div class="small-box bg-orange">
                                                                    <div class="inner">
                                                                        <h3 class="text-light">${fp_count}</h3>
                                                                        <p class="text-light">Forwarded Proposals</p>
                                                                    </div>
                                                                    <div class="icon">
                                                                        <i class="fa-solid fa-share-from-square"></i>
                                                                    </div>
                                                                    <a href="forwardedproposalsfromrevtocs.htm" class="small-box-footer">View More <i class="fas fa-arrow-circle-right"></i></a>
                                                                </div>
                                                            </div>-->
                        </div>
                        <!--Page Content End-->
                    </div>
                </main>

                <%@include file="auth_footer_content.jsp" %>

            </div>
        </div>


        <%@include file="auth_footer_import.jsp" %>
    </body>
</html>
