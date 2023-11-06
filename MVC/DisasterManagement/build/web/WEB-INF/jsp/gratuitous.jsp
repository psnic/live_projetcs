<%-- 
    Document   : gratuitous
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
        <title>Gratuitous Relief | DRMS</title>
        <%@include file="auth_head_import.jsp" %>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="auth_nav_navbar.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/getmenu.htm"></c:import>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Gratuitous Relief</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                            <!--Page Content Start-->
                            <div class="row">
                                <div class="col-md-3 mb-2">
                                    <label for="assistanceSelect"><b>Select An Assistance</b></label>
                                </div>
                                <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                            <div class="col-md-3 mb-2">
                                <label for="financialYear"><b>Financial Year</b></label>
                            </div>
                            <div class="col-md-3 mb-2">
                                <label for="financialYear"><b>Date of Incidence</b></label>
                            </div>
                            <div class="col-md-3 mb-2">
                                <label for="financialYear"><b>FIR No.</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-select" id="assistanceSelect">
                                </select>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center">
                                <input type="text" class="form-control" readonly="true" id="financialYear" value="${financialyear}">
                            </div>
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-select" id="dateSelect">
                                    <option selected disabled>--Select--</option>
                                    <c:forEach items="${datelist}" var="formattedDate">
                                        <option value="${formattedDate}">${formattedDate}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center">
                                <select class="form-select" id="firSelect" required>
                                    <option selected disabled>--Select--</option>
                                    <%--<c:forEach items="${firlist}" var="f">--%>
                                    <%--<c:if test="${f.fir_no!=null}">--%>
                                        <!--<option value="${f.fir_no}" ><c:out value="${f.fir_no}"></c:out></option>-->
                                    <%--</c:if>--%>
                                    <%--</c:forEach>--%>
                                </select>
                            </div>
                        </div>
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia1Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle1"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm1" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryName1" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input type="text" path="beneficiary_name" class="form-control" id="inputBeneficiaryName1" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input type="text" path="victim_name" class="form-control" id="inputDeceasedName" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Deceased</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="age_category" type="radio" name="ageCategory" value="adult" id="adultRadio1"/>
                                                        <label class="form-check-label" for="adultRadio1">Adult</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="age_category" type="radio" name="ageCategory" value="minor" id="minorRadio1"/>
                                                        <label class="form-check-label" for="minorRadio1">Minor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio1"/>
                                                        <label class="form-check-label" for="maleRadio1">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio1"/>
                                                        <label class="form-check-label" for="femaleRadio1">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio1"/>
                                                        <label class="form-check-label" for="otherRadio1">Others</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8 d-flex justify-content-center">
                                                    <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                        <option selected disabled>--Select Village--</option>
                                                        <c:forEach items="${villagelist}" var="v">
                                                            <c:if test="${v.villagecode!=null}">
                                                                <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input type="text" path="ifsc" id="inputIfsc" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAmountPayable1" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                <div class="col-md-8">
                                                    <input type="text" readonly="true" class="form-control onlyDigits" name="amountpayable" maxlength="" id="inputAmountPayable1"/>
                                                    <ol class="breadcrumb mb-2">
                                                        <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                <div class="col-md-8">
                                                    <input type="text" name="remarks" class="form-control" id="inputBeneficiaryRemarks"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <div class="col-12">
                                                                                                <div class="upload__box">
                                                                                                    <div class="upload__btn-box">
                                                                                                        <label class="upload__btn">
                                                                                                            <p class="btn btn-primary btn-block">Upload Photos/Certificates</p>
                                                                                                            <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="files" accept="image/png, image/jpeg, application/pdf" onchange="toggleAccordionVisibility()">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="upload__img-wrap"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div id="dynamicUploadFieldsContainer1"></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia1" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia2Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle2"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm2" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryName2" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName2" required="true"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                            <div class="col-md-8">
                                            <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                        </div>
                                    </div>-->
                                            <div class="form-group row mt-3">
                                                <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio2">
                                                        <label class="form-check-label" for="adultRadio2">Adult</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio2">
                                                        <label class="form-check-label" for="minorRadio2">Minor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio2"/>
                                                        <label class="form-check-label" for="maleRadio2">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio2"/>
                                                        <label class="form-check-label" for="femaleRadio2">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio2"/>
                                                        <label class="form-check-label" for="otherRadio2">Others</label>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="form-group row mt-3">
                                                <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8 d-flex justify-content-center">
                                                    <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                        <option selected disabled>--Select Village--</option>
                                                        <c:forEach items="${villagelist}" var="v">
                                                            <c:if test="${v.villagecode!=null}">
                                                                <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAmountPayable2" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                <div class="col-md-8">
                                                    <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable2"/>
                                                    <ol class="breadcrumb mb-2">
                                                        <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                <div class="col-md-8">
                                                    <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <div class="col-12">
                                                                                                <div class="upload__box">
                                                                                                    <div class="upload__btn-box">
                                                                                                        <label class="upload__btn">
                                                                                                            <p class="btn btn-primary btn-block">Upload Photos/Certificates</p>
                                                                                                            <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="files" accept="image/png, image/jpeg, application/pdf" onchange="toggleAccordionVisibility()">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="upload__img-wrap"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div id="dynamicUploadFieldsContainer2"></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia2" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia3Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle3"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm3" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryName3" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName3" required="true"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                            <div class="col-md-8">
                                            <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                        </div>
                                    </div>-->
                                            <div class="form-group row mt-3">
                                                <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio3">
                                                        <label class="form-check-label" for="adultRadio3">Adult</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio3">
                                                        <label class="form-check-label" for="minorRadio3">Minor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio3"/>
                                                        <label class="form-check-label" for="maleRadio3">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio3"/>
                                                        <label class="form-check-label" for="femaleRadio3">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio3"/>
                                                        <label class="form-check-label" for="otherRadio3">Others</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8 d-flex justify-content-center">
                                                    <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                        <option selected disabled>--Select Village--</option>
                                                        <c:forEach items="${villagelist}" var="v">
                                                            <c:if test="${v.villagecode!=null}">
                                                                <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b><span class="blink text-danger">*</span></label>
                                                <div class="col-md-8">
                                                    <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAmountPayable3" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                <div class="col-md-8">
                                                    <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable3"/>
                                                    <ol class="breadcrumb mb-2">
                                                        <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                <div class="col-md-8">
                                                    <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <div class="col-12">
                                                                                                <div class="upload__box">
                                                                                                    <div class="upload__btn-box">
                                                                                                        <label class="upload__btn">
                                                                                                            <p class="btn btn-primary btn-block">Upload Photos/Certificates</p>
                                                                                                            <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="files" accept="image/png, image/jpeg, application/pdf" onchange="toggleAccordionVisibility()">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="upload__img-wrap"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div id="dynamicUploadFieldsContainer3"></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia3" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia4Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle4"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm4" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputABJ" class="col-md-4 col-form-label"><b>Under Ayushman Bharat Yojna?</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="isABJ" value="Y" id="yes1">
                                                        <label class="form-check-label" for="yes1">Yes</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="isABJ" value="N" id="no1">
                                                        <label class="form-check-label" for="no1">No</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-none" id="grievousContainer1">
                                                <div class="form-group row mt-3">
                                                    <label for="inputBeneficiaryName4" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName4" required="true"/>
                                                    </div>
                                                </div>
                                                <!--                                                <div class="form-group row mt-3">
                                                                                                    <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                                    <div class="col-md-8">
                                                <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                            </div>
                                        </div>-->
                                                <div class="form-group row mt-3">
                                                    <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio4">
                                                            <label class="form-check-label" for="adultRadio4">Adult</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio4">
                                                            <label class="form-check-label" for="minorRadio4">Minor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio4"/>
                                                            <label class="form-check-label" for="maleRadio4">Male</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio4"/>
                                                            <label class="form-check-label" for="femaleRadio4">Female</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio4"/>
                                                            <label class="form-check-label" for="otherRadio4">Others</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8 d-flex justify-content-center">
                                                        <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                            <option selected disabled>--Select Village--</option>
                                                            <c:forEach items="${villagelist}" var="v">
                                                                <c:if test="${v.villagecode!=null}">
                                                                    <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputAmountPayable4" class="col-md-4 col-form-label"><b>Amount Payable</b><span class="blink text-danger">*</span></label>
                                                    <div class="col-md-8">
                                                        <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable4"/>
                                                        <ol class="breadcrumb mb-2">
                                                            <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                    <div class="col-md-8">
                                                        <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                    </div>
                                                </div>
                                                <div id="dynamicUploadFieldsContainer4"></div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-none" id="grievousFooter1">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia4" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia5Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle5"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm5" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputABJ" class="col-md-4 col-form-label"><b>Under Ayushman Bharat Yojna?</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="isABJ" value="Y" id="yes2">
                                                        <label class="form-check-label" for="yes2">Yes</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="isABJ" value="N" id="no2">
                                                        <label class="form-check-label" for="no2">No</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-none" id="grievousContainer2">
                                                <div class="form-group row mt-3">
                                                    <label for="inputBeneficiaryName5" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName5" required="true"/>
                                                    </div>
                                                </div>
                                                <!--                                                <div class="form-group row mt-3">
                                                                                                    <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                                    <div class="col-md-8">
                                                <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                            </div>
                                        </div>-->
                                                <div class="form-group row mt-3">
                                                    <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio5">
                                                            <label class="form-check-label" for="adultRadio5">Adult</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio5">
                                                            <label class="form-check-label" for="minorRadio5">Minor</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio5"/>
                                                            <label class="form-check-label" for="maleRadio5">Male</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio5"/>
                                                            <label class="form-check-label" for="femaleRadio5">Female</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio5"/>
                                                            <label class="form-check-label" for="otherRadio5">Others</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8 d-flex justify-content-center">
                                                        <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                            <option selected disabled>--Select Village--</option>
                                                            <c:forEach items="${villagelist}" var="v">
                                                                <c:if test="${v.villagecode!=null}">
                                                                    <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                    <div class="col-md-8">
                                                        <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputAmountPayable5" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                    <div class="col-md-8">
                                                        <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable5"/>
                                                        <ol class="breadcrumb mb-2">
                                                            <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                        </ol>
                                                    </div>
                                                </div>
                                                <div class="form-group row mt-3">
                                                    <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                    <div class="col-md-8">
                                                        <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                    </div>
                                                </div>

                                                <div id="dynamicUploadFieldsContainer5"></div>
                                            </div>
                                        </div>
                                        <div class="card-footer d-none" id="grievousFooter2">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia5" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia6Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle6"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm6" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryName6" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName6" required="true"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                            <div class="col-md-8">
                                            <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                        </div>
                                    </div>-->
                                            <div class="form-group row mt-3">
                                                <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio6">
                                                        <label class="form-check-label" for="adultRadio6">Adult</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio6">
                                                        <label class="form-check-label" for="minorRadio6">Minor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio6"/>
                                                        <label class="form-check-label" for="maleRadio6">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio6"/>
                                                        <label class="form-check-label" for="femaleRadio6">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio6"/>
                                                        <label class="form-check-label" for="otherRadio6">Others</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8 d-flex justify-content-center">
                                                    <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                        <option selected disabled>--Select Village--</option>
                                                        <c:forEach items="${villagelist}" var="v">
                                                            <c:if test="${v.villagecode!=null}">
                                                                <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAmountPayable6" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                <div class="col-md-8">
                                                    <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable6" value="<c:out escapeXml="true" value="" />"/>
                                                    <ol class="breadcrumb mb-2">
                                                        <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                <div class="col-md-8">
                                                    <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <div class="col-12">
                                                                                                <div class="upload__box">
                                                                                                    <div class="upload__btn-box">
                                                                                                        <label class="upload__btn">
                                                                                                            <p class="btn btn-primary btn-block">Upload Photos/Certificates</p>
                                                                                                            <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="files" accept="image/png, image/jpeg, application/pdf" onchange="toggleAccordionVisibility()">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="upload__img-wrap"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div id="dynamicUploadFieldsContainer6"></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia6" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>                            
                        <div class="mt-2 py-4 mb-4 d-none" id="exGratia7Container">
                            <div class="card card-section">
                                <div class="card-header">
                                    <h5 class="text-capitalize" id="formTitle7"></h5>
                                </div>
                                <div class="form-section">
                                    <form:form id="exgratiaForm7" method="POST" modelAttribute="beneficiary" role="form" enctype="multipart/form-data" autocomplete="off">
                                        <div class="card-body">
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryName7" class="col-md-4 col-form-label"><b>Name of Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="beneficiary_name" type="text" class="form-control" id="inputBeneficiaryName7" required="true"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <label for="inputDeceasedName" class="col-md-4 col-form-label"><b>Name of Deceased/Victim</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                                                            <div class="col-md-8">
                                            <%--<form:input path="victim_name" type="text" class="form-control" id="inputDeceasedName" required="true"/>--%>
                                        </div>
                                    </div>-->
                                            <div class="form-group row mt-3">
                                                <label for="inputAgeCategory" class="col-md-4 col-form-label"><b>Age Category Of The Beneficiary</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="adult" id="adultRadio7">
                                                        <label class="form-check-label" for="adultRadio7">Adult</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="ageCategory" value="minor" id="minorRadio7">
                                                        <label class="form-check-label" for="minorRadio7">Minor</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputGender" class="col-md-4 col-form-label"><b>Gender</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="M" id="maleRadio7"/>
                                                        <label class="form-check-label" for="maleRadio7">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="F" id="femaleRadio7"/>
                                                        <label class="form-check-label" for="femaleRadio7">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" path="gender" type="radio" name="gender" value="O" id="otherRadio7"/>
                                                        <label class="form-check-label" for="otherRadio7">Others</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="villageSelect" class="col-md-4 col-form-label"><b>Village</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8 d-flex justify-content-center">
                                                    <form:select class="form-select" path="villagecode.villagecode" id="villageSelect">
                                                        <option selected disabled>--Select Village--</option>
                                                        <c:forEach items="${villagelist}" var="v">
                                                            <c:if test="${v.villagecode!=null}">
                                                                <form:option value="${v.villagecode}" ><c:out value="${v.villagename}"></c:out></form:option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankName" class="col-md-4 col-form-label"><b>Bank Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="bank_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBranchName" class="col-md-4 col-form-label"><b>Branch Name</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="branch_name" type="text" class="form-control" maxlength="" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputIFSC" class="col-md-4 col-form-label"><b>IFSC Code</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ifsc" type="text" class="form-control" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBankAcNumber" class="col-md-4 col-form-label"><b>Bank A/C Number</b>&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></label>
                                                <div class="col-md-8">
                                                    <form:input path="ac_number" type="text" class="form-control onlyDigits" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputAmountPayable7" class="col-md-4 col-form-label"><b>Amount Payable</b></label>
                                                <div class="col-md-8">
                                                    <input name="amountpayable" type="text" readonly="true" class="form-control onlyDigits" maxlength="" id="inputAmountPayable7"/>
                                                    <ol class="breadcrumb mb-2">
                                                        <li class="breadcrumb-item active text-danger">The assessed amount above adheres to SDRF norms for relief payment.</li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div class="form-group row mt-3">
                                                <label for="inputBeneficiaryRemarks" class="col-md-4 col-form-label"><b>Remarks</b></label>
                                                <div class="col-md-8">
                                                    <input name="remarks" type="text" class="form-control" id="inputBeneficiaryRemarks"/>
                                                </div>
                                            </div>
                                            <!--                                            <div class="form-group row mt-3">
                                                                                            <div class="col-12">
                                                                                                <div class="upload__box">
                                                                                                    <div class="upload__btn-box">
                                                                                                        <label class="upload__btn">
                                                                                                            <p class="btn btn-primary btn-block">Upload Photos/Certificates</p>
                                                                                                            <input type="file" multiple="multiple" data-max_length="20" class="upload__inputfile" name="files" accept="image/png, image/jpeg, application/pdf" onchange="toggleAccordionVisibility()">
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="upload__img-wrap"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div id="dynamicUploadFieldsContainer7"></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class=" d-flex justify-content-end">
                                                <!--<button class="btn btn-success" title="Save Details"><i class="fa-solid fa-floppy-disk fa-fade"></i>&nbsp;Save Details</button>-->
                                                <input type="submit" id="btnSaveExgratia7" value="Save Details" class="btn btn-success"/>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mt-4">
                            <div class="card-header">
                                <h5>List Of Beneficiaries Entered And Not Forwarded</h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <table id="dataTable" class="table table-bordered">
                                            <thead>
                                                <!--                                                <tr>
                                                                                                    <th colspan="4" class="text-center"><h5>List Of Beneficiaries Entered And Not Forwarded</h5></th>
                                                                                                </tr>-->
                                                <tr>
                                                    <th>Sl No.</th>
                                                    <th>Beneficiary Name</th>
                                                    <th>Assistance Provided</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- Data will be populated here -->
                                                <c:forEach items="${existingData}" var="o" varStatus="i">
                                                    <tr>
                                                        <td class="text-center"><c:out escapeXml="true" value="${i.count}" /></td>
                                                        <td><c:out escapeXml="true" value="${o[0]}" /></td>
                                                        <td>
                                                            <c:out escapeXml="true" value="${o[1]}" />
                                                            <c:out escapeXml="true" value="${o[2]}" />
                                                            <c:if test="${not (o[3] == 'N.A' || o[3] == 'NA')}">
                                                                <c:out escapeXml="true" value="${o[3]}" />
                                                            </c:if>
                                                        </td>
                                                        <td><c:out escapeXml="true" value="${o[4]}" /></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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

                $('input[name="isABJ"]').change(function () {
                    if ($(this).val() === 'Y') {
                        alert('Not Eligible For assistance ');
                    }
                });
                // Populate select options and fields on page load
                populateSelectOptionsAndFields($('#assistanceSelect').val());

                // Bind onchange event to populate select options and fields
                $('#assistanceSelect').change(function () {
//                    console.log('1');
                    var selectedValue = $(this).val();
//                    console.log('2');
                    populateSelectOptionsAndFields(selectedValue);
                    fetchDocumentTypes(selectedValue);
//                    console.log('X');
                });

                function toggleGrievousContainer() {
                    var radioN1 = document.getElementById('no1');
                    var grievousContainer1 = document.getElementById('grievousContainer1');
                    var grievousFooter1 = document.getElementById('grievousFooter1');

                    var radioN2 = document.getElementById('no2');
                    var grievousContainer2 = document.getElementById('grievousContainer2');
                    var grievousFooter2 = document.getElementById('grievousFooter2');

                    if (radioN1.checked) {
                        grievousContainer1.classList.remove('d-none');
                        grievousFooter1.classList.remove('d-none');
                    } else {
                        grievousContainer1.classList.add('d-none');
                        grievousFooter1.classList.add('d-none');
                    }

                    if (radioN2.checked) {
                        grievousContainer2.classList.remove('d-none');
                        grievousFooter2.classList.remove('d-none');
                    } else {
                        grievousContainer2.classList.add('d-none');
                        grievousFooter2.classList.add('d-none');
                    }
                }

                // Add an event listener to the radio buttons
                var radioYes1 = document.getElementById('yes1');
                var radioNo1 = document.getElementById('no1');
                var radioYes2 = document.getElementById('yes2');
                var radioNo2 = document.getElementById('no2');

                radioYes1.addEventListener('change', toggleGrievousContainer);
                radioNo1.addEventListener('change', toggleGrievousContainer);
                radioYes2.addEventListener('change', toggleGrievousContainer);
                radioNo2.addEventListener('change', toggleGrievousContainer);

                // Call the function initially to set the initial state
                toggleGrievousContainer();

