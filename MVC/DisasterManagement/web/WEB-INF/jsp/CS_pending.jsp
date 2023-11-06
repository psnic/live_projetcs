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
        <title>Home | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style type="text/css">
            body{
                background:#FAFAFB;
                margin-top: 20px;
            }
            /* Custom styles for the checkbox */
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
                            <h1 class="mt-4 mb-4">Pending Proposals</h1>
                            <!--Page Content Start-->
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-center">List Of Pending Proposals With Commissioner Secretary</h5>
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
                                                <th>Select For Bulk Approval</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${pendinglist}" var="p">
                                                <tr class="fake-btn">
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <!--<td><c:out escapeXml="true" value="${p[5]}" /></td>-->
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                    <td>
                                                        <div class="button-container mb-1">
                                                            <button class="btn btn-warning btn-sm btn-block" onclick="viewReport(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[3]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />'
                                                                            )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                        </div>
                                                        <div class="button-container mb-1">
                                                            <button class="btn btn-success btn-sm btn-block" onclick="approveProposal(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />',
                                                                            '<c:out escapeXml="true" value="${p[7]}" />'
                                                                            )">&nbsp;Approve For Placing in SEC&nbsp;</button>
                                                        </div>
                                                        <div class="button-container">
                                                            <button class="btn btn-danger btn-block" onclick="rejectProposal(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />',
                                                                            '<c:out escapeXml="true" value="${p[7]}" />'
                                                                            )">&nbsp;Return to Revenue Dept.&nbsp;</button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" class="bulk-approval-checkbox custom-checkbox" data-fir="${p[0]}" data-reportid="${p[6]}" data-proposalid="${p[7]}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <button id="bulk-approve-button" class="btn btn-success btn-block">Bulk Approve</button>
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
                                                                var reportid;
                                                                $(document).ready(function () {
                                                                    var dataTableInitialized = false;
                                                                    var dataTableBenInitialized = false;
                                                                    var dataTableDocInitialized = false;
                                                                    $('#reportTable').DataTable();

                                                                    $("#bulk-approve-button").click(function () {
                                                                        var selectedRows = [];

                                                                        // Iterate through all the checkboxes and collect selected rows
                                                                        $(".bulk-approval-checkbox:checked").each(function () {
                                                                            var firNo = $(this).data("fir");
                                                                            var reportid = $(this).data("reportid");
                                                                            var proposalid = $(this).data("proposalid");

                                                                            selectedRows.push({
                                                                                firNo: firNo,
                                                                                reportid: reportid,
                                                                                proposalid: proposalid
                                                                            });
                                                                        });

                                                                        if (selectedRows.length === 0) {
                                                                            alert('Select at least one proposal for bulk approval.');
                                                                            return;
                                                                        }

                                                                        // Perform the bulk approval action
                                                                        bulkApproveProposals(selectedRows);
                                                                    });
                                                                });

                                                                function approveProposal(firNo, reportid, proposalid) {
                                                                    var successFlag = false; // Flag to track success
                                                                    var selectedFir = $("#firSelect").val();
                                                                    console.log('firNo: ' + firNo + ' reportid: ' + reportid + ' proposalid: ' + proposalid)

                                                                    $.confirm({
                                                                        title: 'Approve Proposal',
                                                                        columnClass: 'medium', // Adjust the column width if needed
                                                                        content:
                                                                                '<div class="custom-dialog">' +
                                                                                '<h6>Are you sure you want to approve this proposal for placing in SEC with FIR No: <b>' + firNo + ' </b> ?</h6>' +
                                                                                '<div class="form-group mb-2">' +
                                                                                '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
                                                                                '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                                                                                '</div>' +
                                                                                '</div>',
                                                                        buttons: {
                                                                            forwardRep: {
                                                                                text: 'Approve',
                                                                                btnClass: 'btn-success',
                                                                                action: function () {
                                                                                    $.confirm({
                                                                                        content: function () {
                                                                                            var self = this;
                                                                                            var remarks = $('#remarks').val();
                                                                                            return $.ajax({
                                                                                                url: './approveproposal.htm',
                                                                                                data: 'firNo=' + firNo + '&reportid=' + reportid + '&proposalid=' + proposalid + '&remarks=' + remarks,
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
                                                                
                                                                function rejectProposal(firNo, reportid, proposalid) {
                                                                    var successFlag = false; // Flag to track success
                                                                    var selectedFir = $("#firSelect").val();
                                                                    console.log('firNo: ' + firNo + ' reportid: ' + reportid + ' proposalid: ' + proposalid)

                                                                    $.confirm({
                                                                        title: 'Return Proposal',
                                                                        columnClass: 'medium', // Adjust the column width if needed
                                                                        content:
                                                                                '<div class="custom-dialog">' +
                                                                                '<h6>Are you sure you want to return this proposal with FIR No: <b>' + firNo + ' </b> ?</h6>' +
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
                                                                                                url: './rejectproposal.htm',
                                                                                                data: 'firNo=' + firNo + '&reportid=' + reportid + '&proposalid=' + proposalid + '&remarks=' + remarks,
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
                                                                                                    self.setContent('Proposal successfully rejected.');
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

                                                                function bulkApproveProposals(selectedRows) {
                                                                    var successFlag = false; // Flag to track success
                                                                    var selectedFirNumbers = selectedRows.map(function (row) {
                                                                        return row.firNo;
                                                                    }).join(', '); // Join the selected FIR numbers with a comma

                                                                    $.confirm({
                                                                        title: 'Approve Proposal',
                                                                        columnClass: 'medium', // Adjust the column width if needed
                                                                        content:
                                                                                '<div class="custom-dialog">' +
                                                                                '<h6>Are you sure you want to approve the selected proposals for placing in SEC?<br>' +
                                                                                'Selected FIR Numbers: <b>' + selectedFirNumbers + '</b></h6>' +
                                                                                '<div class="form-group mb-2">' +
                                                                                '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
                                                                                '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                                                                                '</div>' +
                                                                                '</div>',
                                                                        buttons: {
                                                                            forwardRep: {
                                                                                text: 'Approve',
                                                                                btnClass: 'btn-success',
                                                                                action: function () {
                                                                                    
                                                                                    var remarks = $('#remarks').val();

                                                                                    // Create an array of selected rows with remarks
                                                                                    var selectedRowsWithRemarks = selectedRows.map(function (row) {
                                                                                        return {
                                                                                            firNo: row.firNo,
                                                                                            reportid: row.reportid,
                                                                                            proposalid: row.proposalid,
                                                                                            remarks: remarks
                                                                                        };
                                                                                    });
                                                                                    $.confirm({
                                                                                        content: function () {
                                                                                            var self = this;
                                                                                            return $.ajax({
                                                                                                url: './bulkapproveproposals.htm', // Update with your server endpoint
                                                                                                method: 'POST',
                                                                                                contentType: 'application/json',
                                                                                                data: JSON.stringify(selectedRowsWithRemarks),
                                                                                                beforeSend: function (xhr) {
                                                                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                }
                                                                                            }).done(function (response) {
                                                                                                console.log(response);
                                                                                                self.setTitle(response.name);
                                                                                                if (response === '1') {
                                                                                                    self.setTitle('Success!');
                                                                                                    self.setContent('Proposals successfully forwarded.');
                                                                                                    successFlag = true; // Set success flag
                                                                                                } else {
                                                                                                    self.setTitle('Failed!');
                                                                                                    self.setContent('Failed to forward proposals.');
                                                                                                }
                                                                                            }).fail(function () {
                                                                                                self.setTitle('Error!');
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
                                                                                $.alert('Proposals Not Forwarded');
                                                                            }
                                                                        }
                                                                    });
                                                                }



//                                                                function bulkApproveProposals(selectedRows) {
//                                                                    // Make an AJAX request to your server to perform bulk approval
//                                                                    $.ajax({
//                                                                        url: './bulkapproveproposals.htm', // Update with your server endpoint
//                                                                        method: 'POST',
//                                                                        contentType: 'application/json',
//                                                                        data: JSON.stringify(selectedRows),
//                                                                        beforeSend: function (xhr) {
//                                                                            // Set CSRF headers if needed
//                                                                        },
//                                                                        success: function (response) {
//                                                                            console.log(response);
//                                                                            alert('Bulk approval completed successfully.');
//                                                                            window.location.reload(); // Reload the page or update the UI as needed
//                                                                        },
//                                                                        error: function () {
//                                                                            alert('Error occurred during bulk approval.');
//                                                                        }
//                                                                    });
//                                                                }

                                                                function viewReport(fir_no, dateofincidence, reportid) {
                                                                    var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                    window.open(url, '_blank');
                                                                }



        </script>
    </body>
</html>
