<%-- 
    Document   : auth_callexecutive_home
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
        <title>Home | DRMS</title>
        <%--<%@include file="auth_head_import.jsp" %>--%>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/fontawesome-free-6.4.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .text-align-right {
                text-align: right;
            }
            .form-check {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .inline-input {
                flex: 1;
                margin-left: 10px;
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
                            <h3 class="mt-4 mb-0">Daily Report</h3>
                            <!--                            <ol class="breadcrumb mb-4">
                                                            <li class="breadcrumb-item active">Dashboard</li>
                                                        </ol>-->

                            <!--Page Content Start-->
                            <div class="container-fluid bg-light mt-2 py-4 mb-4">
                                <div class="d-flex justify-content-between">
                                    <h6 class="mb-2">Name of state: Meghalaya</h6>
                                    <h6 class="mb-2">As on 01-08-2023</h6>
                                </div>
                                <table id="dailyReport" class="table table-bordered table-striped dataTable">
                                    <thead>
                                        <!--                                        <tr>
                                                                                    <th colspan="5" class="text-center">Meghalaya</th>
                                                                                </tr>-->
                                        <tr class="text-center">
                                            <th>Sl. No.</th>
                                            <th>Description</th>
                                            <th><b>During Last 24 hours</b></th>
                                        </tr>
                                    </thead>
                                    <tbody id="dailyReportBody">
                                        <tr class="">
                                            <td>1.</td>
                                            <td>No. of districts affected with name</td>
                                            <td>
                                                <b>East Khasi Hills:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit.<br>
                                                <b>West Garo Hills:</b> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
                                                <b>West Khasi Hills:</b> Id aliquet lectus proin nibh nisl condimentum id venenatis. Erat imperdiet sed euismod nisi. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Venenatis urna cursus eget nunc. Nunc sed augue lacus viverra vitae congue eu consequat ac.<br>
                                                <b>Eastern West Khasi Hills:</b> Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Nec ultrices dui sapien eget mi proin. Blandit cursus risus at ultrices. Ut sem nulla pharetra diam sit amet nisl suscipit adipiscing. Commodo elit at imperdiet dui accumsan sit. Fames ac turpis egestas integer eget aliquet. Dictum sit amet justo donec enim diam.<br>
                                            </td>
                                        </tr>
                                        <tr class="">
                                            <td>2.</td>
                                            <td>No. of villages affected</td>
                                            <td>12</td>
                                        </tr>
                                        <tr class="">
                                            <td>3.</td>
                                            <td>Population affected</td>
                                            <td>76922</td>
                                        </tr>
                                        <tr class="">
                                            <td>4.</td>
                                            <td>Human lives lost</td>
                                            <td>2</td>
                                        </tr>
                                        <tr class="">
                                            <td>5.</td>
                                            <td>No. of missing persons</td>
                                            <td>Nil</td>
                                        </tr>
                                        <tr class="">
                                            <td>6.</td>
                                            <td>No. of injured persons</td>
                                            <td>3</td>
                                        </tr>
                                        <tr class="">
                                            <td>7.</td>
                                            <td>Houses damaged</td>
                                            <td>
                                                3<br>
                                                Fully: 2<br>
                                                Partially: 1<br>
                                            </td>
                                        </tr>
                                        <tr class="">
                                            <td>8.</td>
                                            <td>Animal deaths</td>
                                            <td>13</td>
                                        </tr>
                                        <tr class="">
                                            <td>9.</td>
                                            <td>No. of persons evacuated</td>
                                            <td>Nil</td>
                                        </tr>
                                        <tr class="">
                                            <td>10.</td>
                                            <td>No. of relief camp opened</td>
                                            <td>Nil</td>
                                        </tr>
                                        <tr class="">
                                            <td>11.</td>
                                            <td>Inmates in the relief camps</td>
                                            <td>Nil</td>
                                        </tr>
                                        <tr class="">
                                            <td>12.</td>
                                            <td>Relief material distributed</td>
                                            <td>Nil</td>
                                        </tr>
                                        <tr class="">
                                            <td>13.</td>
                                            <td>Total crop area affected(in hectares)</td>
                                            <td>4.5 ha</td>
                                        </tr>
                                        <tr class="">
                                            <td>14.</td>
                                            <td>Infrastructure Damage</td>
                                            <td>Public Roads : 3</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--Page Content End-->
                        </div>
                    </main>
                <%@include file="auth_footer_content.jsp" %>
            </div>
        </div>

        <%@include file="auth_footer_import.jsp" %>
        <script src="jojo/js/moment.min.js" type="text/javascript"></script>
        <script src="jojo/DataTables/datatables.min.js" type="text/javascript"></script>
        <script>
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var csrfToken = $("meta[name='_csrf']").attr("content");
            $(document).ready(function () {
                $('#dailyReport').DataTable({
                    info: false,
                    "bFilter": false,
                    "bLengthChange": false,
                    "order": [],
                    lengthMenu: [
                        [15],
                        [15],
                    ],
                });
            });
            function toggleTextBox(type) {
            const inputField = document.getElementById(type + 'Input');
                    inputField.classList.toggle('d-none');
            }
            const dateInput = document.getElementById('dateInput');
                    const today = new Date().toISOString().split('T')[0];
                    dateInput.setAttribute('max', today);
        </script>
    </body>
</html>