//                populatevillage();
                ImgUpload();

                $('#dataTable').DataTable({});

                $('#dateSelect').change(function () {
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                url: './getallfirfromdate.htm',
                                data: 'date=' + $('#dateSelect').val(),
                                method: 'get'
                            }).done(function (response) {
                                var ps = JSON.parse(response);
//                                                                var ps = JSON.parse(res.policestation);
                                var markup = "<option value=''>Select</option>"
                                for (var i = 0; i < ps.length; i++) {
                                    markup += "<option value=" + ps[i].fir_no + ">" + ps[i].fir_no + "</option>";
                                }
                                $('#firSelect').html(markup);
                                self.close();
                            }).fail(function () {
                                self.setContent('Something went wrong.');
                            });
                        }
                    });
                });

                $("#exgratiaForm1").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName1').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var amount = $('#inputAmountPayable1').val();
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm1").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm2").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName2').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var amount = $('#inputAmountPayable2').val();
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm2").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm3").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName3').val();
                    var amount = $('#inputAmountPayable3').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm3").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm4").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName4').val();
                    var amount = $('#inputAmountPayable4').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm4").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm5").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName5').val();
                    var amount = $('#inputAmountPayable5').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm5").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm6").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName6').val();
                    var amount = $('#inputAmountPayable6').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm6").trigger("reset");
                                }
                            }
                        }
                    });
                });
                $("#exgratiaForm7").submit(function (e) {
                    e.preventDefault();
                    var norm = $('#assistanceSelect').val();
                    var fir = $('#firSelect').val();
                    var finyear = $('#financialYear').val();
                    var beneficiaryName = $('#inputBeneficiaryName7').val();
                    var amount = $('#inputAmountPayable7').val();
                    var assistanceSelect = document.getElementById('assistanceSelect');
                    var selectedOption = assistanceSelect.options[assistanceSelect.selectedIndex].text;
                    var formData = new FormData($(this)[0]);
                    formData.append('normSelect', norm);
                    formData.append('fir_no', fir);
                    formData.append('fin_year', finyear);
                    $.confirm({
                        content: function () {
                            var self = this;
                            return $.ajax({
                                method: 'POST',
                                url: "./saveexgratia.htm",
                                data: formData,
                                processData: false,
                                contentType: false
                            }).done(function (response) {
                                if (response !== '-1') {
                                    self.setTitle("Success");
                                    self.setContent("Details Saved Successfully");
                                    // Add a new row to the table with the saved data
                                    var newRow = $("<tr>");
                                    newRow.append("<td class='text-center'>" + ($('#dataTable tbody tr').length + 1) + "</td>");
                                    newRow.append("<td>" + beneficiaryName + "</td>");
                                    newRow.append("<td>" + selectedOption + "</td>");
                                    newRow.append("<td>" + amount + "</td>");

                                    $('#dataTable tbody').append(newRow);

                                    // Scroll down to the table
                                    $('html, body').animate({
                                        scrollTop: $("#dataTable").offset().top
                                    }, 1000);
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
                                    $("#exgratiaForm7").trigger("reset");
                                }
                            }
                        }
                    });
                });
            });

