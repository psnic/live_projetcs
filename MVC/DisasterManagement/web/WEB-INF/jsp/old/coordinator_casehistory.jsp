<%-- 
    Document   : manager_casehistory
    Created on : 13 Dec, 2022, 12:55:54 PM
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
        <title>Manager Case History</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="card">
            <div class="card-title bg-181 text-center fw-bold p-2">Case History of : <c:out value="${basic_casedetails.caseno}"/></div>
            <div class="card-body">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#basiccasedetails" class="nav-link active" data-bs-toggle="tab">Basic Case Details</a>
                    </li>
                    <li class="nav-item">
                        <a href="#logdetails" class="nav-link" data-bs-toggle="tab">Log Details</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="pt-3 tab-pane fade show active cardcontainer" id="basiccasedetails">
                        <div class="cmilist">
                            <div class="list-title text-center fw-bold">
                                Case Number: <c:out value="${basiccasedetail.caseno}" />

                                <input type="hidden" id="casenoRO" value="<c:out value="${basiccasedetail.caseno}" />" />
                                <input type="hidden" id="districtselected" value="<c:out value="${basiccasedetail.complainantdetails.district}" />" />

                            </div>
                            <div class="list-content" style="font-family: 'Times New Roman',Times, serif;">
                                Case Registered through Phone<br>
                                Case Registration Date: <c:out value="${basiccasedetail.casedate}" /><br>
                                Nature of Case: <c:out value="${basiccasedetail.m_natureofcase.crimeclassification}" /><br>
                                Priority Level: <c:out value="${basiccasedetail.m_casepriority.caseprioritydesc}" /><br>
                                Incident District: <c:out value="${basiccasedetail.complainantdetails.district.districtname}" /><br>
                                Incident Location: <c:out value="${basiccasedetail.complainantdetails.city_village}" /><br>
                                Incident Landmark: <c:out value="${basiccasedetail.complainantdetails.landmark}" />
                            </div>
                        </div>

                        <div class="cmilist">
                            <div class="list-title text-center fw-bold">
                                Victim / Complainant Details
                            </div>
                            <div class="list-content" style="font-family: 'Times New Roman',Times, serif;">
                                Complainant Name: <c:out value="${basiccasedetail.complainantdetails.callername}" /><br>
                                Complainant Phone No.: <c:out value="${basiccasedetail.complainantdetails.complainantphoneno}" /><br>
                                Survivor's Name: <c:out value="${basiccasedetail.complainantdetails.survivorname}" /><br>
                                Survivor's Father's Name: <c:out value="${basiccasedetail.complainantdetails.fathername}" /><br>
                                Survivor's Marital's Status: <c:out value="${basiccasedetail.complainantdetails.m_marital_status.maritalstatusdesc}" /><br>
                                Survivor's Husband's Name: <c:out value="${basic_casedetails.complainantdetails.husbandname}" /><br>
                                Survivor's Cell No: <c:out value="${basiccasedetail.complainantdetails.survivorphoneno}" /><br>
                                Survivor's Age: <c:out value="${basiccasedetail.complainantdetails.survivorage}" /><br>
                                Police Station: <c:out value="${basiccasedetail.complainantdetails.policestation.policestation}" /><br>
                                State: <c:out value="${basiccasedetail.complainantdetails.district.statecode.statename}" />
                            </div>
                        </div>

                        <c:if test="${accussed_detaillist.size() > 0}">
                            <div class="cmilist">
                                <div class="list-title text-center fw-bold">
                                    Accused Details
                                </div>
                                <c:forEach items="${accussed_detaillist}" var="a">
                                    <div class="list-content" style="font-family: 'Times New Roman',Times, serif;">
                                        <p>
                                            Accused Name : <c:out value="${a.accusedname}" /><br>
                                            Age : <c:out value="${a.age}" /><br>
                                            Phone No : <c:out value="${a.phoneno}" /><br>
                                            Address : <c:out value="${a.accusedaddress}" /><br>
                                        </p>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                        <div class="cmilist">
                            <div class="list-title text-center fw-bold">
                                Case Description
                            </div>
                            <div class="list-content" style="font-family: 'Times New Roman',Times, serif;">
                                <p><c:out value="${basiccasedetail.casedescription}" /></p>
                            </div>
                        </div>

                    </div>
                    <div class="pt-3 tab-pane fade cardcontainer" id="logdetails">
                        <c:set var="i" value="0" />
                        <c:forEach items="${call_list}" var="c" varStatus="l1">
                            <c:choose>
                                <c:when test="${c.systemgenerated=='TRUE'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" /><br/>
                                                Case Registration
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Entered by: System Generated
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='15'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" /><br/>
                                                <c:out value="${c.m_logtype.logtypename}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br>
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='3'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                                Description:<br /><c:out value="${c.calldesc}" /><br />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='6' || c.m_logtype.logtypeid=='19'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                                Description:<br /><c:out value="${c.calldesc}" /><br />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='12'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" /><br/>
                                                <c:out value="${c.m_closure.closuredesc}" /><br/>
                                                Type : <c:out value="${c.m_closuretype.closuretypedesc}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br /><c:out value="${c.calldesc}" /><br />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='10' || c.m_logtype.logtypeid=='8' }">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                                Description:<br /><c:out value="${c.calldesc}" /><br />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='17'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                                Agency name <b><c:out value="${c.assistance_provided.master_agencydetail.agencyname}" /><br/>
                                                    Description:<br />
                                                    Type of Assistance Provided :<c:out value="${c.assistance_provided.m_agencyassistancetype.agencyassistancetypename}" /><br />
                                                    Remarks <c:out value="${c.assistance_provided.remarks}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='5'}">
                                    <div class="cmilist case-edit-delete" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <div class="d-flex flex-row justify-content-between">
                                                <p class="fw-bold mb-0">
                                                    <c:out value="${days[i]}" /><br/>
                                                    <c:out value="${c.call_date}" /><br/>
                                                    Communication
                                                    <c:choose>
                                                        <c:when test="${c.m_calltype.calltypeid==1}">From</c:when>
                                                        <c:otherwise>With</c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${c.master_agencydetail.magencydetailid!='' && c.master_agencydetail.magencydetailid!=0}">
                                                            <c:out value="${c.master_agencydetail.m_agencytype.agencytypename}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="${c.m_casualty.casualtydesc}" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div class="">
                                                    <button type="button" class="btn btn-primary btn-sm mr-2" onclick="editcalllog(<c:out escapeXml ="true" value="${c.call_logid}" />)"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;Edit Call Log</button>
                                                    <button type="button" class="btn btn-danger btn-sm ml-2" onclick="deletecalllog(<c:out escapeXml ="true" value="${c.call_logid}" />)"><i class="fa-solid fa-trash"></i>&nbsp;&nbsp;Delete Call Log</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Mode of Communication: <c:out value="${c.modeofcomunication.modeofcomunicationdesc}" /><br />
                                                Phone No.: <c:out value="${c.phoneno}" /><br/>
                                                Recepient/Caller's Name: <c:out value="${c.recepientname}" /><br />
                                                Designation: <c:out value="${c.designation}" /><br />
                                                Call status: <c:out value="${c.call_status}" /><br />
                                                Description:<br/><c:out value="${c.calldesc}"/>
                                                <c:choose>
                                                    <c:when test="${c.m_calltype.calltypeid==2}">
                                                        <br/><br/>
                                                        Next Follow Up Date: <c:out value="${c.followupdate}" /><br />
                                                        Follow Up Remarks: <c:out value="${c.followupremarks}" />
                                                    </c:when>
                                                </c:choose>
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='16' }">
                                    <div class="cmilist case-edit-delete" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <div class="d-flex flex-row justify-content-between">
                                                <p class="fw-bold mb-0">
                                                    <c:out value="${days[i]}" /><br/>
                                                    <c:out value="${c.call_date}" />
                                                    <c:out value="${c.m_logtype.logtypename}" /><br/>
                                                    <c:choose>
                                                        <c:when test="${c.m_calltype.calltypeid==1}">From</c:when>
                                                        <c:otherwise>With</c:otherwise>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${c.master_agencydetail.magencydetailid!='' && c.master_agencydetail.magencydetailid!=0}"><c:out value="${c.master_agencydetail.m_agencytype.agencytypename}" /></c:when>
                                                        <c:otherwise><c:out value="${c.m_casualty.casualtydesc}" /></c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div class="">
                                                    <button type="button" class="btn btn-primary btn-sm mr-2" onclick="editcalllog(<c:out escapeXml="true" value="${c.call_logid}" />)"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;Edit Call Log</button>
                                                    <button type="button" class="btn btn-danger btn-sm ml-2" onclick="deletecalllog(<c:out escapeXml="true" value="${c.call_logid}" />)"><i class="fa-solid fa-trash"></i>&nbsp;&nbsp;Delete Call Log</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Mode of Communication: <c:out value="${c.modeofcomunication.modeofcomunicationdesc}" /><br />
                                                Phone No.: <c:out value="${c.phoneno}" /><br />
                                                Recepient/Caller's Name: <c:out value="${c.recepientname}" /><br />
                                                Call status <c:out value="${c.call_status}" /><br />
                                                Description:<br /><c:out value="${c.calldesc}" />
                                                <c:choose>
                                                    <c:when test="${c.m_calltype.calltypeid==2}"><br /><br />
                                                        Next Follow Up Date: <c:out value="${c.followupdate}" /><br />
                                                        Follow Up Remarks: <c:out value="${c.followupremarks}" />
                                                    </c:when>
                                                </c:choose>
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='14'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br/><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='13' || c.m_logtype.logtypeid=='20'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br/><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='9'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Description:<br/><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                            Source Entered by: <c:out value="${c.userlogin.username}" />
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${c.m_logtype.logtypeid=='1' || c.m_logtype.logtypeid=='18'}">
                                    <div class="cmilist" style="font-family: 'Times New Roman',Times, serif;">
                                        <div class="list-title">
                                            <p class="fw-bold mb-0">
                                                <c:out value="${days[i]}" /><br/>
                                                <c:out value="${c.call_date}" />
                                                <c:out value="${c.m_logtype.logtypename}" /><br />
                                            </p>
                                        </div>
                                        <div class="list-content">
                                            <p class="list-title">
                                                Name of Agency: <c:out value="${c.master_agencydetail.agencyname}" /><br />
                                                Mode of Communication: <c:out value="${c.modeofcomunication.modeofcomunicationdesc}" /><br />
                                                Email ID: <c:out value="${c.phoneno}" /><br />
                                                Recepient Name: <c:out value="${c.recepientname}" /><br />
                                                Designation: <c:out value="${c.designation}" />
                                            </p>
                                            <p class="list-title">
                                                Description: <br /><c:out value="${c.calldesc}" />
                                            </p>
                                            <c:if test="${c.followupremarks!=null}">
                                                <p class="list-title">
                                                    Next Follow Up Date: <c:out value="${c.followupdate}" /><br/>
                                                    Follow Up Remarks: <c:out value="${c.followupremarks}" />
                                                </p>
                                            </c:if>
                                            <c:if test="${fn:length(c.file)>1}">
                                                <c:forEach var="ax" items="${audiolist}" varStatus="l2">
                                                    <c:if test="${l1.index eq l2.index}">
                                                        <div class="list-title">
                                                            Local Voice Files:<br>
                                                            <audio controls src="<c:out escapeXml="true" value="${ax}"/>"/>
                                                            <a download="audio-file" id="audioRecordDownload_${c.call_logid}" href="<c:out escapeXml="true" value="${ax}"/>">Download audio</a>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <p class="list-title">
                                                Source Centre: <c:out value="${c.userlogin.m_centre.centredesc}" /><br />
                                                Source Entered by: <c:out value="${c.userlogin.username}" />
                                            </p>
                                            <c:if test="${c.m_logtype.logtypeid=='1'}">
                                                <c:forEach items="${email_attachmentList}" var="e">
                                                    <c:if test="${c.call_logid==e.call_log.call_logid}">
                                                        <a href="viewemail_attachment_file.htm?email_attachmentid=${e.email_attachmentid}" target="_blank">${e.email_attachment_filename}</a>
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                            <c:set var="i" value="${i+1}" />
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal for Edit Phone Conversation Start-->
        <form id="editPhoneConversationForm" autocomplete="off"> 
            <div class="modal fade" id="phoneConversationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="phoneConversationModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="phoneConversationModalLabel">Edit Call Log</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <textarea rows="4" class="form-control" placeholder="Leave a comment here" name="reactivatedescription" id="reactivatedescription" style="height: 100px" required="true"></textarea>
                                <label for="reactivatedescription">Reason for Reactivation&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="date" id="reactivatedate" name="reactivatedate" placeholder="yyyy-mm-dd hh:mm:ss" class="form-control" />
                                <label for="reactivatedate">Reactivate Date</label>
                            </div>
                        </div>
                        <div class="modal-footer d-flex justify-content-between">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-floppy-disk"></i>&nbsp;Save Call Log</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--Modal for Edit Phone Conversation End-->

        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <!--<script src="suantonsing/js/popper.min.js" type="text/javascript"></script>-->
        <!--<script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>-->
        <!--<script src="suantonsing/js/scripts.js" type="text/javascript"></script>-->
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <!--<script src="suantonsing/js/sha256.js" type="text/javascript"></script>-->
        <!--<script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>-->

        <script>
                                                        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                        var csrfToken = $("meta[name='_csrf']").attr("content");
                                                        var caseno = $('#casenoRO').val();
                                                        var districtselected = $('#districtselected').val();
                                                        $(document).ready(function () {});
                                                        function editcalllog(calllogid) {
                                                            window.location.href = 'edit_calllog.htm?caseno=' + caseno.trim() + '&call_logid=' + calllogid + '&districtselected=' + districtselected;
                                                        }

                                                        function deletecalllog(calllogid) {
                                                            var stat = 0;
                                                            var self;
                                                            $.confirm({
                                                                title: 'Confirm!',
                                                                content: 'You are about to delete call log! There is no undo! Please confirm you want to delete.',
                                                                buttons: {
                                                                    confirm: function () {
                                                                        $.confirm({
                                                                            content: function () {
                                                                                self = this;
                                                                                return $.ajax({
                                                                                    url: './deletecall_log.htm',
                                                                                    data: 'call_logid=' + calllogid,
                                                                                    method: 'GET'
                                                                                }).done(function (response) {
                                                                                    var res = JSON.parse(response);
                                                                                    stat = res.status;
                                                                                    self.setContent(res.msg);
                                                                                    self.setTitle(res.title);
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            },
                                                                            buttons: {
                                                                                close: function () {
                                                                                    if (stat === 1) {
                                                                                        window.location.reload();
                                                                                    } else {
                                                                                        self.close();
                                                                                    }
                                                                                }
                                                                            }
                                                                        });
                                                                    },
                                                                    cancel: function () {
                                                                        $.alert('Canceled!');
                                                                    }
                                                                }
                                                            });
                                                        }
        </script>
    </body>
</html>
