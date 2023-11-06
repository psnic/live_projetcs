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
        <title>Add Masters</title>
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
                    <%@include file="banner.jsp" %>
                    <div class="container-fluid px-4">
                        <div class="card mt-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-4">
                                        <button type="button" class="btn btn-pink-outline w-100 mb-3" onclick="showReligion();">Religion</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-3" onclick="showNatureofcasetype();">Nature of Case Type</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-3" onclick="showNatureofcase();">Nature of Case</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-3" onclick="showIntegratedAgencies();">Integrated Agencies</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-3" onclick="showNonIntegratedAgencies();">Non-Integrated Agencies</button>
                                    </div>
                                    <div class="col">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="initialDiv">Select A Choice from the list on the left</div>
                                                <!--Religion Form Start-->
                                                <div id="religionDiv" class="d-none">
                                                    <form:form modelAttribute="religion" id="religionForm" autocomplete="off">
                                                        <form:input path="religionid" id="religionid" class="form-control" hidden="true"/>                         
                                                        <div class="d-flex justify-content-between">
                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:input path="religiondesc" class="space form-control" id="religiondesc" placeholder="Religion" maxlength="50" required="true"/>
                                                                <label for="religiondesc">Enter Religion</label>
                                                            </div>
                                                            <input type="submit" id="addReligion" value="Add Religion" class="btn btn-success"> 
                                                        </div>  
                                                    </form:form>
                                                </div>
                                                <!--Religion Form End-->
                                                <!--Nature Of Case Type Form Start-->
                                                <div id="natureofcasetypeDiv" class="d-none">
                                                    <form:form modelAttribute="natureofcasetype" id="natureofcasetypeForm" autocomplete="off">
                                                        <form:input path="natureofcasetypeid" id="natureofcasetypeid" class="form-control" hidden="true"/>                         
                                                        <div class="d-flex justify-content-between">
                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:input path="crimetype" class="space form-control" id="crimetype" placeholder="Crime Type" maxlength="50" required="true" />
                                                                <label for="crimetype">Enter Crime Type</label>
                                                            </div>
                                                            <input type="submit" id="addNatureofcasetype" value="Add Nature Of Case Type" class="btn btn-success"> 
                                                        </div>  
                                                    </form:form>
                                                </div>
                                                <!--Nature Of Case Type Form End-->
                                                <!--Nature Of Case Form Start-->
                                                <div id="natureofcaseDiv" class="d-none">
                                                    <form:form modelAttribute="natureofcase" id="natureofcaseForm" autocomplete="off">
                                                        <form:input path="natureofcaseid" id="natureofcaseid" class="form-control" hidden="true" required="true"/>                         
                                                        <div class="d-flex justify-content-between">
                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:select path="m_natureofcasetype.natureofcasetypeid" name="natureofcasetype" class="form-select" id="natureofcasetype" aria-label="Select Nature Of Case Type" required="true">
                                                                    <option selected="true" disabled="true" value="">Select Nature OF Case Type</option>
                                                                    <c:forEach items="${natureofcasetypelist}" var="n">
                                                                        <option value="${n.natureofcasetypeid}">${n.crimetype}</option>
                                                                    </c:forEach>
                                                                </form:select>
                                                                <label for="natureofcasetype">Select Nature OF Case Type</label>
                                                            </div>

                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:input path="crimeclassification" class="space form-control" id="crimeclassification" placeholder="Crime Classsification" maxlength="50" required="true"/>
                                                                <label for="crimeclassification">Enter Crime Classification</label>
                                                            </div>
                                                            <input type="submit" id="addNatureofcase" value="Add Nature Of Case" class="btn btn-success"> 
                                                        </div>  
                                                    </form:form>
                                                </div>
                                                <!--Nature Of Case Form End-->
                                                <!--Integrated Agencies Form Start-->
                                                <div id="integratedagenciesDiv" class="d-none">
                                                    <form:form modelAttribute="integratedagencies" id="integratedagenciesForm" autocomplete="off">
                                                        <form:input path="integratedagencyid" id="integratedagencyid" class="form-control" hidden="true"/>                         
                                                        <div class="d-flex justify-content-between">
                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:input path="integratedagencyname" class="space form-control" id="integratedagencyname" placeholder="Enter Integrated Agency Name" maxlength="100" required="true"/>
                                                                <label for="integratedagencyname">Enter Integrated Agency Name</label>
                                                            </div>
                                                            <input type="submit" id="addIntegratedAgency" value="Add Integrated Agency" class="btn btn-success"> 
                                                        </div>  
                                                    </form:form>
                                                </div>
                                                <!--Integrated Agencies Form End-->
                                                <!--Non Integrated Agencies Form Start-->
                                                <div id="nonintegratedagenciesDiv" class="d-none">
                                                    <form:form modelAttribute="nonintegratedagencies" id="nonintegratedagenciesForm" autocomplete="off">
                                                        <form:input path="nonintegratedagencyid" id="nonintegratedagencyid" class="form-control" hidden="true"/>                         
                                                        <div class="d-flex justify-content-between">
                                                            <div class="form-floating mr-2" style="width: 70%;">
                                                                <form:input path="nonintegratedagencyname" class="space form-control" id="nonintegratedagencyname" placeholder="Enter Non Integrated Agency Name" maxlength="100" required="true"/>
                                                                <label for="nonintegratedagencyname">Enter Non Integrated Agency Name</label>
                                                            </div>
                                                            <input type="submit" id="addNonIntegratedAgency" value="Add Non Integrated Agency" class="btn btn-success"> 
                                                        </div>  
                                                    </form:form>
                                                </div>
                                                <!--Non Integrated Agencies Form End-->
                                            </div>
                                        </div>
                                        <div class="card" id="secondcard">
                                            <div class="card-body">
                                                <!--Religion List Start-->
                                                <div class="p-2 card-body table-responsive" id="displayreligionlist" style="display:none;">
                                                    <div class="col">
                                                        <div id="displayreligion" class="mb-5" style="max-height: 350px; display:block;overflow-y: auto;">
                                                            <table class='table table-striped' >
                                                                <thead>
                                                                    <tr>
                                                                        <th hidden="true">ID</th>
                                                                        <th>Sl No.</th>
                                                                        <th>Religion</th> 
                                                                        <th class="noExport">Edit</th>
                                                                        <th class="noExport">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${religionlist}" var="c" varStatus="i">
                                                                        <tr >
                                                                            <td hidden="true">
                                                                                <c:out value="${c.religionid}" />
                                                                            </td>
                                                                            <td>
                                                                                <c:out value="${i.count}" />
                                                                            </td>
                                                                            <td>
                                                                                <c:out value="${c.religiondesc}" />
                                                                            </td>
                                                                            <td>
                                                                                <input type="button" id="editReligion" value="Edit" class="btn btn-secondary btn-block" onclick="editreligion('<c:out value="${c.religionid}"/>', '<c:out value="${c.religiondesc}"/>')"/>
                                                                            </td>
                                                                            <td>
                                                                                <input type="button" id="deleteReligion" value="Delete" class="btn btn-danger btn-block" onclick="deletereligion('<c:out value="${c.religionid}"/>')"/>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                <!--Religion LIst End-->
                                                <!--Nature Of Case Type List Start-->
                                                <div class="p-2 card-body table-responsive" id="displaynatureofcasetypelist" style="display:none;">
                                                    <div class="col">
                                                        <div id="displaynatureofcasetype" class="mb-5" style="max-height: 350px; display:block;overflow-y: auto;">
                                                            <table class='table table-striped' >
                                                                <thead>
                                                                    <tr>
                                                                        <th hidden="true">ID</th>
                                                                        <th>Sl No.</th>
                                                                        <th>Nature Of Case Type</th> 
                                                                        <th class="noExport">Edit</th>
                                                                        <th class="noExport">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${natureofcasetypelist}" var="c" varStatus="i">
                                                                        <tr >
                                                                            <td hidden="true">
                                                                                <c:out value="${c.natureofcasetypeid}"></c:out>
                                                                                </td>
                                                                                <td class="naturecasetyperowclick">
                                                                                <c:out value="${i.count}"></c:out>
                                                                                </td>
                                                                                <td class="naturecasetyperowclick">
                                                                                <c:out value="${c.crimetype}"></c:out>
                                                                                </td>
                                                                                <td>
                                                                                    <input type="button" id="editNatureofcaseType" value="Edit" class="btn btn-secondary btn-block" onclick="editnatureofcasetype('<c:out value="${c.natureofcasetypeid}"/>', '<c:out value="${c.crimetype}"/>')"/>
                                                                            </td>
                                                                            <td>
                                                                                <input type="button" id="deleteCrimetype" value="Delete" class="btn btn-danger btn-block" onclick="deletecrimetype('<c:out value="${c.natureofcasetypeid}"/>')"/>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                <!--Nature OF Case Type List End-->
                                                <!--Nature Of Case List Start-->
                                                <div class="p-2 card-body table-responsive" id="displaynatureofcaselist" style="display:none;">
                                                    <div class="col">
                                                        <div id="displaynatureofcase" class="mb-5" style="max-height: 350px; display:block;overflow-y: auto;">
                                                            <table class='table table-striped' >
                                                                <thead>
                                                                    <tr>
                                                                        <th hidden="true">ID</th>
                                                                        <th>Sl No.</th>
                                                                        <th>Nature Of Case Type</th> 
                                                                        <th>Nature Of Case</th> 
                                                                        <th class="noExport">Edit</th>
                                                                        <th class="noExport">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${naturecaselist}" var="c" varStatus="i" >
                                                                        <tr >
                                                                            <td hidden="true">
                                                                                <c:out value="${c.natureofcaseid}"></c:out>
                                                                                </td>
                                                                                <td class="naturecaserowclick">
                                                                                <c:out value="${i.count}"></c:out>
                                                                                </td>
                                                                                <td class="naturecaserowclick">
                                                                                <c:out value="${c.m_natureofcasetype.crimetype}"></c:out><input type="hidden" id="m_natureofcasetype${i.index}" value="${c.m_natureofcasetype.crimetype}"/>
                                                                                </td>
                                                                                <td class="naturecaserowclick" hidden=true"">
                                                                                <c:out value="${c.m_natureofcasetype.natureofcasetypeid}"></c:out>
                                                                                </td> 
                                                                                <td class="naturecaserowclick">
                                                                                <c:out value="${c.crimeclassification}"></c:out>
                                                                                </td>
                                                                                <td>
                                                                                    <input type="button" id="editNatureOfCase" value="Edit" class="btn btn-secondary btn-block" onclick="editnatureofcase('<c:out value="${c.natureofcaseid}"/>', '<c:out value="${c.crimeclassification}"/>', '<c:out value="${c.m_natureofcasetype.natureofcasetypeid}"/>')"/>
                                                                            </td>
                                                                            <td>
                                                                                <input type="button" id="deleteCrime" value="Delete" class="btn btn-danger btn-block" onclick="deletecrime('<c:out value="${c.natureofcaseid}"/>')"/>

                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                <!--Nature OF Case List End-->
                                                <!--Integrated Agency List Start-->
                                                <div class="p-2 card-body table-responsive" id="displayintegratedagencieslist" style="display:none;">
                                                    <div class="col">
                                                        <div id="displayintegratedagencies" class="mb-5" style="max-height: 350px; display:block;overflow-y: auto;">
                                                            <table class='table table-striped' >
                                                                <thead>
                                                                    <tr>
                                                                        <th hidden="true">ID</th>
                                                                        <th>Sl No.</th>
                                                                        <th>Integrated Agencies</th> 
                                                                        <th class="noExport">Edit</th>
                                                                        <th class="noExport">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${integratedagencieslist}" var="c" varStatus="i">
                                                                        <c:if test="${c.integratedagencyid!=0}">
                                                                            <tr >
                                                                                <td hidden="true">
                                                                                    <c:out value="${c.integratedagencyid}"></c:out>
                                                                                    </td>
                                                                                    <td class="integratedagenciesrowclick">
                                                                                    <c:out value="${i.count}"></c:out>
                                                                                    </td>
                                                                                    <td class="integratedagenciesrowclick">
                                                                                    <c:out value="${c.integratedagencyname}"></c:out>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="button" id="editIntegratedagency" value="Edit" class="btn btn-secondary btn-block" onclick="editintegratedagency('<c:out value="${c.integratedagencyid}"/>', '<c:out value="${c.integratedagencyname}"/>')"/>
                                                                                </td>
                                                                                <td>
                                                                                    <input type="button" id="deleteintegratedagency" value="Delete" class="btn btn-danger btn-block" onclick="btndeleteintegratedagency('<c:out value="${c.integratedagencyid}"/>')"/>

                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                <!--Integrated Agency List End-->
                                                <!--Non Integrated Agency List Start-->
                                                <div class="p-2 card-body table-responsive" id="displaynonintegratedagencieslist" style="display:none;">
                                                    <div class="col">
                                                        <div id="displaynonintegratedagencies" class="mb-5" style="max-height: 350px; display:block;overflow-y: auto;">
                                                            <table class='table table-striped' >
                                                                <thead>
                                                                    <tr>
                                                                        <th hidden="true">ID</th>
                                                                        <th>Sl No.</th>
                                                                        <th>Non Integrated Agencies</th> 
                                                                        <th class="noExport">Edit</th>
                                                                        <th class="noExport">Delete</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${nonintegratedagencieslist}" var="c" varStatus="i">
                                                                        <c:if test="${c.nonintegratedagencyid!=0}">
                                                                            <tr >
                                                                                <td hidden="true">
                                                                                    <c:out value="${c.nonintegratedagencyid}"></c:out>
                                                                                    </td>
                                                                                    <td class="nonintegratedagenciesrowclick">
                                                                                    <c:out value="${i.count}"></c:out>
                                                                                    </td>
                                                                                    <td class="nonintegratedagenciesrowclick">
                                                                                    <c:out value="${c.nonintegratedagencyname}"></c:out>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="button" id="editNonIntegratedagency" value="Edit" class="btn btn-secondary btn-block" onclick="editnonintegratedagency('<c:out value="${c.nonintegratedagencyid}"/>', '<c:out value="${c.nonintegratedagencyname}"/>')"/>
                                                                                </td>
                                                                                <td>
                                                                                    <input type="button" id="deletenonintegratedagency" value="Delete" class="btn btn-danger " onclick="btndeletenonintegratedagency('<c:out value="${c.nonintegratedagencyid}"/>')"/>

                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </tbody>  
                                                            </table>
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                <!--Non Integrated Agency List End-->
                                            </div>
                                        </div>
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
                                                                                        $('#initialDiv').show();
                                                                                        $('#secondcard').hide();
                                                                                        function showReligion() {
                                                                                            $('#initialDiv').hide();
                                                                                            $('#secondcard').show();
                                                                                            $('#natureofcaseDiv').hide();
                                                                                            $('#displayreligionlist').show();
                                                                                            $('#displaynatureofcasetypelist').hide();
                                                                                            $('#religionDiv').removeClass('d-none');
                                                                                            $('#religionDiv').show();
                                                                                            $('#natureofcasetypeDiv').hide();
                                                                                            $('#displaynatureofcaselist').hide();
                                                                                            $('#integratedagenciesDiv').hide();
                                                                                            $('#displayintegratedagencieslist').hide();
                                                                                            $('#displaynonintegratedagencieslist').hide();
                                                                                            $('#nonintegratedagenciesDiv').hide();
                                                                                        }
                                                                                        function showNatureofcasetype() {
                                                                                            $('#initialDiv').hide();
                                                                                            $('#displayreligionlist').hide();
                                                                                            $('#religionDiv').hide();
                                                                                            $('#secondcard').show();
                                                                                            $('#natureofcasetypeDiv').show();
                                                                                            $('#natureofcaseDiv').hide();
                                                                                            $('#displaynatureofcasetypelist').show();
                                                                                            $('#natureofcasetypeDiv').removeClass('d-none');
                                                                                            $('#displaynatureofcaselist').hide();
                                                                                            $('#displayintegratedagencieslist').hide();
                                                                                            $('#displaynonintegratedagencieslist').hide();
                                                                                            $('#nonintegratedagenciesDiv').hide();
                                                                                        }
                                                                                        function showNatureofcase() {
                                                                                            $('#initialDiv').hide();
                                                                                            $('#displayreligionlist').hide();
                                                                                            $('#religionDiv').hide();
                                                                                            $('#secondcard').show();
                                                                                            $('#natureofcasetypeDiv').hide();
                                                                                            $('#natureofcaseDiv').show();
                                                                                            $('#displaynatureofcasetypelist').hide();
                                                                                            $('#displaynatureofcaselist').show();
                                                                                            $('#natureofcaseDiv').removeClass('d-none');
                                                                                            $('#integratedagenciesDiv').hide();
                                                                                            $('#displayintegratedagencieslist').hide();
                                                                                            $('#displaynonintegratedagencieslist').hide();
                                                                                            $('#nonintegratedagenciesDiv').hide();
                                                                                        }
                                                                                        function showIntegratedAgencies() {
                                                                                            $('#initialDiv').hide();
                                                                                            $('#displayreligionlist').hide();
                                                                                            $('#religionDiv').hide();
                                                                                            $('#natureofcasetypeDiv').hide();
                                                                                            $('#displaynatureofcasetypelist').hide();
                                                                                            $('#natureofcaseDiv').hide();
                                                                                            $('#displaynatureofcaselist').hide();
                                                                                            $('#secondcard').show();
                                                                                            $('#integratedagenciesDiv').show();
                                                                                            $('#displayintegratedagencieslist').show();
                                                                                            $('#integratedagenciesDiv').removeClass('d-none');
                                                                                            $('#displaynonintegratedagencieslist').hide();
                                                                                            $('#nonintegratedagenciesDiv').hide();

                                                                                        }
                                                                                        function showNonIntegratedAgencies() {
                                                                                            $('#initialDiv').hide();
                                                                                            $('#displayreligionlist').hide();
                                                                                            $('#religionDiv').hide();
                                                                                            $('#natureofcasetypeDiv').hide();
                                                                                            $('#displaynatureofcasetypelist').hide();
                                                                                            $('#natureofcaseDiv').hide();
                                                                                            $('#displaynatureofcaselist').hide();
                                                                                            $('#secondcard').show();
                                                                                            $('#nonintegratedagenciesDiv').show();
                                                                                            $('#displaynonintegratedagencieslist').show();
                                                                                            $('#integratedagenciesDiv').hide();
                                                                                            $('#displayintegratedagencieslist').hide();
                                                                                            $('#nonintegratedagenciesDiv').removeClass('d-none');
                                                                                        }

                                                                                        function editreligion(religionid, rdesc) {
                                                                                            $("#religionid").val(religionid);
                                                                                            $("#religiondesc").val(rdesc);
                                                                                        }
                                                                                        function editnatureofcasetype(nocid, nocdesc) {
                                                                                            $("#natureofcasetypeid").val(nocid);
                                                                                            $("#crimetype").val(nocdesc);
                                                                                        }
                                                                                        function editnatureofcase(nid, ndesc, noct) {
                                                                                            $("#natureofcaseid").val(nid);
                                                                                            $("#crimeclassification").val(ndesc);
                                                                                            $("#natureofcasetype").val(noct).trigger('change');
                                                                                        }
                                                                                        function editintegratedagency(nai, ndesc) {
                                                                                            $("#integratedagencyid").val(nai);
                                                                                            $("#integratedagencyname").val(ndesc);
                                                                                        }
                                                                                        function editnonintegratedagency(nai, ndesc) {
                                                                                            $("#nonintegratedagencyid").val(nai);
                                                                                            $("#nonintegratedagencyname").val(ndesc);
                                                                                        }

                                                                                        function deletereligion(religionid) {
                                                                                            var religiondesc = $("#religiondesc").val();
                                                                                            alert(religionid)
                                                                                            $.confirm({
                                                                                                title: 'Are you sure you want to delete the Religion ' + religiondesc + ' ?',
                                                                                                content: '',
                                                                                                buttons: {
                                                                                                    cancel: function () {
                                                                                                        $.alert('Cancelled!');
                                                                                                    },
                                                                                                    delete: {
                                                                                                        text: 'Delete',
                                                                                                        btnClass: 'btn-red',
                                                                                                        action: function () {
                                                                                                            $.confirm({
                                                                                                                content: function () {
                                                                                                                    var self = this;
                                                                                                                    return $.ajax({
                                                                                                                        method: 'GET',
                                                                                                                        url: './deletereligion.htm',
                                                                                                                        data: 'religionid=' + religionid
                                                                                                                    }).done(function (response) {
                                                                                                                        if (response === '1') {
                                                                                                                            self.setTitle('Successful!');
                                                                                                                            self.setContent('Religion Deleted succesfully');
                                                                                                                        } else {
                                                                                                                            self.setTitle('Error Occurred!');
                                                                                                                            self.setContent('Unable to Delete user. Please try again!');
                                                                                                                        }
                                                                                                                    }).fail(function (x) {
                                                                                                                        self.setTitle('');
                                                                                                                        self.setContent('Something went wrong.');
                                                                                                                    });
                                                                                                                },
                                                                                                                onDestroy: function () {
                                                                                                                    window.location.reload();
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                        function deletecrimetype(nocid) {
                                                                                            $.confirm({
                                                                                                title: 'Are you sure you want to delete the Crime Type ?',
                                                                                                content: '',
                                                                                                buttons: {
                                                                                                    cancel: function () {
                                                                                                        $.alert('Cancelled!');
                                                                                                    },
                                                                                                    delete: {
                                                                                                        text: 'Delete',
                                                                                                        btnClass: 'btn-red',
                                                                                                        action: function () {
                                                                                                            $.confirm({
                                                                                                                content: function () {
                                                                                                                    var self = this;
                                                                                                                    return $.ajax({
                                                                                                                        method: 'GET',
                                                                                                                        url: './deleteNatureofcrimetype.htm',
                                                                                                                        data: 'natureofcasetypeid=' + nocid
                                                                                                                    }).done(function (response) {
                                                                                                                        if (response === '1') {
                                                                                                                            self.setTitle('Successful!');
                                                                                                                            self.setContent('Crime Type Deleted succesfully');
                                                                                                                        } else {
                                                                                                                            self.setTitle('Error Occurred!');
                                                                                                                            self.setContent('Unable to Delete. Please try again!');
                                                                                                                        }
                                                                                                                    }).fail(function (x) {
                                                                                                                        self.setTitle('');
                                                                                                                        self.setContent('Something went wrong.');
                                                                                                                    });
                                                                                                                },
                                                                                                                onDestroy: function () {
                                                                                                                    window.location.reload();
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                        function deletecrime(nocid) {
                                                                                            $.confirm({
                                                                                                title: 'Are you sure you want to delete the Crime?',
                                                                                                content: '',
                                                                                                buttons: {
                                                                                                    cancel: function () {
                                                                                                        $.alert('Cancelled!');
                                                                                                    },
                                                                                                    delete: {
                                                                                                        text: 'Delete',
                                                                                                        btnClass: 'btn-red',
                                                                                                        action: function () {
                                                                                                            $.confirm({
                                                                                                                content: function () {
                                                                                                                    var self = this;
                                                                                                                    return $.ajax({
                                                                                                                        method: 'GET',
                                                                                                                        url: './deleteNatureofcrime.htm',
                                                                                                                        data: 'natureofcaseid=' + nocid
                                                                                                                    }).done(function (response) {
                                                                                                                        if (response === '1') {
                                                                                                                            self.setTitle('Successful!');
                                                                                                                            self.setContent('Crime Deleted succesfully');
                                                                                                                        } else {
                                                                                                                            self.setTitle('Error Occurred!');
                                                                                                                            self.setContent('Unable to Delete. Please try again!');
                                                                                                                        }
                                                                                                                    }).fail(function (x) {
                                                                                                                        self.setTitle('');
                                                                                                                        self.setContent('Something went wrong.');
                                                                                                                    });
                                                                                                                },
                                                                                                                onDestroy: function () {
                                                                                                                    window.location.reload();
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                        function btndeletenonintegratedagency(nocid) {
                                                                                            $.confirm({
                                                                                                title: 'Are you sure you want to delete the Non Integrated Agency?',
                                                                                                content: '',
                                                                                                buttons: {
                                                                                                    cancel: function () {
                                                                                                        $.alert('Cancelled!');
                                                                                                    },
                                                                                                    delete: {
                                                                                                        text: 'Delete',
                                                                                                        btnClass: 'btn-red',
                                                                                                        action: function () {
                                                                                                            $.confirm({
                                                                                                                content: function () {
                                                                                                                    var self = this;
                                                                                                                    return $.ajax({
                                                                                                                        method: 'GET',
                                                                                                                        url: './deleteNonintegratedagency.htm',
                                                                                                                        data: 'nonintegratedagencyid=' + nocid
                                                                                                                    }).done(function (response) {
                                                                                                                        if (response === '1') {
                                                                                                                            self.setTitle('Successful!');
                                                                                                                            self.setContent('Non Integrated Agency Deleted succesfully');
                                                                                                                        } else {
                                                                                                                            self.setTitle('Error Occurred!');
                                                                                                                            self.setContent('Unable to Delete. Please try again!');
                                                                                                                        }
                                                                                                                    }).fail(function (x) {
                                                                                                                        self.setTitle('');
                                                                                                                        self.setContent('Something went wrong.');
                                                                                                                    });
                                                                                                                },
                                                                                                                onDestroy: function () {
                                                                                                                    window.location.reload();
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                        function btndeleteintegratedagency(nocid) {
                                                                                            $.confirm({
                                                                                                title: 'Are you sure you want to delete the Integrated Agency?',
                                                                                                content: '',
                                                                                                buttons: {
                                                                                                    cancel: function () {
                                                                                                        $.alert('Cancelled!');
                                                                                                    },
                                                                                                    delete: {
                                                                                                        text: 'Delete',
                                                                                                        btnClass: 'btn-red',
                                                                                                        action: function () {
                                                                                                            $.confirm({
                                                                                                                content: function () {
                                                                                                                    var self = this;
                                                                                                                    return $.ajax({
                                                                                                                        method: 'GET',
                                                                                                                        url: './deleteIntegratedagency.htm',
                                                                                                                        data: 'integratedagencyid=' + nocid
                                                                                                                    }).done(function (response) {
                                                                                                                        if (response === '1') {
                                                                                                                            self.setTitle('Successful!');
                                                                                                                            self.setContent('Integrated Agency Deleted succesfully');
                                                                                                                        } else {
                                                                                                                            self.setTitle('Error Occurred!');
                                                                                                                            self.setContent('Unable to Delete. Please try again!');
                                                                                                                        }
                                                                                                                    }).fail(function (x) {
                                                                                                                        self.setTitle('');
                                                                                                                        self.setContent('Something went wrong.');
                                                                                                                    });
                                                                                                                },
                                                                                                                onDestroy: function () {
                                                                                                                    window.location.reload();
                                                                                                                }
                                                                                                            });
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            });
                                                                                        }


                                                                                        $(document).ready(function () {
                                                                                            $("#religionForm").submit(function (e) {
                                                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                                                e.preventDefault();
                                                                                                $.confirm({
                                                                                                    content: function () {
                                                                                                        var self = this;
                                                                                                        return $.ajax({
                                                                                                            type: "POST",
                                                                                                            url: "./addMoreReligion.htm",
                                                                                                            async: false,
                                                                                                            data: $("#religionForm").serialize(),
                                                                                                            beforeSend: function (xhr) {
                                                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                            }
                                                                                                        }).done(function (response) {
                                                                                                            if (response === '1') {
                                                                                                                self.setContent('New Religion Added');
                                                                                                                self.setTitle('Successeful!');
                                                                                                            } else {
                                                                                                                self.setContent('Religion could not be added!</b> Please Try Again');
                                                                                                                self.setTitle('Error!');
                                                                                                            }
                                                                                                        }).fail(function () {
                                                                                                            self.setContent('Something went wrong.');
                                                                                                        });
                                                                                                    },
                                                                                                    onDestroy: function () {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                            $("#natureofcasetypeForm").submit(function (e) {
                                                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                                                e.preventDefault();
                                                                                                $.confirm({
                                                                                                    content: function () {
                                                                                                        var self = this;
                                                                                                        return $.ajax({
                                                                                                            type: "POST",
                                                                                                            url: "./addMorenatureofcasetype.htm",
                                                                                                            async: false,
                                                                                                            data: $("#natureofcasetypeForm").serialize(),
                                                                                                            beforeSend: function (xhr) {
                                                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                            }
                                                                                                        }).done(function (response) {
                                                                                                            if (response === '1') {
                                                                                                                self.setContent('New Nature Of Case Type Added');
                                                                                                                self.setTitle('Successeful!');
                                                                                                            } else {
                                                                                                                self.setContent('Nature Of Case Type could not be added!</b> Please Try Again');
                                                                                                                self.setTitle('Error!');
                                                                                                            }
                                                                                                        }).fail(function () {
                                                                                                            self.setContent('Something went wrong.');
                                                                                                        });
                                                                                                    },
                                                                                                    onDestroy: function () {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                });
                                                                                            });

                                                                                            $("#natureofcaseForm").submit(function (e) {
                                                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                                                e.preventDefault();
                                                                                                $.confirm({
                                                                                                    content: function () {
                                                                                                        var self = this;
                                                                                                        return $.ajax({
                                                                                                            type: "POST",
                                                                                                            url: "./addcrime.htm",
                                                                                                            async: false,
                                                                                                            data: $("#natureofcaseForm").serialize(),
                                                                                                            beforeSend: function (xhr) {
                                                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                            }
                                                                                                        }).done(function (response) {
                                                                                                            if (response === '1') {
                                                                                                                self.setContent('New Nature Of Case Added');
                                                                                                                self.setTitle('Successeful!');
                                                                                                            } else {
                                                                                                                self.setContent('Nature Of Case could not be added!</b> Please Try Again');
                                                                                                                self.setTitle('Error!');
                                                                                                            }
                                                                                                        }).fail(function () {
                                                                                                            self.setContent('Something went wrong.');
                                                                                                        });
                                                                                                    },
                                                                                                    onDestroy: function () {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                            $("#integratedagenciesForm").submit(function (e) {
                                                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                                                e.preventDefault();
                                                                                                $.confirm({
                                                                                                    content: function () {
                                                                                                        var self = this;
                                                                                                        return $.ajax({
                                                                                                            type: "POST",
                                                                                                            url: "./addMoreintegratedagency.htm",
                                                                                                            async: false,
                                                                                                            data: $("#integratedagenciesForm").serialize(),
                                                                                                            beforeSend: function (xhr) {
                                                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                            }
                                                                                                        }).done(function (response) {
                                                                                                            if (response === '1') {
                                                                                                                self.setContent('Integrated Agency Added');
                                                                                                                self.setTitle('Successeful!');
                                                                                                            } else {
                                                                                                                self.setContent('Integrated Agency could not be added!</b> Please Try Again');
                                                                                                                self.setTitle('Error!');
                                                                                                            }
                                                                                                        }).fail(function () {
                                                                                                            self.setContent('Something went wrong.');
                                                                                                        });
                                                                                                    },
                                                                                                    onDestroy: function () {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                            $("#nonintegratedagenciesForm").submit(function (e) {
                                                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                                                e.preventDefault();
                                                                                                $.confirm({
                                                                                                    content: function () {
                                                                                                        var self = this;
                                                                                                        return $.ajax({
                                                                                                            type: "POST",
                                                                                                            url: "./addMorenonintegratedagency.htm",
                                                                                                            async: false,
                                                                                                            data: $("#nonintegratedagenciesForm").serialize(),
                                                                                                            beforeSend: function (xhr) {
                                                                                                                xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                                            }
                                                                                                        }).done(function (response) {
                                                                                                            if (response === '1') {
                                                                                                                self.setContent('Non Integrated Agency Added');
                                                                                                                self.setTitle('Successeful!');
                                                                                                            } else {
                                                                                                                self.setContent('Non Integrated Agency could not be added!</b> Please Try Again');
                                                                                                                self.setTitle('Error!');
                                                                                                            }
                                                                                                        }).fail(function () {
                                                                                                            self.setContent('Something went wrong.');
                                                                                                        });
                                                                                                    },
                                                                                                    onDestroy: function () {
                                                                                                        window.location.reload();
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                        });
        </script>
    </body>
</html>
