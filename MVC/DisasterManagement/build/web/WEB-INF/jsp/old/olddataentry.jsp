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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Old Data Entry</title>
        <sec:csrfMetaTags />
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .mycontainer{
                padding: 8px;
                margin: 3px;
                border:1px solid #E0E0E0;
            }
            #casehist {
                max-height: 420px;
                overflow: auto;
            }

            .cdt {
                width: 120px;
            }
            .btnhc {
                width: 120px;
            }
            .btnimg {
                margin-right: 20px;
                width: 35px;
                height: 35px;
            }

            .clickable {
                cursor: pointer;
                font-weight: bold;
                text-decoration: underline;
            }

            /*css for toggle*/
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
                float: right;
            }

            .switch input {
                display: none;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: gray;
                border-radius: 34px;
                transition: background-color 0.2s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                border-radius: 50%;
                transition: transform 0.2s;
            }

            input:checked + .slider {
                background-color: green;
            }

            input:checked + .slider:before {
                transform: translateX(26px);
            }

            #toggle-text{
                font-weight: bold;
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
                    <!-- DO NOT REMOVE OR COMMENT START -->
<!--                    <input type="text" value="${LOGIN.sipline}" id="usercode" class="form-control" readonly="true" />
                    <input type="text" id="callernumber" class="form-control" readonly="true" />
                    <audio id="remoteAudio"></audio>-->
                    <!--                    <div class="container mb-4">
                                            <div class="row mb-4">
                                                <div class="col-sm-3">
                                                    <div class="px-3">
                                                        <div class="dialpad-display">
                                                            <div class="mt-2">
                                                                <span id="toggle-text">Ready To Take Call</span>
                                                                <label class="switch mb-2">
                                                                    <input type="checkbox" id="toggle-switch" checked>
                                                                    <span class="slider"></span>
                                                                </label>
                                                            </div>
                                                            <input type="text" id="usercode" value="<c:out escapeXml="true" value="${LOGIN.usercode}" />" class="form-control" readonly="true" />
                                                            <div class="d-flex flex-row justify-content-between">
                                                                <input type="text" class="form-control" readonly="true" placeholder="Enter Number To Call" id="phoneInput" />
                                                                <button class="btn btn-outline-secondary" onclick="clearRecentPhone();">Clear</button>
                                                            </div>
                                                        </div>
                                                        <div class="dialpad-buttons mt-2">
                                                            <div class="d-flex flex-row justify-content-around">
                                                            </div>
                    
                                                            <div class="d-flex flex-row justify-content-between">
                                                                <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-100 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit">
                                                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                                                        <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                        <strong class="fw-bold ml-5">Call Back</strong>
                                                                    </div>
                                                                </button>
                                                                <button id="terminateCallBtn" type="button" onclick="terminateCall();" class="d-none w-100 h-100 btn btn-danger mr-1 mb-2 text-white fw-bold btn-digit">
                                                                    <div class="d-flex flex-row justify-content-center align-items-center">
                                                                        <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                        <strong class="fw-bold ml-5">Hangup</strong>
                                                                    </div>
                                                                </button>
                                                            </div>
                    
                                                            <div class="d-flex flex-row justify-content-between h-100">
                                                                <div class="call-display-timer text-dark cdt">
                                                                    <div class="d-flex flex-column text-center justify-content-center align-items-center">
                                                                        <p class="fw-bold mb-1" id="softphone-timer">00:00</p>
                                                                        <div id="recordingIconContainer" class="blink d-none d-flex flex-column text-center justify-content-center align-items-center">
                                                                            <i class="fa-solid fa-microphone" id="softphone-recorder"></i>
                                                                            <small class="btn-digit-sub fw-normal text-dark" id="softphone-status">Recording</small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                                                                    <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-100 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit">
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
                                                                                                                    </button>
                                                                <button type="button" class="btn btn-primary ml-1 mb-2 text-white fw-bold btn-digit">
                                                                <div class="d-flex flex-column">
                                                                <i class="fa-solid fa-right-left"></i>
                                                                <small class="btn-digit-sub fw-normal">Transfer</small>
                                                                </div>
                                                                </button>
                    
                                                                <i class="fa-solid fa-circle-pause"></i>
                                                                <i class="fa-solid fa-circle-play"></i>
                    
                                                                <div class="container">
                                                                <button id="holdCall" class="btn btn-warning btnhc" disabled="disabled" onclick="holdcall();"><i id="holdIcon" class="fa-solid fa-circle-pause"></i>&nbsp;<span id="holdBtnTxt">Hold Call</span></button>
                                                                </div>
                                                            </div>
                                                            <div class="container mt-2">
                                                                <div id="controls d-flex align-items-center justify-content-center">
                                                                    <img id="record" src="suantonsing/assets/mic128.png" onclick="toggleRecording(this);">
                                                                    <a class="btn btn-outline-success" id="save" href="#"><img src="suantonsing/assets/save.svg" style="width:40px; height:40px" /></a>
                                                                </div>
                                                            </div>
                                                            <audio id="remoteAudio"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-9">
                                                    <table id="cllHist" class="table table-bordered table-striped dataTable">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="5" class="text-center">Calls Received By This Operator</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Sl. No.</th>
                                                                <th>Date &amp; Time</th>
                                                                <th>Phone No.</th>
                                                                <th>Call Type</th>
                                                                <th>Disposition</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="cllHistBody">
                    <%--<c:forEach items="${call_history}" varStatus="x" var="c">--%>
                        <tr>
                            <td>
                    <%--<c:choose>--%>

                    <%--<c:when test="${x.count == 1}">--%>
                        <span class="d-flex justify-content-between">
                    <%--<c:out escapeXml="true" value="${x.count}"/>--%>
                    <button onclick="callbacknum(<c:out escapeXml="true" value="${c.phoneno}"/>);" type="button" class="btn btn-sm btn-outline-secondary"><span class="">Call Back</span></button>
                </span>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                    <%--<c:out escapeXml="true" value="${x.count}"/>--%>
                    <%--</c:otherwise>--%>
                    <%--</c:choose>--%>
                </td>
                <td>
                    <%--<fmt:formatDate type="both" timeStyle="short" dateStyle="medium" pattern="dd, MMM yyyy - hh:mm a" value="${c.call_date}" />--%>
                </td>
                <td>
                    <%--<c:out escapeXml="true" value="${c.phoneno}" />--%>
                </td>
                <td>
                    <%--<c:out escapeXml="true" value="${c.m_calltype.calltypedesc}" />--%>
                </td>
                <td>
                    <%--<c:out escapeXml="true" value="${c.m_call.calldesc}" />--%>
                </td>
            </tr>
                    <%--</c:forEach>--%>
                </tbody>
            </table>
        </div>
    </div>