//            jQuery(document).ready(function () {
//                ImgUpload();
//            });
//            function ImgUpload() {
//                var imgWrap = "";
//                var imgArray = [];
//
//                $('.upload__inputfile').each(function () {
//                    $(this).on('change', function (e) {
//                        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
//                        var maxLength = $(this).attr('data-max_length');
//
//                        var files = e.target.files;
//                        var filesArr = Array.prototype.slice.call(files);
//                        var iterator = 0;
//                        filesArr.forEach(function (f, index) {
//
//                            if (!f.type.match('image.*')) {
//                                return;
//                            }
//
//                            if (imgArray.length > maxLength) {
//                                return false
//                            } else {
//                                var len = 0;
//                                for (var i = 0; i < imgArray.length; i++) {
//                                    if (imgArray[i] !== undefined) {
//                                        len++;
//                                    }
//                                }
//                                if (len > maxLength) {
//                                    return false;
//                                } else {
//                                    imgArray.push(f);
//
//                                    var reader = new FileReader();
//                                    reader.onload = function (e) {
//                                        var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
//                                        imgWrap.append(html);
//                                        iterator++;
//                                    }
//                                    reader.readAsDataURL(f);
//                                }
//                            }
//                        });
//                    });
//                });
//
//                $('body').on('click', ".upload__img-close", function (e) {
//                    var file = $(this).parent().data("file");
//                    for (var i = 0; i < imgArray.length; i++) {
//                        if (imgArray[i].name === file) {
//                            imgArray.splice(i, 1);
//                            break;
//                        }
//                    }
//                    $(this).parent().parent().remove();
//                });
//            }
//            $(document).ready(function () {
//                ImgUpload();
//            });

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

