<%-- 
    Document   : auth_callexecutive_home
    Created on : 6 Jul, 2023, 3:00:55 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <sec:csrfMetaTags />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | DRMS</title>
        <%--<%@include file="auth_head_import.jsp" %>--%>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/fontawesome-free-6.4.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .text-align-right {
                text-align: right;
            }
            .form-check {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
            }

            .inline-input {
                flex: 1;
                margin-left: 10px;
            }

            .table-grid-container {
                max-height: 320px; /* Set your desired height here */
                overflow-y: auto;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="auth_nav_navbar.jsp" %>


        <div id="layoutSidenav">
            <c:import url="/getmenu.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h3 class="mt-4 mb-0">Camp Details</h3>
                            <!--                            <ol class="breadcrumb mb-4">
                                                            <li class="breadcrumb-item active">Dashboard</li>
                                                        </ol>-->

                            <!--Page Content Start-->
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-12 col-md-3">
                                        <div class="dialer-container p-2">

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="container-fluid bg-light mt-2 py-4 mb-4">
                                <h5 class="mb-2">Please fill in the details below</h5>
                                <div class="form-section">
                                    <form id="" role="form" enctype="multipart/form-data">
                                        <!--                                        <div class="form-group row mt-3 d-flex justify-content-center">
                                                                                    <label for="inputFromDate" class="col-md-1 col-form-label"><b>From</b><span class="blink text-danger">*</span></label>
                                                                                    <div class="col-md-3">
                                                                                        <input type="date" class="form-control" id="inputDate" onclick="getMaxCurrentDate()" required="true"/>
                                                                                    </div>
                                                                                    <label for="inputToDate" class="col-md-1 col-form-label"><b>To</b><span class="blink text-danger">*</span></label>
                                                                                    <div class="col-md-3">
                                                                                        <input type="date" class="form-control" id="inputDate" onclick="getMaxCurrentDate()" required="true"/>
                                                                                    </div>
                                                                                </div>-->

<!--                                        <div class="form-group row mt-4">
                                            <label for="inputDuration" class="col-md-4 col-form-label"><b>Duration of days</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" maxlength="100" required="true" id="inputnoOfCamps"/>
                                            </div>
                                        </div>-->
                                        <div class="form-group row mt-3">
                                            <!--<label for="inputDate" class="col-md-4 col-form-label"><b>From</b><span class="blink text-danger">*</span></label>-->
                                            <label for="inputFromDate" class="col-md-2 col-form-label"><b>From</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" id="inputDate" onclick="getMaxCurrentDate()" required="true"/>
                                            </div>
                                            <label for="inputFromDate" class="col-md-2 col-form-label"><b>To</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" id="starttime" class="form-control" name="starttime" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputCampName" class="col-md-4 col-form-label"><b>Camp Name</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" maxlength="100" required="true" id="inputnoOfCamps"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputNoOfCamps" class="col-md-4 col-form-label"><b>No. of Camps</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" maxlength="100" required="true" id="inputnoOfCamps"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputLocation" class="col-md-4 col-form-label"><b>Camp Location</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" maxlength="100" required="true" id="inputLocation"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputNoofHouseholds" class="col-md-4 col-form-label"><b>No. of affected households</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" maxlength="100" required="true" id="inputNoofHouseholds"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputNoofPersons" class="col-md-4 col-form-label"><b>No. Of Persons Residing in the camp</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" maxlength="100" required="true" oninput="addRowsToGrid(this.value)" id="inputNoofRows"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <h5>Survivor Details</h5>
                                            <div class="table-grid-container">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl. No</th>
                                                            <th>Affected Village</th>
                                                            <th>No. of Adults</th>
                                                            <th>No. of Minors</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="survivor-grid-body">
                                                        <!-- Initial row -->
                                                        <!--                                                        <tr>
                                                                                                                    <td><input type="text" class="form-control" name="name[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="gender[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="age[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="village[]" /></td>
                                                                                                                </tr>-->
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <h5>Food Details</h5>
                                            <div class="table-grid-container">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl. No</th>
                                                            <th>Item Name</th>
                                                            <th>Volume</th>
                                                            <th>Amount</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="food-grid-body">
                                                        <!-- Initial row -->
                                                        <!--                                                        <tr>
                                                                                                                    <td><input type="text" class="form-control" name="name[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="gender[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="age[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="village[]" /></td>
                                                                                                                </tr>-->
                                                    </tbody>
                                                </table>
                                                <button type="button" class="btn btn-primary" onclick="addNewRow('food-grid-body')" id="foodbtn">Add Row</button>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputAmountClothing" class="col-md-4 col-form-label"><b>Amount spent on clothing</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" maxlength="100" required="true" id="inputAmountClothing"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <label for="inputMedicalCare" class="col-md-4 col-form-label"><b>Medical Care</b><span class="blink text-danger">*</span></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" maxlength="100" required="true" id="inputMedicalCare"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-4">
                                            <h5>Other Essentials</h5>
                                            <div class="table-grid-container">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Sl. No</th>
                                                            <th>Item Name</th>
                                                            <th>Amount</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="essentials-grid-body">
                                                        <!-- Initial row -->
                                                        <!--                                                        <tr>
                                                                                                                    <td><input type="text" class="form-control" name="name[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="gender[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="age[]" /></td>
                                                                                                                    <td><input type="text" class="form-control" name="village[]" /></td>
                                                                                                                </tr>-->
                                                    </tbody>
                                                </table>
                                                <button type="button" class="btn btn-primary" onclick="addNewEssentialsRow('essentials-grid-body')" id="essentialsbtn">Add Row</button>
                                            </div>
                                        </div>
                                        <div class="mt-4 d-flex justify-content-end">
                                            <button class="btn btn-success" title="Save Camp Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Camp Details</button>
                                        </div>
                                    </form>
                                </div>
                                <!--Page Content End-->
                            </div>
                        </div>
                    </main>
                <%@include file="auth_footer_content.jsp" %>
            </div>

            <!--Modal Start-->
            <div class="modal fade" id="someId" tabindex="-1" aria-labelledby="someIdModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="someIdModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id="someIdBody">
                           
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Modal End-->


            <%@include file="auth_footer_import.jsp" %>
            <script src="jojo/js/moment.min.js" type="text/javascript"></script>
            <script>

                                                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                    var csrfToken = $("meta[name='_csrf']").attr("content");

                                                    var dateInput = document.getElementById('dateInput');
                                                    var today = new Date().toISOString().split('T')[0];
                                                    dateInput.setAttribute('max', today);

                                                    $(document).ready(function () {

                                                    });
                                                    function toggleTextBox(type) {
                                                        var inputField = document.getElementById(type + 'Input');
                                                        inputField.classList.toggle('d-none');
                                                    }

                                                    function addRowsToGrid(numRows) {
                                                        var gridBody = document.getElementById("survivor-grid-body");
                                                        gridBody.innerHTML = ""; // Clear existing rows
                                                        for (let i = 0; i < numRows; i++) {
                                                            var newRow =
                                                                    '<tr>' +
                                                                    '<td>' + (i + 1) + '</td>' +
                                                                    '<td><input type="text" class="form-control" name="villagecode[]" required/></td>' +
                                                                    '<td><input type="text" class="form-control" name="adult[]" required/></td>' +
                                                                    '<td><input type="text" class="form-control" name="minor[]" required/></td>' +
                                                                    '</tr>';
                                                            gridBody.insertAdjacentHTML("beforeend", newRow);
                                                        }
                                                    }

                                                    function addNewRow(tableBodyId) {
                                                        var tbody = document.getElementById(tableBodyId);
                                                        var rowCount = tbody.rows.length;
                                                        var newRow = '<tr>' +
                                                                '<td>' + (rowCount + 1) + '</td>' +
                                                                '<td><input type="text" class="form-control" name="itemName[]" required/></td>' +
                                                                '<td><input type="text" class="form-control" name="volume[]" required/></td>' +
                                                                '<td><input type="text" class="form-control" name="amount[]" required/></td>' +
                                                                '<td><button type="button" class="btn btn-danger" onclick="removeRow(this, \'' + tableBodyId + '\')">Remove Row</button></td>' +
                                                                '</tr>';
                                                        tbody.insertAdjacentHTML("beforeend", newRow);
                                                    }
                                                    function addNewEssentialsRow(tableBodyId) {
                                                        var tbody = document.getElementById(tableBodyId);
                                                        var rowCount = tbody.rows.length;
                                                        var newRow = '<tr>' +
                                                                '<td>' + (rowCount + 1) + '</td>' +
                                                                '<td><input type="text" class="form-control" name="eItemName[]" required/></td>' +
                                                                '<td><input type="text" class="form-control" name="eAmount[]" required/></td>' +
                                                                '<td><button type="button" class="btn btn-danger" onclick="removeRow(this, \'' + tableBodyId + '\')">Remove Row</button></td>' +
                                                                '</tr>';
                                                        tbody.insertAdjacentHTML("beforeend", newRow);
                                                    }

//                                                    function removeRow(button) {
//                                                        // Get the row that contains the clicked button
//                                                        var row = button.parentNode.parentNode;
//                                                        // Remove the row from the table body
//                                                        row.parentNode.removeChild(row);
//                                                    }

                                                    function removeRow(button, tableBodyId) {
                                                        var row = button.closest("tr");
                                                        var tbody = document.getElementById(tableBodyId);
                                                        var rows = tbody.getElementsByTagName("tr");

                                                        // Remove the row
                                                        row.remove();

                                                        // Renumber the serial numbers
                                                        for (var i = 0; i < rows.length; i++) {
                                                            rows[i].getElementsByTagName("td")[0].innerText = (i + 1);
                                                        }
                                                    }




            </script>
    </body>
</html>
