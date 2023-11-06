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
        <title>Manage Agencies</title>
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
                                <h4 class="text-white text-left fw-bold font-size-lg mb-0">Manage Agencies</h4>
                                <input type="button" class="btn btn-success btn-sm" id="addNewAgency" name="addNewAgencynm" value="Add New Agency" data-bs-toggle="modal" data-bs-target="#createNewAgency" data-bs-dismiss="modal"/>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="col-md-10">
                                            <div class="form-floating mr-2" style="width: 100%;">
                                                <select name="agencynm" class="form-select" id="agencyid" aria-label="Select Agency">
                                                    <option selected="true" disabled="true" value="">Select Agency</option>
                                                    <c:forEach var="m" items="${magency_list}">                                     
                                                        <option value="<c:out value="${m.agencytypeid}"/>" ><c:out value="${m.agencytypename}"/></option>
                                                    </c:forEach>
                                                </select>
                                                <label for="agencyid">Select Agency</label>
                                            </div>                                            
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm" onclick="openAgencyContactModal()">Add Master & Contact Detail</button>
                                    </div>
                                </div>
                            </div>
                            <div class="p-2 card-body table-responsive">
                                <table id="agencydetailList" class="table table-striped">
                                    <thead class="fs-14">
                                        <tr>
                                            <th>Sl No.</th>
                                            <th>Agency name</th>
                                            <th>Contact Person Name</th>
                                            <th>Designation</th>
                                            <th>Mobile Number 1</th>
                                            <th>District</th>
                                            <th>Address</th>
                                            <th>Pincode</th>
                                        </tr>
                                    </thead>
                                    <tbody id="allagencylist">
                                        <c:forEach items="${maglist}" var="u" varStatus="status">
                                            <tr>
                                                <td><c:out value="${status.count}"></c:out></td>
                                                <td><c:out value="${u.master_agencydetail.m_agencytype.agencytypename}"></c:out></td>
                                                <td><c:out value="${u.person_name}"></c:out></td>
                                                <td><c:out value="${u.designation}"></c:out></td>
                                                <td><c:out value="${u.mobile1}"></c:out></td>
                                                <td><c:out value="${u.master_agencydetail.district.districtname}"></c:out></td>
                                                <td><c:out value="${u.master_agencydetail.address}"></c:out></td>
                                                <td><c:out value="${u.master_agencydetail.pincode}"></c:out></td>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>  
                    </div>
                    <!-- Modal for Add Agency -->
                    <div class="modal fade" id="addagencyModal" tabindex="-1" aria-labelledby="addagencyModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-small modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header bg-purple-hov ">
                                    <h5 class="modal-title fw-bold text-white" id="addagencyModalLabel">Add Agency</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                                  
                                </div>
                                <div class="modal-body">
                                    <div class="col-sm-12">
                                        <div class="container">
                                            <form method="POST" name="addagencymodalnm" id="addagencyid" role="form" autocomplete="off">
                                                <div class="d-flex justify-content-between">
                                                    <div class="form-floating">
                                                        <input name="agencytypename" class="alphabets form-control d-flex" id="agencytypename" placeholder="Agency Type" maxlength="100" required="true" />
                                                        <label for="agencytypename">Enter Agency Type</label>
                                                    </div>
                                                    <input type="submit" id="addagencytype" value="Add Agency Type" class="btn btn-success"> 
                                                </div>  
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer d-flex justify-content-between">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Modal Add Agency ENd-->

                    <!-- Modal for Add Master and Contact Agency -->
                    <div class="modal fade" id="addMasterandContactModal" tabindex="-1" aria-labelledby="addMasterandContactModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-fullscreen">
                            <div class="modal-content">
                                <div class="modal-header bg-purple text-white">
                                    <h5 class="modal-title fw-bold text-white" id="addagencyModalLabel">Add Master And Contact Agency</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>                                  
                                </div>
                                <div class="modal-body">
                                    <form:form modelAttribute="addMasterandContact" id="addMasterandContactForm" role="form" autocomplete="off">
                                        <div class="container-fluid">
                                            <div class="mb-4">
                                                <form:input path="magencydetailid" name="magencydetailid" id="magencydetailid" class="form-control" hidden="true"/>                         
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-3">
                                                        <div class="form-floating">
                                                            <input name="agencyname" class="space form-control d-flex" id="agencyname" placeholder="Agency Type" maxlength="100" required="true"/>
                                                            <label for="agencyname">Enter Agency Name</label>
                                                        </div>     
                                                    </div>
                                                    <div class="col-sm-12 col-md-3">
                                                        <div class="form-floating">
                                                            <input name="address" type="text" class="form-control h-100" id="inputAddress" placeholder="Address" rows="7" maxlength="300"/>
                                                            <label for="inputAddress">Enter Address</label>
                                                        </div>   
                                                    </div>
                                                    <div class="col-sm-12 col-md-3">
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
                                                    <div class="col-sm-12 col-md-3">
                                                        <div class="form-floating">
                                                            <input name="pincode" type="text" class="numbers form-control h-100" id="pincode" placeholder="Pincode" maxlength="6" required="true"/>
                                                            <label for="pincode">Pincode</label>
                                                        </div>    
                                                    </div>
                                                </div>
                                            </div>
                                            <input hidden="true" id="rowCount" name="rowCount" />
                                            <input hidden="true" id="modalagencyid" name="modalagencyid" />
                                            <input hidden="true" id="districtcodeval" name="districtcodeval" />

                                            <div class="card mt-4" id="gridData">
                                                <div class="card-header d-flex justify-content-between">
                                                    <h6 class="mb-0 card-title">Contact Person</h6>
                                                    <button class="btn btn-sm btn-primary" type="button" id="addRow">Add Row</button>
                                                </div>
                                                <div class="card-body">                                                    
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <table class="table table-bordered table-striped" id="contactAgencyTable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Sl. No.</th>
                                                                        <th>Contact Person Name</th>
                                                                        <th>Designation</th>
                                                                        <th>Mobile 1</th>
                                                                        <th>Office Phone 1</th>
                                                                        <th>Mobile 2</th>
                                                                        <th>Office Phone 2</th>
                                                                        <th>Personal Email</th>
                                                                        <th>Office Email</th>
                                                                        <th>Remove</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="cpList">
                                                                    <tr>
                                                                        <td name="slno">1</td>
                                                                        <td><input type="text" name="cp_name[]" class="form-control alphabets" required="true"/></td>
                                                                        <td><input type="text" name="cp_designation[]" class="form-control" /></td>
                                                                        <td><input type="text" name="cp_mobile1[]" class="form-control mobilenumber" required="true"/></td>
                                                                        <td><input type="text" name="cp_office_phone1[]" class="form-control landlinenumber" /></td>
                                                                        <td><input type="text" name="cp_mobile2[]" class="form-control mobilenumber" /></td>
                                                                        <td><input type="text" name="cp_office_phone2[]" class="form-control landlinenumber"/></td>
                                                                        <td><input type="text" id="personalemail" name="cp_personal_email[]" class="form-control email" /></td>
                                                                        <td><input type="text" id="officemail" name="cp_office_email[]" class="form-control email" /></td>
                                                                        <td></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-100 mt-2 text-center">
                                            <button type="submit" class="btn btn-success btn-block">SUBMIT</button>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="modal-footer d-flex justify-content-between">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Modal Add Master and Contact Agency ENd-->


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
                                                $('#agencydetailList').DataTable({
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
                                                            text: '<p class="mb-0"><i class="fa-solid fa-file-excel"></i>&nbsp;Export Agency Details List</p>',
                                                            title: function () {
                                                                return "Agency Details List";
                                                            },
                                                            exportOptions: {
                                                                columns: "thead th:not(.noExport)"
                                                            }
                                                        }
                                                    ]
                                                });
                                                $('#agencyid').click(function () {
                                                    var id = $('#agencyid').val();
                                                    $.ajax({
                                                        type: "GET",
                                                        url: "./getparticularListContactAgency.htm",
                                                        data: "id=" + id.toString().trim(),
                                                        success: function (data) {
                                                            $('#allagencylist').html('');
                                                            if (data.length > 0) {
                                                                var count = 1;
                                                                for (i = 0; i < data.length; i++) {
                                                                    var str = "<tr class='mrowclick'><td>" + (count++) + "</td><td>" + data[i].master_agencydetail.agencyname + "</td><td>" + data[i].person_name + "</td><td>" + data[i].designation + "</td><td>" + data[i].mobile1 + "</td><td>" + data[i].master_agencydetail.district.districtname + "</td><td>" + data[i].master_agencydetail.address + "</td><td>" + data[i].master_agencydetail.pincode + "</td>" +
                                                                            "</tr>";


                                                                    //<td>" + data[i].personalemailid + "</td><td>" + data[i].office_emailid + "</td> "<td>" + data[i].officephone1 + "</td><td>" + data[i].mobile2 + "</td><td>" + data[i].officephone2 + "</td>
                                                                    $('#allagencylist').append(str);
                                                                }
                                                            }
                                                        },
                                                        error: function (jqXHR, textStatus, errorThrown) {
                                                            alert("error:" + textStatus + " - exception:" + errorThrown);
                                                        }
                                                    });
                                                });


                                                $('#addNewAgency').click(function () {
                                                    $('#addagencyModal').modal('show');
                                                });
                                                $('#addmastercontactdetail').click(function () {
                                                    $('#addmastercontactdetailModal').modal('show');
                                                });
                                                $('#addagencyModal').modal({backdrop: 'static', keyboard: false}, 'show');




                                                $('#addRow').click(function () {

                                                    var rowCount = $("#contactAgencyTable tr").length;
                                                    var newRowString = '<tr>' +
                                                            '<td>' + rowCount-- + '</td>' +
                                                            '<td><input type="text" name="cp_name[]" class="form-control" required="true"/></td>' +
                                                            '<td><input type="text" name="cp_designation[]" class="form-control" /></td>' +
                                                            '<td><input type="text" name="cp_mobile1[]" class="form-control mobilenumber" required="true"/></td>' +
                                                            '<td><input type="text" name="cp_office_phone1[]" class="form-control landlinenumber" /></td>' +
                                                            '<td><input type="text" name="cp_mobile2[]" class="form-control mobilenumber" /></td>' +
                                                            '<td><input type="text" name="cp_office_phone2[]" class="form-control landlinenumber" /></td>' +
                                                            '<td><input type="text" name="cp_personal_email[]" class="form-control" /></td>' +
                                                            '<td><input type="text" name="cp_office_email[]" class="form-control" /></td>' +
                                                            '<td><button class="btn btn-danger btn-block" type="button" onclick="deleteRow(this)"><i class="fa-solid fa-trash"></i></button></td>' +
                                                            '</tr>';
                                                    $('#cpList').append(newRowString);
                                                });

                                                $("#addagencyid").submit(function (e) {
                                                    e.preventDefault();
                                                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                                    $.confirm({
                                                        content: function () {
                                                            var self = this;
                                                            return $.ajax({
                                                                method: 'POST',
                                                                url: './addnewagency.htm',
                                                                data: $("#addagencyid").serialize(),
                                                                beforeSend: function (xhr) {
                                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                }
                                                            }).done(function (response) {
                                                                if (response === '1') {
                                                                    $("#addagencyModal").modal('hide');
                                                                    self.setContent('New Agency Added');
                                                                    self.setTitle('Success!');
                                                                } else {
                                                                    $("#addagencyModal").modal('hide');
                                                                    self.setContent('Something went wrong');
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
                                                $("#addMasterandContactForm").submit(function (e) {
                                                    e.preventDefault();
                                                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                                    $('#rowCount').val($("#contactAgencyTable tr").length - 1);
                                                    $('#districtcodeval').val($("#districtcode").val());
                                                    $.confirm({
                                                        content: function () {
                                                            var self = this;
                                                            return $.ajax({
                                                                method: 'POST',
                                                                url: './savemastercontactdetail.htm',
                                                                data: $("#addMasterandContactForm").serialize(),
                                                                beforeSend: function (xhr) {
                                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                }
                                                            }).done(function (response) {
                                                                if (response === '1') {
                                                                    $("#addMasterandContactModal").modal('hide');
                                                                    self.setContent('Master and Contact Added');
                                                                    self.setTitle('Success!');
                                                                } else {
                                                                    $("#addMasterandContactModal").modal('hide');
                                                                    clearAgencyModal();
                                                                    self.setContent('Something went wrong');
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
                                                $(document).on("keypress", ".numbers", function (event) {
                                                    if (event.which < 48 || event.which > 57) {
                                                        event.preventDefault();
                                                    }
                                                });

                                                $(document).on("keypress", ".mobilenumber", function (event) {
                                                    if (event.which < 48 || event.which > 57 || $(this).closest('.mobilenumber').val().length > 9) {
                                                        event.preventDefault();
                                                    }
                                                });

                                                $(document).on("keypress", ".landlinenumber", function (event) {
                                                    if (event.which < 48 || event.which > 57 || $(this).closest('.landlinenumber').val().length > 10) {
                                                        event.preventDefault();
                                                    }
                                                });
                                                var wcmt = document.getElementById('addagencyModal');
                                                wcmt.addEventListener('hidden.bs.modal', function (event) {
                                                    $('#addagencyid').trigger("reset");
                                                });
                                                var wcmt = document.getElementById('addMasterandContactModal');
                                                wcmt.addEventListener('hidden.bs.modal', function (event) {
                                                    $('#addMasterandContactForm').trigger("reset");
                                                });
                                            });
                                            $(function () {
                                                $('input.alphabets').keyup(function () {
                                                    if (this.value.match(/[^a-zA-Z. ]/g)) {
                                                        this.value = this.value.replace(/[^a-zA-Z. ]/g, '');
                                                    }
                                                });
                                            });


                                            //onclick of delete button in the Contact and Agency table call this function
                                            function deleteRow(row) {
                                                row.closest('tr').remove();
                                                $("#contactAgencyTable tbody").find('tr').each(function (i, el) {
                                                    var $tds = $(this).find('td');
                                                    $tds.eq(0).text(i + 1);
                                                });
                                            }

                                            function openAgencyContactModal()
                                            {
                                                if ($('#agencyid').val())
                                                {
                                                    $('#modalagencyid').val($('#agencyid').val());
                                                    $('#addMasterandContactModal').modal('show');
                                                } else
                                                {
                                                    alert("Please select an agency!");
                                                }
                                            }

                                            function clearAgencyModal()
                                            {
                                                $('#addMasterandContactForm')[0].reset();
                                                var newRowString = '<tr>' +
                                                        '<td>1</td>' +
                                                        '<td><input type="text" name="cp_name[]" class="form-control" /></td>' +
                                                        '<td><input type="text" name="cp_designation[]" class="form-control" /></td>' +
                                                        '<td><input type="text" name="cp_mobile1[]" class="form-control mobilenumber" /></td>' +
                                                        '<td><input type="text" name="cp_office_phone1[]" class="form-control landlinenumber" /></td>' +
                                                        '<td><input type="text" name="cp_mobile2[]" class="form-control mobilenumber" /></td>' +
                                                        '<td><input type="text" name="cp_office_phone2[]" class="form-control landlinenumber" /></td>' +
                                                        '<td><input type="text" name="cp_personal_email[]" class="form-control" /></td>' +
                                                        '<td><input type="text" name="cp_office_email[]" class="form-control" /></td>' +
                                                        '<td></td>' +
                                                        '</tr>';
                                                $('#cpList').html(newRowString);

                                            }

                                            $("#officemail").focusout(function (e) {
                                                var re = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
                                                if ($("#officemail").val().replace(/\s/g, '').length !== 0) {
                                                    if (re.test($('#officemail').val()) === false) {
                                                        alert("Please enter valid Email ID");
                                                        $("#officemail").val("");
                                                        $("#officemail").focus();
                                                    }
                                                }
                                            });
                                            $("#personalemail").focusout(function (e) {
                                                var re = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
                                                if ($("#personalemail").val().replace(/\s/g, '').length !== 0) {
                                                    if (re.test($('#personalemail').val()) === false) {
                                                        alert("Please enter valid Email ID");
                                                        $("#personalemail").val("");
                                                        $("#personalemail").focus();
                                                    }
                                                }
                                            });
        </script>
    </body>
</html>
