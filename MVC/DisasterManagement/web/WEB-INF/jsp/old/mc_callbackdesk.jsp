<%-- 
    Document   : mc_callbackdesk
    Created on : 22, 2023, 3:23:28 PM
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
        <title>Call Back Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style>
            .rowclick {
                cursor: pointer;
            }
            .mycontainer{
                padding: 8px;
                margin: 0px;
                border:1px solid #E0E0E0;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="scrollcontainer">
                        <div class="container">
                            <div class="card mt-4">
                                <div class="card-header bg-purple text-center"><h4 class="text-white py-2">Call Back Desk</h4></div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <table class="table table-bordered table-striped dataTable" id="missedCallTable">
                                                <thead>
                                                    <tr>
                                                        <th colspan="4" class="text-center">List Of Missed Calls</th>
                                                    </tr>
                                                    <tr>
                                                        <th>Sl No.</th>
                                                        <th>Phone No.</th>
                                                        <th>Call Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="m" items="${missedcalls}" varStatus="i">
                                                        <tr>
                                                            <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                            <td><c:out escapeXml="true" value="${m.phoneno}" /></td>
                                                            <td><c:out escapeXml="true" value="${m.call_date}" /></td>
                                                            <td><button class="btn btn-secondary" id="actionCall" onclick="forwardmissedcallnumber(
                                                                            '<c:out escapeXml="true" value="${m.phoneno}"/>'
                                                                            )">&nbsp;Call&nbsp;</button></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="px-3">
                                                <div class="bg-light mb-2 p-2 text-center">
                                                    Make General Phone calls (Not related with any case)
                                                </div>
                                                <div class="dialpad-display">
                                                    <input type="text" id="usercode" value="<c:out escapeXml="true" value="${LOGIN.usercode}" />" class="form-control" readonly="true" />
                                                    <input type="text" class="form-control" placeholder="Enter Number To Call" id="phoneInput" name="complainantphoneno"/>
                                                </div>
                                                <div class="dialpad-buttons mt-2">
                                                    <div class="d-flex flex-row justify-content-around">
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('1')">1</button>
                                                        <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('2')">2</button>
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('3')">3</button>
                                                    </div>
                                                    <div class="d-flex flex-row justify-content-around">
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('4')">4</button>
                                                        <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('5')">5</button>
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('6')">6</button>
                                                    </div>
                                                    <div class="d-flex flex-row justify-content-around">
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('7')">7</button>
                                                        <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('8')">8</button>
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('9')">9</button>
                                                    </div>
                                                    <div class="d-flex flex-row justify-content-around">
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('*')">*</button>
                                                        <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('0')">0</button>
                                                        <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('#')">#</button>
                                                    </div>

                                                    <div class="d-flex flex-row justify-content-between">
                                                        <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-75 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit" disabled="true">
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
                                                        <button class="btn btn-default w-30 ml-auto mb-2 text-purple-hov fw-bold btn-digit" onclick="removenumtodial()"><i class="fa-solid fa-delete-left"></i></button>
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
                                                        <!--                                                    <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-100 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit">
                                                                                                                <div class="d-flex flex-row justify-content-around align-items-center">
                                                                                                                    <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                                                                    <strong class="fw-bold ml-5">Call</strong>
                                                                                                                </div>
                                                                                                            </button>
                                                                                                            <button id="terminateCallBtn" type="button" onclick="terminateCall();" class="d-none w-100 h-100 btn btn-danger mr-1 mb-2 text-white fw-bold btn-digit">
                                                                                                                <div class="d-flex flex-row justify-content-around align-items-center">
                                                                                                                    <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                                                                    <strong class="fw-bold ml-5">Hangup</strong>
                                                                                                                </div>
                                                                                                            </button>-->
                                                        <!--<button type="button" class="btn btn-primary ml-1 mb-2 text-white fw-bold btn-digit">-->
                                                        <!--<div class="d-flex flex-column">-->
                                                        <!--<i class="fa-solid fa-right-left"></i>-->
                                                        <!--<small class="btn-digit-sub fw-normal">Transfer</small>-->
                                                        <!--</div>-->
                                                        <!--</button>-->

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

                                    </div>
                                </div>
                                <div id="callbackdesktitle" class="mt-3 d-none">
                                    <div class="card">
                                        <div class="card-header bg-purple">
                                            <h4 class="text-white text-center fw-bold font-size-lg">Call Back Desk Form</h4>
                                        </div>
                                    </div>
                                    <div class="card mt-3 mb-3">
                                        <div class="card-header">
                                            <h5 class="fw-bold font-size-lg">Call Type</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="d-flex align-items-center">
                                                <input type="radio" name="calltype" id="calltypevalid" checked value="1"/>&nbsp;<label class="fw-bold" for="calltypevalid">Valid Call</label>
                                                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
                                                <input type="radio" name="calltype" id="calltypemisc" value="2"/>&nbsp;<label class="fw-bold" for="calltypemisc">Miscellaneous Calls</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="callBackFormContainer" class="mt-3 d-none">
                                    <form:form modelAttribute="complainantdetails"  method="POST" name="callbackdesk" id="callbackdeskform" autocomplete="off" enctype="multipart/form-data">
                                        <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                                        <div id="survivordiv">
                                            <!--<div class="container mt-3 mb-2">-->
                                            <table class='table table-striped table-bordered'>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Recipient name <span class="blink text-danger">*</span>
                                                    </td>
                                                    <td>
                                                        <form:input path="callername" type="text" required="true" class="form-control azAzSPC text-capitalize" id="callername"/>
                                                        <!--                                            <input type="checkbox" name="callersurvivor" id="callersurvivorid"  />Caller is survivor-->
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Recipient is Survivor?
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <input type="radio" name="callersurvivor" id="radioYes" value="Y"/>&nbsp;<label for="radioYes">Yes</label>
                                                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
                                                            <input type="radio" name="callersurvivor" id="radioNo" checked="true" value="N"/>&nbsp;<label for="radioNo">No</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Name of Survivor 
                                                    </td>
                                                    <td class="text-center">
                                                        <form:input path="survivorname" type="text" class="form-control azAzSPC" id="inputSurvivor" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Survivor's Age 
                                                    </td>
                                                    <td>
                                                        <form:input type="text" path="survivorage" class="form-control onlyDigits ageValid"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Survivor's Address 
                                                    </td>
                                                    <td>
                                                        <form:textarea path="survivoraddress" id="survivoraddress" class="form-control" rows="3" maxlength="2000" ></form:textarea>
                                                            <label id="survivorlenerr" class="error"></label>
                                                            <br> <label id="saddsize"></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="fw-bold">
                                                            District <span class="blink text-danger">*</span>
                                                        </td>
                                                        <td>
                                                        <form:select class="form-control" path="district.districtcode" id="inputDistrict">                                    
                                                            <form:option value="" disabled="true" selected="true">Select District</form:option>
                                                            <c:forEach items="${districts}" var="d">
                                                                <c:if test="${d.districtcode!=0}">
                                                                    <form:option value="${d.districtcode}" ><c:out value="${d.districtname}"></c:out></form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        City / Village 
                                                    </td>
                                                    <td>
                                                        <form:input path="city_village" type="text" class="form-control" id="inputCityVillage" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Police Station
                                                    </td>
                                                    <td>
                                                        <form:select class="form-control" path="policestation.policestationcode" id="inputPolicestation">
                                                            <form:option value="" disabled="true" selected="true">Select District First</form:option>
                                                        </form:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold">
                                                        Marital Status
                                                    </td>
                                                    <td>
                                                        <form:select class="form-control" path="m_marital_status.maritalstatusid" id="inputMaritalStatus">                                    
                                                            <form:option value="" disabled="true" selected="true">Select </form:option>
                                                            <c:forEach var="st" items="${m_marital_list}">
                                                                <c:if test="${st.maritalstatusid!=0}">
                                                                    <form:option value="${st.maritalstatusid}" ><c:out value="${st.maritalstatusdesc}"></c:out></form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fw-bold"><label id="lbl"></label>Case description <span class="blink text-danger">*</span></td>
                                                    <td>
                                                        <textarea type="text" name="casedescription" id="casedescription" style="width:100%;" rows="7" cols="50" class="form-control form-control-lg" maxlength="2000"></textarea>
                                                        <label id="cderror" class="error"></label>
                                                        <br> <label id="cdsize"></label>
                                                    </td>
                                                </tr>

                                            </table>
                                            <!--</div>-->
                                            <input type="hidden" id="oldCaseBtn" type="button" class="btn btn-secondary text-white btn-block" data-bs-toggle="modal" data-bs-target="#oldCaseModal" style="width: 100%" disabled="true"/>
                                            <div class="container mt-4">
                                                <center>
                                                    <input type="submit" id="btnSave" value="Register as New Case" class="btn btn-lg btn-primary btn-block" style="width:50%"/>
                                                    <input type="button" id="btnOldCase" value="Old Case" class="btn btn-lg btn-pink btn-block mt-3" style="width:50%"/>
                                                </center>
                                            </div>
                                            <br>
                                        </div>
                                    </form:form>
                                </div>

                                <form:form id="miscForm" modelAttribute="oldcase" method="POST" autocomplete="off" enctype="multipart/form-data">
                                    <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                                    <div id="call_listdiv" class="mb-2">
                                        <!--<div class="container mt-3 mb-2">-->
                                        <div class="row mycontainer">
                                            <div class="col">
                                                <b>Select Miscellaneous Call&nbsp;</b>
                                            </div>
                                            <div class="col">
                                                <form:select class="form-control" id="inputCallList" path="m_call.callid">
                                                    <form:option value="" disabled="true" selected="true">Select Call</form:option>
                                                    <c:forEach var="c" items="${mcall_list}" varStatus="i">
                                                        <c:if test="${c.callid!='0' && c.callid!='5' && c.callid!='6' && c.callid!='7'&& c.callid!='8' && c.callid!='9'}">
                                                            <form:option value="${c.callid}"><c:out value="${c.calldesc}"></c:out></form:option> 
                                                        </c:if>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </div>
                                        <!--</div>-->
                                        <!--<div class="container mt-3 mb-2">-->    
                                        <div id="casedescdiv">
                                            <table class='table table table-bordered '>
                                                <tr>
                                                    <td class="fw-bold"><label id="lbl"></label>Call description <span class="blink text-danger d-none" id="blinkContainer">*</span></td>

                                                    <td>
                                                        <form:textarea path="calldesc" type="text" name="casedescription" id="misc_calldescription" style="width:100%;" rows="4" cols="50" class="form-control form-control-lg" maxlength="2000"></form:textarea>
                                                            <label id="cderror" class="error"></label>
                                                            <br> <label id="cdsize"></label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <!--</div>-->
                                            <input type="hidden" id="mcallid" name="mcallid"/>
                                            <!--<input type="hidden" id="detaildeskid" name="detaildesk"/>-->
                                            <div class="container mt-4"><center><input type="submit" id="btnSaveMisc" value="Save" class="btn btn-lg btn-primary btn-block" style="width:50%"/></center></div><br>
                                        </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
            <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
            <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/manager_scripts.js" type="text/javascript"></script>
            <script src="suantonsing/js/coordinator_scripts.js" type="text/javascript"></script>
            <script src="js/jssip-3.9.0.js" type="text/javascript"></script>
            <script src="js/recorder/recorder.js" type="text/javascript"></script>
            <script src="js/sipclients.js" type="text/javascript"></script>
            <script>
                                                            $(document).ready(function () {
                                                                $('#closedCaseTable').DataTable({});
                                                                $('#missedCallTable').DataTable({
                                                                    info: false,
                                                                    "bFilter": false,
                                                                    "bLengthChange": false,
                                                                    lengthMenu: [
                                                                        [10],
                                                                        [10],
                                                                    ],
                                                                });

                                                                //                                                            $("body").on('change', '#phoneInput', function () {
                                                                //                                                                var phn = $('#phoneInput').val();
                                                                //                                                                if (phn.length > 1) {
                                                                //                                                                    $('#makeCallBtn').removeAttr('disabled');
                                                                //                                                                } else {
                                                                //                                                                    $('#makeCallBtn').attr('disabled', 'disabled');
                                                                //                                                                }
                                                                //                                                            });

                                                                //                                                            $('#phoneInput').on('change', function () {
                                                                //                                                                var phn = $('#phoneInput').val();
                                                                //                                                                if (phn.length > 1) {
                                                                //                                                                    $('#makeCallBtn').removeAttr('disabled');
                                                                //                                                                } else {
                                                                //                                                                    $('#makeCallBtn').attr('disabled', 'disabled');
                                                                //                                                                }
                                                                //                                                                $(this).val(phn).trigger('change');
                                                                //                                                            });
                                                                $('input.iemail').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z0-9\-_@.]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z\-_@.]*$/, '');
                                                                    }
                                                                });

                                                                $("#casedescription").keyup(function (e) {
                                                                    var len = $("#casedescription").val().length;
                                                                    $("#cdsize").text("Characters left: " + (2000 - len));
                                                                    if (len === 2000) {
                                                                        $("#cdenerr").html("Reach maximum. Cannot add more");
                                                                    } else {
                                                                        $("#cdenerr").html("");
                                                                    }
                                                                });
                                                                $('input.azAzSPC').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z \s]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z \s]*$/, '');
                                                                    }
                                                                });
                                                                $('input.onlyDigits').keyup(function () {
                                                                    if (this.value.match(/[^0-9 \s]/)) {
                                                                        this.value = this.value.replace(/[^0-9 \s]*$/, '');
                                                                    }
                                                                });

                                                                $('input:radio[name="callersurvivor"]').change(
                                                                        function () {
                                                                            var cn = document.getElementById('callername').value;
                                                                            if (this.checked && this.value === 'Y') {
                                                                                document.getElementById('inputSurvivor').value = cn;
//                                                                document.getElementById('inputSurvivor').innerHTML = document.getElementById('callername').value;
                                                                            } else {
                                                                                document.getElementById('inputSurvivor').value = "";
                                                                            }
                                                                        });

                                                                $('#phoneInput').on('change', function () {
                                                                    var phn = $(this).val();
                                                                    if (phn.length > 1) {
                                                                        $('#makeCallBtn').removeAttr('disabled');
//                                                                        $("#callBackFormContainer").removeClass('d-none');
                                                                    } else {
                                                                        $('#makeCallBtn').attr('disabled', 'disabled');
//                                                                        $("#callBackFormContainer").addClass('d-none');
                                                                    }
                                                                });

                                                                $('#actionCall').click(function () {
                                                                    $('#callBackFormContainer').removeClass('d-none');
                                                                    $('#callbackdesktitle').removeClass('d-none');
                                                                });

                                                                $("#phoneInput").on("input", function () {
                                                                    if ($(this).val() === "") {
                                                                        $("#callBackFormContainer").addClass('d-none');
                                                                        $("#callbackdesktitle").addClass('d-none');
                                                                    } else {
                                                                        $("#callBackFormContainer").removeClass('d-none');
                                                                        $("#callbackdesktitle").removeClass('d-none');
                                                                    }
                                                                });

                                                                $('#call_listdiv').hide();
