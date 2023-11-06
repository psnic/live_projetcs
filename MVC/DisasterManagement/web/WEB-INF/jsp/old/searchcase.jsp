<%-- 
    Document   : searchcase
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
        <title>Search Case</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container px-4">
                        <div class="card mt-4">
                            <div class="card-header bg-purple text-center"><h4 class="text-white py-2"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;Search Case</h4></div>
                            <div class="card-body">
                                <form id="searchCaseForm" class="needs-validation" action="casemanagement.htm" method="GET" novalidate>
<!--                                    <div class="form-floating mb-3">
                                        <input maxlength="50" type="text" class="form-control" id="inputSearchCaseNo" placeholder="Enter the Case No. to search" name="icaseno">
                                        <label for="floatingInput">Enter the Case No. to search</label>
                                    </div>-->

                                    <div class="row my-3 text-center">
                                        <div class="col-sm-12">Select Or Enter A Case No. From Below</div>
                                    </div>

                                    <!--<div class="form-floating">-->
                                        <select class="form-select" id="selectSearchCaseNo" aria-label="Floating label select example" name="icaseno">
                                            <option value="" selected="true" disabled="true">Select Case No.</option>

                                            <c:forEach items="${casenos}" var="c" varStatus="x">
                                                <option value="${c}"><c:out escapeXml="true" value="${c}" /></option>
                                            </c:forEach>
                                        </select>
                                        <!--<label for="selectSearchCaseNo">Select Case No</label>-->
                                    <!--</div>-->

                                    <div class="row mt-3 text-center">
                                        <div class="col-sm-12">
                                            <button id="searchCaseBtn" class="btn btn-success btn-lg"><i class="fa-solid fa-magnifying-glass"></i>&nbsp;Search Case</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--                            <div class="card-footer"></div>-->
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
        <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
        <script src="suantonsing/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#closedCaseTable').DataTable({});
                $('#selectSearchCaseNo').select2();

                $('#searchCaseBtn').click(function (e) {
                    $('#inputSearchCaseNo').removeClass('is-invalid');
                    $('#selectSearchCaseNo').removeClass('is-invalid');
                    var inputSearch = $('#inputSearchCaseNo').val();
                    var selectSearch = $('#selectSearchCaseNo').val();
                    if ((inputSearch.length === 0 || inputSearch === null) && (selectSearch === null || selectSearch.length === 0)) {
                        $.alert("Enter or Select Case Number");
                        $('#inputSearchCaseNo').addClass('is-invalid');
                        $('#selectSearchCaseNo').addClass('is-invalid');
                        return false;
                    }
                    return true;
                });
            });
        </script>
    </body>
</html>
