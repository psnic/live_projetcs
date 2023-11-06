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
        <title>Monthly Meetings & Orientation Programs</title>
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
                            <div class="card-header bg-purple"><h4 class="text-white text-center fw-bold font-size-lg">Monthly Meetings & Orientation Programs</h4></div>
                            <div class="card-body">
                                <div class="row mt-2 justify-content-center">
                                    <div class="col-md-3">
                                        <div class="form-floating">
                                            <select name="year" id="inputYear" class="form-control"> 
                                                <option value="" disabled="true" selected="true">Select Year</option>
                                                <c:set var="cy" value="0"/>
                                                <c:set var="current_year" value="${currentyear}"/>
                                                <c:forEach items="${yearlisttoo}" var="y">
                                                    <c:choose>
                                                        <c:when test="${y==current_year}">
                                                            <c:set var="cy" value="1"/>
                                                            <option value="${y}"><c:out escapeXml="true" value="${y}"/></option>
                                                        </c:when>  
                                                        <c:otherwise>
                                                            <option value="${y}"><c:out escapeXml="true" value="${y}"/></option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${cy eq 0}">
                                                    <option value="${currentyear}"><c:out escapeXml="true" value="${currentyear}"/></option>
                                                </c:if>
                                            </select>
                                            <label for="inputYear">Select Report Year</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col" style="max-height: auto; display:block;overflow-y: auto;" id="monthlyReportTable_container">
                                        <table class="table table-striped table-bordered mt-4" id="monthlyReportTable">
                                            <thead>
                                            <th>Month</th>
                                            <th>Report Submission Status</th>
                                            <th>Meeting Details Submission Status</th>
                                            <th>Prepare Monthly Report</th>
                                            <th>Status</th>
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
                                    <h5 class="modal-title fw-bold text-white" id="prepareReportModalLabel">Prepare Report</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="card">
                                            <div class="card-header mb-2">
                                                <h6 class="fw-bold">Report for the month of </h6><h6 id="PRMonth"></h6>
                                            </div>
                                            <form:form modelAttribute="monthlyrep" method="POST" id="monthlyreportform" autocomplete="off">
                                                <input type="hidden" id="hyear" name="year"/>
                                                <input type="hidden" id="hmonth" name="month"/>
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
                                                                            <td class="fw-bold"><c:out value="${r.reportquestiondesc}"></c:out><input type="hidden" id="rep-${status.index}" name="monthlyreportanswerlist[${status.index}].reportquestion.reportquestionid" class="form-control" value="${r.reportquestionid}" /> </td>
                                                                            <td><input type="text" id="rep-${status.index}" name="monthlyreportanswerlist[${status.index}].monthlyreportanswer" class="form-control" />
                                                                        </tr>
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="fw-bold">
                                                                            5
                                                                        </td>
                                                                        <td class="fw-bold">
                                                                            Report Description
                                                                        </td>
                                                                        <td>
                                                                            <textarea type="text" name="monthlyreportdetails" style="width:100%;" rows="5" cols="60" class="form-control"></textarea>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="container mt-4"><center><input type="submit" id="btnSave" value="Save" class="btn btn-primary btn-block" style="width:30%"/></center></div>
                                                </div>
                                            </form:form>
                                        </div>
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

                    <!--View Report Modal Start-->
                    <div class="modal fade" id="viewReportModal" tabindex="-1" aria-labelledby="viewReportModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered model-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header bg-purple-hov">
                                    <h5 class="modal-title fw-bold text-white" id="viewReportModalLabel">Report Details</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!--<div class="container">-->
                                        <!--<div class="card">-->
<!--                                            <div class="card-header mb-2">
                                                <h6 class="fw-bold">Report Details </h6>
                                            </div>-->
                                            <div class="card-body fw-normal" id="reportDescription">
                                            </div>
                                        <!--</div>-->
                                    <!--</div>-->
                                </div>
                                <div class="modal-footer d-flex justify-content-between" id="modal-footer-content-too">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--View Report Modal End-->
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
                $('#monthlyReportTable').DataTable({});

                $('#inputYear').change(function () {
                    var year = $(this).children("option:selected").val();
//                    $('.inputYear').html(year);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                type: "GET",
                                url: "./getmonthlyreportdetails.htm",
                                data: 'year=' + year
                            }).done(function (data) {
//                                console.log(data);
                                $('#mtbody').html('');
                                for (var i = 0; i < data.length; i++) {
                                    var str = "<tr class='mrowclick'><td>" + data[i].month + " " + year + "</td>";
                                    if (data[i].status === 1) {
                                        str += '<td>Report Submitted</td>' +
                                                '<td>Meeting Details Submitted</td>' +
                                                '<td><button type="button" style="width:150px;" value="' + data[i].month + ',' + year + '" data-bs-toggle="modal" data-bs-target="#viewReportModal" class="btn btn-success" onclick="viewReport(&quot;' + year + '&quot;,&quot;' + data[i].month + '&quot;)">View  Report</button></td>' +
                                                '<td class="text-success fw-bold">Submitted</td></tr>';
                                    } else {
                                        str += '<td>Report Not Submitted</td>' +
                                                '<td>Meeting Details Not Submitted</td>' +
                                                '<td><button type="button" style="width:150px;" value="' + data[i].month + ',' + year + '" data-bs-toggle="modal" data-bs-target="#prepareReportModal" class="btn btn-primary" onclick="prepareReport(&quot;' + year + '&quot;,&quot;' + data[i].monthcode + '&quot;,&quot;'+ data[i].month + '&quot;)" id="prepmonthlyreport-i">Prepare  Report</button></td>' +
                                                '<td class="text-danger fw-bold"> Not Submitted</td></tr>';
                                    }
                                    $('#mtbody').append(str);
                                }
                                self.close();
                            }).fail(function () {
                                self.setContent('Something went wrong.');
                            });
                        }
                    });
                });
                
                $('#prepareReportModal').on('hidden.bs.modal', function () {
                    $(this).find('#monthlyreportform').trigger('reset');
                });

                $("#monthlyreportform").submit(function (e) {
                    e.preventDefault();
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var month = $('#hmonth').val();
                    var year = $('#hyear').val();
                    var formData = new FormData($(this)[0]);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./savereportmonthlyanswer.htm",
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
                                    $("#monthlyreportform").trigger("reset");
                                    window.location.reload();
                                }
                            }
                        }
                    });
                });
            });

            function prepareReport(year, monthcode, month) {
//                console.log(year);
//                console.log(monthcode);
                $('#hyear').val(year);
                $('#hmonth').val(monthcode);
                $('#PRMonth').html(month +" "+year);
            }

            function viewReport(year, month) {
                $.confirm({
                    content: function () {
                        var self = this;
                        return $.ajax({
                            type: "GET",
                            url: "./viewmonthlyreportdetails.htm",
                            data: {year: year, month: month}
                        }).done(function (data) {
                            var res = JSON.parse(data);
                            $('#reportDescription').html(res.monthlyreportdetail);
                            self.close();
                        }).fail(function () {
                            self.setContent('Something went wrong.');
                        });
                    }
                });
            }
        </script>
    </body>
</html>