//                                                                $('#call_listoperatordiv').hide();
                                                                $('input[type="radio"]').click(function () {
                                                                    if ($(this).attr('id') === 'calltypemisc') {
                                                                        $('#callBackFormContainer').hide();
                                                                        $('#call_listdiv').show();
                                                                        $('#callername').removeAttr('required');
                                                                        $('#inputDistrict').removeAttr('required');
                                                                    } else if ($(this).attr('id') === 'calltypevalid') {
                                                                        $('#callBackFormContainer').show();
                                                                        $('#call_listdiv').hide();
                                                                        $('#callername').attr('required', true);
                                                                        $('#inputDistrict').attr('required', true);
                                                                    }
                                                                });

                                                                $('#inputCallList').on('change', function () {
                                                                    var selectedValue = $('#inputCallList').val();
                                                                    if (selectedValue === '4') {
                                                                        $('#misc_calldescription').prop('required', true);
                                                                        $('#blinkContainer').removeClass('d-none');
                                                                    } else {
                                                                        $('#misc_calldescription').prop('required', false);
                                                                        $('#blinkContainer').addClass('d-none');
                                                                    }
                                                                });

                                                                $('#inputDistrict').change(function () {
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                url: './getpolicestationfromdistrict.htm',
                                                                                data: 'districtcode=' + $('#inputDistrict').val(),
                                                                                method: 'get'
                                                                            }).done(function (response) {
                                                                                var ps = JSON.parse(response);
                                                                                //                                                                var ps = JSON.parse(res.policestation);
                                                                                var markup = "<option value=''>Select</option>"
                                                                                for (var i = 0; i < ps.length; i++) {
                                                                                    markup += "<option value=" + ps[i].policestationcode + ">" + ps[i].policestation + "</option>";
                                                                                }
                                                                                $('#inputPolicestation').html(markup);
                                                                                self.close();
                                                                            }).fail(function () {
                                                                                self.setContent('Something went wrong.');
                                                                            });
                                                                        }
                                                                    });
                                                                });

                                                                $("#callbackdeskform").submit(function (e) {
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    var phn = $('#phoneInput').val();
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: 'POST',
                                                                                url: "./savecallbackdeskform.htm?complainantphoneno=" + phn,
                                                                                data: formData,
                                                                                processData: false,
                                                                                contentType: false
                                                                            }).done(function (response) {
                                                                                if (response !== '-1') {
                                                                                    self.setTitle("Success");
                                                                                    self.setContent("Details Saved Successfully. With New Case No: " + response);
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
                                                                                    $("#callbackdeskform").trigger("reset");
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });

                                                                $("#miscForm").submit(function (e) {
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    var callerno = $('#callerno').val();
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: 'POST',
                                                                                url: "./savemiscform.htm?callerno=" + callerno,
                                                                                data: formData,
                                                                                processData: false,
                                                                                contentType: false
                                                                            }).done(function (response) {
                                                                                console.log(response);
                                                                                if (response !== '-1') {
                                                                                    self.setTitle("Success");
                                                                                    self.setContent("Details Saved Successfully.");
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
                                                                                    $("#miscForm").trigger("reset");
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });
                                                            });

                                                            function loadCaseList(centreid, closuretypeid) {
                                                                //                                                    alert(centreid);
                                                                //                                                    alert(closuretypeid);

                                                                //                                                    $.confirm({
                                                                //                                                        content: function () {
                                                                //                                                            var self = this;
                                                                //                                                            return $.ajax({
                                                                //                                                                url: './getclosurelistbyclosuretype.htm',
                                                                //                                                                data: 'centreid=' + centreid + '&closuretypeid=' + closuretypeid,
                                                                //                                                                method: 'GET'
                                                                //                                                            }).done(function (response) {
                                                                //                                                                console.log(response);
                                                                //                                                                self.close();
                                                                //                                                            }).fail(function () {
                                                                //                                                                self.setTitle('');
                                                                //                                                                self.setContent('Something went wrong.');
                                                                //                                                            });
                                                                //                                                        }
                                                                //                                                    });

                                                            }
            </script>
    </body>
</html>
