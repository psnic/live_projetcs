<%-- 
    Document   : templateforallpages
    Created on : 8 Nov, 2022, 4:52:32 PM
    Author     : Lily
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
        <title>Superuser Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="tempscripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/passwordstrength/passtrength.css" rel="stylesheet" type="text/css"/>

        <style>
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
                    <%@include file="banner.jsp" %>
                    <div class="container-fluid">

                        <div class="card scrollcontainer">
                            <div class="card-header bg-purple d-flex justify-content-between">
                                <h4 class="text-white text-left fw-bold font-size-lg mb-0">User Management</h4>
                                <input type="button" class="btn btn-success btn-sm" id="addNewUser" name="addNewUsernm" value="Create New User" data-toggle="modal" data-target="#createNewUser-modal" data-dismiss="modal"/>
                            </div>
                            <hr>
                            <div class="p-2 card-body table-responsive">
                                <table id="userList" class="table table-striped">
                                    <thead class="fs-14">
                                        <tr>
                                            <th>Sl No.</th>
                                            <th>Username</th> 
                                            <th>User Type</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Contact Number</th>
                                            <th>Email ID</th>
                                            <th>Address</th>
                                            <th>Usercode</th>
                                            <th class="noExport">Edit</th>
                                            <th class="noExport">Change Password</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${userloginlist}" var="u" varStatus="x">
                                            <tr>
                                                <td>
                                                    <c:out value="${x.count}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[1]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[8]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[2]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[3]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[5]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[6]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[4]}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u[7]}"></c:out>
                                                    </td>
                                                    <td>
                                                        <input type="button" id="editUser" onclick="editfunc('<c:out value="${u[0]}"/>', '<c:out value="${u[1]}"/>', '<c:out value="${u[2]}"/>', '<c:out value="${u[3]}"/>', '<c:out value="${u[4]}"/>', '<c:out value="${u[5]}"/>', '<c:out value="${u[6]}"/>', '<c:out value="${u[7]}"/>', '<c:out value="${u[9]}"/>', '<c:out value="${u[10]}"/>', '<c:out value="${u[11]}"/>', '<c:out value="${u[12]}"/>')" value="Edit User" class="btn btn-secondary" data-toggle="modal" data-target="#createNewUser-modal" data-dismiss="modal"/>
                                                </td>
                                                <td>
                                                    <input type="button" id="changeUserPassword" onclick="changepasswordfunc('<c:out value="${u[0]}"/>', '<c:out value="${u[1]}"/>')" value="Change User Password" class="btn btn-primary" data-toggle="modal" data-target="#changepasswordModal-modal" data-dismiss="modal"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>  
                    </div>


                    <!-- Modal for Superuser's create user -->
                    <div class="modal fade" id="createUserModal" tabindex="-1" aria-labelledby="createUserLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-header bg-purple-hov ">
                                <h5 class="modal-title fw-bold text-white" id="managerModalLabel">Create User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-right:20px !important;"></button>
                            </div>
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Enter User Details</h4></div>
                                    <div class="col-sm-12">
                                        <div class="container">
                                            <div class="card">
                                                <div class="card-body">
                                                    <form:form modelAttribute="userlogin" id="frmcreateuserlogin" name="createuserlogin"  autocomplete="off" class="needs-validation">
                                                        <form:input path="userid" id="userid"  class="form-control" hidden="true" ></form:input>
                                                        <form:input path="usercode" id="usercode"  class="form-control" hidden="true"></form:input>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="username" class="space form-control h-100" id="inputUsername" placeholder="Username" rows="7" maxlength="20"></form:input>
                                                                        <label for="inputUsername">Enter Username</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:select path="m_usertype.usertypeid" name="usertype" class="form-select" id="inputUsertype" aria-label="Select Usertype" required="true">
                                                                        <option selected="true" disabled="true" value="">Select Usertype</option>
                                                                        <c:forEach items="${usertypelist}" var="u">
                                                                            <form:option value="${u.usertypeid}"><c:out value="${u.usertypedesc}"/></form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <label for="inputUsertype">Select Usertype</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <form:select path="m_centre.centreid" name="usercentre" class="form-select" id="inputUsercentre" aria-label="Select Usercentre" required="true">
                                                                        <option selected="true" disabled="true" value="">Select User Centre</option>
                                                                        <c:forEach items="${centrelist}" var="c">
                                                                            <form:option value="${c.centreid}"><c:out value="${c.centredesc}"/></form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <label for="inputUsercentre">Select User Centre</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row g-2 mb-3" id="inputPassword">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <form:input path="password"  type="password" class="space form-control h-100" id="password" placeholder="Enter Password" rows="7" maxlength="15" onfocusout="checkreq()"></form:input>
                                                                        <!--<label for="password">Enter Password</label>--> 
                                                                    </div>
                                                                </div>

                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                        <input type="password" name="confirmpassword" class="form-control h-100" id="inputConfirmpassword" placeholder="Confirm Password" rows="7" maxlength="15"/>
                                                                        <!--<label for="inputConfirmpassword">Confirm Password</label>-->
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="firstname"  class="alphabets form-control h-100" id="inputFirstname" placeholder="Firstname" rows="7" maxlength="50"></form:input>
                                                                        <label for="inputFirstname">Enter Firstname</label>
                                                                    </div> 
                                                                </div>

                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="lastname" class="alphabets form-control h-100" id="inputLastname" placeholder="Lastname" rows="7" maxlength="50"></form:input>
                                                                        <label for="inputLastname">Enter Lastname</label>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="contactno" class="numbers form-control h-100" id="inputContactno" placeholder="Contact No." rows="7" minlength="10" maxlength="10"></form:input>
                                                                        <label for="inputContactno">Enter Contact No.</label>
                                                                    </div> 
                                                                </div>

                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="emailid"  type="email" class="form-control h-100" id="inputEmailid" placeholder="Email ID" maxlength="50"></form:input>
                                                                        <label for="inputEmailid">Enter Email ID</label>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="address"  type="text" name="address" class="form-control h-100" id="inputAddress" placeholder="Address" maxlength="300"></form:input>
                                                                        <label for="inputAddress">Enter Address</label>
                                                                    </div> 
                                                                </div>
                                                                <div class="col-md" id="sipline">
                                                                    <div class="form-floating">
                                                                    <form:input path="sipline"  type="text" class="numbers form-control h-100" id="inputSipline" placeholder="Sipline" maxlength="4"></form:input>
                                                                        <label for="inputSipline">Enter Sip Line</label>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="mb-4" id="isManager">
                                                                <input type="checkbox" id="ismanager" value="0" onchange="toggle();"/>
                                                                <label for="ismanager">Is Manager</label>
                                                            </div>
                                                            <div class="w-100" style="text-align:center">
                                                                <input id="createuserbtn" type="submit" value="Create User" class="btn btn-success" />
                                                                <input id="updateuserbtn" type="submit" value="Update User Details" class="btn btn-success" />
                                                                <input type="button" id="deleteBTN" value="Delete User" class="btn btn-danger" />
                                                                <input type="reset" value="Reset" class="btn btn-warning" />
                                                            </div>                                                          
                                                    </form:form>
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
                    <!-- Modal for Superuser's create user end-->
                    <!-- Modal for Superuser's Change Password -->
                    <div class="modal fade" id="changepasswordModal" tabindex="-1" aria-labelledby="changepasswordLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-purple-hov ">
                                    <h5 class="modal-title fw-bold text-white" id="managerModalLabel">Change User Password</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                                  
                                </div>
                                <div class="modal-body">
                                    <div class="col-sm-12">
                                        <div class="container">
                                            <div class="card">
                                                <div class="card-body">
                                                    <form method="POST"  name="userpasswordnm" id="userpassword" role="form" autocomplete="off">
                                                        <input name="useridpw" id="userid_changepassword" hidden="true" />
                                                        <div class="text-center row g-2 mb-3">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <input name="username" id="inputUsernamepw" class="form-control h-100" required="true" readonly="true"/>
                                                                    <label for="inputUsernamepw">User ID</label>
                                                                </div> 
                                                            </div> 
                                                        </div>
                                                        <div class="text-center row g-2 mb-3" id="OldPassword">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <input name="oldpassword"  type="password" class="space form-control h-100" id="inputOldPassword" placeholder="Enter Old Password" maxlength="15"/>
                                                                    <label for="inputOldPassword">Enter Old Password</label> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="text-center row g-2 mb-3" id="NewPassword">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <label for="inputNewPassword">Enter New Password</label>
                                                                    <input name="newpassword" type="password" class="space form-control h-100" id="inputNewPassword" placeholder="Enter New Password" maxlength="15" onfocusout="checkreq(); checkoldnewpwd()"/>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="text-center row g-2 mb-3" id="ConfirmPassword">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <label for="inputConfirmNewPassword">Confirm New Password</label>
                                                                    <input name="confirmnewpassword" type="password" class="space form-control h-100" id="inputConfirmNewPassword" placeholder="Confirm New Password" maxlength="15"/>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <center>
                                                            <input id="changepasswordbtn" type="button" name="changepasswordbtn" value="SUBMIT" onclick="changeuserpassword()" class="btn btn-info"/>
                                                            <input type="button" value="RESET" class="btn btn-danger" onclick="customReset();"/>
                                                        </center>
                                                    </form>
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
                    <!--End of Modal for Superuser's Change Password -->
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
        <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="tempscripts/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="suantonsing/passwordstrength/passtrength.js" type="text/javascript"></script>
        <script>
                                                                $(document).ready(function () {
                                                                    $('#userList').DataTable({
                                                                        dom: 'Blfrtip',
                                                                        retrieve: true,
                                                                        sPaginationType: "full_numbers",
                                                                        bJQueryUI: true,
                                                                        bDestroy: true,
                                                                        pageLength: 50,
                                                                        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                                                                        buttons: [
                                                                            {
                                                                                extend: 'excel',
                                                                                text: '<p class="mb-0"><i class="fa-solid fa-file-excel"></i>&nbsp;Export Userlist</p>',
                                                                                title: function () {
                                                                                    return "User List";
                                                                                },
                                                                                exportOptions: {
                                                                                    columns: "thead th:not(.noExport)"
                                                                                }
                                                                            }
                                                                        ]
                                                                    });

                                                                    $('#changepasswordModal').modal({backdrop: 'static', keyboard: false}, 'show');

                                                                    $(function () {
                                                                        $('input.alphabets').keyup(function () {
                                                                            if (this.value.match(/[^a-zA-Z. ]/g)) {
                                                                                this.value = this.value.replace(/[^a-zA-Z. ]/g, '');
                                                                            }
                                                                        });
                                                                    });

                                                                    $(document).on("keypress", ".numbers", function (event) {
                                                                        if (event.which < 48 || event.which > 57) {
                                                                            event.preventDefault();
                                                                        }

                                                                    });
                                                                    $(document).on("keypress", ".space", function (event) {
                                                                        if (event.which === 32) {
                                                                            event.preventDefault();
                                                                        }

                                                                    });

                                                                    $("#inputContactno").keypress(function () {
                                                                        var m = $('#inputContactno').val();

                                                                        if (m.length < 10)
                                                                        {
                                                                            $('#inputContactno').html("");
                                                                        }
                                                                    });

                                                                    $("#inputConfirmpassword").keyup(function (e) {
                                                                        if ($("#password").val().replace(/\s/g, '').length === 0) {
                                                                            alert("Please Enter password first")
                                                                            $("#inputConfirmpassword").val("");
                                                                            $("#password").focus();
                                                                        }
                                                                    });

                                                                    $("#inputConfirmpassword").focusout(function (e) {
                                                                        if ($("#inputConfirmpassword").val().replace(/\s/g, '').length !== 0)
                                                                            if ($("#password").val() !== $("#inputConfirmpassword").val()) {
                                                                                alert("Confirmed Password does not match")
                                                                                $("#inputConfirmpassword").val("");
                                                                                $("#inputConfirmpassword").focus();
                                                                                return false;
                                                                            }
                                                                    });
                                                                    $("#inputConfirmNewPassword").focusout(function (e) {
                                                                        if ($("#inputConfirmNewPassword").val().replace(/\s/g, '').length !== 0)
                                                                            if ($("#inputNewPassword").val() !== $("#inputConfirmNewPassword").val()) {
                                                                                alert("Confirmed Password does not match")
                                                                                $("#inputConfirmNewPassword").val("");
                                                                                $("#inputConfirmNewPassword").focus();
                                                                                return false;
                                                                            }
                                                                    });
                                                                    $("#addNewUser").click(function () {
                                                                        $('#frmcreateuserlogin')[0].reset();
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    url: 'usermanagement.htm',
                                                                                    method: 'GET'
                                                                                }).done(function () {
                                                                                    $("#createUserModal").modal('show');
                                                                                    $("#createuserbtn").show();
                                                                                    $("#inputPassword").show();
                                                                                    $("#deleteBTN").hide();
                                                                                    $("#updateuserbtn").hide();
                                                                                    $("#sipline").hide();
                                                                                    $("#isManager").hide();
                                                                                    self.close();
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            },
                                                                            onClose: function () {
                                                                            }
                                                                        });
                                                                    });

                                                                    $("#deleteBTN").click(function () {
                                                                        var userid = $('#userid').val();
                                                                        var username = $("#inputUsername").val();
                                                                        $.confirm({
                                                                            title: 'Are you sure you want to delete the user ' + username + ' ?',
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
                                                                                                    url: './deleteuser.htm',
                                                                                                    data: 'userid=' + userid
                                                                                                }).done(function (response) {
                                                                                                    if (response === '1') {
                                                                                                        self.setTitle('Successful!');
                                                                                                        self.setContent('User Deleted succesfully');
                                                                                                        $("#createUserModal").modal('hide');
                                                                                                    } else {
                                                                                                        self.setTitle('Error Occurred!');
                                                                                                        self.setContent('Unable to Delete user. Please try again!');
                                                                                                        $("#createUserModal").modal('hide');
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
                                                                    });

                                                                    $("#inputEmailid").focusout(function (e) {
                                                                        var re = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
                                                                        if ($("#inputEmailid").val().replace(/\s/g, '').length !== 0) {
                                                                            if (re.test($('#inputEmailid').val()) === false) {
                                                                                alert("Please enter valid Email ID");
                                                                                $("#inputEmailid").val("");
                                                                                $("#inputEmailid").focus();
                                                                            }
                                                                        }
                                                                    });

                                                                    $("#inputOldPassword").on('focusout', function (e) {
                                                                        var userid = $("#userid").val();
                                                                        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                        var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                        $("#inputOldPassword").removeClass('is-invalid');
                                                                        var self;
                                                                        $.confirm({
                                                                            content: function () {
                                                                                self = this;
                                                                                return $.ajax({
                                                                                    method: 'POST',
                                                                                    url: './checkoldpasswordmatch.htm',
                                                                                    data: 'oldpassword=' + $('#inputOldPassword').val().trim() + '&userid=' + userid.trim(),
                                                                                    beforeSend: function (xhr) {
                                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                    }
                                                                                }).done(function (response) {
                                                                                    if (response === '1') {
                                                                                        self.setContent("Old Password does not match");
                                                                                        self.setTitle('Wrong Password');
                                                                                        $("#inputOldPassword").val("");
                                                                                        $("#inputOldPassword").addClass('is-invalid');
                                                                                    } else {
                                                                                        self.close();
                                                                                        $("#inputOldPassword").addClass('is-valid');
                                                                                    }
                                                                                }).fail(function () {
                                                                                    self.setContent('Something went wrong.');
                                                                                });
                                                                            }
                                                                        });
                                                                    });

                                                                    $("#frmcreateuserlogin").submit(function (e) {
                                                                        var username = $("#inputUsername").val();
                                                                        var firstname = $("#inputFirstname").val();
                                                                        var lastname = $("#inputLastname").val();
                                                                        var password = $("#password").val();
                                                                        var usertype = $("#inputUsertype option:selected").text();

                                                                        e.preventDefault();
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    type: "POST",
                                                                                    url: "./usermanagement.htm",
                                                                                    async: false,
                                                                                    data: $("#frmcreateuserlogin").serialize() + "&ismanager=" + $("#ismanager").val()
                                                                                }).done(function (response) {
                                                                                    if (response === '1') {
                                                                                        $("#createUserModal").modal('hide');
                                                                                        self.setContent('New User <b>' + firstname + ' ' + lastname + '\'s  </b>' + 'account created as <b>' + usertype + '.</b></br> User ID : <b>' + username + '</b> and Password: <b>' + password + '</b>.');
                                                                                        self.setTitle('Successefully Created User!');
                                                                                    } else if (response === '2') {
                                                                                        self.setContent('Username already Exists!</b> Please Try a Different Username');
                                                                                        self.setTitle('Error!');
                                                                                    } else if (response === '3') {
                                                                                        self.setContent('User Details Successfully Updated');
                                                                                        self.setTitle('Success!');
                                                                                    } else {
                                                                                        $("#createUserModal").modal('hide');
                                                                                        self.setContent('User could not be created!</b> Please Try Again');
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

                                                                    $('#inputUsertype').change(function () {
                                                                        var typeid = $('#inputUsertype').val();
                                                                        if (typeid === '1' || typeid === '3') {
                                                                            $('#sipline').show();
                                                                            $('#isManager').hide();
                                                                        } else if (typeid === '2') {
                                                                            $('#isManager').show();
                                                                            $('#sipline').show();
                                                                        } else {
                                                                            $('#sipline').hide();
                                                                            $('#isManager').hide();
                                                                            $('#inputSipline').val('');
                                                                        }
                                                                    });
                                                                });
                                                                function editfunc(userid, username, firstname, lastname, address, contactno, emailid, usercode, usertype, centre, password, sipline) {
                                                                    $("#userid").val(userid);
                                                                    $("#inputUsername").val(username);
                                                                    $("#inputFirstname").val(firstname);
                                                                    $("#inputLastname").val(lastname);
                                                                    $("#inputAddress").val(address);
                                                                    $("#inputContactno").val(contactno);
                                                                    $("#inputEmailid").val(emailid);
                                                                    $("#usercode").val(usercode);
                                                                    $("#password").val(password);
                                                                    $("#inputSipline").val(sipline);
                                                                    $("#inputUsertype").val(usertype).trigger("change");
                                                                    $("#inputUsercentre").val(centre).trigger("change");
                                                                    $("#createUserModal").modal('show');
                                                                    $("#inputPassword").hide();
                                                                    $("#createuserbtn").hide();
                                                                    $("#deleteBTN").show();
                                                                    $("#updateuserbtn").show();
                                                                }
                                                                function changepasswordfunc(userid, username) {
                                                                    $("#changepasswordModal").modal('show');
                                                                    $("#inputUsernamepw").val(username);
                                                                    $("#userid").val(userid);
                                                                }

                                                                function changeuserpassword() {
                                                                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                    var userid = $("#userid").val();
                                                                    var uname = $("#inputUsernamepw").val();
                                                                    var newpw = $("#inputNewPassword").val();
                                                                    var oldpw = $("#inputOldPassword").val();
                                                                    $.confirm({
                                                                        content: function () {
                                                                            var self = this;
                                                                            return $.ajax({
                                                                                method: "POST",
                                                                                url: "./updatepassword.htm",
                                                                                data: 'newpassword=' + newpw + '&oldpassword=' + oldpw + '&useridpw=' + userid,
                                                                                beforeSend: function (xhr) {
                                                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                                }
                                                                            }).done(function (response) {
                                                                                if (response === '2') {
                                                                                    $("#changepasswordModal").modal('hide');
                                                                                    self.setContent('Password is successfully changed for the User ' + uname);
                                                                                    self.setTitle('Success!');
                                                                                } else if (response === '1') {
                                                                                    self.setContent('Old Password is incorrect');
                                                                                    self.setTitle('Please Try Again!');
                                                                                } else {
                                                                                    $("#changepasswordModal").modal('hide');
                                                                                    self.setContent('Something went wrong Password could not be changed!');
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
                                                                }

                                                                function checkreq()
                                                                {
                                                                    var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
                                                                    if ($("#inputNewPassword").val().replace(/\s/g, '').length !== 0) {
                                                                        if (re.test($('#inputNewPassword').val()) === false) {
                                                                            alert("Password doesn't match requirement!!! Password must contain atleast one number, one lowercase, one uppercase and atleast 8 characters");
                                                                            $("#inputNewPassword").val("");
                                                                            $("#inputNewPassword").focus();
                                                                        }
                                                                    }
                                                                }
                                                                function checkoldnewpwd()
                                                                {
                                                                    if ($("#inputNewPassword").val().replace(/\s/g, '').length !== 0) {
                                                                        var oldpwd = $('#inputOldPassword').val().toUpperCase();
                                                                        var newpwd = $('#inputNewPassword').val().toUpperCase();
                                                                        if (oldpwd === newpwd) {
                                                                            alert("New Password should not match with old password");
                                                                            $("#inputNewPassword").val("");
                                                                            $("#inputNewPassword").focus();
                                                                        }
                                                                    }
                                                                }

                                                                function toggle()
                                                                {
                                                                    if ($("#ismanager").is(":checked")) {
                                                                        $("#ismanager").val("1");
                                                                    } else {
                                                                        $("#ismanager").val("0");
                                                                    }
                                                                }

                                                                $('#password').passtrength({
                                                                    tooltip: true,
                                                                    textWeak: "Weak",
                                                                    textMedium: "Medium",
                                                                    textStrong: "Strong",
                                                                    textVeryStrong: "Very Strong",
                                                                    passwordToggle: true
                                                                });
                                                                $('#inputConfirmpassword').passtrength({
                                                                    tooltip: true,
                                                                    textWeak: "Weak",
                                                                    textMedium: "Medium",
                                                                    textStrong: "Strong",
                                                                    textVeryStrong: "Very Strong",
                                                                    passwordToggle: true
                                                                });
                                                                $('#inputConfirmNewPassword').passtrength({
                                                                    tooltip: true,
                                                                    textWeak: "Weak",
                                                                    textMedium: "Medium",
                                                                    textStrong: "Strong",
                                                                    textVeryStrong: "Very Strong",
                                                                    passwordToggle: true
                                                                });
                                                                $('#inputNewPassword').passtrength({
                                                                    tooltip: true,
                                                                    textWeak: "Weak",
                                                                    textMedium: "Medium",
                                                                    textStrong: "Strong",
                                                                    textVeryStrong: "Very Strong",
                                                                    passwordToggle: true
                                                                });



        </script>
    </body>
</html>
