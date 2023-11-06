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
        <title>Sanction Movement| DRMS</title>
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
                            <h1 class="mt-4 mb-4">Sanction Movement</h1>
                            <!--Page Content Start-->
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <!--                            <div class="card-header">
                                                            <h5 class="text-center">List Of Pending Proposals With Commissioner Secretary</h5>
                                                        </div>-->
                            <div class="card-body">
                                <div id="tableContainer" class="mt-4">
                                    <table id="reportTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>File Number</th>
                                                <th>Proposal Number</th>
                                                <th>Calamity</th>
                                                <th>Date of Incidence</th>
                                                <th>District</th>
                                                <th>Assistance</th>
                                                <th>Amount Proposed</th>
                                                <th>Remarks</th>
                                                <th>Check</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${sanctionlist}" var="p">
                                                <tr>
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[5]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[6]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[9]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[10]}" /></td>
                                                    <td>
                                                        <input type="checkbox" class="bulk-approval-checkbox custom-checkbox" data-proposalid="${p[1]}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between mt-2 mb-2">
                                    <button id="reject-button" class="btn btn-danger btn-block">Rejected By SEC</button>
                                    <button id="approve-button" class="btn btn-success btn-block">Approved By SEC</button>
                                </div>
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

                $("#approve-button").click(function () {
                    var selectedRows = [];
                    // Iterate through all the checkboxes and collect selected rows
                    $(".bulk-approval-checkbox:checked").each(function () {
                        var proposalid = $(this).data("proposalid");
                        selectedRows.push({
                            proposalid: proposalid
                        });
                    });

                    if (selectedRows.length === 0) {
                        alert('Select at least one proposal for approval.');
                        return;
                    }
                    approveProposals(selectedRows);
                });
                
                $("#reject-button").click(function () {
                    var selectedRows = [];
                    // Iterate through all the checkboxes and collect selected rows
                    $(".bulk-approval-checkbox:checked").each(function () {
                        var proposalid = $(this).data("proposalid");

                        selectedRows.push({
                            proposalid: proposalid
                        });
                    });
                    if (selectedRows.length === 0) {
                        alert('Select at least one proposal for rejection.');
                        return;
                    }
                    rejectProposals(selectedRows);
                });
            });

            function approveProposals(selectedRows) {
                var successFlag = false; // Flag to track success
                var selectedProposals = selectedRows.map(function (row) {
                    return row.proposalid;
                }).join(', '); // Join the selected proposal id with a comma

                $.confirm({
                    title: 'Approved Proposal By SEC',
                    columnClass: 'medium',
                    content:
                            '<div class="custom-dialog">' +
                            '<h6>Are you sure you want to approve the selected proposals?<br>' +
                            'Selected Proposals: <b>' + selectedProposals + '</b></h6>' +
                            '<div class="form-group mb-2">' +
                            '<label for="remarks" class="mt-3"><b>Remarks:</b></label>' +
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
                                        proposalid: row.proposalid,
                                        remarks: remarks
                                    };
                                });
                                console.log("Here3: "+JSON.stringify(selectedRowsWithRemarks));
                                $.confirm({
                                    content: function () {
                                        var self = this;
                                        return $.ajax({
                                            url: './approveproposalsbysec.htm', 
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
                                                self.setContent('Proposals successfully approved.');
                                                successFlag = true; // Set success flag
                                            } else {
                                                self.setTitle('Failed!');
                                                self.setContent('Failed to approve proposals.');
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
                            $.alert('Proposals Not Approved');
                        }
                    }
                });
            }
            
            function rejectProposals(selectedRows) {
                var successFlag = false; // Flag to track success
                var selectedProposals = selectedRows.map(function (row) {
                    return row.proposalid;
                }).join(', '); // Join the selected proposal ids numbers with a comma

                $.confirm({
                    title: 'Rejected Proposal By SEC',
                    columnClass: 'medium', 
                    content:
                            '<div class="custom-dialog">' +
                            '<h6>Are you sure you want to reject the selected proposals?<br>' +
                            'Selected Proposals: <b>' + selectedProposals + '</b></h6>' +
                            '<div class="form-group mb-2">' +
                            '<label for="remarks" class="mt-3"><b>Remarks:</b></label>' +
                            '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                            '</div>' +
                            '</div>',
                    buttons: {
                        forwardRep: {
                            text: 'Reject',
                            btnClass: 'btn-danger',
                            action: function () {

                                var remarks = $('#remarks').val();

                                // Create an array of selected rows with remarks
                                var selectedRowsWithRemarks = selectedRows.map(function (row) {
                                    return {
                                        proposalid: row.proposalid,
                                        remarks: remarks
                                    };
                                });
                                $.confirm({
                                    content: function () {
                                        var self = this;
                                        return $.ajax({
                                            url: './rejectproposalsbysec.htm', 
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
                                                self.setContent('Proposals successfully approved.');
                                                successFlag = true; // Set success flag
                                            } else {
                                                self.setTitle('Failed!');
                                                self.setContent('Failed to approve proposals.');
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
                            $.alert('Proposals Not Rejected');
                        }
                    }
                });
            }

            function viewReport(fir_no, dateofincidence, reportid) {
                var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                window.open(url, '_blank');
            }
        </script>
    </body>
</html>