//            function populatevillage() {
//                var self = this;
//                var blockcode = $('#inputBlockcode').val();
//                $.ajax({
//                    url: './getvillagefromblock.htm',
//                    data: 'blockcode=' + blockcode,
//                    method: 'get'
//                }).done(function (response) {
//                    var bl = JSON.parse(response);
//                    console.log(bl);
//                    var markup = "<option value='' disabled selected>---Select Village--</option>"
//                    for (var i = 0; i < bl.length; i++) {
//                        markup += "<option value=" + bl[i].villagecode + ">" + bl[i].villagename + "</option>";
//                    }
//                    $('#villageSelect').html(markup);
//                    self.close();
//                }).fail(function () {
//                    self.setContent('Something went wrong.');
//                });
//            }


            function populateSelectOptionsAndFields(selectedValue) {
                // Fetch norms data and update select options
                $.ajax({
                    url: './exgratianorms.htm',
                    method: 'GET',
                    dataType: 'json',
                    success: function (normsData) {
//                                                                                var normjson = JSON.parse(normsData);
//                                                                                console.log(normsData);
//                                                                                console.log(normjson);
                        var selectedNorm = null;
                        var formTitleText = "";
                        var selectOptionsMarkup = "<option value='' selected disabled>---Assistances For Gratuitous Relief---</option>";
                        for (var i = 0; i < normsData.length; i++) {
                            var norm = normsData[i];
                            var selectText = norm[1] + ' ' + norm[2];
                            if (norm[3] !== 'N.A' && norm[3] !== 'NA') {
                                selectText += ' ' + norm[3];
                            }
                            selectOptionsMarkup += '<option value="' + norm[0] + '" class="text-capitalize">' + selectText + '</option>';
                            // Check if this is the selected norm
                            if (norm[0] === parseInt(selectedValue)) {
                                selectedNorm = norm;
                                formTitleText = selectText;
                            }
                            $('#assistanceSelect option[value=' + norm[0] + ']').attr('selected', 'selected');
                        }

                        $('#assistanceSelect').html(selectOptionsMarkup);
                        // Update inputAmountPayable and toggle container visibility
                        if (selectedNorm) {
                            for (var i = 1; i <= 7; i++) {
                                if (i === parseInt(selectedValue)) {
                                    $('#exGratia' + i + 'Container').removeClass('d-none');
                                    $('#formTitle' + i).html(formTitleText);
                                    $('#inputAmountPayable' + i).val(selectedNorm[4]);
                                } else {
                                    $('#exGratia' + i + 'Container').addClass('d-none');
                                }
                            }
                        }
//                            selectedValue
                        $('#assistanceSelect').val(selectedValue);
                    },
                    error: function () {
                        console.error('Error fetching norms data.');
                    }
                });
            }
            function fetchDocumentTypes(normCode) {
                // Make an AJAX request to fetch required document types based on normCode
                $.ajax({
                    url: './getdocumenttypesforbeneficiary.htm',
                    method: 'GET',
                    data: {norm_code: normCode},
                    success: function (documentTypes) {
                        console.log(documentTypes);
                        var uploadFieldsMarkup = '';
                        for (var i = 0; i < documentTypes.length; i++) {
                            var documentType = documentTypes[i];
                            uploadFieldsMarkup +=
                                    '<div class="form-group row mt-4">' +
                                    '<label for="fileInput' + i + '" class="form-label text-capitalize col-md-4"><b>Upload ' + documentType + '&nbsp;<i class="fa-solid fa-star-of-life fa-beat-fade fa-2xs" style="color: #ff4747;"></i></b></label>' +
                                    '<div class="col-md-8">' +
                                    '<input class="form-control" id="fileInput' + i + '" type="file" class="form-control" name="files">' +
//                                    '<input type="file" id="fileInput' + i + '" class="form-control" name="files" accept="image/png, image/jpeg" required style="display:none;">' +
                                    '</div>' +
                                    '</div>';
                        }
                        switch (normCode) {
                            case '1':
                                $('#dynamicUploadFieldsContainer1').html(uploadFieldsMarkup);
                                break;
                            case '2':
                                $('#dynamicUploadFieldsContainer2').html(uploadFieldsMarkup);
                                break;
                            case '3':
                                $('#dynamicUploadFieldsContainer3').html(uploadFieldsMarkup);
                                break;
                            case '4':
                                $('#dynamicUploadFieldsContainer4').html(uploadFieldsMarkup);
                                break;
                            case '5':
                                $('#dynamicUploadFieldsContainer5').html(uploadFieldsMarkup);
                                break;
                            case '6':
                                $('#dynamicUploadFieldsContainer6').html(uploadFieldsMarkup);
                                break;
                            case '7':
                                $('#dynamicUploadFieldsContainer7').html(uploadFieldsMarkup);
                                break;
                                // Add more cases for other normCodes if needed
                            default:
                                break;
                        }
                    }
                });
            }
        </script>
    </body>
</html>
