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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Police Station</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <link href="tempscripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>

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
                                <h4 class="text-white text-left fw-bold font-size-lg mb-0">Police Station</h4>
                                <input type="button" class="btn btn-success btn-sm" id="addNewStation" name="addNewStationnm" value="Add New Police Station" data-toggle="modal" data-target="#createNewStation-modal" data-dismiss="modal"/>
                            </div>
                            <hr>
                            <div class="p-2 card-body table-responsive">
                                <table id="policestationList" class="table table-striped">
                                    <thead class="fs-14">
                                        <tr>
                                            <th>Sl No.</th>
                                            <th>Police station code</th> 
                                            <th>District</th>
                                            <th>Ncrb code</th>
                                            <th>Police station</th>
                                            <th>Active status</th>
                                            <th class="noExport">Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${p_list}" var="u" varStatus="status">
                                            <tr>
                                                <td>
                                                    <c:out value="${status.count}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u.policestationcode}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u.district.districtname}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u.ncrbcode}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u.policestation}"></c:out>
                                                    </td>
                                                    <td>
                                                    <c:out value="${u.activestatus}"></c:out>
                                                    </td>
                                                    <td>
                                                        <input type="button" id="editStation" onclick="editfunc('<c:out value="${u.policestationcode}"/>', '<c:out value="${u.district.districtcode}"/>', '<c:out value="${u.ncrbcode}"/>', '<c:out value="${u.policestation}"/>', '<c:out value="${u.activestatus}"/>')" value="Edit" class="btn btn-secondary" data-toggle="modal" data-target="#createNewStation-modal" data-dismiss="modal"/>
                                                    </td>                                               
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>  
                    </div>


                    <!-- Modal for Superuser's create police station -->
                    <div class="modal fade" id="createNewStationModal" tabindex="-1" aria-labelledby="createNewStationLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-header bg-purple-hov ">
                                <h5 class="modal-title fw-bold text-white" id="createNewStationLabel">Create New Police Station</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-right:20px !important;"></button>
                            </div>
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="col-sm-12 text-center mb-2"><h4 class="fw-bold">Enter Police Station Details</h4></div>
                                    <div class="col-sm-12">
                                        <div class="container">
                                            <div class="card">
                                                <div class="card-body">
                                                    <form:form modelAttribute="policestation" id="frmcreatepolicestation" name="policestationform"  autocomplete="off" class="needs-validation">
                                                        <form:input path="policestationcode" id="policestationcode"  class="form-control" hidden="true" ></form:input>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="ncrbcode" class="numbers space form-control h-100" id="ncrbcode" placeholder="Ncrb Code" rows="7" maxlength="7"></form:input>
                                                                        <label for="ncrbcode">Enter NCRBCode</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:select path="district.districtcode" name="districtcode" class="form-select" id="districtcode" aria-label="Select District" required="true">
                                                                        <option selected="true" disabled="true" value="">Select District</option>
                                                                        <c:forEach items="${districtlist}" var="v">
                                                                            <form:option value="${v.districtcode}"><c:out value="${v.districtname}"/></form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                    <label for="districtcode">Select District</label>
                                                                </div>
                                                            </div>
                                                        </div>                                                        
                                                        <div class="row g-2 mb-3">
                                                            <div class="col-md">
                                                                <div class="form-floating">
                                                                    <form:input path="policestation"  class="alphabets form-control h-100" id="policestation" placeholder="Police Station" rows="7" maxlength="100" required="true"></form:input>
                                                                        <label for="policestation">Enter Police Station</label>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="row g-2 mb-3">
                                                                <div class="col-md">
                                                                    <div class="form-floating">
                                                                    <form:input path="activestatus" class="text-uppercase alphabets form-control h-100" id="activestatus" placeholder="Active Status" rows="7" maxlength="10"></form:input>
                                                                        <label for="activestatus">Enter Active Status</label>
                                                                    </div> 
                                                                </div>
                                                            </div>
                                                            <div class="w-100" style="text-align:center">
                                                                <input id="createstationbtn" type="submit" value="Create Police Station" class="btn btn-success" />
                                                                <input id="updatestationbtn" type="submit" value="Update Police Station" class="btn btn-success" />
                                                                <input type="button" id="deleteBTN" value="Delete Police Station" class="btn btn-danger" />
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
                    <!-- Modal for Superuser's create station end-->
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
        <script>
                                                                $(document).ready(function () {
                                                                    $('#policestationList').DataTable({
                                                                        dom: 'Blfrtip',
                                                                        retrieve: true,
                                                                        sPaginationType: "full_numbers",
                                                                        bJQueryUI: true,
                                                                        bDestroy: true,
                                                                        pageLength: 100,
                                                                        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                                                                        buttons: [
                                                                            {
                                                                                extend: 'excel',
                                                                                text: '<p class="mb-0"><i class="fa-solid fa-file-excel"></i>&nbsp;Export Police Station List</p>',
                                                                                title: function () {
                                                                                    return "Police Station List";
                                                                                },
                                                                                exportOptions: {
                                                                                    columns: "thead th:not(.noExport)"
                                                                                }
                                                                            }
                                                                        ]
                                                                    });

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

                                                                    $("#addNewStation").click(function () {
                                                                        $('#frmcreatepolicestation')[0].reset();
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    url: 'policestation.htm',
                                                                                    method: 'GET'
                                                                                }).done(function () {
                                                                                    $("#createNewStationModal").modal('show');
                                                                                    $("#createstationbtn").show();
                                                                                    $("#inputPassword").show();
                                                                                    $("#deleteBTN").hide();
                                                                                    $("#updatestationbtn").hide();
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
                                                                        var policestationcode = $('#policestationcode').val();
                                                                        var policestation = $("#policestation").val();
                                                                        $.confirm({
                                                                            title: 'Are you sure you want to delete Police Station ' + policestation + ' ?',
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
                                                                                                debugger;
                                                                                                var self = this;
                                                                                                return $.ajax({
                                                                                                    method: 'GET',
                                                                                                    url: './deletepolicestation.htm',
                                                                                                    data: 'policestationcode=' + policestationcode
                                                                                                }).done(function (response) {
                                                                                                    if (response === '1') {
                                                                                                        self.setTitle('Successful!');
                                                                                                        self.setContent('Police Station Deleted succesfully');
                                                                                                        $("#createNewStationModal").modal('hide');
                                                                                                    } else {
                                                                                                        self.setTitle('Error Occurred!');
                                                                                                        self.setContent('Unable to Delete Police Station. Please try again!');
                                                                                                        $("#createNewStationModal").modal('hide');
                                                                                                    }
                                                                                                }).fail(function (x) {
                                                                                                    debugger;
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

                                                                    $("#frmcreatepolicestation").submit(function (e) {
                                                                        var pname = $("#policestation").val();
                                                                        var district = $("#districtcode option:selected").text();

                                                                        e.preventDefault();
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    type: "POST",
                                                                                    url: "./savepolicestation.htm",
                                                                                    async: false,
                                                                                    data: $("#frmcreatepolicestation").serialize()
                                                                                }).done(function (response) {
                                                                                    if (response === '1') {
                                                                                        $("#createNewStationModal").modal('hide');
                                                                                        self.setContent('New Police Station <b>' + pname + '</b>' + ' created at <b>' + district+'</b> District');
                                                                                        self.setTitle('Successefully Created!');
                                                                                    } else if (response === '2') {
                                                                                        self.setContent('Police Station already Exists!</b>');
                                                                                        self.setTitle('Error!');
                                                                                    } else if (response === '3') {
                                                                                        self.setContent('Station Details Successfully Updated');
                                                                                        self.setTitle('Success!');
                                                                                    } else {
                                                                                        $("#createNewStationModal").modal('hide');
                                                                                        self.setContent('Police Station could not be created!</b> Please Try Again');
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
                                                                function editfunc(pcode, dcode, ncrbcode, pname, actives) {
                                                                    $("#policestationcode").val(pcode);
                                                                    $("#ncrbcode").val(ncrbcode);
                                                                    $("#policestation").val(pname);
                                                                    $("#activestatus").val(actives);
                                                                    $("#districtcode").val(dcode).trigger("change");
                                                                    $("#createNewStationModal").modal('show');
                                                                    $("#createstationbtn").hide();
                                                                    $("#deleteBTN").show();
                                                                    $("#updatestationbtn").show();
                                                                }
        </script>
    </body>
</html>