</div>-->
                    <!-- DO NOT REMOVE OR COMMENT END -->

                    <div class="mt-4" style="height: 20px"></div>

                    <!--<div class="scrollcontainer">-->
                    <form:form modelAttribute="operator" method="POST" name="operatordesk" id="operatordeskform" autocomplete="off" enctype="multipart/form-data">
                        <div class="container mt-3 mb-2">
                            <div class="card">
                                <div class="card-header bg-purple">
                                    <h4 class="text-white text-center fw-bold font-size-lg">Old Data Entry Desk</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <form:input path="complainantphoneno" name="callerno" type="text" class="form-control text-black onlyDigits" id="callerno" placeholder="Phone no" maxlength="10"/>
                                        </div>
                                        <div class="col-md-3">
                                            <!--                                            <button type="button" class="btn btn-success text-white btn-block" data-bs-toggle="modal" data-bs-target="#callHistoryModal" style="width: 100%" onclick="callHistoryTable()">
                                                                                            Call History
                                                                                        </button>-->
                                            <button id="oldCaseBtn" type="button" class="btn btn-secondary text-white btn-block" data-bs-toggle="modal" data-bs-target="#oldCaseModal" style="width: 100%" disabled="true">
                                                Old Case
                                            </button>
                                        </div>
                                        <div class="col-md-3">
                                            <button id="emerCaseBtn" class="btn btn-danger text-white btn-block w-100" disabled="true" type="button" data-bs-toggle="modal" data-bs-target="#emergencyCaseModal">
                                                Emergency Case
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                        <div class="container mt-3 mb-2">   
                            <div class="card mt-3">
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
                        <div id="survivordiv">
                            <div class="container mt-3 mb-2">
                                <table class='table table-striped table-bordered '>
                                    <tr>
                                        <td class="fw-bold">
                                            Desk <span class="blink text-danger">*</span>
                                        </td>
                                        <td>
                                            <select class="form-control" name="deskid" id="inputDesk">                                    
                                                <option value="" disabled="true" selected="true">Select Desk</option>
                                                <c:forEach items="${desk_list}" var="d">
                                                    <c:if test="${d.deskid!=0}">
                                                        <option value="${d.deskid}" ><c:out value="${d.deskdesc}"></c:out></option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">
                                            Name of Caller <span class="blink text-danger">*</span>
                                        </td>
                                        <td>
                                            <form:input type="text" path="callername" required="true" class="form-control azAzSPC" id="callername"/>
                                            <!--                                            <input type="checkbox" name="callersurvivor" id="callersurvivorid"  />Caller is survivor-->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">
                                            Caller is Survivor?
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
                                            <form:input type="text" path="survivorname" class="form-control azAzSPC" id="inputSurvivor" />
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
                                                Incident District <span class="blink text-danger">*</span>
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
                                            Incident Block
                                        </td>
                                        <td>
                                            <form:select class="form-control" path="block.blockcode" id="inputBlock">
                                                <form:option value="" disabled="true" selected="true">Select District First</form:option>
                                            </form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">
                                            Incident Police Station
                                        </td>
                                        <td>
                                            <form:select class="form-control" path="policestation.policestationcode" id="inputPolicestation">
                                                <form:option value="" disabled="true" selected="true">Select District First</form:option>
                                            </form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fw-bold">
                                            Incident Location 
                                        </td>
                                        <td>
                                            <form:input type="text" id="locationid" path="incidentlocation" class="form-control"/>
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
                                            <textarea type="text" name="casedescription" id="casedescription" style="width:100%;" rows="4" cols="50" class="form-control form-control-lg" maxlength="2000"></textarea>
                                            <label id="cderror" class="error"></label>
                                            <br> <label id="cdsize"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Case Date&nbsp;</td>
                                        <td><input type="date" class="form-control" name="calldate" id="inputIncidentCaseDate" placeholder="Case Date" onclick="getMaxCurrentDate()"/></td>
                                    </tr>

                                </table>
                            </div>
                            <!--                            <div class="container px-5 mt-3 mb-2">    
                                                            <div id="casedescdiv">
                                                                <table class='table table table-bordered ' >
                                                                    <tr>
                                                                        <td class="fw-bold"><label id="lbl"></label>Case description <span class="blink text-danger">*</span></td>
                                                                        <td>
                                                                            <textarea type="text" name="casedescription" id="casedescription" style="width:100%;" rows="4" cols="50" class="form-control form-control-lg" maxlength="2000"></textarea>
                                                                            <label id="cderror" class="error"></label>
                                                                            <br> <label id="cdsize"></label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>-->
                            <input type="hidden" id="mcallid" name="mcallid"/>
                            <!--<input type="hidden" id="detaildeskid" name="detaildesk"/>-->
                            <div class="container mt-4">
                                <center>
                                    <input type="submit" id="btnSave" value="Save" class="btn btn-lg btn-primary btn-block" style="width:50%"/>
                                </center>
                            </div>
                            <br>
                        </div>
                        <input type="hidden" id="mcallid" name="mcallid"/>
                        <!--<input type="hidden" id="detaildeskid" name="detaildesk"/>-->
                    </form:form>
                    <!--</div>-->
                    <form:form id="miscForm" modelAttribute="oldcase" method="POST" autocomplete="off" enctype="multipart/form-data">
                        <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                        <div id="call_listdiv" class="mb-2">
                            <div class="container mt-3 mb-2">
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
                            </div>

                            <div class="container mt-3 mb-2">    
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
                                </div>
                                <div class="container mt-3 mb-2">
                                    <div class="row mycontainer">
                                        <div class="col">
                                            <b>Select Date&nbsp;</b>
                                        </div>
                                        <div class="col">
                                            <input type="date" class="form-control" name="calldate" id="inputIncidentCaseDate2" placeholder="Case Date" onclick="getMaxCurrentDate()"/>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="mcallid" name="mcallid"/>
                                <!--<input type="hidden" id="detaildeskid" name="detaildesk"/>-->
                                <div class="container mt-4"><center><input type="submit" id="btnSaveMisc" value="Save" class="btn btn-lg btn-primary btn-block" style="width:50%"/></center></div><br>
                            </div>
                    </form:form>

                    <!-- Modal for old case screen START-->
                    <form:form method="POST" id="oldcaseform" modelAttribute="oldcase" autocomplete="off" enctype="multipart/form-data">
                        <div class="modal fade" id="oldCaseModal" tabindex="-1" aria-labelledby="operatorModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content">
                                    <div class="modal-header bg-purple-hov">
                                        <h5 class="modal-title fw-bold text-white" id="operatorModalLabel">Old Case Screen</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        <!--                                        <button type="button" class="btn btn-success float-right" data-bs-target="#" id='apptRequest'>Appointment Request</button>-->
                                    </div>
                                    <div class="modal-body">
                                        <div class="container" id="modal-content">
                                            <div class="row">
                                                <div class="d-flex justify-content-between">
                                                    <div class="card col-md-6">
                                                        <div class="card-header">
                                                            <h5 class="fw-bold text-center font-size-lg">Old Case Details</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <label for="inputCaseNo" class="form-label fw-bold">Case No(s) where currently calling number matches with Caller number/Survivor's Contact number</label>
                                                            <select class="form-select" aria-label="Select" id="inputCaseNo">  
                                                                <option selected>Select Case No</option>
                                                                <c:set var="i" value="0"></c:set>
                                                                <c:forEach items="${distcaseno}" var="c" varStatus="status">
                                                                    <option value="${distcaseno[i]}">${distcaseno[i]}</option>
                                                                    <c:set var="i" value="${i+1}"></c:set>
                                                                </c:forEach>
                                                            </select>
                                                            <div class="col mb-3 fw-bold mt-2" style="background-color: #EBDDE2;font-family: 'Baskervville', serif;">
                                                                <center>OR &nbsp;<span class="blink text-danger">*</span></center>
                                                            </div>
                                                            <label for="txtcaseno">Please enter Case No</label>
                                                            <input type="text" class="form-control" id="txtcaseno" name="txtcaseno"/>
                                                            <div class="d-flex justify-content-center mb-4 mt-4">
                                                                <!--<button type="button" id="showlog" class="btn btn-success btn-block" style="width:60%">Show Log</button>-->
                                                                <input type="button" id="showlog" value="Show Log" class="btn btn-success btn-block" style="width:60%">
                                                            </div>
                                                            <div class="mb-2 mt-4">
                                                                <div class="col fw-bold" style="background-color: #EBDDE2;font-family: 'Baskervville', serif;">
                                                                    <center>Case History</center>
                                                                </div>
                                                            </div>
                                                            <div class="mb-2" id="casehist">
                                                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                                    <li class="nav-item" role="presentation">
                                                                        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Basic Case Details</a>
                                                                    </li>
                                                                    <li class="nav-item" role="presentation">
                                                                        <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Log Details</a>
                                                                    </li>
                                                                </ul>
                                                                <div class="tab-content" id="myTabContent">
                                                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"></div>
                                                                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="card col-md-6">
                                                        <div class="card-header">
                                                            <h5 class="text-center fw-bold font-size-lg">Conversation Details</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="col-md-12 mb-2 fw-bold">
                                                                <label for="inputcallerno">Caller's Number &nbsp;<span class="blink text-danger">*</span></label>
                                                                <form:input type="text" path="phoneno" id="inputcallerno" class="form-control" required="true"/>
                                                            </div>
                                                            <div class="row mb-2">
                                                                <div class="col-md-12 mb-2 fw-bold">
                                                                    <label for="">Caller's Name &nbsp;<span class="blink text-danger">*</span></label>
                                                                    <div id="dispdivcallernameselect">
                                                                        <form:select id="callernameidselect" class="form-control" path="recepientname">
                                                                            <c:forEach var="c" items="${callog}" varStatus="i">
                                                                                <c:if test="${c.recepientname!=check}">
                                                                                    <c:if test="${c.recepientname!=null}">
                                                                                        <form:option value="${c.recepientname}">${c.recepientname}</form:option>
                                                                                        <c:set var="check" value="${c.recepientname}"></c:set>
                                                                                    </c:if>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </form:select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <input type="checkbox" name="unknownno" id="unknownno" />
                                                                    <label for="unknownno">Check to enter name</label>
                                                                    <div id="dispdivcallername" style="display:none">
                                                                        <input type="hidden" class="form-control" id="callername" data-validation="required" />
                                                                        <form:input path="recepientname" type="text" class="form-control" id="callernameunknown" data-validation="required"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mb-4">
                                                                <div class="row">
                                                                    <div class="col-md-6 fw-bold">
                                                                        <label>Caller Type:</label>
                                                                    </div>
                                                                    <div class="col-md-6 d-flex justify-content-between" id="radios">
                                                                        <label class="radio-inline">
                                                                            <form:radiobutton path="callertype" id="selectcallertype" value="Agency_type"/> Agency Type 
                                                                        </label>
                                                                        <label class="radio-inline">
                                                                            <form:radiobutton path="callertype" id="selectcallertype" value="Casualty_type"/> Casualty type<br>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <!--AJAX Start-->
                                                            <div class="mb-2" id="agencycasualty">
                                                                Agency or Casualty container 
                                                            </div>
                                                            <!--AJAX End--> 

                                                            <div class="mb-4 fw-bold">
                                                                <label for="calldescription">Call Description &nbsp;<span class="blink text-danger">*</span></label>
                                                                <form:textarea path="calldesc" type="text" id="calldescription" style="width:100%;" rows="4" cols="100" class="form-control form-control-lg" data-validation="required" required="true"></form:textarea>
                                                                </div>
                                                                <div class="mb-4">
                                                                    <div class="row">
                                                                        <div class="col-md-6 fw-bold">
                                                                            <label>Call Status:</label>
                                                                        </div>
                                                                        <div class="col-md-6 d-flex justify-content-between" id="radios">
                                                                            <label class="radio-inline">
                                                                            <form:radiobutton path="call_status" id="selectcall_status" value="Successful"/>&nbsp;Successful
                                                                        </label>
                                                                        <label class="radio-inline">
                                                                            <form:radiobutton path="call_status" id="selectcall_status" value="Unsuccessful"/>&nbsp;Unsuccessful
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="mt-4 mb-4">
                                                                <input type="submit" id="btnSaveOldCase" value="Save Conversation" class="btn btn-primary btn-block float-end"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer d-flex justify-content-between">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <!-- Modal for old case screen END-->


                    <!-- Modal for emergency case screen START-->
                    <div class="modal fade" id="emergencyCaseModal" tabindex="-1" aria-labelledby="emergencyCaseModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header bg-danger">
                                    <h5 class="modal-title fw-bold text-white" id="emergencyCaseModalLabel">Emergency Case</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container" id="modal-content">
                                        <form:form modelAttribute="oldcase" method="POST" autocomplete="off" id="emergencyForm" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <div class="d-flex flex-column">
                                                        <!--<span id="iCallNo" class="py-2 bg-secondary text-center fw-bold text-white">9876543210</span>-->
                                                        <form:input path="phoneno" type="text" class="form-control text-black" readonly="true" id="iCallNo" />
                                                    </div>
                                                    <div class="mt-2">
                                                        <input type="text" class="form-control mt-2" name="callerName" id="iCallerName" placeholder="Caller Name" />
                                                        <select class="form-control mt-2" name="districtcode" id="selectEmergencyDistrict">                                    
                                                            <option value="" disabled="true" selected="true">Select District</option>
                                                            <c:forEach items="${districts}" var="d">
                                                                <c:if test="${d.districtcode!=0}">
                                                                    <option value="${d.districtcode}" ><c:out value="${d.districtname}"></c:out></option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" class="form-control mt-2" name="incidentLocation" id="iIncidentLocation" placeholder="Incident Location" />
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="topSection d-flex flex-row justify-content-around">
                                                        <button type="button" class="btn btn-outline-secondary d-flex flex-row justify-content-around align-items-center" onclick="callPCR()"><img src="suantonsing/icons/policeman.png" class="img btnimg"/><span class="text-center"><h4 class="fw-bold mb-0">100</h4>(PCR)</span></button>
                                                        <button type="button" class="btn btn-outline-secondary d-flex flex-row justify-content-around align-items-center" onclick="callAmbulance()"><img src="suantonsing/icons/ambulance.png" class="img btnimg"/><span class="text-center"><h4 class="fw-bold mb-0">108</h4>(Ambulance)</span></button>
                                                        <button type="button" class="btn btn-outline-secondary d-flex flex-row justify-content-around align-items-center" onclick="callFire()"><img src="suantonsing/icons/fire-truck.png" class="img btnimg"/><span class="text-center"><h4 class="fw-bold mb-0">101</h4>(Fire Service)</span></button>
                                                        <button type="button" class="btn btn-outline-secondary d-flex flex-row justify-content-around align-items-center" onclick="loadDirectory()"><img src="suantonsing/icons/telephone-directory.png" class="img btnimg"/><span class="fw-bold mb-0">Directory</span></button>
                                                    </div>
                                                    <div class="midSection mt-3 d-none" id="directoryContainer">
                                                        <div class="card">
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="lowerSection mt-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-floating mb-3">
                                                                            <input type="hidden" class="form-control" name="agencytypeid" id="magencytypeid"/>
                                                                            <form:input type="hidden" path="master_agencydetail.magencydetailid" class="form-control" name="magencydetailid" id="m_agencydetailid"/>
                                                                            <input type="text" class="form-control" id="inputiAgencyType" name="mad_agencytypename" placeholder="Agency Type"/>
                                                                            <label for="inputiAgencyType">Agency Type</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-floating mb-3">
                                                                            <form:input type="hidden" path="contact_agencydetail.cagencydetailid" class="form-control" name="agencyid" id="cagencyid"/>
                                                                            <input type="text" class="form-control" id="inputiAgencyName" name="cad_agencyname" placeholder="Agency Name"/>
                                                                            <label for="inputiAgencyName">Agency Name</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <div class="form-floating">
                                                                            <form:input path="contact_agencydetail.person_name" type="text" name="inputRecipient" class="form-control" id="inputiRecipientName" placeholder="Recipient Name"/>
                                                                            <label for="inputiRecipientName">Recipient Name</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <div class="form-floating">
                                                                            <form:input path="contact_agencydetail.designation" type="text" name="inputDesignation" class="form-control" id="inputiDesignation" placeholder="Designation"/>
                                                                            <label for="inputiDesignation">Designation</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-4">
                                                                        <div class="form-floating">
                                                                            <input type="text" name="inputPhonenumber" class="form-control" id="inputiPhoneno" placeholder="Phone Number"/>
                                                                            <label for="inputiPhoneno">Phone Number</label>
                                                                            <div id="invalidCheck3Feedback" class="invalid-feedback">
                                                                                Phone Number is required.
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-3">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-floating">
                                                                            <textarea path="basic_casedetails.casedescription" id="inputiCaseDescription" name="inputCaseDescription" class="form-control h-100" rows="5" class="5" placeholder="Case Description"></textarea>
                                                                            <label for="inputiCaseDescription">Case Description</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-floating">
                                                                            <form:textarea path="calldesc" id="inputiPhoneConversationDetails" name="inputPhoneConversation" class="form-control h-100" rows="5" placeholder="Phone Conversation Details"></form:textarea>
                                                                                <label for="inputiPhoneConversationDetails">Phone Conversation Details</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <button class="btn btn-block btn-primary my-2 w-100" onclick="transferCall();">Transfer Call</button>
                                                        <button class="btn btn-block btn-primary my-2 w-100" onclick="confCall();" id="confBtn">Conference Call</button>
                                                        <!--<button class="btn btn-block btn-danger my-2 w-100" onclick="resetForm();" id="resetBtn">Reset Form</button>-->
                                                        <!--<button class="btn btn-block btn-primary my-2 w-100">Save Conversation</button>-->
                                                        <input type="submit" id="btnSaveEmergencyCase" value="Save Conversation" class="btn btn-block btn-primary my-2 w-100"/>
                                                    </div>
                                                </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal for emergency case screen END-->

                    <!-- Modal for Call History START -->
                    <!--                    <div class="modal fade" id="callHistoryModal" tabindex="-1" aria-labelledby="callHistoryModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-fullscreen">
                                                <div class="modal-content">
                                                    <div class="modal-header bg-purple-hov">
                                                        <h5 class="modal-title fw-bold text-white" id="callHistoryModalLabel">Call History</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="card">
                                                            <div class="card-header mb-2">
                                                                <h6 class="fw-bold">Phone Number Calling History</h6>
                                                            </div>
                                                            <div class="card-body">
                                                                <div class="row">
                                                                    <div class="col" style="max-height: auto; display:block;overflow-y: auto;" id="callhistorytable_container">
                                                                        <table class="table table-striped table-bordered mt-4" id="callhistorytable">
                                                                            <thead>
                                                                            <th>Sl No.</th>
                                                                            <th>Date and Time</th>
                                                                            <th>Phone Number</th>
                                                                            <th>Disposition</th>
                                                                            </thead>
                                                                            <tbody id="mtbody">
                    
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer d-flex justify-content-between" id="modal-footer-content-too">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-primary">Save changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
                    <!-- Modal for Call History END -->
                </main>
            </div>
        </div>
        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/jssip-3.9.0.js" type="text/javascript"></script>
        <script src="js/recorder/recorder.js" type="text/javascript"></script>
        <script src="js/sipclients.js" type="text/javascript"></script>
        <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>

        <script>
                                                            $(document).ready(function () {

                                                                $('#callernameidselect').change(function () {
                                                                    var callername = $('#callernameidselect').val();
                                                                    document.getElementById('callername').value = callername;
                                                                });
                                                                $('#txtcaseno').keyup(function () {
                                                                    $('#inputCaseNo').val("-1");
                                                                    $('#inputCaseNo').attr("disabled", true);
                                                                });
                                                                $('#inputCaseNo').click(function () {
                                                                    $('#txtcaseno').val("");
                                                                    $('#txtcaseno').attr("readonly", true);
                                                                });
//                                                    $('#callhistorytable').DataTable({});
                                                                $('#cllHist').DataTable({
                                                                    info: false,
                                                                    "bFilter": false,
                                                                    "bLengthChange": false,
                                                                    "order": [],
                                                                    lengthMenu: [
                                                                        [5],
                                                                        [5],
                                                                    ],
                                                                });

                                                                $('input[type="radio"]').click(function () {
                                                                    if ($(this).attr('id') === 'calltypemisc') {
                                                                        $('#survivordiv').hide();
                                                                        $('#call_listdiv').show();
                                                                        $('#callername').removeAttr('required');
                                                                        $('#inputDistrict').removeAttr('required');
                                                                    } else if ($(this).attr('id') === 'calltypevalid') {
                                                                        $('#survivordiv').show();
                                                                        $('#call_listdiv').hide();
                                                                        $('#callername').attr('required', true);
                                                                        $('#inputDistrict').attr('required', true);
                                                                    }
                                                                });

                                                                $("#survivoraddress").keyup(function (e) {
                                                                    var len = $("#survivoraddress").val().length;
                                                                    $("#saddsize").text("Characters left: " + (2000 - len));
                                                                    if (len === 2000) {
                                                                        $("#survivorlenerr").html("Reach maximum. Cannot add more");
                                                                    } else {
                                                                        $("#survivorlenerr").html("");
                                                                    }
                                                                });
                                                                $('input.imobile').keyup(function () {
                                                                    if (this.value.match(/[^0-9 ]/g)) {
                                                                        this.value = this.value.replace(/[^0-9 ]/g, '');
                                                                    }
                                                                });
                                                                $(".imobile").focusout(function () {
                                                                    var tmp = $('.imobile').val();
                                                                    if (tmp.length === 10) {
                                                                        $('#msgUserMobile').html("");
                                                                        return true;
                                                                    } else {
                                                                        $('#msgUserMobile').html("Mobile No. should be 10 digits");
                                                                        return false;
                                                                    }
                                                                });
                                                                $("#callername").keyup(function (e) {
                                                                    document.getElementById('detaildeskid').value = "4";
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
                                                                $("#unknownno").click(function () {
                                                                    if (this.checked) {
                                                                        $('#dispdivcallername').show();
                                                                        $('#dispdivcallernameselect').hide();
                                                                    } else {
                                                                        $('#dispdivcallername').hide();
                                                                        $('#dispdivcallernameselect').show();
                                                                    }
                                                                });
                                                                $("#operatordeskform").submit(function (e) {
                                                                    if ($('input[name="calltype"]:checked').val() === 1) {
                                                                        document.getElementById('mcallid').value = "0";
                                                                        document.getElementById('detaildeskid').value = "4";
                                                                    }
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: 'POST',
                                                                                url: "./saveolddataentry.htm",
                                                                                data: formData,
                                                                                processData: false,
                                                                                contentType: false
                                                                            }).done(function (response) {
                                                                                if (response !== '-1') {
                                                                                    self.setTitle("Success");
                                                                                    self.setContent("Complainant Details Saved Successfully. Case No: " + response);
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
                                                                                    $("#operatordeskform").trigger("reset");
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });
                                                                $("#oldcaseform").submit(function (e) {
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: 'POST',
                                                                                url: "./saveoldcase.htm",
                                                                                data: formData,
                                                                                processData: false,
                                                                                contentType: false
                                                                            }).done(function (response) {
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
                                                                                    $("#oldcaseform").trigger("reset");
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
                                                                                url: "./savemiscformolddata.htm?callerno=" + callerno,
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
                                                                $("#emergencyForm").submit(function (e) {
                                                                    e.preventDefault();
                                                                    var formData = new FormData($(this)[0]);
                                                                    var callerno = $('#callerno').val();
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: 'POST',
                                                                                url: "./saveemergencycaseform.htm?callerno=" + callerno,
                                                                                data: formData,
                                                                                processData: false,
                                                                                contentType: false
                                                                            }).done(function (response) {
                                                                                console.log(response);
                                                                                if (response !== '-1') {
                                                                                    self.setTitle("Success");
                                                                                    self.setContent("Conversation Details Saved Successfully.");
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
//                                                                                $("#emergencyForm").trigger("reset");
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });
//                                    $('#casedescdiv').show();
//                                    $('#lbl').html('Case');
                                                                $('#call_listdiv').hide();
                                                                $('#call_listoperatordiv').hide();
                                                                
                                                                $('#inputDistrict').change(function () {
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                url: './getblockfromdistrict.htm',
                                                                                data: 'districtcode=' + $('#inputDistrict').val(),
                                                                                method: 'get'
                                                                            }).done(function (response) {
                                                                                var bl = JSON.parse(response);
//                                                                var bl = JSON.parse(res.block);
                                                                                var markup = "<option value=''>Select</option>"
                                                                                for (var i = 0; i < bl.length; i++) {
                                                                                    markup += "<option value=" + bl[i].blockcode + ">" + bl[i].block_name + "</option>";
                                                                                }
                                                                                $('#inputBlock').html(markup);
                                                                                self.close();
                                                                            }).fail(function () {
                                                                                self.setContent('Something went wrong.');
                                                                            });
                                                                        }
                                                                    });
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
                                                                $("#oldCaseModal").on('shown.bs.modal', function (e) {
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                url: './oldcasescreen.htm',
                                                                                data: 'callerno=' + $("#callerno").val().trim(),
                                                                                method: 'get'
                                                                            }).done(function (response) {
                                                                                var phone = document.getElementById('callerno').value;
                                                                                document.getElementById('inputcallerno').value = phone;
                                                                                var res = JSON.parse(response);
                                                                                var caseno = JSON.parse(res.distcaseno);
                                                                                var recname = JSON.parse(res.call_log);
                                                                                var cn = "<option value='' selected disabled>Select</option>";
                                                                                for (var d = 0; d < caseno.length; d++) {
                                                                                    cn += "<option value=" + caseno[d] + ">" + caseno[d] + "</option>";
                                                                                }
                                                                                var rn = "<option value='' selected disabled>Select</option>";
                                                                                for (var r = 0; r < recname.length; r++) {
                                                                                    rn += "<option value=" + recname[r].recepientname + ">" + recname[r].recepientname + "</option>";
                                                                                }
                                                                                $("#inputCaseNo").html('');
                                                                                $("#inputCaseNo").html(cn);
                                                                                $("#callernameidselect").html('');
                                                                                $("#callernameidselect").html(rn);
                                                                                self.close();
                                                                            }).fail(function () {
                                                                                self.setContent('Something went wrong.');
                                                                            });
                                                                        }
                                                                    });
                                                                });

                                                                $('#emergencyCaseModal').on('shown.bs.modal', function () {
                                                                    var phone = document.getElementById('callerno').value;
                                                                    document.getElementById('iCallNo').value = phone;
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
//                                                    $('#callhistory').click(function () {
//                                                        var callerno = document.getElementById('callerno').value;
//                                                        //                    $('#callhistorymodal').modal('show');
//                                                        $('#no').html(callerno);
//                                                        //                    alert(callerno);
//                                                        $.ajax({
//                                                            type: "POST",
//                                                            url: "./getCallHistory_Callerno.htm",
//                                                            data: "callerno=" + callerno,
//                                                            success: function (data) {
//                                                                $('#mtbody').html('');
//                                                                //                            for(i=0;i<data.length;i++){
//                                                                //                                var str="<tr class='mrowclick'><td>"+data[i]+"</td><td>"+data[i].caseno+"</td><td>"+data[i].recepientname+"</td>"
//                                                                //                                $('#mtbody').append(str);
//                                                                //                            }
//
//                                                                var list = data;
//                                                                console.log(data);
//                                                                $.each(list, function (index, item) {
//                                                                    //                                alert(item);
//                                                                    var str = "<tr class='mrowclick'><td hidden='true'>" + item[0] + "</td><td>" + item[1] + "</td><td>" + item[2] + "</td><td hidden='true'>" + callerno + "</td>";
//                                                                    $('#mtbody').append(str);
//                                                                });
//                                                                if (data === 0) {
//                                                                    $('#call_listoperatordiv').modal('show');
//                                                                } else {
//                                                                    $('#callhistorymodal').modal('show');
//                                                                }
//                                                            },
//                                                            error: function (jqXHR, textStatus, errorThrown) {
//                                                                alert("error:" + textStatus + " - exception:" + errorThrown);
//                                                            }
//                                                        });
//                                                    });

                                                                //important here
                                                                $("#showlog").click(function () {
                                                                    var cno = $("#inputCaseNo").val();
                                                                    if (cno === null || cno.length === 0) {
                                                                        $.alert("Please Select Case No.");
                                                                        return false;
                                                                    } else {
                                                                        var caseno = $("#inputCaseNo").val();
                                                                        var txtcaseno = document.getElementById('txtcaseno').value;
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    url: 'callcasehistory.htm',
                                                                                    data: 'caseno=' + caseno + '&txtcaseno=' + txtcaseno,
                                                                                    method: 'get'
                                                                                }).done(function (response) {
                                                                                    var temp = "";
                                                                                    var temp2 = "";
                                                                                    var cp = (basicobj && basicobj.m_casepriority) ? basicobj.m_casepriority.caseprioritydesc : '';
                                                                                    var cc = (basicobj && basicobj.m_natureofcase) ? basicobj.m_natureofcase.crimeclassification : '';
                                                                                    var dn = (basicobj && basicobj.complainantdetails.district) ? basicobj.complainantdetails.district.districtname : '';
                                                                                    var basicobj = response[0];
                                                                                    var accuseddetailslist = response[3];
                                                                                    var cllrecords = response[4];
                                                                                    $("#home").html();
                                                                                    temp += '<div class="card mb-2">' +
                                                                                            '<div class="card-header text-center fw-bold">Case Number ' + basicobj.caseno + '</div>' +
                                                                                            '<div class="card-body">' +
                                                                                            '<p>Case Registered through Phone</p>' +
                                                                                            '<p class="mb-0">Case Registration Date: ' + basicobj.casedate + '<br>' +
                                                                                            'Nature of Case: ' + cc + '<br>' +
                                                                                            'Priority Level: ' + cp + '<br>' +
                                                                                            'Incident District: ' + basicobj.complainantdetails.district.districtname + '<br>' +
                                                                                            'Incident Location: ' + basicobj.complainantdetails.city_village + '<br>' +
                                                                                            'Incident Landmark: ' + basicobj.complainantdetails.landmark + '</p>' +
                                                                                            '</div></div>';
                                                                                    temp += '<div class="card mb-2">' +
                                                                                            '<div class="card-header text-center fw-bold">Victim/Complainant Details </div>' +
                                                                                            '<div class="card-body">' +
                                                                                            '<p class="mb-0">Complainant Name: ' + basicobj.complainantdetails.callername + '<br>' +
                                                                                            'Complainant Phone no: ' + basicobj.complainantdetails.complainantphoneno + '<br>' +
                                                                                            'Survivor&apos;s Name: ' + basicobj.complainantdetails.survivorname + '<br>' +
                                                                                            'Survivor&apos;s Father&apos;s Name: ' + basicobj.complainantdetails.fathername + '<br>' +
                                                                                            'Survivor&apos;s Marital&apos;s Status: ' + basicobj.complainantdetails.m_marital_status.maritalstatusdesc + '<br>' +
                                                                                            'Survivor&apos;s Cell No: ' + basicobj.complainantdetails.survivorphoneno + '<br>' +
                                                                                            'Survivor&apos;s Age: ' + basicobj.complainantdetails.survivorage + '<br>' +
                                                                                            'Police Station: ' + basicobj.complainantdetails.policestation.policestation + '<br>' +
                                                                                            'State: ' + basicobj.complainantdetails.district.statecode.statename + '</p>' +
                                                                                            '</div></div>';
                                                                                    try {
                                                                                        if (accuseddetailslist.length > 0 && accuseddetailslist !== null) {
                                                                                            temp += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">Accused Details </div>' +
                                                                                                    '<div class="card-body">';
                                                                                            for (var x = 0; x < accuseddetailslist.length; x++) {
                                                                                                temp += '<p class="mb-0">Accused Name: ' + accuseddetailslist[x].accusedname + '<br>' +
                                                                                                        'Age: ' + accuseddetailslist[x].age + '<br>' +
                                                                                                        'Phone Number: ' + accuseddetailslist[x].phoneno + '<br>' +
                                                                                                        'Address: ' + accuseddetailslist[x].accusedaddress + '</p>';
                                                                                            }
                                                                                            temp += '</div></div>';
                                                                                        }
                                                                                    } catch (err) {
//                                                                            console.log('Accused Details List Not Found');
                                                                                    }

                                                                                    temp += '<div class="card mb-2">' +
                                                                                            '<div class="card-header text-center fw-bold">Case Description</div>' +
                                                                                            '<div class="card-body">' +
                                                                                            '<p class="mb-0">Complainant Name: ' + basicobj.casedescription + '</p>' +
                                                                                            '</div>' +
                                                                                            '</div>';
                                                                                    $("#home").html(temp);
                                                                                    $("#profile").html('');
                                                                                    var calllog = response[1];
                                                                                    var days = response[2];
//                                                                        console.log(calllog);

                                                                                    for (var i = 0; i < calllog.length; i++) {
                                                                                        var dt = new Date(calllog[i].call_date).toString();
                                                                                        var index = dt.lastIndexOf(':') + 3
                                                                                        var ds = dt.substring(0, index);
//                                                                            let c_date = JSON.stringify(dt);
//                                                                            c_date = c_date.slice(1,11);
                                                                                        //                                        var dt = Date.parse(dd).toString('yyyy-MM-dd');

                                                                                        if (calllog[i].systemgenerated === true) {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>Case Registration</strong><hr><br>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>' +
                                                                                                    '<p>Local Voice Files: ' + calllog[i].calldesc + '</p>' +
                                                                                                    '<p>Source Entered by : System Generated</p></div>' +
                                                                                                    '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '15') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong><hr><br>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';

                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '3') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong><hr><br>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>' +
                                                                                                    '<p><a href="viewuploadfile.htm?call_logid=' + calllog[i].call_logid + '" target="_blank">View File</a></p>';
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '6' || calllog[i].m_logtype.logtypeid === '19') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong><hr><br>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '12') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body">' +
                                                                                                    '<p>' + calllog[i].m_closure.closuredesc + ' Type: ' + calllog[i].m_closuretype.closuretypedesc + '</p>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '10' || calllog[i].m_logtype.logtypeid === '8' || calllog[i].m_logtype.logtypeid === '14' || calllog[i].m_logtype.logtypeid === '13' || calllog[i].m_logtype.logtypeid === '20' || calllog[i].m_logtype.logtypeid === '9') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong><hr><br>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '17') {
                                                                                            var agencyname = calllog[i].assistance_provided.master_agencydetail ? calllog[i].assistance_provided.master_agencydetail.agencyname : '';
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong><hr><br>' +
                                                                                                    '<p>Agency Name: ' + agencyname + '</p>' +
//                                                                                                '<p>Agency Name: ' + calllog[i].assistance_provided.master_agencydetail.agencyname + '</p>' +
                                                                                                    '<p>Description:<br>Type of Assistance Provided: ' + calllog[i].assistance_provided.m_agencyassistancetype.agencyassistancetypename + '</p>' +
                                                                                                    '<p>Remarks: ' + calllog[i].assistance_provided.remarks + '</p>';
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '5') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>Communication ';
                                                                                            if (calllog[i].m_calltype.calltypeid === 1) {
                                                                                                temp2 += 'From ';
                                                                                            } else {
                                                                                                temp2 += 'With ';
                                                                                            }

//                                                                                        if (calllog[i].master_agencydetail.magencydetailid !== '' && calllog[i].master_agencydetail.magencydetailid !== 0) {
//                                                                                            temp2 += calllog[i].master_agencydetail.m_agencytype.agencytypename;
//                                                                                        } else {
//                                                                                            temp2 += calllog[i].m_casualty.casualtydesc;
//                                                                                        }

                                                                                            if (calllog[i].master_agencydetail && calllog[i].master_agencydetail.magencydetailid !== '' && calllog[i].master_agencydetail.magencydetailid !== 0) {
                                                                                                temp2 += calllog[i].master_agencydetail.m_agencytype.agencytypename;
                                                                                            } else {
                                                                                                temp2 += calllog[i].m_casualty.casualtydesc;
                                                                                            }

                                                                                            temp2 += '</strong><hr><br><p>Mode of Communication: ' + calllog[i].modeofcomunication.modeofcomunicationdesc + '</p>' +
                                                                                                    '<p>Phone No: ' + calllog[i].phoneno + '</p>' +
                                                                                                    '<p>Recepient/Caller&apos;s Name: ' + calllog[i].recepientname + '</p>' +
                                                                                                    '<p>Designation: ' + calllog[i].designation + '</p>' +
                                                                                                    '<p>Call Status: ' + calllog[i].call_status + '</p>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].m_calltype.calltypeid === 2) {
                                                                                                temp2 += '<p>Next Follow Up Date: ' + calllog[i].followupdate + '<br/>' +
                                                                                                        'Follow Up Remarks: ' + calllog[i].followupremarks + '</p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '16') {
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename;
                                                                                            if (calllog[i].m_calltype.calltypeid === 1) {
                                                                                                temp2 += 'From ';
                                                                                            } else {
                                                                                                temp2 += 'With ';
                                                                                            }

//                                                                                        if (calllog[i].master_agencydetail.magencydetailid !== '' && calllog[i].master_agencydetail.magencydetailid !== 0) {
//                                                                                            temp2 += calllog[i].master_agencydetail.m_agencytype.agencytypename;
//                                                                                        } else {
//                                                                                            temp2 += calllog[i].m_casualty.casualtydesc;
//                                                                                        }

                                                                                            if (calllog[i].master_agencydetail && calllog[i].master_agencydetail.magencydetailid !== '' && calllog[i].master_agencydetail.magencydetailid !== 0) {
                                                                                                temp2 += calllog[i].master_agencydetail.m_agencytype.agencytypename;
                                                                                            } else {
                                                                                                temp2 += calllog[i].m_casualty.casualtydesc;
                                                                                            }

                                                                                            temp2 += '</strong><hr><br><p>Mode of Communication: ' + calllog[i].modeofcomunication.modeofcomunicationdesc + '</p>' +
                                                                                                    '<p>Phone No: ' + calllog[i].phoneno + '</p>' +
                                                                                                    '<p>Recepient/Caller&apos;s Name: ' + calllog[i].recepientname + '</p>' +
                                                                                                    '<p>Call Status: ' + calllog[i].call_status + '</p>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].m_calltype.calltypeid === 2) {
                                                                                                temp2 += '<p>Next Follow Up Date: ' + calllog[i].followupdate + '<br/>' +
                                                                                                        'Follow Up Remarks: ' + calllog[i].followupremarks + '</p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                        if (calllog[i].m_logtype.logtypeid === '1' || calllog[i].m_logtype.logtypeid === '18') {
                                                                                            var agencyname = calllog[i].master_agencydetail ? calllog[i].master_agencydetail.agencyname : '';
                                                                                            temp2 += '<div class="card mb-2">' +
                                                                                                    '<div class="card-header text-center fw-bold">' + days[i] + '<br>' + ds + '</div>' +
                                                                                                    '<div class="card-body"><strong>' + calllog[i].m_logtype.logtypename + '</strong>' +
                                                                                                    '<p>Name Of Agency: ' + agencyname + '</p>' +
//                                                                                                '<p>Name Of Agency: ' + calllog[i].master_agencydetail.agencyname + '</p>' +
                                                                                                    '<p>Mode of Communication: ' + calllog[i].modeofcomunication.modeofcomunicationdesc + '</p>' +
                                                                                                    '<p>Email ID: ' + calllog[i].phoneno + '</p>' +
                                                                                                    '<p>Recepient Name: ' + calllog[i].recepientname + '</p>' +
                                                                                                    '<p>Call Status: ' + calllog[i].call_status + '</p>' +
                                                                                                    '<p>Designation: ' + calllog[i].designation + '</p>' +
                                                                                                    '<p>Description: ' + calllog[i].calldesc + '</p>';
                                                                                            if (calllog[i].followupremarks !== null) {
                                                                                                temp2 += '<p>Next Follow Up Date: ' + calllog[i].followupdate + '<br/>' +
                                                                                                        'Follow Up Remarks: ' + calllog[i].followupremarks + '</p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.m_centre !== null) {
                                                                                                temp2 += '<p>Source Centre: ' + calllog[i].userlogin.m_centre.centredesc + '</p>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Centre: </p>';
                                                                                            }
                                                                                            if (calllog[i].userlogin && calllog[i].userlogin.username) {
                                                                                                temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p></div>' + '</div>';
                                                                                            } else {
                                                                                                temp2 += '<p>Source Entered by: </p></div>' + '</div>';
                                                                                            }

//                                                                                        temp2 += '<p>Source Entered by: ' + calllog[i].userlogin.username + '</p>' +
//                                                                                                //                                            if(calllog[i].m_logtype.logtypeid===1) {
//                                                                                                //                                                    temp2 += 'From ';
//                                                                                                //                                                } else {
//                                                                                                //                                                    temp2 += 'With ';   
//                                                                                                //                                                }
//                                                                                                '</div>' +
//                                                                                                '</div>';
                                                                                        }
                                                                                    }
                                                                                    $("#profile").html(temp2);
                                                                                    var days = response[2];
                                                                                    $("#profile").html(temp2);
                                                                                    self.close();
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            }
                                                                        });
                                                                    }
                                                                });
                                                                $("body").on('change', '#callerno', function () {

                                                                    var phn = $('#callerno').val();
                                                                    if (phn > 1) {
                                                                        $('#oldCaseBtn').removeAttr('disabled');
                                                                        $('#emerCaseBtn').removeAttr('disabled');
//                                                                    checkIfOldCase(phn);
                                                                    } else {
                                                                        $('#oldCaseBtn').attr('disabled', 'disabled');
                                                                        $('#emerCaseBtn').attr('disabled', 'disabled');
                                                                    }

                                                                });
                                                                $("body").on('change', '#selectEmergencyDistrict', function () {

                                                                    var dc = $('#selectEmergencyDistrict').val();
                                                                    if (dc !== '' && dc.length > 0) {
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    url: 'getmasteragenciesbydistrict.htm',
                                                                                    data: 'districtcode=' + dc,
                                                                                    method: 'get'
                                                                                }).done(function (response) {
                                                                                    var sea = '<option value="" selected="true" disabled="true">Select Agency</option>';
                                                                                    for (var a = 0; a < response.length; a++) {
                                                                                        sea += '<option value="' + response[a].magencydetailid + '">' + response[a].agencyname + ' - ' + response[a].m_agencytype.agencytypename + '</option>';
                                                                                    }
                                                                                    $('#selectEmergencyAgency').html(sea);
                                                                                    self.close();
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            }
                                                                        });
                                                                    }

                                                                });
