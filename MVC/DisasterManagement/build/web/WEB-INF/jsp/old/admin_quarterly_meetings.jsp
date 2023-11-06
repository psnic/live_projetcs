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
        <sec:csrfMetaTags />
        <meta name="_csrf_header" content="<c:out value="${_csrf.headerName}" escapeXml="true"/>"/>
        <meta name="_csrf" content="<c:out value="${_csrf.token}" escapeXml="true"/>"/>
        <title>Quarterly Meetings & Orientation Programs</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container px-5">
                        <div class="card">
                            <div class="card-header bg-purple"><h4 class="text-white text-center fw-bold font-size-lg">Quarterly Meetings & Orientation Programs</h4></div>
                            <div class="card-body">
                                <div class="row mt-2 justify-content-center">
                                    <div class="col-md-3">
                                        <div class="form-floating">
                                            <select id="inputFinancialYear" class="form-control"> 
                                                <option value="" disabled="true" selected="true">Select Year</option>
                                                <c:forEach items="${financialyear}" var="y">
                                                    <option value="${y}"><c:out escapeXml="true" value="${y}"/></option>
                                                </c:forEach>
                                            </select>
                                            <label for="inputYear">Select Financial Year</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col" style="max-height: auto; display:block;overflow-y: auto;" id="quarterlyReportTable_container">
                                        <table class="table table-striped table-bordered mt-4" id="quarterlyReportTable">
                                            <thead>
                                            <th>Quarter</th>
                                            <th>Fill/Submit Report</th>
                                            </thead>
                                            <tbody id="mtbody">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Prepare Report Modal Start-->
                    <div class="modal fade" id="prepareReportModal" tabindex="-1" aria-labelledby="prepareReportModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header bg-purple-hov">
                                    <h5 class="modal-title fw-bold text-white" id="callHistoryModalLabel">Prepare Report</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="card">
                                        <div class="card-header mb-2">
                                            <h6 class="fw-bold">Quarterly Report For </h6><h6 id="qrcardheader"></h6>
                                        </div>
                                        <form:form modelAttribute="quarterlyrep" method="POST" id="quarterlyreportform" autocomplete="off">
                                            <input type="hidden" id="Qquarter" name="quarter"/>
                                            <input type="hidden" id="Qyear" name="financial_year"/>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col" style="max-height: auto; display:block;overflow-y: auto;" id="reporttable_container">
                                                        <table class="table table-striped table-bordered mt-4" id="reporttable">
                                                            <thead>
                                                            <th>Sl No.</th>
                                                            <th>Question</th>
                                                            <th>Answer</th>
                                                            </thead>
                                                            <tbody id="reportTBody">
                                                                <c:forEach items="${reportquestion}" var="r" varStatus="status">
                                                                    <tr>
                                                                        <td class="fw-bold"><c:out value="${status.count}"></c:out></td>
                                                                        <td class="fw-bold"><c:out value="${r.reportquestiondesc}"></c:out><input type="hidden" id="rep-${status.index}" name="reportquestionid_${status.index}" class="form-control" value="${r.reportquestionid}" /> </td>
                                                                        <td><input type="text" id="rep-${status.index}" name="answer_${status.index}" class="form-control" />
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="container mt-4"><center><input type="submit" id="btnSave" data-bs-dismiss="modal" value="Save" class="btn btn-primary btn-block" style="width:30%"/></center></div>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                                <div class="modal-footer d-flex justify-content-between" id="modal-footer-content-too">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Prepare Report Modal End-->
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
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                $('#quarterlyReportTable').DataTable({});

//                $('#inputFinancialYear').change(function () {
////                    var year = $(this).children("option:selected").val();
//                    var year = $('#inputFinancialYear').val();
//                    $.ajax({
//                        type: "GET",
//                        url: "./getquarterlydetail.htm",
//                        data: "year=" + year,
//                        success: function (data) {
//                            console.log(data);
//                            var str="";
//                            if (data === 0)
//                            {
//                                $('#mtbody').html('');
//                                for (var i = 1; i <= 4; i++) {
//                                    str = "<tr><td>Quarter-" + i + "</td><td><button data-bs-toggle='modal' data-bs-target='#prepareReportModal' value='" + i + "' class='btn btn-primary' onclick='fillQuarterlyReport("+i+","+year+")'>Fill Report </button></td></tr>";
//                                    $("#mtbody").append(str);
//                                }
//                            } else {
//                                $('#mtbody').html('');
//                                for (var i = 1; i <= data; i++) {
//                                    str = "<tr><td>Quarter-" + i + "</td><td><button class='btn btn-success'>Report Submitted</button></td></tr>";
//                                    $("#mtbody").append(str);
//                                }
//                                for (var i = data + 1; i <= 4; i++) {
//                                    str = "<tr><td>Quarter-" + i + "</td><td><button data-bs-toggle='modal' data-bs-target='#prepareReportModal' value='" + i + "' class='btn btn-primary' onclick='fillQuarterlyReport("+i+","+year+")'>Fill Report </button></td></tr>";
//                                    $("#mtbody").append(str);
//                                }
//                            }
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            alert("error:" + textStatus + " - exception:" + errorThrown);
//                        }
//                    });
//                });

                $('#inputFinancialYear').change(function () {
                    var year = $('#inputFinancialYear').val();
                    $.ajax({
                        type: "GET",
                        url: "./getquarterlydetail.htm",
                        data: "year=" + year,
                        success: function (data) {
                            var str = "";
                            $('#mtbody').html('');
                            for (var i = 1; i <= 4; i++) {
                                if (data[i - 1] !== null) {
                                    str = "<tr><td>Quarter-" + i + "</td><td><button class='btn btn-success Disabled'>Report Submitted</button></td></tr>";
                                    $("#mtbody").append(str);
                                } else {
                                    str = "<tr><td>Quarter-" + i + "</td><td><button data-bs-toggle='modal' data-bs-target='#prepareReportModal' value='" + i + "' class='btn btn-primary' onclick='fillQuarterlyReport(" + i + "," + year + ")'>Fill Report </button></td></tr>";
                                    $("#mtbody").append(str);
                                }
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("error:" + textStatus + " - exception:" + errorThrown);
                        }
                    });
                });

                $('#prepareReportModal').on('hidden.bs.modal', function () {
                    $(this).find('#quarterlyreportform').trigger('reset');
                });

                $("#quarterlyreportform").submit(function (e) {
                    e.preventDefault();
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var formData = new FormData($(this)[0]);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./savereportquarterlyanswer.htm",
                                data: formData,
                                processData: false,
                                contentType: false,
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                }
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Report Details Saved Successfully");
                                    $('#prepareReportModal').modal('hide');
                                } else {
                                    self.setTitle("Failed");
                                }
                            }).fail(function () {
                                self.setTitle('Something went wrong.');
                            });
                        },
                        buttons: {
                            close: {
                                action: function () {
                                    $('#quarterlyreportform').trigger('reset');
                                    window.location.reload();
                                }
                            }
                        }
                    });
                });
            });

            function fillQuarterlyReport(quarter, year) {
                $('#Qquarter').val(quarter);
                $('#Qyear').val($('#inputFinancialYear').val());
//                var x = $('#inputFinancialYear').val();
            }
        </script>
    </body>
</html>
