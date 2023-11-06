<%-- 
    Document   : templateforallpages
    Created on : 8 Nov, 2022, 4:52:32 PM
    Author     : joseph
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
        <sec:csrfMetaTags />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coordinator Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4 scrollcontainer">
                            <input type="hidden" value="<c:out value="${basic_casedetails.caseno}" />" id="inputCaseNoRO" />
                        <input type="hidden" name="deskid"  id="deskid"/>
                        <input type="hidden" name="flagaid"  id="flagaid" value="${flagaid}"/>
                        <input type="hidden" name="districtselected" id="districtselected"/>
                        <input type="hidden" value="${basic_casedetails.basic_caseid}" id="caseid"/>
                        <input type="hidden" value="${basic_casedetails.caseno}" id="caseno"/>
                        <div class="mt-4">
                            <div class="card">
                                <div class="card-body align-items-center justify-content-center">
                                    <div class="float-start">
                                        <p type="button" class="mynavitem mb-0" onclick="gotoCaseManagement();"><i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;Back to Case Management</p>
                                    </div>
                                    <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-solid fa-arrow-right-arrow-left"></i>&nbsp;&nbsp;Transfer Case To Selected Agency</h5>
                                </div>
                            </div>
                        </div>

                        <div class="card mt-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <p>Select Agency Type&nbsp;<span class="text-danger blink fw-bold">*</span></p>
                                                <div class="allFormFields">
                                                    <form id="transfercaseagency" autocomplete="off">
                                                        <c:if test="${flagaid=='1'}">
                                                            <div class="form-floating mb-3">
                                                                <select class="form-select" name="181managementdesk" id="181managementdesk" aria-label="Floating label select example" required="true">
                                                                    <option value="${basic_casedetails.m_desk.deskid}">${basic_casedetails.m_desk.deskdesc}</option>
                                                                    <c:forEach items="${desk_list}" var="c" varStatus="status">
                                                                        <c:if test="${c.deskid!=basic_casedetails.m_desk.deskid}">
                                                                            <option value="${c.deskid}">${c.deskdesc}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <label for="181managementdesk">Select 181 Management Desk&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${flagaid=='2'}">
                                                            <div class="form-floating mb-3">
                                                                <select class="form-select" name="integratedagencies" id="integratedagencies" aria-label="Floating label select example" required="true">
                                                                    <option value="${basic_casedetails.m_integratedagencies.integratedagencyid}">${basic_casedetails.m_integratedagencies.integratedagencyname}</option>
                                                                    <c:forEach items="${integrated_list}" var="c" varStatus="status">
                                                                        <c:if test="${c.integratedagencyid!=basic_casedetails.m_integratedagencies.integratedagencyid}">
                                                                            <option value="${c.integratedagencyid}">${c.integratedagencyname}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <label for="integratedagencies">Select Integrated Agencies&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${flagaid=='3'}">
                                                            <div class="form-floating mb-3">
                                                                <select class="form-select" name="nonintegratedagencies" id="nonintegratedagencies" aria-label="Floating label select example" required="true">
                                                                    <option value="${basic_casedetails.m_nonintegratedagencies.nonintegratedagencyid}">${basic_casedetails.m_nonintegratedagencies.nonintegratedagencyname}</option>
                                                                    <c:forEach items="${nonintegrated_list}" var="c" varStatus="status">
                                                                        <c:if test="${c.nonintegratedagencyid!=basic_casedetails.m_nonintegratedagencies.nonintegratedagencyid}">
                                                                            <option value="${c.nonintegratedagencyid}">${c.nonintegratedagencyname}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <label for="nonintegratedagencies">Select Non-Integrated Agencies&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${flagaid=='4'}">
                                                            <input type="button" id="directory" value="Select Agency" style="width:100%;" class="btn btn-secondary btn-block mb-3" data-bs-target="#mymodal" data-bs-toggle="modal"/>
                                                            <div class="form-floating mb-3">
                                                                <input type="text" class="form-control" id="agencytype" placeholder="Agency Type" readonly="true">
                                                                <label for="agencytype">Agency Type</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input type="text" class="form-control" id="agencyname" placeholder="Agency Name" readonly="true">
                                                                <label for="agencytype">Agency Name</label>
                                                            </div>
                                                        </c:if>
                                                        <input type="hidden"  name="magencydetailid" id="magencydetailid" class="form-control" />
                                                        <div class="form-floating mb-3">
                                                            <textarea name="reasontransfer" rows="4" id="reasontransfer" class="form-control" placeholder="Leave a comment here" style="height: 100px" required="true"></textarea>
                                                            <label for="reasontransfer">Reason for Transfer<span class="text-danger blink fw-bold">*</span></label>
                                                        </div>
