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
        <title>Account Details</title>
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
                        <div class="container-fluid px-4 scrollcontainer">
                            <div class="card mt-4">
                                <div class="card-header bg-purple-hov text-center text-white">
                                    <i class="fa-solid fa-user-pen"></i>&nbsp;&nbsp;Account Details&nbsp;&nbsp;<i class="fa-solid fa-user-pen"></i>
                                </div>
                                <div class="card-body">
                                <form:form modelAttribute="userlogin" autocomplete="off" id="accountDetailsForm">
                                    <div class="row">
                                        <form:input type="hidden" class="form-control" path="userid" id="inputUserID" readonly="true"/>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" path="username" class="form-control" id="inputUsername" placeholder="Enter Username" />
                                                <label for="inputUsername">Username (Used for Logging In to the System)</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" path="firstname" class="form-control" id="inputFirstName" placeholder="Enter First Name" />
                                                <label for="inputFirstName">First Name</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" path="lastname" class="form-control" id="inputLastName" placeholder="Enter Last Name" />
                                                <label for="inputLastName">Last Name</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" path="contactno" class="form-control" id="inputContactNo" placeholder="Enter Contact Number" />
                                                <label for="inputContactNo">Contact Number</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-floating mb-3">
                                                <form:input type="email" path="emailid" class="form-control" id="inputEmail" placeholder="Enter Email ID" />
                                                <label for="inputEmail">Email ID</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-9">
                                            <div class="form-floating mb-3">
                                                <form:textarea type="text" path="address" class="form-control" id="inputAddress" placeholder="Enter Address"></form:textarea>
                                                    <label for="inputAddress">Address</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-4">
                                            <div class="col-sm-12 col-md-12">
                                                <p class="text-muted">More Account Details About You. Only Super Administrator can modify these details.</p>
                                            </div>
                                            <div class="col-sm-12 col-md-3">
                                                <div class="form-floating mb-3">
                                                <form:input type="text" path="usercode" class="form-control" id="inputUsercode" placeholder="Usercode" readonly="true" />
                                                <label for="inputUsercode">Usercode</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <form:input type="hidden" path="m_usertype.usertypeid" id="inputUserTypeRO" class="form-control" readonly="true" />
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="inputUserType" value="${userlogin.m_usertype.usertypedesc}" placeholder="User Type" readonly="true" />
                                                <label for="inputUserType">User Type</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <form:input type="hidden" path="m_centre.centreid" id="inputCentreRO" class="form-control" readonly="true" />
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="inputCentre" value="${userlogin.m_centre.centredesc}" placeholder="Usercode" readonly="true" />
                                                <label for="inputCentre">Centre</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 d-flex justify-content-between">
                                        <button type="button" class="btn btn-pink text-white fw-bold" data-bs-toggle="modal" data-bs-target="#changePasswordModal"><i class="fa-solid fa-key"></i>&nbsp;&nbsp;Change Password</button>
                                        <button type="submit" class="btn btn-purple text-white fw-bold"><i class="fa-solid fa-floppy-disk"></i>&nbsp;&nbsp;Save</button>
                                    </div>    
                                </form:form>
                            </div>
                        </div>

                        <!-- Modal -->
                        <form id="changePasswordForm" autocomplete="off">
                            <div class="modal fade" id="changePasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <input type="text" name="usercode" class="form-control" id="usercodeRO" placeholder="Usercode" readonly="true" value="${userlogin.userid}" hidden="true"/>
                                                <div class="col-sm-12 col-md-12">
                                                    <div class="form-floating mb-3">
                                                        <input type="password" class="form-control" id="inputCurrentPassword" placeholder="name@example.com" required="true">
                                                        <label for="inputCurrentPassword">Current Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="form-floating mb-3">
                                                        <input type="password" class="form-control" id="inputNewPassword" placeholder="name@example.com" required="true">
                                                        <label for="inputNewPassword">New Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-md-6">
                                                    <div class="form-floating mb-3">
                                                        <input type="password" class="form-control" id="inputConfirmNewPassword" placeholder="name@example.com" required="true">
                                                        <label for="inputConfirmNewPassword">Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer d-flex justify-content-between">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Update Password</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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
                var cpM = $('#changePasswordModal').modal();

                $('#accountDetailsForm').submit(function (e) {
                    e.preventDefault();
                    var formData = new FormData($(this)[0]);
                    var st;
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                url: './saveaccountdetails.htm',
                                data: formData,
                                method: 'POST',
                                processData: false,
                                contentType: false,
                                beforeSend: function (xhr) {
                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                }
                            }).done(function (response) {
                                var res = JSON.parse(response);
                                st = res.status;
                                self.setTitle(res.title);
                                self.setContent(res.msg);
                            }).fail(function () {
                                self.setContent('Something went wrong.');
                            });
                        },
                        buttons: {
                            close: function () {
                                if (st === 1) {
                                    window.location.reload();
                                }
                            }
                        }
                    });
                });

                cpM.addEventListener('hidden.bs.modal', function (event) {
                    $('#changePasswordModal').trigger('reset');
                });
            });
        </script>
    </body>
</html>