//                                                                $("body").on('change', '#audiofile', function () {
//                                                                    var fileInput = document.getElementById('audiofile');
//                                                                    if (fileInput.files[0].size > (150)) {
//                                                                        $('#btnSave').removeAttr('disabled');
//                                                                    } else {
//                                                                        $('#btnSave').attr('disabled', 'disabled');
//                                                                    }
//                                                                });

                                                                $("body").on('change', '#selectEmergencyAgency', function () {

                                                                    var ea = $('#selectEmergencyAgency').val();
                                                                    if (ea !== '' && ea.length > 0) {
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    url: 'getcontactagencydetailbyagencyid.htm',
                                                                                    data: 'magencyid=' + ea,
                                                                                    method: 'get'
                                                                                }).done(function (response) {
                                                                                    console.log(response);
                                                                                    var sea = '<option value="" disabled="true" selected="true">Select Contact Person</option>';
                                                                                    for (var a = 0; a < response.length; a++) {
                                                                                        sea += '<option value="' + response[a].mobile1 + '">' + response[a].person_name + ' - ' + response[a].designation + '</option>';
                                                                                    }
                                                                                    $('#selectContactPerson').html(sea);
                                                                                    self.close();
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            }
                                                                        });
                                                                    }

                                                                });
                                                                $("body").on('change', '#selectContactPerson', function () {
                                                                    var ea = $('#selectContactPerson').val();
                                                                    $('#ntc').val(ea);
                                                                    if (ea.length > 0) {
                                                                        $('#trCall').removeAttr('disabled');
                                                                        $('#ccCall').removeAttr('disabled');
                                                                    } else {
                                                                        $('#trCall').attr('disabled', 'disabled');
                                                                        $('#ccCall').attr('disabled', 'disabled');
                                                                    }
                                                                });
                                                                $("body").on('change', '#ntc', function () {
                                                                    var ea = $('#nct').val();
                                                                    if (ea.length > 0) {
                                                                        $('#trCall').removeAttr('disabled');
                                                                        $('#ccCall').removeAttr('disabled');
                                                                    } else {
                                                                        $('#trCall').attr('disabled', 'disabled');
                                                                        $('#ccCall').attr('disabled', 'disabled');
                                                                    }
                                                                });
