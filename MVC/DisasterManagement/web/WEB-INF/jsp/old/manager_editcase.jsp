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
        <title>Manager Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .cardborder {
                border: 1px solid #d7d7d7;
            }
            .scrollcontainer {
                max-height: 80vh;
                min-height: 80vh;
                overflow-y: scroll;
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
                                        <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-solid fa-file-pen"></i>&nbsp;&nbsp;Edit Case Details of <c:out value="${basic_casedetails.caseno}" /></h5>
                                    </div>
                                </div>
                            </div>

                            <ul class="nav nav-tabs mt-4">
                                <li class="nav-item">
                                    <a href="#complaintdetails" class="nav-link active" data-bs-toggle="tab">Complaint Details</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#restructurecasedescription" class="nav-link" data-bs-toggle="tab">Restructure Case Description</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#provideaccuseddetail" class="nav-link" data-bs-toggle="tab">Provide Accused Detail</a>
                                </li>
<!--                                <li class="nav-item">
                                    <a href="#complainantdetails" class="nav-link" data-bs-toggle="tab">Complainant Details (View Only)</a>
                                </li>-->
                            </ul>
                        <form:form modelAttribute="editcasec" autocomplete="off" id="editCaseForm">
                            <div class="tab-content scrollcontainer">
<!--                                <div class="pt-3 tab-pane fade show active bg-light cardborder mb-2" id="complainantdetails">
                                    <p class="fw-bold text-center" style="font-size: 18px;">Complainant Details (View Only)</p>
                                    <table class="table table-bordered table-striped mb-0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <p class="mb-0">
                                                        Name of Caller:<br/>
                                                        <span id="callername"><c:out escapeXml="true" value="${comp_det.callername}" /></span>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0">
                                                        Complainant Phone number:<br/>
                                                        <span id="complainantphoneno1"><c:out escapeXml="true" value="${comp_det.complainantphoneno}" /></span>
                                                    </p>
                                                </td>
                                            </tr>
                                        <input type="hidden" id="complainant_id" name="complaintid" value="${comp_det.complaintid}"/>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Name of Survivor:<br/>
                                                    <span id="survivorname1"><c:out escapeXml="true" value="${comp_det.survivorname}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Age:<br/>
                                                    <span id="survivorage"><c:out escapeXml="true" value="${comp_det.survivorage}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Address:<br/>
                                                    <span id="survivoraddress"><c:out escapeXml="true" value="${comp_det.survivoraddress}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Address District:<br/>
                                                    <span id="survivordistrict"><c:out escapeXml="true" value="${comp_det.survivordistrict.districtname}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Address Block:<br/>
                                                    <span id="survivoraddressblock"><c:out value="${comp_det.survivorblock.block_name}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    City/Village:<br/>
                                                    <span id="cityvill"><c:out value="${comp_det.survivorcity_village}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Address Police Station:<br/>
                                                    <span id="policestation"><c:out value="${comp_det.survivorpolicestation.policestation}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Marital Status:<br/>
                                                    <span id="maritalstatus"><c:out value="${comp_det.m_marital_status.maritalstatusdesc}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Survivor's Phone No.:<br/>
                                                    <span id=""><c:out value="${comp_det.survivorphoneno}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Alternate No.:<br/>
                                                    <span id=""><c:out value="${comp_det.alternateno}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Father's Name:<br/>
                                                    <span id=""><c:out value="${comp_det.fathername}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Husband's Name:<br/>
                                                    <span id=""><c:out value="${comp_det.husbandname}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Religion:<br/>
                                                    <span id=""><c:out value="${comp_det.m_religion.religiondesc}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Email ID:<br/>
                                                    <span id=""><c:out value="${comp_det.emailid}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Case Priority:<br/>
                                                    <span id=""><c:out value="${basic_casedetails.m_casepriority.caseprioritydesc}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Relation With Victim:<br/>
                                                    <span id=""><c:out escapeXml="true" value="${comp_det.relationwithvictim}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Case Referred By:<br/>
                                                    <span id=""><c:out escapeXml="true" value="${comp_det.case_referred_by}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <span class="text-danger fw-bold p-2 my-4">Incident Location</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    City/Village:<br/>
                                                    <span id=""><c:out value="${comp_det.city_village}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Landmark:<br/>
                                                    <span id=""><c:out value="${comp_det.landmark}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Incident District:<br/>
                                                    <span id=""><c:out value="${comp_det.district.districtname}" /></span>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="mb-0">
                                                    Incident Block:<br/>
                                                    <span id=""><c:out value="${comp_det.block.block_name}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="mb-0">
                                                    Incident Police Station:<br/>
                                                    <span id=""><c:out value="${comp_det.policestation.policestation}" /></span>
                                                </p>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>-->

                                <div class="pt-3 tab-pane fade show active bg-light cardborder mb-2" id="complaintdetails">
                                    <p class="fw-bold text-center" style="font-size: 18px;">Complainant Details</p>
                                    <table class="table table-bordered table-striped mb-0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltrspc" id="inputNameOfCaller" placeholder="Caller Name" path="callername" maxlength="150" value="${comp_det.callername}"/>
                                                        <label for="inputNameOfCaller">Name of Caller</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control inumber" id="inputComplainantPhoneNumber" placeholder="Complainant Phone Number" maxlength="150"  path="complainantphoneno" value="${comp_det.complainantphoneno}" readonly="true" />
                                                        <label for="inputComplainantPhoneNumber">Complainant Phone Number</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltrspc" id="inputSurvivorName" placeholder="Name of Survivor" maxlength="150" path="survivorname" value="${comp_det.survivorname}" />
                                                        <label for="inputSurvivorName">Name of Survivor</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control inumber" id="inputSurvivorAge" placeholder="Survivor's Age" path="survivorage" value="${comp_det.survivorage}"/>
                                                        <label for="inputSurvivorAge">Survivor's Age</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltrspc" id="inputSurvivorAddress" placeholder="Survivor's Address" maxlength="200" path="survivoraddress" value="${comp_det.survivoraddress}" />
                                                        <label for="inputSurvivorAddress">Survivor's Address</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-select" id="selectSurvivorDistrict" aria-label="Select Survivor District" path="survivordistrict.districtcode">                                                            
                                                            <form:option value="${comp_det.survivordistrict.districtcode}">${comp_det.survivordistrict.districtname}</form:option>
                                                            <c:forEach var="st" items="${districtlist}">
                                                                <c:if test="${st.districtcode!=0}">
                                                                    <c:choose>
                                                                        <c:when test="${st.districtcode == comp_det.survivordistrict.districtcode}">
                                                                            <form:option value="${st.districtcode}" selected="true">${st.districtname}</form:option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <form:option value="${st.districtcode}">${st.districtname}</form:option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="selectSurvivorDistrict">Survivor's District</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-select" id="inputSurvivorBlock" aria-label="Select Survivor Block" path="survivorblock.blockcode">
                                                            <form:option value="${comp_det.survivorblock.blockcode}">${comp_det.survivorblock.block_name}</form:option>
                                                            <c:forEach var="st" items="${blocklist}">   
                                                                <c:if test="${st.blockcode!=0}">
                                                                    <form:option value="${st.blockcode}" >${st.block_name}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputSurvivorBlock">Survivor's Block</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:textarea type="text" class="form-control iaddress" id="inputCityVillage" placeholder="Enter City/Village" rows="1" maxlength="255" path="survivorcity_village" value="${comp_det.survivorcity_village}"></form:textarea>
                                                            <label for="inputCityVillage">City/Village</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-floating">
                                                        <form:select class="form-select" id="inputSurvivorPS" aria-label="Select Survivor Police Station" path="survivorpolicestation.policestationcode">
                                                            <form:option value="${comp_det.survivorpolicestation.policestationcode}">${comp_det.survivorpolicestation.policestation}</form:option>
                                                            <c:forEach var="st" items="${policestationlist}">   
                                                                <c:if test="${st.policestationcode!=0}">
                                                                    <form:option value="${st.policestationcode}" >${st.policestation}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputSurvivorPS">Survivor's Police Station</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-select" id="inputMaritalStatus" aria-label="Select Marital Status" path="m_marital_status.maritalstatusid">
                                                            <form:option value="${comp_det.m_marital_status.maritalstatusid}">${comp_det.m_marital_status.maritalstatusdesc}</form:option>
                                                            <c:forEach var="st" items="${m_marital_list}">  
                                                                <c:if test="${st.maritalstatusid!=0}">
                                                                    <form:option value="${st.maritalstatusid}" >${st.maritalstatusdesc}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputMaritalStatus">Marital Status</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control inumber" id="inputSurvivorPhoneNo" placeholder="Enter Survivor's Phone No" maxlength="10" path="survivorphoneno" value="${comp_det.survivorphoneno}" />
                                                        <label for="inputSurvivorPhoneNo">Survivor's Phone No.</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control inumber" id="inputAltNo" placeholder="Enter Alternate Number" maxlength="10" path="alternateno" value="${comp_det.alternateno}" />
                                                        <label for="inputAltNo">Alternate No.</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltrspc" id="inputFatherName" placeholder="Father's Name" maxlength="50" path="fathername" value="${comp_det.fathername}" />
                                                        <label for="inputFatherName">Father's Name</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltrspc" id="inputHusbandName" placeholder="Enter Husband Name" maxlength="50" path="husbandname" value="${comp_det.husbandname}"/>
                                                        <label for="inputHusbandName">Husband's Name</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-select" id="inputReligion" aria-label="Select Religion" path="m_religion.religionid">
                                                            <form:option value="${comp_det.m_religion.religionid}">${comp_det.m_religion.religiondesc}</form:option>
                                                            <c:forEach var="st" items="${religion_list}">
                                                                <c:if test="${st.religionid!=0}">
                                                                    <form:option value="${st.religionid}" >${st.religiondesc}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputReligion">Religion</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iemail" id="inputEmail" placeholder="Enter Email" path="emailid" value="${comp_det.emailid}"/>
                                                        <label for="inputEmail">Email ID</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="input" placeholder="Case Priority" value="<c:out value="${basic_casedetails.m_casepriority.caseprioritydesc}" />" readonly="true"/>
                                                        <label for="input">Case Priority</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control iltspc" id="inputRelationWithVictim" placeholder="Enter Relation With Victim" maxlength="50" path="relationwithvictim" value="${comp_det.relationwithvictim}" />
                                                        <label for="inputRelationWithVictim">Relation With Victim</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control" id="inputCaseReferredBy" placeholder="Case Referred By" maxlength="200" path="case_referred_by" value="${comp_det.case_referred_by}" />
                                                        <label for="inputCaseReferredBy">Case Referred By</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center">
                                                    <p class="mb-0 fw-bold text-danger">
                                                        Incident Location
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control" id="inputCtVil" placeholder="Enter City/Village where incident occurred" maxlength="200" path="city_village" value="${comp_det.city_village}" />
                                                        <label for="inputCtVil">City/Village</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control" id="inputIncidentLocation" placeholder="Incident Location" maxlength="255" path="incidentlocation" value="${comp_det.incidentlocation}" />
                                                        <label for="inputIncidentLocation">Incident Location</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:input type="text" class="form-control" id="inputLandmark" placeholder="Enter Landmark" maxlength="255" path="landmark" value="${comp_det.landmark}" />
                                                        <label for="inputLandmark">Landmark</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-control" path="district.districtcode" id="inputIncidentDistrict">                                    
                                                            <form:option value="${comp_det.district.districtcode}">${comp_det.district.districtname}</form:option>
                                                            <c:forEach var="st" items="${districtlist}">       
                                                                <c:if test="${st.districtcode!=0}">
                                                                    <form:option value="${st.districtcode}" >${st.districtname}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputIncidentDistrict">Incident District</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-control" path="block.blockcode" id="inputIncidentBlock"> 
                                                            <form:option value="${comp_det.block.blockcode}">${comp_det.block.block_name}</form:option>
                                                            <c:forEach var="st" items="${blocklist}">   
                                                                <c:if test="${st.blockcode!=0}">
                                                                    <form:option value="${st.blockcode}" >${st.block_name}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                        <label for="inputIncidentBlock">Incident Block</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <form:select class="form-control" path="policestation.policestationcode" id="inputIncidentPS"> 
                                                            <form:option value="${comp_det.policestation.policestationcode}">${comp_det.policestation.policestation}</form:option>
                                                            <c:forEach var="st" items="${policestationlist}">   
                                                                <c:if test="${st.policestationcode!=0}">
                                                                    <form:option value="${st.policestationcode}" >${st.policestation}</form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select> 
                                                        <label for="inputIncidentPS">Incident Police Station</label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pt-3 tab-pane fade bg-light cardborder mb-2" id="restructurecasedescription">
                                    <p class="fw-bold text-center" style="font-size: 18px;">Restructure Case Description</p>
                                    <table class="table table-bordered table-striped mb-0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control inumber" id="inputCaseNoRO" placeholder="Case Number" maxlength="150" value="<c:out escapeXml="true" value="${basic_casedetails.caseno}" />" readonly="true" />
                                                        <label for="inputCaseNoRO">Case Number</label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control iltrspc" id="inputSurvivorNameRO" placeholder="Name of Survivor" maxlength="150" value="${comp_det.survivorname}" readonly="true" />
                                                        <label for="inputSurvivorNameRO">Name of Survivor</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="form-floating">
                                                        <textarea class="form-control h-100" name="casedescription" id="casedescription" required="true" rows="5"><c:out value="${basic_casedetails.casedescription}"/></textarea>
                                                        <label for="casedescription">Case Description<span class="text-danger blink fw-bold">&nbsp;*</span></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="form-floating">
                                                        <select class="form-control" id="natureofcaseid" name="natureofcaseid" required="true"> 
                                                            <option value="<c:out value="${basic_casedetails.m_natureofcase.natureofcaseid}" />"><c:out value="${basic_casedetails.m_natureofcase.crimeclassification}" /></option>
                                                            <c:forEach var="st" items="${natureofcase_list}"> 
                                                                <option value="<c:out value="${st.natureofcaseid}" />"><c:out value="${st.crimeclassification}" /></option>
                                                            </c:forEach>
                                                        </select> 
                                                        <label for="natureofcaseid">Nature of Case<span class="text-danger blink fw-bold">&nbsp;*</span></label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pt-3 tab-pane fade bg-light cardborder mb-4" id="provideaccuseddetail">
                                    <input type="hidden" id="rowCount" name="row_count" />
                                    <p class="fw-bold text-center" style="font-size: 18px;">Provide Accused Details</p>
                                    <table class="table table-bordered table-striped table-hover" id="accusedtable">
                                        <thead>
                                            <tr>
                                                <th>Sl. No.</th>
                                                <th>Accused Name </th>
                                                <th>Age </th>
                                                <th>Gender </th>
                                                <th>Relation with Survivor </th>
                                                <th>Phone No</th>
                                                <th>Accused Address </th>
                                                <th><input type="button" value="Add New" id="add_details" class="btn btn-success w-100"/></th>
                                            </tr>
                                        </thead>
                                        <tbody id="addaccusedtbody">
                                            <c:forEach items="${acc_list}" var="a" varStatus="status">
                                                <tr id="rows-${status.index}">
                                                    <td><c:out escapeXml="true" value="${status.count}" /></td>
                                                    <td>
                                                        <input type="hidden" name="accused_detailid[]"  id="accused_detailid_${status.index}" value="<c:out value="${a.accused_detailid}" />"/>
                                                        <input class="form-control azAZSPC" type="text" name="adl_accusedname[]"  id="accusedname_${status.index}" value="<c:out value="${a.accusedname}" />"/>
                                                    </td>
                                                    <td>
                                                        <input class="form-control inumber" type="text" name="adl_age[]" id="age_${status.index}" value="<c:out value="${a.age}" />"/>
                                                    </td>
                                                    <td>
                                                        <!--<input type="radio" name="adl_radiogender[]" id="adl_radiogendermale_${status.index}" value="Male"/>&nbsp;<label for="adl_radiogendermale_${status.index}">Male</label>-->
                                                        <!--<br><input type="radio" name="adl_radiogender[]" id="adl_radiogenderfemale_${status.index}" value="Female"/>&nbsp;<label for="adl_radiogenderfemale_${status.index}">Female</label>-->
                                                        <select class="form-control" name="adl_radiogender[]">
                                                            <option selected disabled>-- Select --</option>
                                                            <option value="Male" <c:if test="${a.gender == 'Male'}">selected</c:if>>Male</option>
                                                            <option value="Female" <c:if test="${a.gender == 'Female'}">selected</c:if>>Female</option>
                                                            </select>
                                                        </td>
                                                        <td><input class="form-control azAZSPC" type="text" name="adl_relationwithsurvivor[]" id="relationwithsurvivor_${status.index}" value="<c:out value="${a.relationwithsurvivor}" />"/></td>
                                                    <td><input class="form-control inumber" maxlength="10" type="text" name="adl_phoneno[]" id="phoneno_${status.index}" value="<c:out value="${a.phoneno}" />"/></td>
                                                    <td><textarea class="form-control azAZSPC09" style="height:100%;" rows="1"  type="textarea" name="adl_accusedaddress[]" id="accusedaddress_${status.index}"><c:out value="${a.accusedaddress}" /></textarea></td>
                                                    <td>
                                                        <input type="button" value="Delete" class="delete btn btn-danger w-100" id="delete-${status.index}" onclick="deleteRow(this)"  />
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="container">
                                            <input type="submit" value="Save" class="btn btn-success w-100"/>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
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
                                                                $('input.azAZ').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z]*$/, '');
                                                                    }
                                                                });
                                                                $('input.inumber').keyup(function () {
                                                                    if (this.value.match(/[^0-9]/)) {
                                                                        this.value = this.value.replace(/[^0-9]*$/, '');
                                                                    }
                                                                });
                                                                $('input.azAZSPC').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z \s]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z \s]*$/, '');
                                                                    }
                                                                });
                                                                $('input.azAZSPC09').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z0-9 \s]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z0-9 \s]*$/, '');
                                                                    }
                                                                });
                                                                $('input.iemail').keyup(function () {
                                                                    if (this.value.match(/[^a-zA-Z0-9\-_@.]/)) {
                                                                        this.value = this.value.replace(/[^a-zA-Z\-_@.]*$/, '');
                                                                    }
                                                                });
                                                                
                                                                $('#add_details').click(function () {
                                                                    $('#accusedtable').each(function () {
                                                                        var counter = $('#accusedtable tbody tr').length;
                                                                        var rowCount = $("#accusedtable tr").length;
                                                                        var slno = counter + 1;
                                                                        var tds = '<tr id="rows-' + counter + '">' +
                                                                                '<td>' + rowCount-- + '.</td>' +
                                                                                '<td><input type="hidden" name="accused_detailid[]" id="accused_detailid_' + rowCount + '" value=""/>' +
                                                                                '<input type="text" class="form-control azAZSPC" name="adl_accusedname[]" id="accusedname_' + rowCount + '"  /></td>' +
                                                                                '</td>' +
                                                                                '<td><input type="text" class="form-control inumber" name="adl_age[]" id="age_' + rowCount + '" /></td>' +
                                                                                '</td>' +
                                                                                '<td><div class="form-check">' +
                                                                                '<select class="form-control" name="adl_radiogender[]">' +
                                                                                '<option selected="true" disabled="true">-- Select --</option>' +
                                                                                '<option value="Male">Male</option>' +
                                                                                '<option value="Female">Female</option>' +
                                                                                '</select>' +
                                                                                '</div>' +
                                                                                '</td>' +
                                                                                '<td><input type="text" class="form-control azAZSPC" name="adl_relationwithsurvivor[]" id="relationwithsurvivor_' + rowCount + '" /></td>' +
                                                                                '</td>' +
                                                                                '<td><input type="text" class="form-control inumber" maxlength="10" name="adl_phoneno[]" id="phoneno_' + rowCount + '" /></td>' +
                                                                                '</td>' +
                                                                                '<td><textarea class="form-control azAZSPC09" style="height:100%;" rows="1" type="text" name="adl_accusedaddress[]"  id="accusedaddress_' + rowCount + '" ></textarea></td>' +
                                                                                ' <td ><input type="button" value="Delete" id="delete-' + rowCount + '"  class="delete btn btn-danger w-100" onclick="deleteRow(this);" />' +
//                                                                                ' <td ><input type="button" value="Delete" id="delete-' + counter + '"  class="delete btn btn-danger w-100" onclick="deleteRow(' + counter + ');" />' +
                                                                                ' </tr>';
                                                                        $('#addaccusedtbody').append(tds);
                                                                    });
                                                                });

                                                                $('#editCaseForm').submit(function (e) {
                                                                    e.preventDefault();
                                                                    $('#rowCount').val($("#accusedtable tr").length - 1);
                                                                    var caseno = $('#inputCaseNoRO').val();
                                                                    var formData = new FormData($(this)[0]);
                                                                    var rowcount = $('#row_count').val();
                                                                    if (rowcount === null) {
                                                                        rowcount = '0';
                                                                    }
//                                                                    var accusedelement = new Array();
//                                                                    formData.append('accusedelement', accusedelement);
                                                                    formData.append('rowcount', rowcount);
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                url: './saveeditcase.htm?caseno=' + caseno,
                                                                                data: formData,
                                                                                method: 'POST',
                                                                                processData: false,
                                                                                contentType: false,
                                                                                beforeSend: function (xhr) {
                                                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                }
                                                                            }).done(function (response) {
//                                                                                self.setContent('Description: ' + response.description);
//                                                                                self.setContentAppend('<br>Version: ' + response.version);
//                                                                                self.setTitle(response.name);
                                                                                if (response !== '-1') {
//                                                                                    clearAccusedDetails();
                                                                                    self.setContent('Details successfully added.</b>');
                                                                                    self.setTitle('Success!');
                                                                                } else {
                                                                                    self.setContent('Could not save details.');
                                                                                    self.setTitle('Error!');
                                                                                }
                                                                            }).fail(function () {
                                                                                self.setContent('Something went wrong.');
                                                                            });
                                                                        },
                                                                        buttons: {
                                                                            close: {
                                                                                action: function () {
                                                                                    location.reload();
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });
                                                            });

