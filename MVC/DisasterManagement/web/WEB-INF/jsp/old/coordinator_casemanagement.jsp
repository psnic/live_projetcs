<%-- 
    Document   : coordinator_casemanagement
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coordinator Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .cmilist{
                padding: 5px 12px;
                border-radius: 5px;
                border: 1px solid #d1d1d1;
                margin-bottom: 7px;
            }
            .list-title {
                border-bottom: 1px solid #d1d1d1;
                padding-bottom: 7px;
                margin-bottom: 0.8rem;
            }
            .cardcontainer {
                max-height: 70vh !important;
                overflow: hidden;
                overflow-y: scroll;
            }

            .tableactiverow {
                background-color: #d99df0;
                color: #fff;
                font-weight: bold !important;
            }
            .tableactiverow td{
                color: #5d2573 !important;
            }

            .rowclick {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <c:choose>
                        <c:when test="${fn:length(msg) > 0}">
                            <%@include file="banner.jsp" %>
                            <div class="container px-4">
                                <div class="mt-4 alert alert-danger" role="alert">
                                    <c:out escapeXml="true" value="${msg}" />
                                    <br/>
                                    <br/>
                                    <a href="searchcase.htm" class="alert-link">Click Here to Search Case again.</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="container-fluid px-4">
                                <!--<div class="card mt-4">-->
                                <!--<div class="card-header bg-purple text-center text-white fw-bold">Case Management Index</div>-->
                                <!--<div class="card-body">-->

                                <div class="d-none" id="hiddenItems">
                                    <input type="hidden" value="<c:out escapeXml="true" value="${closuretypeid}" />" >
                                    <input type="hidden" value="<c:out escapeXml="true" value="${basiccasedetail.m_closure.closureid}" />" id="closureid">
                                    <input type="hidden" name="deskid" value="<c:out escapeXml="true" value="${deskid}" />" id="deskid"/>
                                    <input type="hidden" name="districtselected" value="<c:out escapeXml="true" value="${districtselected}" />" id="districtselected"/>
                                    <input type="hidden" id="caseno" name="caseno"  class="form-control" value="<c:out escapeXml="true" value="${basiccasedetail.caseno}" />"/>
                                    <input type="hidden" id="scn" name="scn"  class="form-control" value="<c:out escapeXml="true" value="${scn}" />"/>
                                    <input type="hidden" id="closuretypeid" name="closuretypeid"  class="form-control" value="<c:out escapeXml="true" value="${basiccasedetail.m_closuretype.closuretypeid}" />"/>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-sm-3 cardcontainer">
                                        <button type="button" onclick="editcasedetail();" class="btn btn-pink-outline w-100 mb-2 fw-bold">Edit Case Details</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#generalCaseClassificationModal">General Case Classification</button>
                                        <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold">Legal Classification</button>-->
                                        <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#commThroughPhoneModal">Communicate Through Phone</button>-->
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" id="popupwindow">Communicate Through Phone</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="communicateEmail();">Communicate Through Email</button>
                                        <c:if test="${deskid=='6'}">
                                            <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold">Communicate Through Mobile</button>
                                            <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold">Service/Assistance Provided</button>
                                        </c:if>
                                        <c:if test="${LOGIN.m_usertype.usertypeid=='3'}">
                                            <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#writeCommentModal">Write Comment</button>
                                        </c:if>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#transferCaseModal">Transfer Case To Another Agency</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#duplicateCaseModal">Mark This Case A Duplicate</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="recomendcaseclosurefunction();">Recommend Case Closure To Closure Desk</button>
                                        <%--<c:if test="${basiccasedetail.m_closure.closureid=='1'}">--%>
                                        <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="caseclosurefunction();">Case Closure</button>-->
                                        <%--</c:if>--%>
                                        <%--<c:if test="${basiccasedetail.m_closure.closureid=='2'}">--%>
                                        <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold">Reactivate Case</button>-->
                                        <%--</c:if>--%>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#uploadCaseDocumentModal">Case Documents Upload</button>
                                        <c:choose>
                                            <c:when test="${scn!='Search Case Number' && closuretypeid==undefined }">
                                                <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Back To Index Of Cases</button>-->
                                            </c:when>
                                            <c:when test="${scn!='Search Case Number' && closuretypeid!='' }">
                                                <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold">Back To List Of Cases</button>-->
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="searchCaseAgainBTN();">Search Case Again</button>
                                            </c:otherwise>
                                        </c:choose>
                                        <button id="btnprintcase" type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#printCaseModal">Print Case</button>
                                        <!--<button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="deleteCase();">Delete Case</button>-->
                                    </div>
                                    <div class="col-sm-9">
                                        <%@include file="manager_casehistory.jsp" %>
                                    </div>
                                </div>
                                <!--</div>-->
                                <!--</div>-->
                                <!--</div>-->


                                <!--General Case Classification Modal Start-->
                                <div class="modal fade" id="generalCaseClassificationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="generalCaseClassificationLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="generalCaseClassificationLabel">General Case Classification</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col">
                                                            <table class="table table-bordered table-striped table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Crime Type</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="st" items="${naturecasetypelist}">
                                                                        <c:choose>
                                                                            <c:when test="${basiccasedetail.m_natureofcase.m_natureofcasetype.natureofcasetypeid==st.natureofcasetypeid}">
                                                                                <tr class="tableactiverow rowclick">
                                                                                    <td><c:out value="${st.natureofcasetypeid}" /></td>
                                                                                    <td><c:out value="${st.crimetype}" /></td>
                                                                                </tr>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <tr class="rowclick">
                                                                                    <td><c:out value="${st.natureofcasetypeid}" /></td>
                                                                                    <td><c:out value="${st.crimetype}" /></td>
                                                                                </tr>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="col d-none" id="crimedetail">
                                                            <table class="table table-bordered table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Sl No</th>
                                                                        <th>Name</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="st" items="${naturecaselist}">
                                                                        <c:choose>
                                                                            <c:when test="${basiccasedetail.m_natureofcase.natureofcaseid==st.natureofcaseid}">
                                                                                <tr class="tableactiverow">
                                                                                    <td><c:out value="${st.natureofcaseid}" /></td>
                                                                                    <td><c:out value="${st.crimeclassification}" /></td>
                                                                                </tr>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <tr>
                                                                                    <td><c:out value="${st.natureofcaseid}" /></td>
                                                                                    <td><c:out value="${st.crimeclassification}" /></td>
                                                                                </tr>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <!--<button type="button" class="btn btn-primary">Understood</button>-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--General Case Classification Modal End-->


                                <!--Write Comment Start-->
                                <div class="modal fade" id="writeCommentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="writeCommentModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <form autocomplete="off" id="writeCommentForm">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="writeCommentModalLabel">Comment Section</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">


                                                    <div class="mb-4 d-flex flex-row justify-content-between">
                                                        <label for="commentfromoscadmin">Comment From OSC Administration</label>
                                                        <button id="commentfromoscadmin" type="checkbox" class="btn btn-toggle" data-bs-toggle="button" aria-pressed="false" autocomplete="off">
                                                            <div class="handle"></div>
                                                        </button>
                                                    </div>

                                                    <!--<div class="form-check mb-3">-->
                                                    <!--<input class="form-check-input" type="checkbox" name="commentfromoscadmin" id="commentfromoscadmin">-->
                                                    <!--<label class="form-check-label" for="commentfromoscadmin">-->
                                                    <!--Comment From OSC Administration-->
                                                    <!--</label>-->
                                                    <!--</div>-->
                                                    <div class="form-floating mb-3">
                                                        <textarea class="form-control h-100" rows="7" placeholder="Leave a comment here" name="comment" id="comment"></textarea>
                                                        <label for="comment">Remarks</label>
                                                    </div>
                                                    <div class="form-floating">
                                                        <input type="date" class="form-control" id="call_date" name="call_date" />
                                                        <label for="call_date">Remarks</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer d-flex justify-content-between">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--Write Comment End-->

                                <!--Modal for Transfer Case Start-->
                                <div class="modal fade" id="transferCaseModal" tabindex="-1" aria-labelledby="transferCaseModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="transferCaseModalLabel">Transfer Case To Another Agency</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="xfercase('181');">Transfer To 181 Management Desk</button>
                                                <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="xfercase('IA');">Transfer To Integrated Agencies</button>
                                                <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="xfercase('NIA');">Transfer To Non-Integrated Agencies</button>
                                                <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="xfercase('AA');">Transfer Case To Another Agency</button>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal for Transfer Case End-->

                                <!--Modal for Transfer Case Start-->
                                <div class="modal fade" id="duplicateCaseModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="duplicateCaseModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <form autocomplete="off" id="duplicateCaseForm">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="duplicateCaseModalLabel">Mark Case As Duplicate</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-floating mb-3">
                                                        <input readonly="true" type="text" class="form-control" id="icasenoRO" placeholder="name@example.com" value="<c:out escapeXml="true" value="${basiccasedetail.caseno}" />">
                                                        <label for="icasenoRO">Case No.</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" id="inputDuplicateCaseNo" placeholder="Enter Duplicate Case Number" required="true" />
                                                        <label for="inputDuplicateCaseNo">Enter Duplicate Case No.</label>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Mark As Duplicate</button>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--Modal for Transfer Case End-->

                                <!--Modal for Upload Case Document Start-->
                                <form id="uploadCaseDocumentForm" enctype="multipart/form-data">
                                    <div class="modal fade" id="uploadCaseDocumentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="uploadCaseDocumentModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="uploadCaseDocumentModalLabel">Upload Case Document</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3">
                                                        <label for="filename2">Select File<span class="text-danger blink fw-bold">*</span></label>
                                                        <input type="file" class="form-control" name="ldoc" id="filename2" accept=".mp3" required="true"  />
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="date" class="form-control" name="call_date" id="calldateid" required="true"/>
                                                        <label for="filename2">Upload Date<span class="text-danger blink fw-bold">*</span></label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <textarea id="description" name="description" class="form-control" style="height:100%;" placeholder="Enter Description"></textarea> 
                                                        <label for="description">Description</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer d-flex justify-content-between">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-upload"></i>&nbsp;Upload</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!--Modal for Upload Case Document End-->

                                <!-- Modal for coordinator's Functions -->
                                <div class="modal fade" id="coordinatorModalSecond" tabindex="-1" aria-labelledby="coordinatorModalSecondLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-fullscreen">
                                        <div class="modal-content">
                                            <div class="modal-header bg-purple-hov">
                                                <h5 class="modal-title fw-bold text-white" id="coordinatorModalSecondLabel">Modal title Second</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="" id="modal-content-too">
                                                    <!--Dynamic Area Start-->
                                                    <!--Dynamic Area End-->
                                                </div>
                                            </div>
                                            <div class="modal-footer" id="modal-footer-content-too">
                                                <button type="button" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal for coordinator's Functions -->

                                <!-- Modal for Print Case START -->
                                <div class="modal fade" id="printCaseModal" tabindex="-1" aria-labelledby="printCaseModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-fullscreen">
                                        <div class="modal-content">
                                            <div class="modal-header bg-purple-hov">
                                                <h5 class="modal-title fw-bold text-white" id="callHistoryModalLabel">Print Case Details of &nbsp;<c:out escapeXml="true" value="${basiccasedetail.caseno}"/></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body" id="modalBody">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="pt-3 tab-pane fade show cardborder bg-light mb-2" id="complainantdetails">
                                                            <p class="fw-bold text-center" style="font-size: 18px;">Complainant Details of Case Number: <c:out value="${basiccasedetail.caseno}" /></p>
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
                                                                            <span id=""><c:out value="${basiccasedetail.m_casepriority.caseprioritydesc}" /></span>
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
                                                        </div>
                                                    </div>                                                
                                                </div>
                                                <div class="card mt-3">
                                                    <div class="card-header">
                                                        <p class="fw-bold text-center" style="font-size: 18px;">Basic Case Details</p>
                                                    </div>
                                                    <div class="pt-3 tab-pane fade show active" id="basiccasedetails">
                                                        <div class="cmilist">
                                                            <div class="list-title text-center fw-bold">
                                                                Case Number: <c:out value="${basiccasedetail.caseno}" />
                                                                <input type="hidden" id="casenoRO" value="<c:out value="${basiccasedetail.caseno}" />" />
                                                            </div>
                                                            <div class="list-content" style="font-family: 'Times New Roman',Times, serif;">
                                                                Case Registered through Phone<br>
                                                                Case Registration Date: <c:out value="${basiccasedetail.casedate}" />
                                                                <span id="caseRegistrationDays"></span>
                                                                <input type="hidden" id="cr" value="<c:out value="${basiccasedetail.casedate}" />" />
                                                                <script>
                                                                    var ord = $('#cr').val();
                                                                    var mdt = moment(ord).format('MM/DD/YYYY  HH:mm:ss');
                                                                    var dc = moment(mdt).fromNow();
                                                                    $('#caseRegistrationDays').html("&nbsp;(" + dc + ")");
                                                                </script>
                                                                <br>
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
                                                </div>
                                            </div>
                                            <div class="modal-footer d-flex justify-content-between" id="modal-footer-content-too">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary" id="printBtn">Print</button>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                                <!-- Modal for Print Case END -->

                            </div>
                        </c:otherwise>    
                    </c:choose>
                </main>
            </div>
        </div>


        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/print.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <!--<script src="js/jssip-3.9.0.js" type="text/javascript"></script>-->
        <!--<script src="js/recorder/recorder.js" type="text/javascript"></script>-->
        <!--<script src="js/sipclients.js" type="text/javascript"></script>-->

        <script>
                                                                    var d = $('#districtselected').val();
                                                                    var de = $('#deskid').val();
                                                                    var scn = $('#scn').val();
                                                                    var caseno = $('#caseno').val();

                                                                    $(document).ready(function () {
                                                                        $('.rowclick').click(function () {
                                                                            $('#crimedetail').removeClass('d-none');
                                                                        });

                                                                        $('#popupwindow').click(function (e) {
                                                                            e.preventDefault();
                                                                            window.open("communicatethroughphone.htm?caseno=" + caseno, "_blank", "width=1500,height=900,scrollbars=yes,resizable=no");
//                                                                                        console.log($(this).attr("href"));
//                                                                                        return false;
                                                                        });

                                                                        $('#duplicateCaseForm').submit(function (e) {
                                                                            e.preventDefault();
                                                                            var dupcase = $('#inputDuplicateCaseNo').val();
                                                                            var str = "dupcase=" + dupcase.trim() + "&caseno=" + caseno.trim();
                                                                            $.confirm({
                                                                                content: function () {
                                                                                    var self = this;
                                                                                    return $.ajax({
                                                                                        url: './markcasedup.htm',
                                                                                        data: str,
                                                                                        method: 'POST',
                                                                                        beforeSend: function (xhr) {
                                                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                        }
                                                                                    }).done(function (response) {
                                                                                        var res = JSON.parse(response);
                                                                                        self.setTitle(res.title);
                                                                                        self.setContent(res.msg);
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
                                                                        });

                                                                        $('#uploadCaseDocumentForm').submit(function (e) {
                                                                            e.preventDefault();
                                                                        });

                                                                        var printButton = document.getElementById("printBtn");

                                                                        // Add an event listener to the Print button
                                                                        printButton.addEventListener("click", function () {
                                                                            // Call the printThis() function from Print.js
                                                                            printJS({
                                                                                printable: "modalBody",
                                                                                type: "html",
                                                                                css: "suantonsing/css/styles.css" // Optional: include your custom CSS file
                                                                            });
                                                                        });

                                                                    });


                                                                    var gccm = document.getElementById('generalCaseClassificationModal');
                                                                    gccm.addEventListener('hidden.bs.modal', function (event) {
                                                                        $('#crimedetail').addClass('d-none');
                                                                    });

                                                                    var wcmt = document.getElementById('writeCommentModal');
                                                                    wcmt.addEventListener('hidden.bs.modal', function (event) {
                                                                        $('#writeCommentForm').trigger("reset");
                                                                    });

//                                                    function editcalllog(calllogid) {
//                                                        alert(calllogid);
//                                                    }

//                                                                                        function editcasedetail() {
//                                                                                            window.location.href = "coordinator_editcase.htm?caseno=" + caseno + "districtselected=" + d + "&deskid=" + de;
////                                                                                            window.location.href = "editcase.htm?caseno=" + caseno + "districtselected=" + d + "&deskid=" + de;
//                                                                                        }

                                                                    function editcasedetail() {
                                                                        if (scn === "Search Case Number") {
                                                                            window.location.href = "coordinator_editcase.htm?caseno=" + caseno + "&districtselected=" + 0 + "&deskid=" + 0;
                                                                        } else {
                                                                            window.location.href = "coordinator_editcase.htm?caseno=" + caseno + "&districtselected=" + d + "&deskid=" + de;
                                                                        }
                                                                    }

                                                                    function searchCaseAgainBTN() {
                                                                        window.location.href = 'searchcase.htm';
                                                                    }
                                                                    function communicateEmail() {
                                                                        window.location.href = 'mail.htm?caseno=' + caseno;
                                                                    }

                                                                    function indexcase() {
                                                                        var d = document.getElementById('districtselected').value;
                                                                        var de = document.getElementById('deskid').value;
                                                                        //           alert(d)
                                                                        window.location.href = "indexcase.htm?districtselected=" + d + "&deskid=" + de;
                                                                    }

                                                                    function xfercase(xtype) {
                                                                        var flagaid = '';
                                                                        switch (xtype) {
                                                                            case '181':
                                                                                flagaid = "1";
                                                                                break;
                                                                            case 'IA':
                                                                                flagaid = "2";
                                                                                break;
                                                                            case 'NIA':
                                                                                flagaid = "3";
                                                                                break;
                                                                            case 'AA':
                                                                                flagaid = "4";
                                                                                break;
                                                                        }
                                                                        window.location.href = "transfercasetoagencies.htm?caseno=" + caseno + "&districtselected=" + d + "&deskid=" + de + "&flagaid=" + flagaid;
                                                                    }

                                                                    function recomendcaseclosurefunction() {
                                                                        window.location.href = "caseclosure.htm?districtselected=" + d + "&deskid=" + de + "&flagid=" + 1 + "&caseno=" + caseno;
                                                                    }

                                                                    function caseclosurefunction() {
                                                                        window.location.href = "caseclosure.htm?districtselected=" + d + "&deskid=" + de + "&flagid=" + 2 + "&caseno=" + caseno;
                                                                    }

                                                                    function deleteCase() {
                                                                        var flg = '-1';
                                                                        $.confirm({
                                                                            title: 'Delete Case?',
                                                                            content: 'Are you sure to delete this case with Case No.: ' + caseno + '? There is no undo!<br/><br/>This dialog will automatically trigger \'cancel\' in 10 seconds if you don\'t respond.',
                                                                            autoClose: 'cancel|10000',
                                                                            buttons: {
                                                                                deleteUser: {
                                                                                    text: 'Yes Delete',
                                                                                    btnClass: 'btn-danger',
                                                                                    action: function () {
                                                                                        $.confirm({
                                                                                            content: function () {
                                                                                                var self = this;
                                                                                                return $.ajax({
                                                                                                    url: './deletecase.htm',
                                                                                                    data: 'caseno=' + caseno,
                                                                                                    method: 'POST',
                                                                                                    beforeSend: function (xhr) {
                                                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                    }
                                                                                                }).done(function (response) {
//                                                                                    self.setContent('Description: ' + response.description);
//                                                                                    self.setContentAppend('<br>Version: ' + response.version);
//                                                                                    self.setTitle(response.name);
                                                                                                    flg = response;
                                                                                                    if (response === '-1') {
                                                                                                        self.setTitle('Failed!');
                                                                                                        self.setContent('Failed to delete Case.');
                                                                                                    } else {
                                                                                                        self.setTitle('Success!');
                                                                                                        self.setContent('Successfully deleted Case.');
                                                                                                    }
                                                                                                }).fail(function () {
                                                                                                    self.setContent('Something went wrong.');
                                                                                                });
                                                                                            },
                                                                                            buttons: {
                                                                                                close: function () {
                                                                                                    if (flg !== '-1') {
                                                                                                        $.alert('I will take you somewhere');
                                                                                                    } else {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        });
                                                                                    }
                                                                                },
                                                                                cancel: function () {
                                                                                    $.alert('Case is Not Deleted');
                                                                                }
                                                                            }
                                                                        });
                                                                    }


        </script>
    </body>
</html>