<!--                                                        <div class="form-floating mb-3">
                                                            <input type="date" class="form-control" id="calldateid" name="call_date" placeholder="Agency Type">
                                                            <label for="agencytype">Transfer Date</label>
                                                        </div>-->
                                                        <input type="submit" class="mt-3 btn btn-primary w-100" value="Transfer Case" />

                                                        <div class="modal fade" id="mymodal">
                                                            <div class="modal-dialog modal-xl">
                                                                <div class="modal-content">

                                                                    <!-- Modal Header -->
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title">Select Agency</h4>
                                                                        <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
                                                                    </div>

                                                                    <!-- Modal body -->
                                                                    <div class="modal-body">
                                                                        <div class="container">
                                                                            <div class="row">
                                                                                <div class="col" style="max-height: 350px; display:block;overflow-y: auto;">
                                                                                    <table class="table table-striped" >
                                                                                        <thead>
                                                                                        <th>ID</th>
                                                                                        <th>Agency Name</th>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <c:forEach var="st" items="${agentypelist}">
                                                                                                <tr class="rowclick">
                                                                                                    <td>
                                                                                                        ${st.agencytypeid}
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        ${st.agencytypename}
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </c:forEach>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="row">
                                                                                        <div class="col" id="magencydetaillist">
                                                                                            <table id="mtablelist" class="table table-striped">
                                                                                                <thead class="thead">
                                                                                                <th>Sl No</th>
                                                                                                <th>Agency name</th>
                                                                                                <th>Address</th>
                                                                                                <th>District</th>
                                                                                                </thead>
                                                                                                <tbody id="mtbody">

                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col" id="cagencylist">
                                                                                            <table id="ctablelist" class="table table-striped">
                                                                                                <thead class="thead">
                                                                                                <th>Sl No</th>
                                                                                                <th>Person Name</th>
                                                                                                <th>Designation</th>
                                                                                                <th>Mobile No 1</th>
                                                                                                <th>Office No 1</th>
                                                                                                <th>Mobile No 2</th>
                                                                                                <th>Office No 2</th>
                                                                                                </thead>
                                                                                                <tbody id="ctbody">

                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Modal footer -->
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <%@include file="manager_casehistory.jsp" %>
                                    </div>
                                </div>
                            </div>
                        </div>
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

        <script>
                                            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                            var csrfToken = $("meta[name='_csrf']").attr("content");
                                            $(document).ready(function () {

                                                $('table tbody').on('click', '.rowclick', function () {
                                                    var curr = $(this).closest('tr');
                                                    var id = curr.find('td:eq(0)').text();
                                                    var agencytype = curr.find('td:eq(1)').text();
                                                    $("#agencytype").val(agencytype.toString().trim());
                                                    $.confirm({
                                                        content: function () {
                                                            var self = this;
                                                            return $.ajax({
                                                                method: "GET",
                                                                url: "./getmasteragency.htm",
                                                                data: "agencyid=" + id.toString().trim()
                                                            }).done(function (response) {
                                                                var data = JSON.parse(response);
                                                                $('#mtbody').html('');
                                                                $('#ctbody').html('');
                                                                for (i = 0; i < data.length; i++) {
                                                                    var str = "<tr class='mrowclick'><td>" + data[i].magencydetailid + "</td><td>" + data[i].agencyname + "</td><td>" + data[i].address + "</td><td>" + data[i].district.districtname + "</td></tr>"
                                                                    $('#mtbody').append(str);
                                                                }
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                });

                                                $('table tbody').on('click', '.mrowclick', function () {
                                                    var curr = $(this).closest('tr');
                                                    var id = curr.find('td:eq(0)').text();
                                                    var agencyname = curr.find('td:eq(1)').text();
                                                    $("#agencyname").val(agencyname);
                                                    $('#magencydetailid').val(id.toString().trim());
                                                    $('#ctbody').html("");

                                                    $.confirm({
                                                        content: function () {
                                                            var self = this;
                                                            return $.ajax({
                                                                method: "GET",
                                                                url: "./getContactAgencyList.htm",
                                                                data: "magencyid=" + id.toString().trim(),
                                                            }).done(function (response) {
                                                                var data = JSON.parse(response);
                                                                for (var i = 0; i < data.length; i++) {
                                                                    var str = "<tr class='crowclick'><td>" + data[i].cagencydetailid + "</td><td>" + data[i].person_name + "</td><td>" + data[i].designation + "</td><td>" + data[i].mobile1 + "</td><td>" + data[i].officephone1 + "</td><td>" + data[i].mobile2 + "</td><td>" + data[i].officephone2 + "</td></tr>";
                                                                    $('#ctbody').append(str);
                                                                }
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                });


                                                $('#transfercaseagency').submit(function (e) {
                                                    e.preventDefault();
                                                    var flagaid = $('#flagaid').val();
                                                    var caseid = $('#caseid').val();
                                                    var caseno = $('#caseno').val();
                                                    var deskid = $('#181managementdesk').val();
                                                    var integratedagencies = $('#integratedagencies').val();
                                                    var nonintegratedagencies = $('#nonintegratedagencies').val();
                                                    var calldateid = $('#calldateid').val();
                                                    var reasontransfer = $('#reasontransfer').val();
                                                    var magencydetailid = $('#magencydetailid').val();

                                                    if (flagaid === "1") {
                                                        var str = "basic_caseid=" + caseid + "&caseno=" + caseno + "&deskid=" + deskid + "&reasontransfer=" + reasontransfer;
                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './transfercase.htm',
                                                                    data: str,
                                                                    method: 'POST',
                                                                    beforeSend: function (xhr) {
                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                    }
                                                                }).done(function (response) {
                                                                    if (response === '1') {
                                                                        self.setContent('Successfully Transferred Case');
                                                                        self.setTitle("Success!");
                                                                    } else {
                                                                        self.setContent('Failed To Transfer Case');
                                                                        self.setTitle("Failed!");
                                                                    }
                                                                }).fail(function () {
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            },
                                                            buttons: {
                                                                close: function () {
                                                                    window.location.reload();
                                                                }
                                                            }
                                                        });
                                                    }
                                                    if (flagaid === "2") {
                                                        var str = "basic_caseid=" + caseid + "&caseno=" + caseno + "&integratedagencies=" + integratedagencies + "&reasontransfer=" + reasontransfer;
                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './transfercaseintegratedagencies.htm',
                                                                    data: str,
                                                                    method: 'POST',
                                                                    beforeSend: function (xhr) {
                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                    }
                                                                }).done(function (response) {
                                                                    if (response === '1') {
                                                                        self.setContent('Successfully Transferred Case');
                                                                        self.setTitle("Success!");
                                                                    } else {
                                                                        self.setContent('Failed To Transfer Case');
                                                                        self.setTitle("Failed!");
                                                                    }
                                                                }).fail(function () {
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            },
                                                            buttons: {
                                                                close: function () {
                                                                    window.location.reload();
                                                                }
                                                            }
                                                        });
                                                    }
                                                    if (flagaid === "3") {
                                                        var str = "basic_caseid=" + caseid + "&caseno=" + caseno + "&nonintegratedagencies=" + nonintegratedagencies + "&reasontransfer=" + reasontransfer;
                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './transfercasenonintegratedagencies.htm',
                                                                    data: str,
                                                                    method: 'POST',
                                                                    beforeSend: function (xhr) {
                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                    }
                                                                }).done(function (response) {
                                                                    if (response === '1') {
                                                                        self.setContent('Successfully Transferred Case');
                                                                        self.setTitle("Success!");
                                                                    } else {
                                                                        self.setContent('Failed To Transfer Case');
                                                                        self.setTitle("Failed!");
                                                                    }
                                                                }).fail(function () {
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            },
                                                            buttons: {
                                                                close: function () {
                                                                    window.location.reload();
                                                                }
                                                            }
                                                        });
                                                    }
                                                    if (flagaid === "4") {
                                                        var str = "basic_caseid=" + caseid + "&caseno=" + caseno + "&magencydetailid=" + magencydetailid + "&reasontransfer=" + reasontransfer;
                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './transfercaseMasteragencies.htm',
                                                                    data: str,
                                                                    method: 'POST',
                                                                    beforeSend: function (xhr) {
                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                    }
                                                                }).done(function (response) {
                                                                    if (response === '1') {
                                                                        self.setContent('Successfully Transferred Case');
                                                                        self.setTitle("Success!");
                                                                    } else {
                                                                        self.setContent('Failed To Transfer Case');
                                                                        self.setTitle("Failed!");
                                                                    }
                                                                }).fail(function () {
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            },
                                                            buttons: {
                                                                close: function () {
                                                                    window.location.reload();
                                                                }
                                                            }
                                                        });
                                                    }
                                                });
                                            });

                                            function gotoCaseManagement() {
                                                var cn = $('#inputCaseNoRO').val();
                                                window.location.href = "caseindex.htm?caseno=" + cn;
                                            }
        </script>
    </body>
</html>
