<%-- 
    Document   : generate_report
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
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>

        <style type="text/css">
            body{
                background:#FAFAFB;
                margin-top: 20px;
            }
            .upload__box {
                /*padding: 40px;*/
            }
            .upload__inputfile {
                width: 0.1px;
                height: 0.1px;
                opacity: 0;
                overflow: hidden;
                position: absolute;
                z-index: -1;
            }
            .upload__btn-box {
                margin-bottom: 10px;
            }
            .upload__img-wrap {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -10px;
            }
            .upload__img-box {
                width: 200px;
                padding: 0 10px;
                margin-bottom: 12px;
            }
            .upload__img-close {
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background-color: rgba(0, 0, 0, 0.5);
                position: absolute;
                top: 10px;
                right: 10px;
                text-align: center;
                line-height: 24px;
                z-index: 1;
                cursor: pointer;
            }
            .upload__img-close:after {
                content: "✖";
                font-size: 14px;
                color: white;
            }

            .img-bg {
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
                position: relative;
                padding-bottom: 100%;
            }
            .inline-block {
                display: inline-block;
                /* Add any additional styling you need */
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
                            <h1 class="mt-4 mb-4">Statement Of Proposal</h1>
                            <!--Page Content Start-->
                            <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <div class="card-header">
                                <h5 class="text-center">Generate Statement Of Proposal</h5>
                            </div>
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-6 mb-2">
                                        <label for="firSelect"><b>Select Fir No.</b></label>
                                    </div>
                                </div>
                                <div class="row d-flex justify-content-center">
                                    <div class="col-md-6 d-flex justify-content-center">
                                        <select class="form-select" id="firSelect">
                                            <option selected disabled>--Select--</option>
                                            <c:forEach items="${exlist}" var="f">
                                                <c:if test="${f.fir_no!=null}">
                                                    <option value="${f.fir_no}" ><c:out value="${f.fir_no}"></c:out></option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div id="tableContainer" class="d-none mt-4">
                                    <table id="reportTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>Beneficiary Name</th>
                                                <th>Village</th>
                                                <th>Amount</th>
                                                <th>Assistance</th>
                                                <th>Remarks</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <!-- Rows will be dynamically added here -->
                                        </tbody>
                                    </table>
                                    <form:form id="documentReportForm" modelAttribute="report" role="form" enctype="multipart/form-data" autocomplete="off" method="POST">
                                        <div class="form-group row mt-3">
                                            <label for="inputNoVillage" class="col-md-4 col-form-label"><b>Final no. of villages affected after survey</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" id="inputNoVillage" name="no_of_village_affected" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-3">
                                            <label for="inputNoPopulation" class="col-md-4 col-form-label"><b>Final no. of population affected after survey</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" id="inputNoPopulation" name="no_of_population_affected" required="true"/>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-3">
                                            <label for="inputNoHousehold" class="col-md-4 col-form-label"><b>Final no. of families affected after survey</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control onlyDigits" id="inputNoFamily" name="no_of_family_affected" required="true"/>
                                            </div>
                                        </div>
                                        <div id="dynamicUploadFieldsContainer1"></div>
                                        <div class="form-group row mt-3">
                                            <div class="col-12">
                                                <input type="submit" id="forwardButton" class="btn btn-success mt-4 inline-block float-end" value="Forward Report to DC">
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        <!--Page Content End-->
                    </div>
                </main>

                <%@include file="auth_footer_content.jsp" %>

            </div>
        </div>
        <%@include file="auth_footer_import.jsp" %>
        <script src="jojo/DataTables/datatables.min.js" type="text/javascript"></script>
        <script>
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var csrfToken = $("meta[name='_csrf']").attr("content");
            $(document).ready(function () {
                var dataTableInitialized = false;
                $("#firSelect").on("change", function () {
                    var selectedFir = $(this).val();
                    if (selectedFir !== "") {
                        $.ajax({
                            url: "./getexgratiafromfir.htm",
                            method: "GET",
                            data: "firNo=" + selectedFir,
                            success: function (res) {
                                var response = JSON.parse(res)
                                console.log(response);
                                var uploadFieldsMarkup = '';
                                var beneficiary = response[0];
                                var document = response[1];
                                $("#tableBody").empty();
                                for (var i = 0; i < beneficiary.beneficiaries.length; i++) {
                                    var newRow = '<tr>' +
                                            '<td>' + (i + 1) + '</td>' +
                                            '<td>' + beneficiary.beneficiaries[i].beneficiaryName + '</td>' +
                                            '<td>' + beneficiary.beneficiaries[i].village + '</td>' +
                                            '<td>' + beneficiary.beneficiaries[i].amount + '</td>' +
                                            '<td>' + beneficiary.beneficiaries[i].assistance + '</td>' +
                                            '<td>' + beneficiary.beneficiaries[i].remarks + '</td>' +
                                            '</tr>';
                                    $("#tableBody").append(newRow);
                                }
//                                for (var i = 0; i < document.documents.length; i++) {
//                                    uploadFieldsMarkup +=
//                                            '<div class="form-group row mt-4">' +
//                                            '<label for="fileInput' + i + '" class="form-label text-capitalize col-md-4"><b>Upload ' + document.documents[i].document_name + '&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></b></label>' +
//                                            '<div class="col-md-8">' +
//                                            '<input class="form-control dynamicFileInput" id="fileInput' + i + '" type="file" required name="files" accept="image/jpeg">' +
//                                            '<ol class="breadcrumb mb-2">' +
//                                            '<li class="breadcrumb-item active text-danger">In JPG/JPEG Format</li>' +
//                                            '</ol>' +
////                                    '<input type="file" id="fileInput' + i + '" class="form-control" name="files" accept="image/png, image/jpeg" required style="display:none;">' +
//                                            '</div>' +
//                                            '</div>';
//                                }
//                                $('#dynamicUploadFieldsContainer1').html(uploadFieldsMarkup);
                                // Initialize DataTable only if not already initialized
                                if (!dataTableInitialized) {
                                    $('#reportTable').DataTable();
                                    dataTableInitialized = true;
                                }

                                $("#tableContainer").removeClass("d-none");
                            },
                            error: function (xhr, textStatus, errorThrown) {
                                console.error("Error fetching table data:", errorThrown);
                            }
                        });
                    } else {
                        $("#tableContainer").addClass("d-none");
                    }
                });

//                                                        $("#documentReportForm").submit(function (e) {
//                                                            e.preventDefault();
//                                                            var successFlag = false; // Flag to track success
//                                                            var selectedFir = $("#firSelect").val();
//
//                                                            var formData = new FormData();
//                                                            formData.append("firNo", selectedFir);
//                                                            var files = $("#photos")[0].files;
//                                                            for (var i = 0; i < files.length; i++) {
//                                                                formData.append("photos", files[i]);
//                                                            }
//
//                                                            $.confirm({
//                                                                title: 'Forward Report',
//                                                                content: 'Are you sure you want to forward this report with FIR No:<b> ' + selectedFir + '</b> to DC?',
//                                                                buttons: {
//                                                                    forwardRep: {
//                                                                        text: 'Forward',
//                                                                        btnClass: 'btn-success',
//                                                                        action: function () {
//                                                                            $.confirm({
//                                                                                content: function () {
//                                                                                    var self = this;
//                                                                                    self.content.append('<label for="remarks">Remarks:</label><input type="text" id="remarks" class="form-control"/>');
//                                                                                    return $.ajax({
//                                                                                        url: './forwardreport.htm',
//                                                                                        data: formData,
//                                                                                        method: 'POST',
//                                                                                        processData: false,
//                                                                                        contentType: false,
//                                                                                        beforeSend: function (xhr) {
//                                                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
//                                                                                        }
//                                                                                    }).done(function (response) {
//                                                                                        console.log(response);
//                                                                                        self.setTitle(response.name);
//                                                                                        if (response === '-1') {
//                                                                                            self.setTitle('Failed!');
//                                                                                            self.setContent('Failed to forward report.');
//                                                                                        } else {
//                                                                                            self.setTitle('Success!');
//                                                                                            self.setContent('Report successfully forwarded.');
//                                                                                            successFlag = true; // Set success flag
//                                                                                        }
//                                                                                    }).fail(function () {
//                                                                                        self.setContent('Something went wrong.');
//                                                                                    });
//                                                                                },
//                                                                                buttons: {
//                                                                                    close: function () {
//                                                                                        if (!successFlag) {
//                                                                                            $.alert('Something went wrong');
//                                                                                        } else {
//                                                                                            window.location.reload();
//                                                                                        }
//                                                                                    }
//                                                                                }
//                                                                            });
//                                                                        }
//                                                                    },
//                                                                    cancel: function () {
//                                                                        $.alert('Report Not Forwarded');
//                                                                    }
//                                                                }
//                                                            });
//                                                        });

//                $("#documentReportForm").submit(function (e) {
//                    e.preventDefault();
//                    var successFlag = false; // Flag to track success
//                    var selectedFir = $("#firSelect").val();
//                    $.confirm({
//                        title: 'Forward Statement Of Proposal',
//                        columnClass: 'medium', // Adjust the column width if needed
//                        content:
//                                '<div class="custom-dialog">' +
////                                '<p>Are you sure you want to forward this report with FIR No: <b>' + selectedFir + ' </b> to DC?</p>' +
//                                '<div class="form-group mb-2">' +
//                                '<label for="remarks" class=""><b>No. of population affected:</b></label>' +
//                                '<input type="text" required id="no_of_population_affected" class="form-control mt-2"/>' +
//                                '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
//                                '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
//                                '</div>' +
//                                '</div>',
//                        buttons: {
//                            forwardRep: {
//                                text: 'Forward',
//                                btnClass: 'btn-success',
//                                action: function () {
//                                    var self = this;
//                                    var remarks = $("#remarks").val();
//                                    var population = $("#no_of_population_affected").val();
//                                    formData.append("remarks", remarks);
//                                    formData.append("no_of_population_affected", population);
//                                    $.confirm({
//                                        title: 'Confirm Forward',
//                                        columnClass: 'medium', // Adjust the column width if needed
//                                        content:
//                                                '<div class="custom-dialog">' +
//                                                '<h6>Are you sure you want to forward this statement of proposal with FIR No: <b>' + selectedFir + ' </b> to DC?</h6>' +
//                                                '<p>Number of population affected: ' + population + '</p>' +
//                                                '<p>Remarks: ' + remarks + '</p>' +
//                                                '</div>',
//                                        buttons: {
//                                            confirm: {
//                                                text: 'Confirm',
//                                                btnClass: 'btn-success',
//                                                action: function () {
//                                                    $.ajax({
//                                                        url: './forwardreport.htm',
//                                                        data: formData,
//                                                        method: 'POST',
//                                                        processData: false,
//                                                        contentType: false,
//                                                        beforeSend: function (xhr) {
//                                                            xhr.setRequestHeader(csrfHeader, csrfToken);
//                                                        }
//                                                    }).done(function (response) {
//                                                        console.log(response);
//                                                        self.setTitle(response.name);
//                                                        if (response === '-1') {
//                                                            self.setTitle('Failed!');
//                                                            self.setContent('Failed To Forward Statement of Proposal.');
//                                                        } else {
//                                                            self.setTitle('Success!');
//                                                            self.setContent('Statement of proposal successfully forwarded to DC.');
//                                                            successFlag = true; // Set success flag
//                                                        }
//                                                    }).fail(function () {
//                                                        self.setContent('Something went wrong.');
//                                                    });
//                                                }
//                                            },
//                                            cancel: function () {
//                                                $.alert('Statement Of Proposal Not Forwarded');
//                                            }
//                                        }
//                                    });
//                                }
//                            },
//                            cancel: function () {
//                                $.alert('Statement Of Proposal Not Forwarded');
//                            }
//                        }
//                    });
//                });

//                $("#documentReportForm").submit(function (e) {
//                    e.preventDefault();
//                    var selectedFir = $("#firSelect").val();
//
//                    var successFlag = false; // Flag to track success
//
//                    $.confirm({
//                        title: 'Forward Statement Of Proposal',
//                        columnClass: 'medium', // Adjust the column width if needed
//                        content:
//                                '<div class="custom-dialog">' +
//                                '<h6>Are you sure you want to forward this statement of proposal with FIR No: <b>' + selectedFir + ' </b> to DC?</h6>' +
//                                '<div class="form-group mb-2">' +
//                                '<label for="remarks" class=""><b>No. of population affected:</b></label>' +
//                                '<input type="text" required id="no_of_population_affected" class="form-control mt-2"/>' +
//                                '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
//                                '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
//                                '</div>' +
//                                '</div>',
//                        buttons: {
//                            confirm: {
//                                text: 'Forward',
//                                btnClass: 'btn-success',
//                                action: function () {
//                                    var self = this;
//                                    var formData = new FormData($(this)[0]);
//                                    var population = $("#no_of_population_affected").val();
//                                    var remarks = $("#remarks").val();
//                                    var files = $("#fileInput")[0].files;
//
//                                    // Append each file to FormData
//                                    for (var i = 0; i < files.length; i++) {
//                                        formData.append("files", files[i]);
//                                    }
//                                    formData.append("firNo", selectedFir);
//                                    formData.append("remarks", remarks);
//                                    formData.append("no_of_population_affected", population);
//                                    $.ajax({
//                                        url: './forwardreport.htm',
//                                        data: formData,
//                                        method: 'POST',
//                                        processData: false,
//                                        contentType: false,
//                                        beforeSend: function (xhr) {
//                                            xhr.setRequestHeader(csrfHeader, csrfToken);
//                                        }
//                                    }).done(function (response) {
//                                        console.log(response);
//                                        if (response === '-1') {
//                                            self.setTitle('Failed!');
//                                            self.setContent('Failed To Forward Statement of Proposal.');
//                                        } else {
//                                            self.setTitle('Success!');
//                                            self.setContent('Statement of proposal successfully forwarded to DC.');
//                                            successFlag = true; // Set success flag
//                                        }
//                                    }).fail(function () {
//                                        self.setContent('Something went wrong.');
//                                    });
//                                }
//                            },
//                            cancel: function () {
//                                $.alert('Statement Of Proposal Not Forwarded');
//                            }
//                        }
//                    });
//                });

                $("#documentReportForm").submit(function (e) {
                    e.preventDefault();
                    var successFlag = false; // Flag to track success
                    var selectedFir = $("#firSelect").val();

                    $.confirm({
                        title: 'Forward Statement Of Proposal',
                        columnClass: 'medium', // Adjust the column width if needed
                        content:
                                '<div class="custom-dialog">' +
                                '<h6>Are you sure you want to forward this statement of proposal with FIR No: <b>' + selectedFir + ' </b> to DC?</h6>' +
                                '<div class="form-group mb-2">' +
                                '<label for="remarks" class="mt-3"><b>Remarks before forwarding:</b></label>' +
                                '<textarea rows="2" id="remarks" class="form-control mt-2"></textarea>' +
                                '</div>' +
                                '</div>',
                        buttons: {
                            forwardRep: {
                                text: 'Forward',
                                btnClass: 'btn-success',
                                action: function () {
                                    $.confirm({
                                        content: function () {
                                            var self = this;
                                            var formData = new FormData();
                                            $(".dynamicFileInput").each(function () {
                                                var files = $(this)[0].files;
                                                // Append each selected file to the formData
                                                for (var i = 0; i < files.length; i++) {
                                                    formData.append("files", files[i]);
                                                }
                                            });
                                            var population = $("#inputNoPopulation").val();
                                            var village = $("#inputNoVillage").val();
                                            var family = $("#inputNoFamily").val();
                                            var remarks = $("#remarks").val();
                                            formData.append("firNo", selectedFir);
                                            formData.append("remarks", remarks);
                                            formData.append("no_of_population_affected", population);
                                            formData.append("no_of_family_affected", family);
                                            formData.append("no_of_village_affected", village);
                                            return $.ajax({
                                                url: './forwardreport.htm',
                                                data: formData,
                                                method: 'POST',
                                                processData: false,
                                                contentType: false,
                                                beforeSend: function (xhr) {
                                                    xhr.setRequestHeader(csrfHeader, csrfToken);
                                                }
                                            }).done(function (response) {
                                                console.log(response);
                                                self.setTitle(response.name);
                                                if (response === '-1') {
                                                    self.setTitle('Failed!');
                                                    self.setContent('Failed to forward statement of proposal.');
                                                } else {
                                                    self.setTitle('Success!');
                                                    self.setContent('Statement of proposal successfully forwarded.');
                                                    successFlag = true; // Set success flag
                                                }
                                            }).fail(function () {
                                                self.setContent('Something went wrong.');
                                            });
                                        },
                                        buttons: {
                                            close: function () {
                                                if (!successFlag) {
                                                    $.alert('Something went wrong');
                                                } else {
                                                    window.location.reload();
                                                }
                                            }
                                        }
                                    });
                                }
                            },
                            cancel: function () {
                                $.alert('Report Not Forwarded');
                            }
                        }
                    });
                });
            });
//            function forwardReport() {
//                var successFlag = false; // Flag to track success
//                var selectedFir = $("#firSelect").val();
//
//                var formData = new FormData();
//                formData.append("firNo", selectedFir);
//                var files = $("#photos")[0].files;
//                for (var i = 0; i < files.length; i++) {
//                    formData.append("photos", files[i]);
//                }
//
//                $.confirm({
//                    title: 'Forward Report',
//                    content: 'Are you sure you want to forward this statement of proposal with FIR No:<b> ' + selectedFir + '</b> to DC?',
//                    buttons: {
//                        forwardRep: {
//                            text: 'Forward',
//                            btnClass: 'btn-success',
//                            action: function () {
//                                $.confirm({
//                                    content: function () {
//                                        var self = this;
//                                        return $.ajax({
//                                            url: './forwardreport.htm',
//                                            data: formData,
//                                            method: 'POST',
//                                            processData: false,
//                                            contentType: false,
//                                            beforeSend: function (xhr) {
//                                                xhr.setRequestHeader(csrfHeader, csrfToken);
//                                            }
//                                        }).done(function (response) {
//                                            console.log(response);
//                                            self.setTitle(response.name);
//                                            if (response === '-1') {
//                                                self.setTitle('Failed!');
//                                                self.setContent('Failed to forward report.');
//                                            } else {
//                                                self.setTitle('Success!');
//                                                self.setContent('Report successfully forwarded.');
//                                                successFlag = true; // Set success flag
//                                            }
//                                        }).fail(function () {
//                                            self.setContent('Something went wrong.');
//                                        });
//                                    },
//                                    buttons: {
//                                        close: function () {
//                                            if (!successFlag) {
//                                                $.alert('Something went wrong');
//                                            } else {
//                                                window.location.reload();
//                                            }
//                                        }
//                                    }
//                                });
//                            }
//                        },
//                        cancel: function () {
//                            $.alert('Report Not Forwarded');
//                        }
//                    }
//                });
//            }


            function ImgUpload() {
                var imgWrap = "";
                var imgArray = [];

                $('.upload__inputfile').each(function () {
                    $(this).on('change', function (e) {
                        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
                        var maxLength = $(this).attr('data-max_length');

                        var files = e.target.files;
                        var filesArr = Array.prototype.slice.call(files);
                        var iterator = 0;

                        filesArr.forEach(function (f, index) {
                            if (f.type.match('image.*') || f.type === 'application/pdf') {
                                if (imgArray.length >= maxLength) {
                                    return false;
                                } else {
                                    var len = imgArray.filter(function (item) {
                                        return item !== undefined;
                                    }).length;

                                    if (len >= maxLength) {
                                        return false;
                                    } else {
                                        imgArray.push(f);

                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            var fileTypeClass = f.type === 'application/pdf' ? 'pdf-bg' : 'img-bg';
                                            var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='" + fileTypeClass + "'><div class='upload__img-close'></div></div><div class='filename'>" + f.name + "</div></div>";
                                            imgWrap.append(html);
                                            iterator++;
                                        }
                                        reader.readAsDataURL(f);
                                    }
                                }
                            }
                        });
                    });
                });

                $('body').on('click', ".upload__img-close", function (e) {
                    var file = $(this).parent().data("file");
                    for (var i = 0; i < imgArray.length; i++) {
                        if (imgArray[i].name === file) {
                            imgArray.splice(i, 1);
                            break;
                        }
                    }
                    $(this).parent().parent().remove();
                });
            }

        </script>
    </body>
</html>
