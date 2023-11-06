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
        <style>
            /* Update the .small-box class to use flex */
            .small-box {
                border-radius: 0.25rem;
                box-shadow: 0 0 1px rgba(0, 0, 0, 0.125), 0 1px 3px rgba(0, 0, 0, 0.2);
                position: relative;
                display: flex;
                flex-direction: column;
                margin-bottom: 1.25rem;
            }

            /* Apply min-height to the .inner element */
            .small-box > .inner {
                padding: 10px;
                flex-grow: 1;
                min-height: 160px; /* Adjust this value as needed */
            }

            .small-box > .small-box-footer {
                position: relative;
                z-index: 10;
                display: block;
                padding: 3px 0;
                color: rgba(0, 0, 0, 0.8); /* Darker text color */
                text-align: center;
                text-decoration: none;
                /*background-color: rgba(255, 204, 153, 0.5);  Lighter orange background with transparency */
                transition: background-color 0.3s ease; /* Add smooth transition for background color change */
            }

            .small-box > .small-box-footer:hover {
                color: #fff; /* White text color on hover */
                background-color: rgba(0, 0, 0, 0.3); /* Darker semi-transparent background on hover */
            }

            .small-box h3, .small-box .h3 {
                font-size: calc(1rem + 0.5vw); /* Adjusted font size */
                padding: 0;
                margin: 0 0 5px; /* Reduced margin for tighter spacing */
                font-weight: 700;
                white-space: nowrap;
                overflow: hidden; /* Prevent text overflow */
                text-overflow: ellipsis; /* Add ellipsis (...) for truncated text */
            }
            .light-bluish-bg {
                background-color: #e6f7ff; /* Light bluish color */
            }
            .light-green-bg {
                background-color: #b3f8c7; /* Light green color */
            }
            .text-green {
                color:#055724; /* Dark green color */
            }

            .small-box p {
                font-size: 1rem;
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
            .small-box:hover {
                text-decoration: none;
            }
            .relief-bg {
                background-color: #e64545;
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
                            <div class="row">
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Gratuitous Relief</h3>
                                            <p class="text-green">Unsolicited assistance: ex-gratia payment, goods, and aid to families hit by death, injury, or calamity, offering relief and support</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="gratuitous.htm" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Search &amp; Rescue Operations</h3>
                                            <p class="text-green">Swift action: search, rescue, evacuate affected; boats, gear hired for immediate relief, saving lives in emergencies</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Relief Measures</h3>
                                            <p class="text-green">Comprehensive aid: temporary shelter, food, medical care; relief camps, air-dropped supplies, water, and air force rescue</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="campdetails.htm" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Clearance of Affected Areas</h3>
                                            <p class="text-green">Area revival: clear debris, drain floods, remove bodies; restore public spaces after disaster</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Agriculture</h3>
                                            <p class="text-green">Agricultural aid: finances for land restoration, debris removal, fish farms, crop losses, sericulture, and more</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Animal Husbandry</h3>
                                            <p class="text-green">Farmers' support: assistance to small/marginal farmers. Aid for livestock loss, feed, medicine; cattle camps, and owners</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Fishery</h3>
                                            <p class="text-green">Fishery aid: boat repair, net replacement for fishermen; input subsidy for fish seed farms</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
                                <div class="col-lg-3 col-6">
                                    <!-- small box -->
                                    <div class="small-box light-green-bg">
                                        <div class="inner p-3">
                                            <h3 class="text-green">Handicrafts/Handloom</h3>
                                            <p class="text-green">Crafts support: assistance to artisans, aid for tools, materials; replace damaged equipment, lost goods</p>
                                        </div>
                                        <div class="icon">
                                        </div>
                                        <a href="#" class="small-box-footer">Go To Assistance <i class="fas fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>
                                <!-- ./col -->
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
