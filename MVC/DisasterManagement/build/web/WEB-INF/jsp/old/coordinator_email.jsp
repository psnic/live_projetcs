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

        <style>
            .dividerVertical {
                width: 1px;
                background-color: #d2d2d2;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">

                            <div class="mt-4">
                                <div class="card">
                                    <div class="card-body align-items-center justify-content-center">
                                        <div class="float-start">
                                            <p type="button" class="mynavitem mb-0" onclick="gotoCaseManagement();"><i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;Back to Case Management</p>
                                        </div>
                                        <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-solid fa-envelopes-bulk"></i>&nbsp;&nbsp;Communicate Through Email</h5>
                                    </div>
                                </div>
                            </div>

                            <form autocomplete="off" id="emailForm" enctype="multipart/form-data">
                                <input type="hidden" value="<c:out value="${basic_casedetails.caseno}" />" id="inputCaseNoRO" />
                            <div class="row mt-4">
                                <div class="col">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div id="agencyBlock">
                                                <div class="form-floating mb-3">
                                                    <select class="form-select" id="selectAgency" name="agencytype" aria-label="Select Agency">
                                                        <option selected="true" disabled="true">Select Agency</option>
                                                        <c:forEach var="st" items="${agentypelist}">
                                                            <option value="<c:out escapeXml="true" value="${st.agencytypeid}" />"><c:out escapeXml="true" value="${st.agencytypename}" /></option>
                                                        </c:forEach>
                                                    </select>
                                                    <label for="selectAgency">Select Agency</label>
                                                </div>
                                                <div class="form-control mb-3">
                                                    <table id="agencyTable" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No</th>
                                                                <th>Agency name</th>
                                                                <th>Address</th>
                                                                <th>District</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="agencyTableBody">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="form-control mb-3">
                                                    <table id="agencyTableList" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No</th>
                                                                <th>Person Name</th>
                                                                <th>Designation</th>
                                                                <th>Mobile No 1</th>
                                                                <th>Office No 1</th>
                                                                <th>Mobile No 2</th>
                                                                <th>Office No 2</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="agencyTableListBody">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input type="text" id="agencyname" name="agencyname" class="form-control" readonly="true"/>
                                                    <label for="agencyname">Agency Name</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input type="text" id="designation" name="designation" class="form-control" required="true" />
                                                    <label for="designation">Designation&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                </div>

                                                <!--<input type="text" id="agencytype" class="form-control" readonly="true"/>-->
                                                <input type="hidden"  name="magencydetailid" id="magencydetailid" class="form-control"/>
                                                <input type="hidden"  name="agencytypeid" id="agencytypeid" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<%@include file="manager_casehistory.jsp" %>--%>
                                </div>
                                <div class="col">
                                    <div class="card">
                                        <div class="card-header fw-bold"><i class="fa-solid fa-at"></i>&nbsp;Compose Email</div>
                                        <div class="card-body">
                                            <div class="mb-4 ">
                                                <!--d-flex flex-row justify-content-between-->
                                                <!--                                                <button id="recievedEmailCheck" type="checkbox" class="btn btn-toggle" data-bs-toggle="button" aria-pressed="false" autocomplete="off">
                                                                                                    <div class="handle"></div>
                                                                                                </button>-->
                                                <input type="checkbox" id="recievedEmailCheck" />
                                                <label for="recievedEmailCheck">Email Received</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input name="recipient" type="text" class="form-control" id="inputRecipient" placeholder="name@example.com" required="true" />
                                                <label for="inputRecipient">Recipient&nbsp;(To&nbsp;/&nbsp;From&nbsp;)<span class="text-danger fw-bold blink">*</span></label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input name="mailcc" type="text" class="form-control" id="inputCopiesTo" placeholder="name@example.com" />
                                                <label for="inputCopiesTo">Copies To&nbsp;(CC)</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input name="emaildate" type="date" class="form-control" id="inputDate" />
                                                <label for="inputDate">Email Date<span class="text-danger fw-bold blink">*</span></label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input name="subject" type="text" class="form-control" id="inputSubject" placeholder="Enter Subject"/>
                                                <label for="inputSubject">Subject</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <textarea name="content" type="text" class="form-control h-100" id="inputContent" placeholder="Enter Content" rows="5"></textarea>
                                                <label for="inputContent">Mail Content</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input name="recipientname" type="text" class="form-control" id="inputRecipientName" placeholder="Enter Recipient Name"/>
                                                <label for="inputRecipientName">Recipient Name</label>
                                            </div>
                                            <input type="hidden" value="${basic_casedetails.basic_caseid}" name="basic_caseid" id="caseid"/>
                                            <input type="hidden" value="${basic_casedetails.caseno}" name="caseno" id="caseno"/>
                                            <input type="hidden" id="call_logid" name="call_logid" class="form-control" value="${call_logid}"/>

                                            <input type="hidden" name="deskid"  id="deskid"/>
                                            <input type="hidden" name="districtselected" id="districtselected"/>
                                            <div class="form-control mb-3">
                                                <div class="d-flex flex-row justify-content-between">
                                                    <div class="leftActions">
                                                        <!--multiple="multiple" name="mailattachments[]"-->
                                                        <input type="file" name="mailattachments" id="mailattachments" hidden="true" />
                                                        <button type="button" class="btn btn-default" onclick="$('#mailattachments').click();"><i class="fa-solid fa-paperclip"></i>&nbsp;&nbsp;Add Attachment</button>
                                                        <p id="filenames"></p>
                                                    </div>
                                                    <div class="dividerVertical"></div>
                                                    <div class="rightActions" id="rightActions">
                                                        <button type="submit" class="btn btn-purple text-white">
                                                            Send Email &nbsp;<i class="fa-solid fa-paper-plane"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!--Modal for With/Without Follow Up Start-->
                        <div class="modal fade" tabindex="-1" id="woFollowupModal" data-bs-backdrop="static" data-bs-keyboard="false">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header bg-purple-hov">
                                        <h5 class="modal-title fw-bold text-white">Follow Up Screen</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row mb-3" >
                                            <div class="col">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <label for="woOption">Is Follow Up Required?</label>
                                                        <div id="woOption">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="wofollowup" id="withfollowup" value="Y">
                                                                <label class="form-check-label" for="withfollowup">Yes</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" name="wofollowup" id="withoutfollowup" value="N">
                                                                <label class="form-check-label" for="withoutfollowup">No</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row d-none" id="withFollowupDiv">
                                            <form id="followupForm">
                                                <div class="col-12">
                                                    <div class="form-floating mb-3">
                                                        <input name="followupdate" type="date" class="form-control" id="followupDate" />
                                                        <label for="followupDate">Next Follow Up Date</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <textarea name="followupremarks" type="text" class="form-control h-100" id="followupRemarks" placeholder="Enter Content" rows="3"></textarea>
                                                        <label for="followupRemarks">Follow Up Remarks</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-primary" id="withFollowupBTN">Save Follow Up Details</button>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="row d-none" id="withoutFollowupDiv">
                                            <div class="col-12">
                                                <button type="button" class="btn btn-danger" id="withoutFollowupBTN">No Need To Follow Up. Close</button>
                                            </div>
                                        </div>




                                        <div class="row mb-3">
                                            <div class="d-flex flex-row justify-content-between">
                                                <!--                                                <button type="button" class="btn btn-primary" id="withFollowupBTN">Save Follow Up Details</button>
                                                                                                <button type="button" class="btn btn-danger" id="withoutFollowupBTN">No Need To Follow Up</button>-->
                                            </div>
                                        </div>

                                        <!--                                        <div class="row">
                                                                                    <div class="col-12">
                                                                                        <div class="form-floating mb-3">
                                                                                            <input name="followupdate" type="date" class="form-control" id="followupDate" />
                                                                                            <label for="followupDate">Next Follow Up Date</label>
                                                                                        </div>
                                                                                        <div class="form-floating mb-3">
                                                                                            <textarea name="followupremarks" type="text" class="form-control" id="followupRemarks" placeholder="Enter Content" rows="3"></textarea>
                                                                                            <label for="followupRemarks">Follow Up Remarks</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->
                                    </div>
                                    <!--<div class="modal-footer">-->
                                    <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>-->
                                    <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                                    <!--</div>-->
                                </div>
                            </div>
                        </div>
                        <!--Modal for With/Without Follow Up End-->

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
                                                                //                                                                $('#woFollowupModal').modal('show');
                                                                $('#mailattachments').change(function () {
                                                                    var numFiles = $('#mailattachments')[0].files.length;
                                                                    var arr = [];
                                                                    for (var x = 0; x < numFiles; x++) {
                                                                        arr[x] = $('#mailattachments')[0].files[x].name;
                                                                    }
                                                                    $('#filenames').html(arr);
                                                                });

                                                                $('#emailForm').submit(function (e) {
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    var chk = $('#recievedEmailCheck').is(':checked');
                                                                    if (chk === true) {
                                                                        saveEmail(formData);
                                                                    } else {
                                                                        sendEmail(formData);
                                                                    }
                                                                });

                                                                $('#recievedEmailCheck').click(function () {
                                                                    $('#rightActions').html('');
                                                                    var chk = $('#recievedEmailCheck').is(':checked');
                                                                    var btn = '';
                                                                    if (chk === true) {
                                                                        btn = '<button type="submit" class="btn btn-success">' +
                                                                                '<i class="fa-solid fa-envelope"></i>&nbsp; Save Recieved Email' +
                                                                                '</button>';
                                                                    } else {
                                                                        btn = '<button type="submit" class="btn btn-purple text-white">' +
                                                                                'Send Email &nbsp;<i class="fa-solid fa-paper-plane"></i>' +
                                                                                '</button>';
                                                                    }
                                                                    $('#rightActions').html(btn);
                                                                });

                                                                $('input[type=radio][name=wofollowup]').change(function () {
                                                                    $('#followupDate').removeAttr('required');
                                                                    $('#followupRemarks').removeAttr('required');
                                                                    var ch = $('input[name="wofollowup"]:checked').val();
                                                                    if (ch === 'Y') {
                                                                        $('#withFollowupDiv').show();
                                                                        $('#withFollowupDiv').removeClass('d-none');
                                                                        $('#followupDate').attr('required', true);
                                                                        $('#followupRemarks').attr('required', true);
                                                                        $('#withoutFollowupDiv').hide();
                                                                    } else {
                                                                        $('#withFollowupDiv').hide();
                                                                        $('#withoutFollowupDiv').show();
                                                                        $('#withoutFollowupDiv').removeClass('d-none');
                                                                    }
                                                                });

                                                                $('#selectAgency').change(function () {
                                                                    $('#agencyTableListBody').html('');
                                                                    $('#agencyTableBody').html('');
                                                                    $('#agencyname').val('');
                                                                    var agencyid = $('#selectAgency').val();
                                                                    $('#agencytypeid').val(agencyid);
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                url: './getmasteragency.htm',
                                                                                data: 'agencyid=' + agencyid,
                                                                                method: 'GET'
                                                                            }).done(function (response) {
                                                                                var res = JSON.parse(response);
                                                                                if (res.length !== 0) {
                                                                                    var tb = '';
                                                                                    for (var i = 0; i < res.length; i++) {
                                                                                        tb += '<tr class="tbhover" onclick="getContactAgencyDetails(&quot;' + res[i].magencydetailid + '&quot;,&quot;' + res[i].agencyname + '&quot;)">'
                                                                                                + '<td>' + parseInt(i + 1) + '</td>'
                                                                                                + '<td>' + res[i].agencyname + '</td>'
                                                                                                + '<td>' + res[i].address + '</td>'
                                                                                                + '<td>' + res[i].district.districtname + '</td>'
                                                                                                + '</tr>';
                                                                                    }
                                                                                    $('#agencyTableBody').html(tb);
                                                                                }
                                                                                self.close();
                                                                            }).fail(function () {
                                                                                self.setContent('Something went wrong.');
                                                                            });
                                                                        }
                                                                    });
                                                                });
                                                            });

                                                            function gotoCaseManagement() {
                                                                var cn = $('#inputCaseNoRO').val();
                                                                window.location.href = "casemanagement.htm?icaseno=" + cn;
                                                            }


                                                            function sendEmail(formData) {
                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                var ck = 0;
                                                                $.confirm({
                                                                    content: function () {
                                                                        var self = this;
                                                                        return $.ajax({
                                                                            url: './sendemail.htm',
                                                                            method: 'POST',
                                                                            data: formData,
                                                                            processData: false,
                                                                            contentType: false,
                                                                            beforeSend: function (xhr) {
                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                            }
                                                                        }).done(function (response) {
                                                                            var res = JSON.parse(response);
                                                                            if (res.status === 1) {
                                                                                self.setTitle('Success!');
                                                                                self.setContent('Mail successfully sent to recipient.');
                                                                                ck = 1;
                                                                            } else {
                                                                                ck = 0;
                                                                                self.setTitle('Failed!');
                                                                                self.setContent('Failed to send mail to recipient.');
                                                                            }
                                                                        }).fail(function () {
                                                                            self.setTitle('');
                                                                            self.setContent('Something went wrong.');
                                                                        });
                                                                    },
                                                                    buttons: {
                                                                        close: {
                                                                            action: function () {
                                                                                if (ck === 0) {
                                                                                    window.location.reload();
                                                                                } else {
                                                                                    $('#woFollowupModal').modal('show');
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                });
                                                            }

                                                            function saveEmail(formData) {
                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                $.confirm({
                                                                    content: function () {
                                                                        var self = this;
                                                                        return $.ajax({
                                                                            url: './savereceivedemail.htm',
                                                                            method: 'POST',
                                                                            data: formData,
                                                                            processData: false,
                                                                            contentType: false,
                                                                            beforeSend: function (xhr) {
                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                            }
                                                                        }).done(function (response) {
                                                                            var res = JSON.parse(response);
                                                                            self.setContent(res.msg);
                                                                            self.setTitle(res.title);
                                                                        }).fail(function () {
                                                                            self.setTitle('');
                                                                            self.setContent('Something went wrong.');
                                                                        });
                                                                    },
                                                                    buttons: {
                                                                        close: {
                                                                            action: function () {
                                                                                window.location.reload();
                                                                            }
                                                                        }
                                                                    }
                                                                });
                                                            }

                                                            function getContactAgencyDetails(aid, aname) {
                                                                $('#agencyTableListBody').html('');
                                                                $('#agencyname').val(aname);
                                                                $('#magencydetailid').val(aid.trim());
                                                                $.confirm({
                                                                    content: function () {
                                                                        var self = this;
                                                                        return $.ajax({
                                                                            url: './getContactAgencyList.htm',
                                                                            data: 'magencyid=' + aid,
                                                                            method: 'GET'
                                                                        }).done(function (response) {
                                                                            var res = JSON.parse(response);
                                                                            //                                                                            console.log(res);
                                                                            var cont = '';
                                                                            for (var i = 0; i < res.length; i++) {
                                                                                cont += '<tr class="tbhover" onclick="setContactAgency(&quot;' + res[i].cagencydetailid + '&quot;)">'
                                                                                        + '<td>' + parseInt(i + 1) + '</td>'
                                                                                        + '<td>' + res[i].person_name + '</td>'
                                                                                        + '<td>' + res[i].designation + '</td>'
                                                                                        + '<td>' + res[i].mobile1 + '</td>'
                                                                                        + '<td>' + res[i].officephone1 + '</td>'
                                                                                        + '<td>' + res[i].mobile2 + '</td>'
                                                                                        + '<td>' + res[i].officephone2 + '</td>'
                                                                                        + '</tr>';
                                                                            }
                                                                            $('#agencyTableListBody').html(cont);
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
