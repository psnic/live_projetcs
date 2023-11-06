<%-- 
    Document   : fir
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
        <title>FIR | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
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

            /*            #inputPublicPropertyDamaged {
                            
                        }*/

            .brand-link .brand-image {
                float: left;
                line-height: .8;
                margin-left: 0.8rem;
                margin-right: 0.5rem;
                margin-top: unset;
                max-height: 60px;
                width: auto;
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
            /*            .upload__btn {
                            display: inline-block;
                            font-weight: 600;
                            color: #fff;
                            text-align: center;
                            min-width: 116px;
                            padding: 5px;
                            transition: all 0.3s ease;
                            cursor: pointer;
                            border: 2px solid;
                            background-color: #4045ba;
                            border-color: #4045ba;
                            border-radius: 10px;
                            line-height: 26px;
                            font-size: 14px;
                        }
                        .upload__btn:hover {
                            background-color: unset;
                            color: #4045ba;
                            transition: all 0.3s ease;
                        }*/
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

            /*            .grid-container {
                            display: grid;
                            grid-template-columns: repeat(3, 1fr);
                            gap: 10px;
                        }
            
                        .grid-row {
                            display: grid;
                            grid-template-columns: repeat(3, 1fr);
                            gap: 10px;
                        }
            
                         Optional: Add some padding and border to the grid 
                        .grid-container, .grid-row {
                            padding: 10px;
                            border: 1px solid #ccc;
                        }*/

        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="auth_nav_navbar.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/getmenu.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h3 class="mt-4 mb-0">First Information Report</h3>
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

                                <form:form method="POST" id="firForm" role="form" enctype="multipart/form-data" modelAttribute="fir" autocomplete="off">
                                    <form:input type="text" id="inputUserid" path="userid.userid" value="${LOGIN.userid}" class="form-control d-none" readonly="true"/>
                                    <div class="form-group row mt-3">
                                        <label for="inputCalamity" class="col-md-4 col-form-label"><b>Type and Nature of Calamity</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                        <div class="col-md-8">
                                            <form:select class="form-control" path="calamity_id.calamity_id" name="calamity_id" id="inputCalamity" required="true">                                    
                                                <option value="" disabled="true" selected="true">Select Calamity</option>
                                                <c:forEach items="${calamitylist}" var="c">
                                                    <c:if test="${c.calamity_id!=null}">
                                                        <form:option value="${c.calamity_id}" ><c:out value="${c.calamity_name}"></c:out></form:option>
                                                    </c:if>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputDate" class="col-md-4 col-form-label"><b>Date and Time of Occurrence</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                        <div class="col-md-4">
                                            <form:input type="date" path="date_of_calamity_occurence" class="form-control" id="inputDate" onclick="getMaxCurrentDate()" required="true"/>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="time" name="time_occurrence" id="calamitytime" class="form-control" required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputAffectedArea" class="col-md-4 col-form-label"><b> Name of Affected area (Block)</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                        <div class="col-md-8">
                                            <input type="text" id="inputAffectedArea" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockname}" />" class="form-control" readonly="true" />
                                            <form:input type="text" id="inputAffectedArea" path="blockcode.blockcode" value="${LOGIN.blockcode.blockcode}" class="form-control d-none" readonly="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputNoOfVillages" class="col-md-4 col-form-label"><b>No. of villages affected</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="no_villages_affected" class="form-control onlyDigits" maxlength="100"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputPopulationAffected" class="col-md-4 col-form-label"><b>Total human population affected</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="human_population_affected" class="form-control onlyDigits" maxlength="100"/>
                                        </div>
                                    </div>
                                    <!-- Bootstrap Accordion-->
                                    <div class="accordion mt-3" id="accordionPanelsStayOpenExample">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                                    <span><b>Click to enter affected entity inputs (Subject to updation)</b></span>
                                                </button>
                                            </h2>
                                            <div id="panelsStayOpen-collapseOne" class="p-3 accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                                                <div class="accordion-body">
                                                    <div class="form-group row mt-3">
                                                        <label for="inputNoOfPerson" class="col-md-4 col-form-label"><b>No. of Person</b></label>
                                                        <div class="col-md-4">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDead" onclick="toggleTextBox('dead')">
                                                                <label class="form-check-label" for="flexCheckDefault">Dead</label>
                                                                <form:input type="text" path="people_dead" class="form-control d-none inline-input onlyDigits" id="deadInput" maxlength="100" placeholder="No. of people dead"/>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckMissing" onclick="toggleTextBox('missing')">
                                                                <label class="form-check-label" for="flexCheckChecked">Missing</label>
                                                                <form:input type="text" path="people_missing" class="form-control d-none inline-input onlyDigits" id="missingInput" maxlength="100" placeholder="No. of people missing"/>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckInjured" onclick="toggleTextBox('injured')">
                                                                <label class="form-check-label" for="flexCheckChecked">Injured</label>
                                                                <form:input type="text" path="people_injured" class="form-control d-none inline-input onlyDigits" id="injuredInput" maxlength="100" placeholder="No. of people injured"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row mt-3">
                                                        <label for="inputAnimal" class="col-md-4 col-form-label"><b>Animals</b></label>
                                                        <div class="col-md-4">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckAffected" onclick="toggleTextBox('affected')">
                                                                <div class="form-check-label" for="flexCheckDefault">
                                                                    Affected
                                                                    <form:input type="text" path="animals_affected" class="form-control d-none onlyDigits" id="affectedInput" maxlength="100" placeholder="No. of animals affected"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckLost" onclick="toggleTextBox('lost')">
                                                                <label class="form-check-label" for="flexCheckChecked">
                                                                    Lost
                                                                </label>
                                                                <form:input type="text" path="animals_lost" class="form-control d-none onlyDigits" id="lostInput" maxlength="100" placeholder="No. of animals that are lost"/>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckAdead" onclick="toggleTextBox('adead')">
                                                                <label class="form-check-label" for="flexCheckChecked">
                                                                    Dead
                                                                </label>
                                                                <form:input type="text" path="animals_dead" class="form-control d-none onlyDigits" id="adeadInput" maxlength="100" placeholder="No. of animals dead"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row mt-3 mb-3">
                                                        <label for="inputCropAffected" class="col-md-4 col-form-label"><b>Name of crop affected and area (in Hectare)</b></label>
                                                        <div class="col-md-8">
                                                            <form:input type="text" path="crop_affected" class="form-control" maxlength="100"/>
                                                        </div>
                                                    </div>    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="accordion-item mt-3">
                                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                                    <span><b>Click to enter damaged property/infrastructure inputs(Subject to updation)</b></span>
                                                </button>
                                            </h2>
                                            <div id="panelsStayOpen-collapseTwo" class="p-3 accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                                <div class="accordion-body">
                                                    <div class="form-group row mt-3">
                                                        <label for="inputHousesDamaged" class="col-md-4 col-form-label"><b>No. of houses damaged</b></label>
                                                        <div class="col-md-4">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckHousefully" onclick="toggleTextBox('housefully')">
                                                                <div class="form-check-label" for="flexCheckDefault">
                                                                    Fully
                                                                    <form:input type="text" path="house_fully" class="form-control d-none onlyDigits" id="housefullyInput" maxlength="100" placeholder="No. of houses fully damaged"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckHousepartially" onclick="toggleTextBox('housepartially')">
                                                                <label class="form-check-label" for="flexCheckChecked">
                                                                    Partially
                                                                </label>
                                                                <form:input type="text" path="house_partially" class="form-control d-none onlyDigits" id="housepartiallyInput" maxlength="100" placeholder="No. of houses partially damaged"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row mt-3 mb-3">
                                                        <label for="inputPublicPropertyDamaged" class="col-md-4 col-form-label"><b>Damage to public property</b></label>
                                                        <div class="col-md-8">
                                                            <div id="propertieslist">
                                                                <div id="gridContainer">
                                                                    <div class="row" id="gridRow">
                                                                        <!-- Populate rows dynamically on click of add row button -->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <button type="button" class="btn btn-primary mt-3" id="addRowButton" onclick="addRow()">Add Row</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Bootstrap Accordion end-->
                                    <div class="form-group row mt-3">
                                        <label for="inputReliefMeasure" class="col-md-4 col-form-label"><b>Relief Measure undertaken in Brief</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="relief_measure" class="form-control" maxlength="100"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputImmediateResponse" class="col-md-4 col-form-label"><b>Immediate response &AMP; relief assistance required and the best logistical means of delivering that relief from state</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="immediate_response" class="form-control" maxlength="100"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputForecast" class="col-md-4 col-form-label"><b>Forecast of possible future developments including new risk</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="forecast" class="form-control" maxlength="100"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="inputOtherInfo" class="col-md-4 col-form-label"><b>Any other relevant information</b></label>
                                        <div class="col-md-8">
                                            <form:input type="text" path="other_info" class="form-control" maxlength="100"/>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <div class="col-12">
                                            <div class="upload__box">
                                                <div class="upload__btn-box">
                                                    <label class="upload__btn">
                                                        <p class="btn btn-primary btn-block">Upload Photos</p>
                                                        <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="photos" accept="image/png, image/jpeg">
                                                    </label>
                                                </div>
                                                <div class="upload__img-wrap"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 d-flex justify-content-end">
                                        <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                        <input type="submit" id="btnSaveFir" value="Save Details" class="btn btn-success"/>
                                    </div>
                                </form:form>
                            </div>
                        </div>

                        <!--Page Content End-->
                    </div>
                </main>
                <%@include file="auth_footer_content.jsp" %>
            </div>
        </div>

        <%@include file="auth_footer_import.jsp"%>
        <script src="jojo/js/fir_scripts.js" type="text/javascript"></script>
        <script src="jojo/js/moment.min.js" type="text/javascript"></script>
        <script>
                                                                var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                                var csrfToken = $("meta[name='_csrf']").attr("content");
                                                                $(document).ready(function () {
                                                                    ImgUpload();
                                                                    $("#firForm").submit(function (e) {
                                                                        e.preventDefault();
                                                                        var formData = new FormData($(this)[0]);
                                                                        $.confirm({
                                                                            content: function () {
                                                                                var self = this;
                                                                                return $.ajax({
                                                                                    method: 'POST',
                                                                                    url: "./savefir.htm",
                                                                                    data: formData,
                                                                                    processData: false,
                                                                                    contentType: false
                                                                                }).done(function (response) {
                                                                                    if (response !== '-1') {
                                                                                        self.setTitle("Success");
                                                                                        self.setContent("Details Saved Successfully With Fir Number: "+"<br>" + response);
                                                                                    } else {
                                                                                        self.setTitle("Failed");
                                                                                    }
                                                                                }).fail(function () {
                                                                                    self.setTitle('Something went wrong.');
                                                                                });
                                                                            },
                                                                            buttons: {
                                                                                close: {
                                                                                    action: function () {
                                                                                        $("#firForm").trigger("reset");
                                                                                        window.location.reload();
                                                                                    }
                                                                                }
                                                                            }
                                                                        });
                                                                    });
                                                                });

                                                                function toggleTextBox(type) {
                                                                    var inputField = document.getElementById(type + 'Input');
                                                                    inputField.classList.toggle('d-none');

                                                                    // Check if the checkbox is checked and set the 'required' attribute accordingly
                                                                    var checkbox = document.getElementById('flexCheck' + type.charAt(0).toUpperCase() + type.slice(1));
                                                                    inputField.required = checkbox.checked;
                                                                }

