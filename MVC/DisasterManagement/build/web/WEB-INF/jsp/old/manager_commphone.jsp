<%-- 
    Document   : manager_commphone
    Created on : 6 Dec, 2022, 4:31:59 PM
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
        <title>Communicate Through Phone</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container-fluid p-4">
            <form:form id="phoneConversationForm" autocomplete="off" enctype="multipart/form-data" modelAttribute="pcscreen">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="col-4">
                                    <div class="px-3">
                                        <div class="dialpad-display">
                                            <input type="text" id="usercode" value="<c:out escapeXml="true" value="${LOGIN.usercode}" />" class="form-control" readonly="true" />
                                            <input type="text" class="form-control" placeholder="Enter Number To Call" id="phoneInput" name="diallednumber" />
                                        </div>
                                        <div class="dialpad-buttons mt-2">
                                            <div class="d-flex flex-row justify-content-around">
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('1')">1</button>
                                                <button type="button" class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('2')">2</button>
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('3')">3</button>
                                            </div>
                                            <div class="d-flex flex-row justify-content-around">
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('4')">4</button>
                                                <button type="button" class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('5')">5</button>
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('6')">6</button>
                                            </div>
                                            <div class="d-flex flex-row justify-content-around">
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('7')">7</button>
                                                <button type="button" class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('8')">8</button>
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('9')">9</button>
                                            </div>
                                            <div class="d-flex flex-row justify-content-around">
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('*')">*</button>
                                                <button type="button" class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('0')">0</button>
                                                <button type="button" class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('#')">#</button>
                                            </div>

                                            <div class="d-flex flex-row justify-content-between">
                                                <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-75 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit">
                                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                                        <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                        <strong class="fw-bold ml-5">Call</strong>
                                                    </div>
                                                </button>
                                                <button id="terminateCallBtn" type="button" onclick="terminateCall();" class="d-none w-75 h-100 btn btn-danger mr-1 mb-2 text-white fw-bold btn-digit">
                                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                                        <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                        <strong class="fw-bold ml-5">Hangup</strong>
                                                    </div>
                                                </button>
                                                <button type="button" class="btn btn-default w-30 ml-auto mb-2 text-purple-hov fw-bold btn-digit" onclick="removenumtodial()"><i class="fa-solid fa-delete-left"></i></button>
                                            </div>

                                            <div class="d-flex flex-row justify-content-between h-100">
                                                <div class="call-display-timer text-dark w-100">
                                                    <div class="d-flex flex-column text-center justify-content-center align-items-center">
                                                        <p class="fw-bold mb-1" id="softphone-timer">00:00</p>
                                                        <div id="recordingIconContainer" class="blink d-none d-flex flex-column text-center justify-content-center align-items-center">
                                                            <i class="fa-solid fa-microphone" id="softphone-recorder"></i>
                                                            <small class="btn-digit-sub fw-normal text-dark" id="softphone-status">Recording</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="container">
                                                    <div id="controls d-flex align-items-center justify-content-center bg-primary">
                                                        <!--<img id="record" src="suantonsing/assets/mic128.png" onclick="toggleRecording(this);">-->
                                                        <a id="save" href="#"><img src="suantonsing/assets/save.svg" style="width:40px; height:40px" /></a>
                                                        <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                                                    </div>
                                                </div>
                                            </div>
                                            <audio id="remoteAudio"></audio>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="form-floating">
                                    <form:textarea rows="5" class="form-control" id="phoneConversationDetails" path="calldesc" required="true" style="height:100%;" placeholder="Phone Conversation Details (Required)"></form:textarea>
                                        <label for="phoneConversationDetails">Phone Conversation Details<span class="blink text-danger fw-bold">&nbsp;&nbsp;*</span></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <label for="callertype">Caller Type</label>
                                    <div class="callertype">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="callertyperadio" value="A" id="calleragencytype">
                                            <label class="form-check-label" for="calleragencytype">
                                                Agency
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="callertyperadio" value="C" id="casualtytype">
                                            <label class="form-check-label" for="casualtytype">
                                                Casualty
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card mb-3">
                                <div class="card-body">
                                    <div id="radioBasedDiv" class="d-none">
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
                                    </div>
                                    <div id="casualtyBlock">
                                        <div class="form-floating mb-3">
                                            <select class="form-select" id="selectCasualty" name="casualtytype" aria-label="Select Casualty">
                                                <option selected="true" disabled="true">Select Casualty</option>
                                                <c:forEach var="c" items="${casualytype}" varStatus="i">
                                                    <option value="${c.casualtyid}">${c.casualtydesc}</option>
                                                </c:forEach>
                                            </select>
                                            <label for="selectCasualty">Select Casualty</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-floating mb-3">
                                    <form:input type="text" class="form-control" id="inputRecipientName" path="recepientname" placeholder="Recipient Name" required="true" />
                                    <label for="inputRecipientName">Recipient Name&nbsp;&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                    <form:input type="hidden" id="id" path="call_logid" class="form-control" />
                                    <input type="hidden"  name="magencydetailid" id="magencydetailid" class="form-control"/>
                                </div>
                                <div class="form-floating mb-3">
                                    <form:input type="text" class="form-control" id="inputRecipientDesignation"  path="designation"  placeholder="Enter Designation" />
                                    <label for="inputRecipientDesignation">Designation</label>
                                    <form:input type="hidden" id="basic_casedetailsid" path="basic_casedetails.basic_caseid" class="form-control" value="${basic_casedetails.basic_caseid}"/>
                                    <input type="hidden" id="caseno"  class="form-control" value="${basic_casedetails.caseno}"/>
                                </div>
                                <div class="form-floating">
                                    <form:input type="text" class="form-control" id="inputCallStatus" path="call_status" placeholder="Call Status" />
                                    <label for="inputCallStatus">Call Status</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12 text-center">
                        <input type="submit" id="btnSaveConversation" class="btn btn-purple text-white my-4" value="Save Conversation" />
                    </div>
                </div>
            </form:form>

            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <%@include file="manager_casehistory.jsp" %>
                </div>
            </div>
        </div>

        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <script src="js/jssip-3.9.0.js" type="text/javascript"></script>
        <script src="js/recorder/recorder.js" type="text/javascript"></script>
        <script src="js/sipclients.js" type="text/javascript"></script>

        <script>
                                                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                                    $(document).ready(function () {
                                                        $('#calleragencytype').click(function () {
                                                            $('#radioBasedDiv').removeClass('d-none');
                                                            $('#agencyBlock').show();
                                                            $('#casualtyBlock').hide();
                                                        });
                                                        $('#casualtytype').click(function () {
                                                            $('#radioBasedDiv').removeClass('d-none');
                                                            $('#agencyBlock').hide();
                                                            $('#casualtyBlock').show();
                                                        });

                                                        $('#selectAgency').change(function () {
                                                            $('#agencyTableListBody').html('');
                                                            $('#agencyTableBody').html('');
                                                            $('#agencyname').val('');
                                                            var agencyid = $('#selectAgency').val();
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

                                                        $('#phoneConversationForm').submit(function (e) {
                                                            e.preventDefault();
                                                            var formData = new FormData($(this)[0]);
                                                            $.confirm({
                                                                content: function () {
                                                                    var self = this;
                                                                    return $.ajax({
                                                                        url: './savecommunicatethroughphone.htm',
                                                                        data: formData,
                                                                        method: 'POST',
                                                                        processData: false,
                                                                        contentType: false,
                                                                        beforeSend: function (xhr) {
                                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                        }
                                                                    }).done(function (response) {
                                                                        var res = JSON.parse(response);
                                                                        self.setContent(res.msg);
                                                                        if (res.status === 0) {
                                                                            self.setTitle('Failed!');
                                                                        } else {
                                                                            self.setTitle('Success!');
                                                                        }
                                                                    }).fail(function () {
                                                                        self.setContent('Something went wrong.');
                                                                    });
                                                                }
                                                            });
                                                        });
                                                    });

                                                    function getContactAgencyDetails(aid, aname) {
//                                                        console.log(aid);
//                                                        console.log(aname);
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
//                                                                    console.log(res);
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
