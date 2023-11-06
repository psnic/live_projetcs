<%-- 
    Document   : generate_report
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
        <title>Returned Proposals | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style type="text/css">
            body{
                background:#FAFAFB;
                margin-top: 20px;
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
                            <h1 class="mt-4 mb-4">Pending Proposals</h1>
                            <!--Page Content Start-->
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-center">Proposals Returned From DC</h5>
                            </div>
                            <div class="card-body">
                                
                                <div id="tableContainer" class="mt-4">
                                    <table id="reportTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>Fir Number</th>
                                                <th>Calamity Type</th>
                                                <th>Assistance</th>
                                                <th>Date of Incidence</th>
                                                <!--<th>Block</th>-->
                                                <th>District</th>
                                                <th>Remarks</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${pendinglist}" var="p">
                                                <tr>
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <!--<td><c:out escapeXml="true" value="${p[5]}" /></td>-->
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[7]}" /></td>
                                                    <td class="">
                                                        <div class="button-container mb-1 p-1">
                                                            <button class="btn btn-warning btn-block" onclick="viewReport(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[3]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />'
                                                                            )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${(LOGIN.role_code.role_code == '4')}">
                                                                <div class="button-container mb-1 p-1">
                                                                    <button class="btn btn-success btn-block" onclick="forwardReport(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />'
                                                                                    )">&nbsp;Forward To DC&nbsp;</button>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--<input type="submit" id="forwardButton" class="btn btn-success float-end mt-4" value="Forward Proposal to Revenue Dept" onclick="forwardReport()"/>-->
                                </div>
                            </div>
                        </div>

                        <!--Page Content End-->
                        <!-- Add this HTML structure to your page -->

                        <!-- Fullscreen Modal -->
                        <div class="modal fade" id="beneficiaryDetails" tabindex="-1" role="dialog" aria-labelledby="beneficiaryDetailsLabel" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="beneficiaryDetailsLabel"></h5>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <!--<div class="card-body">-->
                                            <!-- Table to display beneficiary details -->
                                            <!--                                            <div class="row">
                                                                                            
                                                                                        </div>-->
                                            <table class="table table-bordered" id="beneficiaryTable">
                                                <thead>
                                                    <tr>
                                                        <th colspan="6" class="text-center"><h5>List Of Gratuitous Beneficiaries</h5></th>
                                                    </tr>
                                                    <tr>
                                                        <th>Sl No.</th>
                                                        <th>Beneficiary Name</th>
                                                        <th>Village</th>
                                                        <th>Amount</th>
                                                        <th>Assistance</th>
                                                        <th>Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="beneficiaryTableBody">
                                                    <!-- Data will be populated here using JavaScript -->
                                                </tbody>
                                            </table>
                                            <table class="table table-bordered mt-4" id="beneficiaryDocsTable">
                                                <thead>
                                                    <tr>
                                                        <th colspan="3" class="text-center"><h5>List Of Documents Attached With The Report</h5></th>
                                                    </tr>
                                                    <tr>
                                                        <th>Serial No.</th>
                                                        <th>Document Name</th>
                                                        <th>View Document</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="beneficiaryDocsTableBody">
                                                    <!-- Data will be populated here using JavaScript -->
                                                </tbody>
                                            </table>
                                        </div>
                                        <!--</div>-->
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                                                        var reportid;
                                                                        $(document).ready(function () {
                                                                            var dataTableInitialized = false;
                                                                            var dataTableBenInitialized = false;
                                                                            var dataTableDocInitialized = false;
                                                                            $('#reportTable').DataTable();

//                                                                $("#assistanceSelect").change(function () {
//                                                                    var selectedValue = $(this).val();
//                                                                    console.log(selectedValue);
//                                                                    if (selectedValue) {
//                                                                        $.ajax({
//                                                                            url: "./getfirdetailsbyassistancehead.htm",
//                                                                            data: {assistanceHeadCode: selectedValue},
//                                                                            method: "GET",
////                            dataType: "json",
//                                                                            success: function (data) {
//                                                                                console.log(data);
//                                                                                var tableBody = $("#tableBody");
//                                                                                tableBody.empty();
//                                                                                $.each(data, function (index, item) {
//                                                                                    var newRow = '<tr>' +
//                                                                                            '<td>' + (index + 1) + '</td>' +
//                                                                                            '<td>' + item[0] + '</td>' + // Fir Number
//                                                                                            '<td>' + item[1] + '</td>' + // Calamity Type
//                                                                                            '<td>' + item[3] + '</td>' + // Date of Incidence
//                                                                                            '<td>' + item[5] + '</td>' + // Block
//                                                                                            '<td>' + item[4] + '</td>' + // District
//                                                                                            '<td>' +
//                                                                                            '<div class="button-container">' +
//                                                                                            '<button class="btn btn-warning btn-block mb-2" onclick="viewReport(&quot;' + item[0] + '&quot;,&quot;' + item[3] + '&quot;,&quot;' + item[6] + '&quot;)">Statement of Proposal</button>' +
//                                                                                            '</div>' +
//                                                                                            '<div class="button-container">' +
//                                                                                            '<button class="btn btn-secondary btn-success btn-block" onclick="forwardReport(&quot;' + item[0] + '&quot;,&quot;' + item[6] + '&quot;)">Forward To Revenue</button>' +
//                                                                                            '</div>' +
//                                                                                            '</td>' +
//                                                                                            '</tr>';
//                                                                                    tableBody.append(newRow);
//                                                                                });
//                                                                                if (!dataTableInitialized) {
//                                                                                    $('#reportTable').DataTable();
//                                                                                    dataTableInitialized = true;
//                                                                                }
//                                                                                $("#tableContainer").removeClass("d-none");
//                                                                            },
//                                                                            error: function (error) {
//                                                                                console.error("Error fetching data: ", error);
//                                                                            }
//                                                                        });
//                                                                    }
//                                                                });

//                $("#firSelect").on("change", function () {
//                    var selectedFir = $(this).val();
//                    if (selectedFir !== "") {
//                        $.ajax({
//                            url: "./getfirdetails.htm",
//                            method: "GET",
//                            data: {firNo: selectedFir},
//                            success: function (data) {
//                                console.log(data);
//                                $("#tableBody").empty();
//                                if (data.length > 0) {
//                                    var newRow = '<tr>' +
//                                            '<td>' + data[0].firNo + '</td>' +
//                                            '<td>' + data[0].calamityType + '</td>' +
//                                            '<td>' + data[0].dateOfIncidence + '</td>' +
//                                            '<td>' + data[0].blockName + '</td>' +
//                                            '<td>' +
//                                            '<div class="button-container">' +
//                                            '<button class="btn btn-secondary btn-block mb-2 view-beneficiary-details">View Beneficiary Details</button>' +
//                                            '</div>' +
//                                            '<div class="button-container">' +
//                                            '<button class="btn btn-secondary btn-block" onclick="viewReport(&quot;' + data[0].firNo + '&quot;,&quot;' + data[0].dateOfIncidence + '&quot;)">View Statement of Proposal</button>' +
//                                            '</div>' +
//                                            '</td>' +
//                                            '</tr>';
//                                    reportid = data[0].reportid;
//                                    $("#tableBody").append(newRow);
//                                }
//                                // Initialize DataTable only if not already initialized
//                                if (!dataTableInitialized) {
//                                    $('#reportTable').DataTable({
//                                        paging: false, // Hide pagination
//                                        searching: false, // Hide search
//                                        info: false // Hide "Showing x of y entries"
//                                    });
//                                    dataTableInitialized = true;
//                                }
//
//                                $("#tableContainer").removeClass("d-none");
//                            },
//                            error: function (xhr, textStatus, errorThrown) {
//                                console.error("Error fetching table data:", errorThrown);
//                            }
//                        });
//                    } else {
//                        $("#tableContainer").addClass("d-none");
//                    }
//                });

//                $("#tableBody").on("click", ".view-beneficiary-details", function () {
//                    var selectedFir = $('#firSelect').val();
//                    populateBeneficiaryTable(selectedFir);
////                                                populateDocumentTable(reportid);
////                                                console.log('reportid: '+reportid);
////                                                var reportid = $('#inputReportid').val();
//                    $("#beneficiaryDetails").modal("show");
//                    $("#beneficiaryDetailsLabel").html("Beneficiary Details of Fir No: " + selectedFir);
//                });

//                function populateBeneficiaryTable(selectedFir) {
//                    var rid = "";
//                    $.ajax({
//                        url: "./getExgratiaFormsByFirWithReport.htm",
//                        method: "GET",
//                        data: {firNo: selectedFir},
//                        success: function (data) {
//                            console.log(data);
//                            $("#beneficiaryTableBody").empty();
//                            for (var i = 0; i < data.length; i++) {
//                                var newRow = '<tr>' +
//                                        '<td>' + (i + 1) + '</td>' +
//                                        '<td>' + data[i].beneficiaryName + '</td>' +
//                                        '<td>' + data[i].village + '</td>' +
//                                        '<td>' + data[i].amount + '</td>' +
//                                        '<td>' + data[i].assistance + '</td>' +
//                                        '<td>' + data[i].remarks + '</td>' +
//                                        '</tr>';
//                                $("#beneficiaryTableBody").append(newRow);
////                                                            $("#inputReportid").val(data[i].reportid);
//                                rid = data[i].reportid;
//
//                            }
//                            // Initialize DataTable only if not already initialized
//                            if (!dataTableBenInitialized) {
//                                $('#beneficiaryTable').DataTable();
//                                dataTableBenInitialized = true;
//                            }
//                            if (rid.length > 0) {
//                                populateDocumentTable(rid);
//                            } else {
//                                alert('No RID');
//                            }
//                        },
//                        error: function (xhr, textStatus, errorThrown) {
//                            console.error("Error fetching table data:", errorThrown);
//                        }
//                    });
//                }
//
//                function populateDocumentTable(reportid) {
//                    console.log('reportid: ' + reportid);
//                    $.ajax({
//                        url: "./getdocumentsfromreportid.htm",
//                        method: "GET",
//                        data: {reportid: reportid},
//                        success: function (data) {
//                            console.log(data);
//                            $("#beneficiaryDocsTableBody").empty();
//                            for (var i = 0; i < data.length; i++) {
//                                var documentUrl = "data:" + data[i].filetype + ";base64," + arrayBufferToBase64(data[i].filestored);
//                                var newRow = '<tr>' +
//                                        '<td>' + (i + 1) + '</td>' +
//                                        '<td>' + data[i].documentName + '</td>' +
//                                        '<td><button class="btn btn-primary view-document" data-url="' + documentUrl + '">View Document</button></td>' +
//                                        '</tr>';
//                                $("#beneficiaryDocsTableBody").append(newRow);
//                            }
//                            // Initialize DataTable only if not already initialized
//                            if (!dataTableDocInitialized) {
//                                $('#beneficiaryDocsTable').DataTable({
//                                    paging: false, // Hide pagination
//                                    searching: false, // Hide search
//                                    info: false // Hide "Showing x of y entries"
//                                });
//                                dataTableDocInitialized = true;
//                            }
//                        },
//                        error: function (xhr, textStatus, errorThrown) {
//                            console.error("Error fetching document data:", errorThrown);
//                        }
//                    });
//                }
//
//                function arrayBufferToBase64(buffer) {
//                    var binary = '';
//                    var bytes = new Uint8Array(buffer);
//                    var len = bytes.byteLength;
//                    for (var i = 0; i < len; i++) {
//                        binary += String.fromCharCode(bytes[i]);
//                    }
//                    return btoa(binary);
//                }
//
//// Event listener for view document buttons
//                $("#beneficiaryDocsTable").on("click", ".view-document", function () {
//                    var documentUrl = $(this).data("url");
//                    window.open(documentUrl, "_blank"); // Open document in a new tab
//                });

                                                                        });