//                                                            jQuery(document).ready(function () {
//                                                                ImgUpload();
//                                                            });
//
//                                                            function ImgUpload() {
//                                                                var imgWrap = "";
//                                                                var imgArray = [];
//
//                                                                $('.upload__inputfile').each(function () {
//                                                                    $(this).on('change', function (e) {
//                                                                        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
//                                                                        var maxLength = $(this).attr('data-max_length');
//
//                                                                        var files = e.target.files;
//                                                                        var filesArr = Array.prototype.slice.call(files);
//                                                                        var iterator = 0;
//                                                                        filesArr.forEach(function (f, index) {
//
//                                                                            if (!f.type.match('image.*')) {
//                                                                                return;
//                                                                            }
//
//                                                                            if (imgArray.length > maxLength) {
//                                                                                return false
//                                                                            } else {
//                                                                                var len = 0;
//                                                                                for (var i = 0; i < imgArray.length; i++) {
//                                                                                    if (imgArray[i] !== undefined) {
//                                                                                        len++;
//                                                                                    }
//                                                                                }
//                                                                                if (len > maxLength) {
//                                                                                    return false;
//                                                                                } else {
//                                                                                    imgArray.push(f);
//
//                                                                                    var reader = new FileReader();
//                                                                                    reader.onload = function (e) {
//                                                                                        var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
//                                                                                        imgWrap.append(html);
//                                                                                        iterator++;
//                                                                                    }
//                                                                                    reader.readAsDataURL(f);
//                                                                                }
//                                                                            }
//                                                                        });
//                                                                    });
//                                                                });
//
//                                                                $('body').on('click', ".upload__img-close", function (e) {
//                                                                    var file = $(this).parent().data("file");
//                                                                    for (var i = 0; i < imgArray.length; i++) {
//                                                                        if (imgArray[i].name === file) {
//                                                                            imgArray.splice(i, 1);
//                                                                            break;
//                                                                        }
//                                                                    }
//                                                                    $(this).parent().parent().remove();
//                                                                });
//                                                            }

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
                                                                                if (!f.type.match('image.*')) {
                                                                                    return;
                                                                                }

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
                                                                                            var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div><div class='filename'>" + f.name + "</div></div>";
                                                                                            imgWrap.append(html);
                                                                                            iterator++;
                                                                                        }
                                                                                        reader.readAsDataURL(f);
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
