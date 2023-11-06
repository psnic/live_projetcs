<%-- 
    Document   : gratuitous
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
        <title>Sanction Report | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .custom-checkbox {
                width: 20px; /* Adjust the width as needed */
                height: 20px; /* Adjust the height as needed */
                margin: 0 auto; /* Center horizontally */
                display: block; /* Make the checkbox a block element to center it */
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
                            <h1 class="mt-4">Sanction Report</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                            <!--Page Content Start-->
                            <div class="mt-2 py-4 mb-4" id="agendaNoteContainer">
                            <%--<c:forEach var="calamityName" items="${organizedData.keySet()}">--%>
                                <%--<c:set var="rowData" value="${organizedData[calamityName][0]}" />--%>
                                <div id="tableContainer" class="mt-4 mb-2">
                                    <table id="sanctionTable" class="table table-bordered sanction-table">
                                        <thead>
                                            <tr>
                                                <th colspan="8" class="text-center text-decoration-underline text-uppercase">Sanction For Damages</th>
                                            </tr>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>District</th>
                                                <th>Dept. File No.</th>
                                                <th>DC's Letter Number &AMP; Date</th>
                                                <th>Calamity</th>
                                                <th>Purpose</th>
                                                <th>Amount Approved &AMP; Sanctioned</th>
                                                <th>Remarks</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach var="p" items="${reportlist}" varStatus="i">
                                                <tr>
                                                    <td>${i.count}</td>
                                                    <td><c:out escapeXml="true" value="${p[0]}"/></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}"/></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" />,<c:out escapeXml="true" value="${p[8]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td>Gratuitous Relief</td>
                                                    <td><c:out escapeXml="true" value="${p[5]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[6]}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            <%--</c:forEach>--%>
                            <div class="total-amount">
                                <h5>Total Amount: <span class="total-amount-value">${totalAmount}</span></h5>
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
            $(document).ready(function () {
                // Populate select options and fields on page load
                $("#assistanceSelect, #inputCalamity, #districtSelect").change(function () {
                    var assistanceHeadCode = $("#assistanceSelect").val();
                    var calamityId = $("#inputCalamity").val();
                    var districtCode = $("#districtSelect").val();

                    // Check if all three dropdowns have selected values
                    if (assistanceHeadCode && calamityId && districtCode) {
                        populateTable(assistanceHeadCode, calamityId, districtCode);
                    }
                });

                $(".sanction-table").DataTable({
                    info: false,
                    "bFilter": false,
                    "paging": false,
                    "bLengthChange": false,
                    dom: 'Bfrtip',
                    buttons: [
                        'pdfHtml5',
                        'excelHtml5'
                    ]
                });
            });
            function populateTable(assistanceHeadCode, calamityId, districtCode) {
                $.ajax({
                    url: './getdetailsforagendanote.htm',
                    method: 'GET',
                    data: {
                        assistanceHeadCode: assistanceHeadCode,
                        calamityId: calamityId,
                        districtCode: districtCode
                    },
//                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        $("#tableBody").empty();
                        for (var i = 0; i < data.length; i++) {
                            var newRow = '<tr >' +
                                    '<td>' + (i + 1) + '</td>' +
                                    '<td>' + data[i][6] + '</td>' +
                                    '<td>' + data[i][1] + '</td>' +
                                    '<td>' + data[i][2] + '</td>' +
                                    '<td>' + data[i][7] + '</td>' +
                                    '<td>' + data[i][3] + '</td>' +
                                    '<td>' + data[i][4] + '</td>' +
                                    '<td>' +
//                                    '<div class="button-container">' +
//                                    '<button class="btn btn-primary btn-block mb-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Prepare Agenda Note</button>' +
//                                    '</div>' +
                                    '<input type="checkbox" class="bulk-approval-checkbox custom-checkbox" data-calamity="' + data[i][1] + '" data-reportid="' + data[i][5] + '" data-proposalid="' + data[i][6] + '" />' +
                                    '</td>' +
                                    '</tr>';
                            $("#tableBody").append(newRow);
                        }
                        $('#reportTable').DataTable();
                        $("#agendaNoteContainer").removeClass("d-none");
                    },
                    error: function (error) {
                        console.error("Error fetching data: ", error);
                    }
                });
            }

        </script>
    </body>
</html>