//                                        function viewReport(fir_no, dateofincidence) {
//                                            $.confirm({
//                                                content: function () {
//                                                    var self = this;
//                                                    return $.ajax({
//                                                        type: "GET",
//                                                        url: "./statementofproposal.htm",
//                                                        data: {fir_no: fir_no, dateofincidence: dateofincidence}
//                                                    }).done(function (data) {
//                                                        var res = JSON.parse(data);
//                                                        self.close();
//                                                    }).fail(function () {
//                                                        self.setContent('Something went wrong.');
//                                                    });
//                                                }
//                                            });
//                                        }

                                                                        function forwardReport(firNo, reportid) {
                                                                            var successFlag = false; // Flag to track success
                                                                            var selectedFir = $("#firSelect").val();
                                                                            console.log('firNo: ' + firNo + ' reportid: ' + reportid)
                                                                            $.confirm({
                                                                                title: 'Forward Proposal',
                                                                                columnClass: 'medium', // Adjust the column width if needed
                                                                                content:
                                                                                        '<div class="custom-dialog">' +
                                                                                        '<h6>Are you sure you want to forward this statement of proposal with FIR No: <b>' + firNo + ' </b> to DC?</h6>' +
                                                                                        '<div class="form-group mb-2">' +
                                                                                        '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
                                                                                        '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                                                                                        '</div>' +
                                                                                        '</div>',
                                                                                buttons: {
                                                                                    forwardRep: {
                                                                                        text: 'Forward',
                                                                                        btnClass: 'btn-success',
                                                                                        action: function () {
                                                                                            $.confirm({
                                                                                                content: function () {
                                                                                                    var self = this;
                                                                                                    var remarks = $('#remarks').val();
                                                                                                    return $.ajax({
                                                                                                        url: './forwardproposaltodc.htm',
                                                                                                        data: 'firNo=' + firNo + '&reportid=' + reportid + '&remarks=' + remarks,
                                                                                                        method: 'POST',
                                                                                                        beforeSend: function (xhr) {
                                                                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                        }
                                                                                                    }).done(function (response) {
                                                                                                        console.log(response);
                                                                                                        self.setTitle(response.name);
                                                                                                        if (response === '-1') {
                                                                                                            self.setTitle('Failed!');
                                                                                                            self.setContent('Failed to forward Proposal.');
                                                                                                        } else {
                                                                                                            self.setTitle('Success!');
                                                                                                            self.setContent('Proposal successfully forwarded.');
                                                                                                            successFlag = true; // Set success flag
                                                                                                        }
                                                                                                    }).fail(function () {
                                                                                                        self.setContent('Something went wrong.');
                                                                                                    });
                                                                                                },
                                                                                                buttons: {
                                                                                                    close: function () {
                                                                                                        if (!successFlag) {
                                                                                                            $.alert('Something went wrong');
                                                                                                        } else {
                                                                                                            window.location.reload();
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                    },
                                                                                    cancel: function () {
                                                                                        $.alert('Proposal Not Forwarded');
                                                                                    }
                                                                                }
                                                                            });
                                                                        }

                                                                        function viewReport(fir_no, dateofincidence, reportid) {
//                                            console.log("reportid:: " + reportid);
                                                                            var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                            window.open(url, '_blank');
                                                                        }

                                                                        function returnProposal(firNo, reportid) {
                                                                            var successFlag = false; // Flag to track success
                                                                            var selectedFir = $("#firSelect").val();
                                                                            console.log('firNo: ' + firNo + ' reportid: ' + reportid)

                                                                            $.confirm({
                                                                                title: 'Return Proposal',
                                                                                columnClass: 'medium', // Adjust the column width if needed
                                                                                content:
                                                                                        '<div class="custom-dialog">' +
                                                                                        '<h6>Are you sure you want to return this proposal with FIR No: <b>' + firNo + ' </b> to BDO?</h6>' +
                                                                                        '<div class="form-group mb-2">' +
                                                                                        '<label for="remarks" class="mt-3"><b>Remarks:</b></label>' +
                                                                                        '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                                                                                        '</div>' +
                                                                                        '</div>',
//                                                                        autoClose: 'cancel|10000',
                                                                                buttons: {
                                                                                    forwardRep: {
                                                                                        text: 'Return',
                                                                                        btnClass: 'btn-danger',
                                                                                        action: function () {
                                                                                            $.confirm({
                                                                                                content: function () {
                                                                                                    var self = this;
                                                                                                    var remarks = $('#remarks').val();
                                                                                                    return $.ajax({
                                                                                                        url: './returnproposaltobdo.htm',
                                                                                                        data: 'firNo=' + firNo + '&reportid=' + reportid + '&remarks=' + remarks,
                                                                                                        method: 'POST',
                                                                                                        beforeSend: function (xhr) {
                                                                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                        }
                                                                                                    }).done(function (response) {
                                                                                                        console.log(response);
                                                                                                        self.setTitle(response.name);
                                                                                                        if (response === '-1') {
                                                                                                            self.setTitle('Failed!');
                                                                                                            self.setContent('Failed to reject Proposal.');
                                                                                                        } else {
                                                                                                            self.setTitle('Success!');
                                                                                                            self.setContent('Proposal successfully returned to BDO.');
                                                                                                            successFlag = true; // Set success flag
                                                                                                        }
                                                                                                    }).fail(function () {
                                                                                                        self.setContent('Something went wrong.');
                                                                                                    });
                                                                                                },
                                                                                                buttons: {
                                                                                                    close: function () {
                                                                                                        if (!successFlag) {
                                                                                                            $.alert('Something went wrong');
                                                                                                        } else {
                                                                                                            window.location.reload();
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                    },
                                                                                    cancel: function () {
                                                                                        $.alert('Proposal Not Forwarded');
                                                                                    }
                                                                                }
                                                                            });
                                                                        }



        </script>
    </body>
</html>