//                                                            $('#emergencyForm').submit(function (e) {
//                                                                e.preventDefault();
//                                                            });
                                                                $('#selectAgency').change(function () {
                                                                    $('#agencyTableListBody').html('');
                                                                    $('#agencyTableBody').html('');
                                                                    $('#agencyname').val('');
                                                                    var agencyid = $('#selectAgency').val();
                                                                    var atype = $("#selectAgency option:selected").text();
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
                                                                                        tb += '<tr class="tbhover" onclick="getContactAgencyDetails(&quot;' + res[i].magencydetailid + '&quot;,&quot;' + res[i].agencyname + '&quot;,&quot;' + agencyid + '&quot;,&quot;' + atype + '&quot;)">'
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
                                                                $('#inputCallList').on('change', function () {
                                                                    var selectedValue = $('#inputCallList').val();
                                                                    console.log('Here ' + selectedValue);
                                                                    if (selectedValue === '4') {
                                                                        $('#misc_calldescription').prop('required', true);
                                                                        $('#blinkContainer').removeClass('d-none');
                                                                    } else {
                                                                        $('#misc_calldescription').prop('required', false);
                                                                        $('#blinkContainer').addClass('d-none');
                                                                    }
                                                                });

                                                                const toggleSwitch = document.getElementById("toggle-switch");
                                                                        const toggleText = document.getElementById("toggle-text");
                                                                        toggleSwitch.addEventListener("change", function () {
                                                                            if (this.checked) {
                                                                                toggleText.textContent = "Ready To Take Call";
                                                                            } else {
                                                                                toggleText.textContent = "Not Ready To Take Call";
                                                                            }
                                                                        });

                                                            });
                                                            function loadDirectory() {
                                                                $('#directoryContainer').removeClass("d-none");
                                                            }

                                                            function getContactAgencyDetails(aid, aname, atypeid, atype) {
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
                                                                                cont += '<tr>'
                                                                                        + '<td>' + parseInt(i + 1) + '</td>'
                                                                                        + '<td>' + res[i].person_name + '</td>'
                                                                                        + '<td>' + res[i].designation + '</td>'
                                                                                        + '<td class="clickable" onclick="setContactAgency(&quot;' + aid + '&quot;,&quot;' + aname + '&quot;,&quot;' + atypeid + '&quot;,&quot;' + atype + '&quot;,&quot;' + res[i].person_name + '&quot;,&quot;' + res[i].designation + '&quot;,&quot;' + res[i].mobile1 + '&quot; )">' + res[i].mobile1 + '</td>'
                                                                                        + '<td class="clickable" onclick="setContactAgency(&quot;' + aid + '&quot;,&quot;' + aname + '&quot;,&quot;' + atypeid + '&quot;,&quot;' + atype + '&quot;,&quot;' + res[i].person_name + '&quot;,&quot;' + res[i].designation + '&quot;,&quot;' + res[i].officephone1 + '&quot; )">' + res[i].officephone1 + '</td>'
                                                                                        + '<td class="clickable" onclick="setContactAgency(&quot;' + aid + '&quot;,&quot;' + aname + '&quot;,&quot;' + atypeid + '&quot;,&quot;' + atype + '&quot;,&quot;' + res[i].person_name + '&quot;,&quot;' + res[i].designation + '&quot;,&quot;' + res[i].mobile2 + '&quot; )">' + res[i].mobile2 + '</td>'
                                                                                        + '<td class="clickable" onclick="setContactAgency(&quot;' + aid + '&quot;,&quot;' + aname + '&quot;,&quot;' + atypeid + '&quot;,&quot;' + atype + '&quot;,&quot;' + res[i].person_name + '&quot;,&quot;' + res[i].designation + '&quot;,&quot;' + res[i].officephone2 + '&quot; )">' + res[i].officephone2 + '</td>'
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

                                                            function setContactAgency(agencytypeid, agencytypename, agencyid, agencyname, personname, designation, phone) {
//                                                                inputiAgencyType
//                                                                inputiAgencyName
//                                                                
//                                                                agencytypeid
//                                                                agencyid
                                                                $('#agencytypeid').val(agencytypeid);
                                                                $('#m_agencydetailid').val(agencytypeid);
                                                                $('#magencytypeid').val(agencytypeid);

                                                                $('#inputiAgencyType').val(agencyname);
                                                                $('#inputiAgencyName').val(agencytypename);

//                                                            $('#inputiAgencyType').val(agencytypename);
//                                                            $('#inputiAgencyName').val(agencyname);
                                                                $('#agencyid').val(agencyid);
                                                                $('#cagencyid').val(agencyid);
                                                                $('#inputiRecipientName').val(personname);
                                                                $('#inputiDesignation').val(designation);
                                                                $('#inputiPhoneno').val(phone);
                                                            }

                                                            $("#makeCallBtn").attr('disabled', 'disabled');





//                                            function getDistricts() {
//                                                $.ajax({
//                                                    type: "GET",
//                                                    url: "./getAllDistricts.htm",
//                                                    success: function (response) {
//                                                        var res = JSON.parse(response);
//                                                        var dist = JSON.parse(res.district);
////                                                        $('#inputDistrict').empty();
//                                                        var markup = '';
//                                                        for (var i = 0; i < dist.length; i++) {
//                                                            markup += '<option value="' + dist[i].districtcode + '">' + dist[i].districtname + '</option>';
//                                                        }
//                                                        $('#inputDistrict').html(markup);
//                                                    }
//                                                });
//                                            }

//                                            function getAllMaritalStatus() {
//                                                $.ajax({
//                                                    type: "GET",
//                                                    url: "./getAllMaritalStatus.htm",
//                                                    success: function (response) {
//                                                        var res = JSON.parse(response);
//                                                        var ms = JSON.parse(res.maritalstatus);
//                                                        $('#inputMaritalStatus').empty();
//                                                        var html = '';
//                                                        for (var i = 0; i < ms.length; i++) {
//                                                            html += '<option value="' + ms[i].maritalstatusid + '">' + ms[i].maritalstatusdesc + '</option>';
//                                                        }
//                                                        $('#inputMaritalStatus').append(html);
//                                                    }
//                                                });
//                                            }
//
//                                            function getCallList() {
//                                                $.ajax({
//                                                    type: "GET",
//                                                    url: "./getCallList.htm",
//                                                    success: function (response) {
//                                                        var call = JSON.parse(response);
//                                                        console.log(response);
//                                                        console.log(call);
//                                                        var html = '';
//                                                        for (var i = 0; i < call.length; i++) {
//                                                            if (call[i].callid === "1" || call[i].callid === "2" || call[i].callid === "3") {
//                                                                html += '<option value="' + call[i].callid + '">' + call[i].calldesc + '</option>';
//                                                            }
//                                                        }
//                                                        console.log(html);
//                                                        $('#inputCallList').append(html);
//                                                    }
//                                                });
//                                            }

//                                                function callHistoryTable() {
//                                                    var callerno = document.getElementById('callerno').value;
//                                                    $.ajax({
//                                                        type: "GET",
//                                                        url: "./getCallHistory.htm",
//                                                        data: "callerno=" + callerno,
//                                                        success: function (response) {
//                                                            var res = JSON.parse(response);
//                                                            var call_list = JSON.parse(res.call_list);
//                                                            var temp = "";
//                                                            for (var i = 0; i < call_list.length; i++) {
//                                                                temp += '<tr><td>' + (i + 1) + '</td>' +
//                                                                        '<td>' + call_list[i].call_date + '</td>' +
//                                                                        '<td>' + call_list[i].phoneno + '</td>' +
//                                                                        '<td>' + call_list[i].m_call.calldesc + '</td></tr>';
//                                                            }
//                                                            $('#mtbody').html('');
//                                                            $('#mtbody').append(temp);
//                                                        }
//                                                    });
//                                                }

                                                            function callPCR() {
                                                                var agencyid = '15';
                                                                var cagencyid = '50';
                                                                $.ajax({
                                                                    type: "GET",
                                                                    url: "./getmasteragency.htm",
                                                                    data: "agencyid=" + agencyid,
                                                                    success: function (response) {
                                                                        var res = JSON.parse(response);
                                                                        document.getElementById('inputiAgencyType').value = res[3].m_agencytype.agencytypename;
                                                                        document.getElementById('m_agencydetailid').value = res[3].magencydetailid;
                                                                        document.getElementById('magencytypeid').value = res[3].m_agencytype.agencytypeid;
                                                                        document.getElementById('cagencyid').value = cagencyid;
                                                                        document.getElementById('inputiAgencyName').value = res[3].agencyname;
                                                                        document.getElementById('inputiRecipientName').value = 'Emergency';
                                                                        document.getElementById('inputiPhoneno').value = '2226042';
                                                                    }
                                                                });
                                                            }

                                                            function callAmbulance() {
                                                                var agencyid = '7';
                                                                var cagencyid = '2';
                                                                $.ajax({
                                                                    type: "GET",
                                                                    url: "./getmasteragency.htm",
                                                                    data: "agencyid=" + agencyid,
                                                                    success: function (response) {
                                                                        var res = JSON.parse(response);
                                                                        document.getElementById('inputiAgencyType').value = res[0].m_agencytype.agencytypename;
                                                                        document.getElementById('m_agencydetailid').value = res[0].magencydetailid;
                                                                        document.getElementById('magencytypeid').value = res[0].m_agencytype.agencytypeid;
                                                                        document.getElementById('cagencyid').value = cagencyid;
                                                                        document.getElementById('inputiAgencyName').value = res[0].agencyname;
                                                                        document.getElementById('inputiRecipientName').value = 'Emergency';
                                                                        document.getElementById('inputiPhoneno').value = '108';
                                                                    }
                                                                });
                                                            }
                                                            function callFire() {
                                                                var agencyid = '8';
                                                                var cagencyid = '3';
                                                                $.ajax({
                                                                    type: "GET",
                                                                    url: "./getmasteragency.htm",
                                                                    data: "agencyid=" + agencyid,
                                                                    success: function (response) {
                                                                        var res = JSON.parse(response);
                                                                        document.getElementById('inputiAgencyType').value = res[0].m_agencytype.agencytypename;
                                                                        document.getElementById('m_agencydetailid').value = res[0].magencydetailid;
                                                                        document.getElementById('magencytypeid').value = res[0].m_agencytype.agencytypeid;
                                                                        document.getElementById('cagencyid').value = cagencyid;
                                                                        document.getElementById('inputiAgencyName').value = res[0].agencyname;
                                                                        document.getElementById('inputiRecipientName').value = 'Emergency';
                                                                        document.getElementById('inputiPhoneno').value = '101';
                                                                    }
                                                                });
                                                            }

                                                            function resetForm() {
                                                                $("#emergencyForm")[0].reset();
                                                                $('#emergencyForm input').not(document.getElementById('iCallNo')).val();
//                                                            $('#emergencyForm input').not('#iCallNo').val('');
                                                                $('#directoryContainer').addClass("d-none");
                                                            }
                                                            function callbacknum(num) {
                                                                $('#phoneInput').val(num);
                                                                $("#makeCallBtn").removeAttr('disabled');
                                                            }

                                                            function getMaxCurrentDate() {
                                                                var casedate = document.getElementById('inputIncidentCaseDate');
                                                                var casedate2 = document.getElementById('inputIncidentCaseDate2');
                                                                var maxDate = new Date();
                                                                maxDate.setFullYear(maxDate.getFullYear());
                                                                casedate.setAttribute("max", maxDate.toISOString().split('T')[0]);
                                                                casedate.removeAttribute("min");
                                                                casedate2.setAttribute("max", maxDate.toISOString().split('T')[0]);
                                                                casedate2.removeAttribute("min");
                                                            }


        </script>
    </body>     
</html>
