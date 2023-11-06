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
            .fake-btn {
                cursor: pointer;
            }
            .fake-btn:hover {
                background-color: #ccc; /* Change to the desired grey color */
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
                        <div class="card mt-4 mb-4">
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-3 mb-2">
                                        <label for="actionSelect"><b>Select which action to take</b></label>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-3 d-flex justify-content-center">
                                        <select class="form-select action-select" id="actionSelect" data-target-apv="apvBtn" data-target-ret="retBtn">
                                            <option selected disabled>--Select--</option>
                                            <c:forEach items="${actionlist}" var="v">
                                                <c:if test="${v.processflowid!=null}">
                                                    <option value="${v.processflowid}" ><c:out value="${v.description}"></c:out></option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-center">List Of Pending Proposals In Revenue Department</h5>
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
                                                <th>View S.O.P</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${pendinglist}" var="p">
                                                <tr class="fake-btn" onclick="loadBeneficiaries('<c:out escapeXml="true" value="${p[0]}" />', '<c:out escapeXml="true" value="${p[6]}" />')">
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <!--<td><c:out escapeXml="true" value="${p[5]}" /></td>-->
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[8]}" /></td>
                                                    <td class="">
                                                        <div class="button-container mb-1 p-1">
                                                            <button class="btn btn-primary btn-block" onclick="viewProposal(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[3]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />'
                                                                            )">&nbsp;View&nbsp;</button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="button-container mb-1 p-1">
                                                            <button class="btn btn-warning btn-block" onclick="viewReport(
                                                                            '<c:out escapeXml="true" value="${p[0]}" />',
                                                                            '<c:out escapeXml="true" value="${p[3]}" />',
                                                                            '<c:out escapeXml="true" value="${p[6]}" />'
                                                                            )">&nbsp;Sign Statement Of Proposal&nbsp;</button>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${(LOGIN.role_code.role_code == '5')}">
                                                                <div class="button-container mb-1 p-1">
                                                                    <button class="btn btn-success btn-block d-none apvBtn" id="apvBtn" onclick="approveProposal(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[7]}" />'
                                                                                    )">&nbsp;Approve For Placing in SEC&nbsp;</button>
                                                                </div>
                                                                <div class="button-container p-1">
                                                                    <button class="btn btn-danger btn-block d-none retBtn" id="retBtn" onclick="rejectProposal(
                                                                                    '<c:out escapeXml="true" value="${p[0]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[6]}" />',
                                                                                    '<c:out escapeXml="true" value="${p[7]}" />'
                                                                                    )">&nbsp;Return Proposal to DC.&nbsp;</button>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!--Page Content End-->
                    </div>

                    <!--Beneficiary Details Fullscreen Modal Start-->
                    <div class="modal fade" id="beneficiaryModal" tabindex="-1" aria-labelledby="beneficiaryModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="beneficiaryModalLabel">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="card mt-4 mb-4 p-2">
                                        <div class="container-fluid" id="modal-content">
                                            <div class="card-body">
                                                <!--Dynamic Area Start-->
                                                <!--Dynamic Area End-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer" id="modal-footer-content">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Beneficiary Details Fullscreen Modal End-->
                </main>

                <%@include file="auth_footer_content.jsp" %>

            </div>
        </div>
        <%@include file="auth_footer_import.jsp" %>
        <script src="jojo/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="jojo/js/common_scripts.js" type="text/javascript"></script>
        <script>
                                                                        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                        var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                        var reportid;
                                                                        $(document).ready(function () {
                                                                            var dataTableInitialized = false;
                                                                            var dataTableBenInitialized = false;
                                                                            var dataTableDocInitialized = false;

                                                                            $('#reportTable').DataTable();

                                                                            $('.action-select').on('change', function () {
                                                                                var selectedProcessFlowId = $(this).val();
                                                                                var apvBtn = $('.' + $(this).data('target-apv'));
                                                                                var retBtn = $('.' + $(this).data('target-ret'));

                                                                                // Hide all buttons first
                                                                                apvBtn.addClass('d-none');
                                                                                retBtn.addClass('d-none');

                                                                                if (selectedProcessFlowId === '6') {
                                                                                    apvBtn.removeClass('d-none');
                                                                                } else if (selectedProcessFlowId === '8') {
                                                                                    retBtn.removeClass('d-none');
                                                                                }
                                                                            });

                                                                            // Trigger the change event when the page loads to initially set the button visibility
                                                                            $('.action-select').trigger('change');

                                                                        });

                                                                        function forwardReport(firNo, reportid, proposalid) {
                                                                            var successFlag = false; // Flag to track success
                                                                            var selectedFir = $("#firSelect").val();
                                                                            console.log('firNo: ' + firNo + ' reportid: ' + reportid + ' proposalid: ' + proposalid)

                                                                            $.confirm({
                                                                                title: 'Forward Proposal',
                                                                                columnClass: 'medium', // Adjust the column width if needed
                                                                                content:
                                                                                        '<div class="custom-dialog">' +
                                                                                        '<h6>Are you sure you want to forward this statement of proposal with FIR No: <b>' + firNo + ' </b> to Commissioner Secretary?</h6>' +
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
                                                                                                        url: './forwardproposaltocommsec.htm',
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

                                                                        function viewReport(fir_no, dateofincidence, reportid) {
                                                                            var url = "statementofproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                            window.open(url, '_blank');
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
                                                                                        '<h6>Are you sure you want to return this proposal with FIR No: <b>' + firNo + ' </b> to DC?</h6>' +
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

                                                                        function viewProposal(fir_no, dateofincidence, reportid) {
//                                            console.log("reportid:: " + reportid);
                                                                            var url = "viewproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                            window.open(url, '_blank');
                                                                        }



        </script>
    </body>
</html>
