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
        <c:choose>
            <c:when test="${deskid=='4'}">
                <title>Coordinator Desk</title>
            </c:when>    
            <c:otherwise>
                <title>Manager Desk</title>
            </c:otherwise>
        </c:choose>
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
                        <div class="container-fluid px-4">
                            <div class="mt-3">
                                <div class="card">
                                    <div class="card-body align-items-center justify-content-center">
                                        <div class="float-start">
                                        <c:choose>
                                            <c:when test="${deskid=='4'}">
                                                <p type="button" class="mynavitem mb-0" onclick="gotoCaseIndex();"><i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;Back to Case Management</p>
                                            </c:when>    
                                            <c:otherwise>
                                                <p type="button" class="mynavitem mb-0" onclick="gotoCaseManagement();"><i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;Back to Case Management</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <c:choose>
                                        <c:when test="${closureid == '1'}">
                                            <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-regular fa-file-excel"></i>&nbsp;&nbsp;Recommend Case Closure to Closure Desk</h5>
                                        </c:when>
                                        <c:when test="${closureid == '2'}">
                                            <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-solid fa-rectangle-xmark"></i>&nbsp;&nbsp;Case Closure Desk</h5>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="scrollcontainer">
                            <!--<div class="card">-->
                            <!--<div class="card-body">-->
                            <div class="row mt-2">
                                <div class="col">
                                    <div class="card">
                                        <div class="card-body">
                                            <form id="recommendCaseClosureForm" autocomplete="off">
                                                <input type="hidden" value="<c:out value="${basic_casedetails.caseno}" />" id="inputCaseNoRO" name="caseno" />
                                                <input type="hidden" value="<c:out value="${closureid}" />" id="closureid" name="closureid" />
                                                <div class="form-floating mb-3">
                                                    <select name="closuretypeid" id="closuretypeid" class="form-select" aria-label="Floating label select example" required="true">
                                                        <option value="">Select Closure Type</option>
                                                        <c:forEach items="${closurelist}" var="c" varStatus="status">
                                                            <option value="${c.closuretypeid}">${c.closuretypedesc}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label for="closuretypeid">Select Closure Type&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <textarea id="reasonclosure" name="reasonclosure" rows="4" class="form-control" placeholder="Leave a comment here" style="height: 100px" required="true"></textarea>
                                                    <label for="reasonclosure">Reason for Closure&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input id="closuredate" name="closuredate" type="date" class="form-control" placeholder="Leave a comment here" ></textarea>
                                                    <label for="closuredate">Recommended Closure Date</label>
                                                </div>
                                                <input type="hidden" id="closureid"  class="form-control" value="${closureid}"/>
                                                <input type="submit" class="btn btn-success w-100" value="Recommend For Case Closure" />
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="col">
                                    <%@include file="manager_casehistory.jsp" %>
                                </div>
                            </div>
                            <!--</div>-->
                            <!--</div>-->
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
                                                        $('#recommendCaseClosureForm').submit(function (e) {
                                                            e.preventDefault();
                                                            var formData = new FormData($(this)[0]);
                                                            $.confirm({
                                                                content: function () {
                                                                    var self = this;
                                                                    return $.ajax({
                                                                        url: './markcaseclosure.htm',
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
                                                                        self.setTitle(res.title);
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

                                                    function gotoCaseIndex() {
                                                        var cn = $('#inputCaseNoRO').val();
                                                        window.location.href = "caseindex.htm?caseno=" + cn;
                                                    }
                                                    
        </script>
    </body>
</html>
