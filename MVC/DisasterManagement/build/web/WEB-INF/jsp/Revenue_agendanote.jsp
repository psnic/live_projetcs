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
        <title>Agenda Note | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .upload__box {
                /*padding: 40px;*/
            }
            .upload__inputfile {
                width: 0.1px;
                height: 0.1px;
                opacity: 0;
                overflow: hidden;
                position: absolute;
                z-index: -1;
            }
            .upload__btn-box {
                margin-bottom: 10px;
            }
            .upload__img-wrap {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -10px;
            }
            .upload__img-box {
                width: 200px;
                padding: 0 10px;
                margin-bottom: 12px;
            }
            .upload__img-close {
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background-color: rgba(0, 0, 0, 0.5);
                position: absolute;
                top: 10px;
                right: 10px;
                text-align: center;
                line-height: 24px;
                z-index: 1;
                cursor: pointer;
            }
            .upload__img-close:after {
                content: "✖";
                font-size: 14px;
                color: white;
            }

            .img-bg {
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                position: relative;
                padding-bottom: 100%;
            }
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
                        <%--<form:form id="agendaform" modelAttribute="agendanote" method="POST" role="form" enctype="multipart/form-data" autocomplete="off">--%>
                        <h1 class="mt-4">Agenda Note</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <!--Page Content Start-->
                        <div class="row">
                            <div class="col-md-3 mb-2">
                                <label for="assistanceSelect"><b>Select Assistance</b></label>
                            </div>
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                            <div class="col-md-3 mb-2">
                                <label for="inputCalamity"><b>Select Calamity</b></label>
                            </div>
                            <div class="col-md-3 mb-2">
                                <label for="districtSelect"><b>Select District</b></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-select" id="assistanceSelect">
                                    <option selected disabled>--Select--</option>
                                    <c:forEach items="${astlist}" var="a">
                                        <c:if test="${a.assistance_head_code!=null}">
                                            <option value="${a.assistance_head_code}" ><c:out value="${a.description}"></c:out></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-control"  name="calamity_id" id="inputCalamity" required="true">                                    
                                    <option value="" disabled="true" selected="true">--Select--</option>
                                    <c:forEach items="${calamitylist}" var="c">
                                        <c:if test="${c.calamity_id!=null}">
                                            <option value="${c.calamity_id}" ><c:out value="${c.calamity_name}"></c:out></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-select" id="districtSelect">
                                    <option selected disabled>--Select--</option>
                                    <c:forEach items="${districtlist}" var="c">
                                        <c:if test="${c.districtcodelgd!=null}">
                                            <option value="${c.districtcodelgd}" ><c:out value="${c.districtname}"></c:out></option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="mt-2 py-4 mb-4" id="agendaNoteContainer">
                            <div class="card card-section">
                                <!--                                <div class="card-header">
                                                                    <h5 class="text-capitalize" id="formTitle1"></h5>
                                                                </div>-->
                                <div class="form-section">
                                    <div class="card-body">
                                        <div id="tableContainer" class="mt-4">
                                            <table id="reportTable" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Sl No.</th>
                                                        <th>Proposal Id</th>
                                                        <th>Calamity</th>
                                                        <th>Assistance Head</th>
                                                        <th>Type of Assistance</th>
                                                        <th>Date of Incidence</th>
                                                        <th>District</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tableBody">
                                                    <c:forEach varStatus="i" items="${agendalist}" var="p">
                                                        <tr>
                                                            <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[6]}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[7]}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                            <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                            <td>
                                                                <input type="checkbox" class="bulk-approval-checkbox custom-checkbox" data-calamity="${p[1]}" data-reportid="${p[5]}" data-proposalid="${p[6]}" data-districtcodelgd="${p[8]}"/>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <!--<input type="submit" id="forwardButton" class="btn btn-success float-end mt-4" value="Forward Proposal to Revenue Dept" onclick="forwardReport()"/>-->
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <div class=" d-flex justify-content-end">
                                            <button id="button-agendanote" class="btn btn-primary btn-block mb-2 mt-2" title="Generate Agenda Note"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Generate Agenda Note</button>
                                            <!--                                            <input type="submit" id="btnSaveExgratia1" value="Save Details" class="btn btn-success"/>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <%--</form:form>--%>
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Agenda Note</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col mb-2">
                                                <label for="inputNoteNumber"><b>Enter Note Number:</b></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col mb-2">
                                                <input type="text" id="inputBlockcode" class="form-control" name="note_number"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Submit</button>
                                    </div>
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

                $("#button-agendanote").click(function () {
                    var selectedRows = [];
                    // Iterate through all the checkboxes and collect selected rows
                    $(".bulk-approval-checkbox:checked").each(function () {
                        var reportid = $(this).data("reportid");
                        var calamity_name = $(this).data("calamity");
                        var proposalid = $(this).data("proposalid");
//                        var districtcodelgd = $('#districtSelect').val();
                        var districtcodelgd = $(this).data("districtcodelgd");

                        console.log("reportid: " + reportid + ", proposalid: " + proposalid + ", calamity: " + calamity_name);

                        selectedRows.push({
                            calamity_name: calamity_name,
                            reportid: reportid,
                            proposalid: proposalid,
                            districtcodelgd: districtcodelgd
                        });
                    });

                    if (selectedRows.length === 0) {
                        alert('Select at least one checkbox to generate an agenda note.');
                        return;
                    }

                    // Perform agenda note generation
                    generateAgendaNote(selectedRows);
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
                                    '<input type="checkbox" class="bulk-approval-checkbox custom-checkbox" data-calamity="' + data[i][1] + '" data-reportid="' + data[i][5] + '" data-proposalid="' + data[i][6] + '" data-districtcodelgd="' + data[i][8] + '" />' +
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

            function view_adenda_note() {
                var url = "agendanote.htm";
                window.open(url, '_blank');
            }

            function generateAgendaNote(selectedRows) {
                var successFlag = false; // Flag to track success
                var selectedProposals = selectedRows.map(function (row) {
                    return row.proposalid;
                }).join(', ');

                $.confirm({
                    title: 'Agenda Note',
                    columnClass: 'medium', // Adjust the column width if needed
                    content:
                            '<div class="custom-dialog">' +
                            '<h6>Are you sure you want to generate agenda note for the following proposals ?<br>' +
                            'Selected Proposals: <b>' + selectedProposals + '</b></h6>' +
                            '<div class="form-group mb-2">' +
                            '<label for="inputAgendaNoteNumber" class="mt-3"><b>Enter Note Number:</b></label>' +
                            '<input type="text" id="inputAgendaNoteNumber" class="form-control mt-2" required>' +
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
                                var note_number = $('#inputAgendaNoteNumber').val();

                                // Create an array of selected rows with remarks
                                var selectedRowsWithRemarks = selectedRows.map(function (row) {
                                    return {
                                        calamity_name: row.calamity_name,
                                        reportid: row.reportid,
                                        proposalid: row.proposalid,
                                        districtcodelgd: row.districtcodelgd,
                                        remarks: remarks,
                                        note_number: note_number
                                    };
                                });
                                $.confirm({
                                    content: function () {
                                        var self = this;
                                        return $.ajax({
                                            url: './generateagendanote.htm',
                                            method: 'POST',
                                            contentType: 'application/json',
                                            data: JSON.stringify(selectedRowsWithRemarks),
                                            beforeSend: function (xhr) {
                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                            }
                                        }).done(function (response) {
                                            console.log(response);
                                            self.setTitle(response.name);
                                            if (response !== '-1') {
                                                self.setTitle('Success!');
                                                self.setContent('Agenda Note Successfully Created.');
                                                successFlag = true; // Set success flag
                                            } else {
                                                self.setTitle('Failed!');
                                                self.setContent('Failed To Create Agenda Note.');
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
                            $.alert('Agenda Note Not Generated');
                        }
                    }
                });
            }

        </script>
    </body>
</html>
