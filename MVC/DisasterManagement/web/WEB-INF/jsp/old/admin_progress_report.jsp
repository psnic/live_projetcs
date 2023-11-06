<%-- 
    Document   : templateforallpages
    Created on : 8 Nov, 2022, 4:52:32 PM
    Author     : joshua
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
        <title>Quarterly Meetings & Orientation Programs</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                    <%@include file="banner.jsp" %>
                    <div class="container px-5">
                        <div class="card">
                            <div class="card-header bg-purple"><h4 class="text-white text-center fw-bold font-size-lg">Progress Report</h4></div>
                            <div class="card-body">
                                <div class="row d-flex flex-row justify-content-center">
                                    <div class="col-md-3 fw-bold">
                                        Date From <span class="blink text-danger">*</span> <input type="date" id="date1" name="date1" class="form-control" required>
                                    </div>
                                    <div class="col-md-3 fw-bold">
                                        Date To <span class="blink text-danger">*</span><input type="date" id="date2" name="date2" class="form-control" required>
                                    </div>
                                </div>
                                <div class="row d-flex flex-row justify-content-around mt-3">
                                    <div class="col-sm-6">
                                        <select name="year" id="inputSelect" class="form-control mb-3"> 
                                            <option value="" disabled="true" selected="true">Select</option>
                                            <option value="pdr1">Distribution of Incoming Calls</option>
                                            <option value="pdr2">Classification of Cases & Nature</option>
                                            <option value="pdr2a">Distribution of Support</option>
                                            <option value="pdr3">Status of Complaints</option>
                                            <option value="categoriesofcases">Categories of Cases by Crime Type</option>
                                            <option value="categoriesofcasesdistrictwise">Categories of Cases by District</option>
                                        </select>
                                        <!--                                        <button id="pdr1" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Distribution of Incoming Calls</button>
                                                                                <button id="pdr2" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Classification of Cases & Nature</button>
                                                                                <button id="pdr2a" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Distribution of Support</button>
                                                                                <button id="pdr3" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Status of Complaints</button>
                                                                                <button id="categoriesofcases" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Categories of Cases by Crime Type</button>
                                                                                <button id="categoriesofcasesdistrictwise" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#">Categories of Cases by District Wise</button>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="pdr1_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="pdr1_table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Sl No.
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbpdr1">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="pdr2_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="pdr2_table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Sl No.
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbpdr2">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="pdr2a_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="pdr2a_table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Sl No.
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbpdr2a">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="pdr3_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="pdr3_table" >
                                    <thead>
                                        <tr>
                                            <th>Sl No. </th>
                                            <th>Conditions</th>
                                            <!--<label id="pdr3df"> </label> to <label id="pdr3dt"> </label></-->
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbpdr3">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="categoriesofcases_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="categoriesofcases_table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Sl No.
                                            </th>
                                            <th>
                                                Crime Category
                                            </th>
                                            <th>
                                                Crime Classification
                                            </th>
                                            <th>
                                                Total cases
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tb_categoriesofcases">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <div class="d-none container mb-3" id="categoriesofcasesdistrictwise_container">
                        <div class="col">
                            <div class="col mt-2" style="margin-left:25px;">               
                                <table class='table table-striped table-bordered' id="categoriesofcasesdistrictwise_table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Sl No.
                                            </th>
                                            <th>
                                                District
                                            </th>
                                            <th>
                                                Total
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tb_categoriesofcasesdistrictwise">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container mt-4">
                            <center>
                                <input type="submit" id="btnSave" value="Print" class="btn btn-lg btn-primary btn-block" onclick="getOfficewisedetailsreportfunc()" style="width:50%"/>
                            </center>
                        </div>
                    </div>
                    <!--                    <div class="container mb-3">
                                            <div class="col">
                                                <div id="display">
                    
                                                </div>
                                            </div>
                                        </div>-->
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

        <script>
                                    $(document).ready(function () {
                                        $('body').on('change', "#inputSelect", function (e) {
                                            var optVal = $("#inputSelect option:selected").val();
                                            if (optVal === 'pdr1') {
                                                $('#pdr2_container').addClass('d-none');
                                                $('#pdr2a_container').addClass('d-none');
                                                $('#pdr3_container').addClass('d-none');
                                                $('#categoriesofcases_container').addClass('d-none');
                                                $('#categoriesofcasesdistrictwise_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#pdr1_container').show();
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./progresreportpdr1.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = '';
                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>';
                                                                    markup += '<td>' + (i + 1) + '</td>';
                                                                    markup += '<td>' + res[i].call_description + '</td>';
                                                                    markup += '<td>' + res[i].total + '</td>';
                                                                    markup += '</tr>';
                                                                }

                                                                $("#pdr1_table").DataTable().destroy();
                                                                $('#tbpdr1').html('');
                                                                $('#tbpdr1').append(markup);
                                                                $('#pdr1_table').DataTable({});
                                                                $('#pdr1_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            } else if (optVal === 'pdr2') {
                                                $('#pdr1_container').addClass('d-none');
                                                $('#pdr2a_container').addClass('d-none');
                                                $('#pdr3_container').addClass('d-none');
                                                $('#categoriesofcases_container').addClass('d-none');
                                                $('#categoriesofcasesdistrictwise_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#pdr2_container').show();
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./progresreportpdr2.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = "";

                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>';
                                                                    markup += '<td>' + (i + 1) + '</td>';
                                                                    markup += '<td>' + res[i].call_description + '</td>';
                                                                    markup += '<td>' + res[i].total + '</td>';
                                                                    markup += '</tr>';
                                                                }

                                                                $("#pdr2_table").DataTable().destroy();
                                                                $('#tbpdr2').html('');
                                                                $('#tbpdr2').append(markup);
                                                                $('#pdr2_table').DataTable({});
                                                                $('#pdr2_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            } else if (optVal === 'pdr2a') {
                                                $('#pdr1_container').addClass('d-none');
                                                $('#pdr2_container').addClass('d-none');
                                                $('#pdr3_container').addClass('d-none');
                                                $('#categoriesofcases_container').addClass('d-none');
                                                $('#categoriesofcasesdistrictwise_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#pdr2a_container').show();
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./progresreportpdr2a.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = "";
                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + res[i][0] + '</td>' +
                                                                            '<td>' + res[i][1] + '</td>' +
                                                                            '</tr>';
                                                                }

                                                                $("#pdr2a_table").DataTable().destroy();
                                                                $('#tbpdr2a').html('');
                                                                $('#tbpdr2a').append(markup);
                                                                $('#pdr2a_table').DataTable({});
                                                                $('#pdr2a_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            } else if (optVal === 'pdr3') {
                                                $('#pdr1_container').addClass('d-none');
                                                $('#pdr2_container').addClass('d-none');
                                                $('#pdr2a_container').addClass('d-none');
                                                $('#categoriesofcases_container').addClass('d-none');
                                                $('#categoriesofcasesdistrictwise_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#pdr3_container').show();
                                                            $('#pdr3df').html(datefrom);
                                                            $('#pdr3dt').html(dateto);
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./progresreportpdr3.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = "";
                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>';
                                                                    markup += '<td>' + (i + 1) + '</td>';
                                                                    markup += '<td>' + res[i].call_description + '</td>';
                                                                    markup += '<td>' + res[i].total + '</td>';
                                                                    markup += '</tr>';
                                                                }

                                                                $("#pdr3_table").DataTable().destroy();
                                                                $('#tbpdr3').html('');
                                                                $('#tbpdr3').append(markup);
                                                                $('#pdr3_table').DataTable({});
                                                                $('#pdr3_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            } else if (optVal === 'categoriesofcases') {
                                                $('#pdr1_container').addClass('d-none');
                                                $('#pdr2_container').addClass('d-none');
                                                $('#pdr2a_container').addClass('d-none');
                                                $('#pdr3_container').addClass('d-none');
                                                $('#categoriesofcasesdistrictwise_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#categoriesofcases_container').show();
                                                            $('#categoriesofcasesdf').html(datefrom);
                                                            $('#categoriesofcasesdt').html(dateto);
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./countcategoriesofcases.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = "";

                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + res[i][0] + '</td>' +
                                                                            '<td>' + res[i][1] + '</td>' +
                                                                            '<td>' + res[i][2] + '</td>' +
                                                                            '</tr>';
                                                                }

//                                                                $("#categoriesofcases_table").dataTable().fnDestroy();
                                                                $("#categoriesofcases_table").DataTable().destroy();
                                                                $('#tb_categoriesofcases').html('');
                                                                $('#tb_categoriesofcases').append(markup);
                                                                $('#categoriesofcases_table').DataTable({});
                                                                $('#categoriesofcases_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            } else if (optVal === 'categoriesofcasesdistrictwise') {
                                                $('#pdr1_container').addClass('d-none');
                                                $('#pdr2_container').addClass('d-none');
                                                $('#pdr2a_container').addClass('d-none');
                                                $('#pdr3_container').addClass('d-none');
                                                $('#categoriesofcases_container').addClass('d-none');
                                                document.getElementById("date1").required = true;
                                                e.preventDefault();
                                                var datefrom = $('#date1').val();
                                                var dateto = $('#date2').val();
                                                if (!datefrom.trim() || !dateto.trim()) {
                                                    $.alert('Please select a start date and end date.');
                                                } else {
                                                    $.confirm({
                                                        content: function () {
                                                            $('#categoriesofcasesdistrictwise_container').show();
                                                            $('#categoriesofcasesdistrictwisedf').html(datefrom);
                                                            $('#categoriesofcasesdistrictwisedt').html(dateto);
                                                            var self = this;
                                                            return $.ajax({
                                                                type: "GET",
                                                                url: "./countcategoriesofcasesdistrictwise.htm?datefrom=" + datefrom + "&dateto=" + dateto
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
                                                                var markup = "";

                                                                for (var i = 0; i < res.length; i++) {
                                                                    markup += '<tr>' +
                                                                            '<td>' + (i + 1) + '</td>' +
                                                                            '<td>' + res[i][0] + '</td>' +
                                                                            '<td>' + res[i][1] + '</td>' +
                                                                            '</tr>';
                                                                }

                                                                $('#categoriesofcasesdistrictwise_table').DataTable().destroy();
                                                                $('#tb_categoriesofcasesdistrictwise').html('');
                                                                $('#tb_categoriesofcasesdistrictwise').append(markup);
                                                                $('#categoriesofcasesdistrictwise_table').DataTable({});
                                                                $('#categoriesofcasesdistrictwise_container').removeClass('d-none');
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }
                                            }
                                        });

//                $('#pdr1').click(function (e) {
//                    $('#pdr2_container').addClass('d-none');
//                    $('#pdr2a_container').addClass('d-none');
//                    $('#pdr3_container').addClass('d-none');
//                    $('#categoriesofcases_container').addClass('d-none');
//                    $('#categoriesofcasesdistrictwise_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#pdr1_container').show();
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./progresreportpdr1.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var markup = "";
//
//                                    markup += '<tr>' +
//                                            '<td>' + datefrom + '</td>' +
//                                            '<td>' + dateto + '</td>' +
//                                            '<td>' + (res.totmissedcalls + res.totcasesreg + res.totcasesregoldcase + res.totcasesmiscecalls) + '</td>' +
//                                            '<td>' + (res.totcasesreg + res.totcasesregoldcase + res.totcasesmiscecalls) + '</td>' +
//                                            '<td>' + (res.totcasesreg) + '</td>' +
//                                            '<td>' + (res.totcasesregemailsms) + '</td>' +
//                                            '<td>' + (res.totcasesreg + res.totcasesregemailsms) + '</td>' +
//                                            '<td>' + (res.totcasesregoldcase) + '</td>' +
//                                            '<td>' + (res.totcasesmiscecalls) + '</td>' +
//                                            '</tr>';
//
//                                    $('#tbpdr1').html('');
//                                    $('#tbpdr1').append(markup);
//                                    $("#pdr1_table").dataTable().fnDestroy();
//                                    $('#pdr1_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
////                                    {extend: 'copy', className: 'btn btn-primary glyphicon glyphicon-duplicate'},
////                                    {extend: 'csv', className: 'btn btn-primary glyphicon glyphicon-save-file'},
////                                    {extend: 'excel', className: 'btn btn-primary glyphicon glyphicon-list-alt'},
////                                    {extend: 'pdf', className: 'btn btn-primary glyphicon glyphicon-file'},
////                                    {extend: 'print', className: 'btn btn-primary glyphicon glyphicon-print'}
//                                            'copy', 'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#pdr1_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
//
//                $('#pdr2').click(function (e) {
//                    $('#pdr1_container').addClass('d-none');
//                    $('#pdr2a_container').addClass('d-none');
//                    $('#pdr3_container').addClass('d-none');
//                    $('#categoriesofcases_container').addClass('d-none');
//                    $('#categoriesofcasesdistrictwise_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#pdr2_container').show();
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./progresreportpdr2.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var markup = "";
//
//                                    markup += '<tr>' +
//                                            '<td>' + datefrom + '</td>' +
//                                            '<td>' + dateto + '</td>' +
//                                            '<td>' + res.totcasesreg + '</td>' +
//                                            '<td>' + res.totcasesisemergency + '</td>' +
//                                            '<td>' + (res.totcasesreg - res.totcasesisemergency) + '</td>' +
//                                            '</tr>';
//
//                                    $('#tbpdr2').html('');
//                                    $('#tbpdr2').append(markup);
//                                    $("#pdr2_table").dataTable().fnDestroy();
//                                    $('#pdr2_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
//                                            'copy', 'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#pdr2_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
//
//                $('#pdr2a').click(function (e) {
//                    $('#pdr1_container').addClass('d-none');
//                    $('#pdr2_container').addClass('d-none');
//                    $('#pdr3_container').addClass('d-none');
//                    $('#categoriesofcases_container').addClass('d-none');
//                    $('#categoriesofcasesdistrictwise_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#pdr2a_container').show();
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./progresreportpdr2a.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var markup = "";
//                                    for (var i = 0; i < res.length; i++) {
//                                        markup += '<tr><td>' + res[i][0] + '</td>' +
//                                                '<td>' + res[i][1] + '</td></tr>';
//                                    }
//
//                                    $('#tbpdr2a').html('');
//                                    $('#tbpdr2a').append(markup);
//                                    $("#pdr2a_table").dataTable().fnDestroy();
//                                    $('#pdr2a_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
//                                            'copy', 'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#pdr2a_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
//
//                $('#pdr3').click(function (e) {
//                    $('#pdr1_container').addClass('d-none');
//                    $('#pdr2_container').addClass('d-none');
//                    $('#pdr2a_container').addClass('d-none');
//                    $('#categoriesofcases_container').addClass('d-none');
//                    $('#categoriesofcasesdistrictwise_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#pdr3_container').show();
//                                $('#pdr3df').html(datefrom);
//                                $('#pdr3dt').html(dateto);
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./progresreportpdr3.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var closurecaseno = JSON.parse(res.closurecaseno);
//
//                                    var markup = "";
//                                    for (var i = 0; i < closurecaseno.length; i++) {
//                                        markup += '<tr>' +
//                                                '<td>' + closurecaseno[i][0] + '</td>' +
//                                                '<td>' + closurecaseno[i][1] + '</td>' +
//                                                '</tr>';
//                                    }
//                                    markup += '<tr>' +
//                                            '<td>Total Active Cases</td>' +
//                                            '<td>' + res.totactivecase + '</td>' +
//                                            '</tr>' +
//                                            '<tr>' +
//                                            '<td>Total Cases at 181 WHL</td>' +
//                                            '<td>' + res.count181WHLcases + '</td>' +
//                                            '</tr>' +
//                                            '<tr>' +
//                                            '<td>Total Cases at Sakhi Centres</td>' +
//                                            '<td>' + res.countIntegratedcases + '</td>' +
//                                            '</tr>' +
//                                            '<tr>' +
//                                            '<td>Total Cases at Non-integrated Centres</td>' +
//                                            '<td>' + res.countNonIntegratedcases + '</td>' +
//                                            '</tr>' +
//                                            '<tr>' +
//                                            '<td>Total Cases Registered</td>' +
//                                            '<td>' + res.totcasesreg + '</td>' +
//                                            '</tr>';
//
//                                    $('#tbpdr3').html('');
//                                    $('#tbpdr3').append(markup);
//                                    $("#pdr3_table").dataTable().fnDestroy();
//                                    $('#pdr3_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
//                                            'copy', 'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#pdr3_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
//
//                $('#categoriesofcases').click(function (e) {
//                    $('#pdr1_container').addClass('d-none');
//                    $('#pdr2_container').addClass('d-none');
//                    $('#pdr2a_container').addClass('d-none');
//                    $('#pdr3_container').addClass('d-none');
//                    $('#categoriesofcasesdistrictwise_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#categoriesofcases_container').show();
//                                $('#categoriesofcasesdf').html(datefrom);
//                                $('#categoriesofcasesdt').html(dateto);
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./countcategoriesofcases.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var markup = "";
//
//                                    for (var i = 0; i < res.length; i++) {
//                                        markup += '<tr><td>' + res[i][0] + '</td>' +
//                                                '<td>' + res[i][1] + '</td>' +
//                                                '<td>' + res[i][2] + '</td></tr>';
//                                    }
//
//                                    $('#tb_categoriesofcases').html('');
//                                    $('#tb_categoriesofcases').append(markup);
//                                    $("#categoriesofcases_table").dataTable().fnDestroy();
//                                    $('#categoriesofcases_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
//                                            'copy', 'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#categoriesofcases_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
//
//                $('#categoriesofcasesdistrictwise').click(function (e) {
//                    $('#pdr1_container').addClass('d-none');
//                    $('#pdr2_container').addClass('d-none');
//                    $('#pdr2a_container').addClass('d-none');
//                    $('#pdr3_container').addClass('d-none');
//                    $('#categoriesofcases_container').addClass('d-none');
//                    document.getElementById("date1").required = true;
//                    e.preventDefault();
//                    var datefrom = $('#date1').val();
//                    var dateto = $('#date2').val();
//                    if (!datefrom.trim() || !dateto.trim()) {
//                        $.alert('Please select a start date and end date.');
//                    } else {
//                        $.confirm({
//                            content: function () {
//                                $('#categoriesofcasesdistrictwise_container').show();
//                                $('#categoriesofcasesdistrictwisedf').html(datefrom);
//                                $('#categoriesofcasesdistrictwisedt').html(dateto);
//                                var self = this;
//                                return $.ajax({
//                                    type: "GET",
//                                    url: "./countcategoriesofcasesdistrictwise.htm?datefrom=" + datefrom + "&dateto=" + dateto
//                                }).done(function (response) {
//                                    var res = JSON.parse(response);
//                                    var markup = "";
//
//                                    for (var i = 0; i < res.length; i++) {
//                                        markup += '<tr><td>' + res[i][0] + '</td>' +
//                                                '<td>' + res[i][1] + '</td></tr>';
//                                    }
//
//                                    $('#tb_categoriesofcasesdistrictwise').html('');
//                                    $('#tb_categoriesofcasesdistrictwise').append(markup);
//                                    $("#categoriesofcasesdistrictwise_table").dataTable().fnDestroy();
//                                    $('#categoriesofcasesdistrictwise_table').DataTable({
//                                        dom: 'Bfrtip',
//                                        buttons: [
//                                            'csv', 'excel', 'pdf', 'print'
//                                        ]
//                                    });
//                                    $('#categoriesofcasesdistrictwise_container').removeClass('d-none');
//                                    self.close();
//                                }).fail(function () {
//                                    self.setContent('Something went wrong.');
//                                });
//                            }
//                        });
//                    }
//                });
                                    });

                                    function getOfficewisedetailsreportfunc() {
                                        var datefrom = $('#date1').val();
                                        var dateto = $('#date2').val();
                                        var url = "report.htm?inputSelect=" + $("#inputSelect").val() + "&datefrom1=" + datefrom + "&dateto1=" + dateto;
                                        window.open(url, '_blank');
                                    }
        </script>
    </body>
</html>