//                                                            function deleteRow(rowid) {
//                                                                if ($('#accused_detailid_' + rowid).val() !== '' && $('#accused_detailid_' + rowid).val() !== undefined) {
//                                                                    $.confirm({
//                                                                        content: function () {
//                                                                            var self = this;
//                                                                            return $.ajax({
//                                                                                url: 'bower.json',
//                                                                                data: 'accused_detailid=' + $('#accused_detailid_' + rowid).val(),
//                                                                                method: 'GET'
//                                                                            }).done(function (response) {
//                                                                                if (response === '0') {
//                                                                                    self.setTitle('Failed!');
//                                                                                    self.setContent('Failed to Delete Accused Detail. Please Try again.');
//                                                                                } else {
//                                                                                    self.setTitle('Success!');
//                                                                                    self.setContent('Successfully Deleted Accused Detail');
//                                                                                }
//                                                                            }).fail(function () {
//                                                                                self.setTitle('Oops!');
//                                                                                self.setContent('Something went wrong.');
//                                                                            });
//                                                                        }
//                                                                    });
//                                                                } else {
//                                                                    $('#rows-' + rowid).remove();
//                                                                }
//                                                            }

                                                            function deleteRow(row) {
                                                                row.closest('tr').remove();
                                                                $("#accusedtable tbody").find('tr').each(function (i, el) {
                                                                    var $tds = $(this).find('td');
                                                                    $tds.eq(0).text(i + 1);
                                                                });
                                                            }

                                                            function clearAccusedDetails() {
                                                                var newRowString = '<tr>' +
                                                                        '<td>1</td>' +
                                                                        '<td><input type="text" name="adl_accusedname[]" class="form-control" /></td>' +
                                                                        '<td><input type="text" name="adl_age[]" class="form-control" /></td>' +
                                                                        '<td><input type="text" name="adl_radiogender[]" class="form-control" /></td>' +
                                                                        '<td><input type="radio" name="adl_relationwithsurvivor[]" class="form-control" /></td>' +
                                                                        '<td><input type="text" name="adl_phoneno[]" class="form-control inumber" /></td>' +
                                                                        '<td><input type="text" name="adl_accusedaddress[]" class="form-control" /></td>' +
                                                                        '<td></td>' +
                                                                        '</tr>';
                                                                $('#addaccusedtbody').html(newRowString);

                                                            }

                                                            function gotoCaseManagement() {
                                                                var cn = $('#inputCaseNoRO').val();
                                                                window.location.href = "casemanagement.htm?icaseno=" + cn;
                                                            }
        </script>
    </body>
</html>
