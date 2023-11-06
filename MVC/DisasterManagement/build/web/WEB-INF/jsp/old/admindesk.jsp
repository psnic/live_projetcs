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
        <title>Administrator Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>

        <style>

        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main class="main_content">

                        <div class="scrollcontainer">
                        <%@include file="banner.jsp" %>

                        <div class="container px-5">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title fw-bold text-center">Overall Report</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${mm}</h2>
                                                    Monthly Meeting &amp; Orientation Programs
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${qq}</h2>
                                                    Quarterly Meeting &amp; Orientation Programs
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${cc}</h2>
                                                    Call Count
                                                    <!--<canvas id="stranded_area_wise"></canvas>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="card mt-3">
                                                <div class="card-body">
                                                    <canvas id="all_years_call_count_bar"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card mt-4">
                                <div class="card-header">
                                    <h5 class="card-title fw-bold text-center">Current Year Report: Current Year - <span id="cySpan"></span></h5>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${cmm}</h2>
                                                    Monthly Meeting &amp; Orientation Programs
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${cqq}</h2>
                                                    Quarterly Meeting &amp; Orientation Programs
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h2>${ccc}</h2>
                                                    Call Count
                                                    <!--<canvas id="stranded_area_wise"></canvas>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="card mt-3">
                                                <div class="card-body">
                                                    <canvas id="current_year_call_count_bar"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!--<canvas id="stranded_area_wise"></canvas>-->
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
        <script src="suantonsing/ChartJs/Chart.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
//                var area = ["All", "New", "Test"];
//                var scount = [20, 15];
//                var bgcolor = ['#516b75', '#2a9d8f', '#D15353', '#a16dc4', '#595482', '#8E88B7', '#a37a74', '#61575b'];
//                var canvas = document.getElementById('stranded_area_wise');
//                var data = {
//                    labels: area,
//                    datasets: [
//                        {
//                            label: "Statictics",
//                            backgroundColor: bgcolor,
//                            borderWidth: 2,
//                            data: scount
//                        }
//                    ]
//                };
//                var myBarChart = new Chart(canvas, {
//                    data: data,
//                    type: 'bar',
////                    options: {
////                        plugins: {
////                            legend: {
////                                display: false
//////                                labels: {
//////                                    color: 'rgb(255, 99, 132)'
//////                                }
////                            }
////                        }
////                    }
//                });


                //get the list of years-count for calls and then display it in bar/pie
                $.confirm({
                    content: function () {
                        var self = this;
                        return $.ajax({
                            url: './getadmindashboarddata.htm',
                            method: 'GET'
                        }).done(function (response) {
                            var res = JSON.parse(response);
//                            console.log(res);
                            var allyears = res.allyears;
                            var years = allyears.years;
                            var counts = allyears.counts;

                            var curentyear = res.currentyear;
                            var cmonths = curentyear.months;
                            var ccounts = curentyear.ccount;

                            $("#cySpan").html(res.currentyear.year);

                            var cmonths = [
                                "January", "February", "March", "April", "May", "June",
                                "July", "August", "September", "October", "November", "December"
                            ];

                            var bgcolor = ['#516b75', '#2a9d8f', '#D15353', '#a16dc4', '#595482', '#8E88B7', '#a37a74', '#61575b'];
                            var canvas = document.getElementById('all_years_call_count_bar');
                            var current = document.getElementById('current_year_call_count_bar');

                            var data = {
                                labels: years,
                                datasets: [
                                    {
                                        label: "All Calls Count",
                                        backgroundColor: bgcolor,
                                        borderWidth: 0.5,
                                        barPercentage: 0.5,
                                        barThickness: 6,
                                        maxBarThickness: 8,
                                        minBarLength: 2,
                                        data: counts
                                    }
                                ]
                            };

                            var myBarChart = new Chart(canvas, {
                                data: data,
                                type: 'doughnut',
                                responsive: true,
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });


                            var data2 = {
                                labels: cmonths,
                                datasets: [
                                    {
                                        label: "Current Year Call Count",
                                        backgroundColor: bgcolor,
                                        borderWidth: 0.5,
                                        barPercentage: 0.5,
                                        barThickness: 6,
                                        maxBarThickness: 8,
                                        minBarLength: 2,
                                        data: ccounts
                                    }
                                ],
                                order: cmonths
                            };

                            var myBarChart2 = new Chart(current, {
                                data: data2,
                                type: 'bar',
                                responsive: true,
                                options: {
                                    indexAxis: 'y',
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });

                            self.close();
                        }).fail(function () {
                            self.setTitle('');
                            self.setContent('Something went wrong.');
                        });
                    }
                });

            });
        </script>
    </body>
</html>
