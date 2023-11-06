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
        <title>Manager Desk</title>
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
                        <div class="container px-4">
                            <div class="mt-4">
                                <div class="card">
                                    <div class="card-body align-items-center justify-content-center">
                                        <div class="float-start">
                                            <p type="button" class="mynavitem mb-0" onclick="gotoCaseManagement();"><i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;Back to Case Management</p>
                                        </div>
                                        <h5 class="mb-0 fw-bold text-center text-purple-hov"><i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;Edit Call Log</h5>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="<c:out value="${basic_casedetails.caseno}" />" id="inputCaseNoRO" />
                        <form:form modelAttribute="pcscreen" method="POST" id="pcrscreen" enctype="multipart/form-data">
                            <sec:csrfInput />
                            <div class="card mt-4">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <div class="form-floating mb-3">
                                                <form:input readonly="true" type="text" id="caseno" path="basic_casedetails.caseno" class="form-control" placeholder="Enter Case Number" />
                                                <label for="caseno">Case Number</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating mb-3">
                                                <form:select class="form-control" path="m_calltype.calltypeid" id="calltypeid"> 
                                                    <form:option value="${m_calltype.calltypeid}">${m_calltype.calltypedesc}</form:option>
                                                    <c:forEach var="st" items="${calltypelist}">   
                                                        <form:option value="${st.calltypeid}" >${st.calltypedesc}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                                <label for="calltypeid">Call Type</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" id="phoneno" path="phoneno" class="form-control" placeholder="Enter Phone Number" />
                                                <label for="phoneno">Phone Number</label>
                                            </div>
                                        </div>
                                        <form:input type="hidden" path="m_call.callid" class="form-control" />
                                    </div>
                                    <div class="row mb-3">

                                        <div class="col-12 mb-3">
                                            <input type="hidden" value="${pcscreen.callertype}" id="callerType" />
                                            <label for="callertype">Caller Type</label>
                                            <c:choose>
                                                <c:when test="${pcscreen.callertype =='Casualty_type'}">
                                                    <div class="callertype">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="callertyperadio" value="A" id="calleragencytype">
                                                            <label class="form-check-label" for="calleragencytype">
                                                                Agency
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input checked="checked" class="form-check-input" type="radio" name="callertyperadio" value="C" id="casualtytype">
                                                            <label class="form-check-label" for="casualtytype">
                                                                Casualty
                                                            </label>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="callertype">
                                                        <div class="form-check">
                                                            <input checked="checked" class="form-check-input" type="radio" name="callertyperadio" value="A" id="calleragencytype">
                                                            <label class="form-check-label" for="calleragencytype">
                                                                Agency
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="callertyperadio" value="C" id="casualtytype">
                                                            <label class="form-check-label" for="casualtytype">
                                                                Casualty
                                                            </label>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div id="radioBasedDiv" class="d-none">
                                            <div class="col" id="agencyBlock">
                                                <div class="form-floating mb-3">
                                                    <select class="form-select" id="selectAgency" name="agencytype" aria-label="Select Agency">
                                                        <option selected="true" disabled="true">Select Agency</option>
                                                        <c:forEach var="st" items="${agentypelist}">
                                                            <option value="<c:out escapeXml="true" value="${st.agencytypeid}" />"><c:out escapeXml="true" value="${st.agencytypename}" /></option>
                                                        </c:forEach>
                                                    </select>
                                                    <label for="selectAgency">Select Agency</label>
                                                </div>
                                                <div class="form-control mb-3">
                                                    <table id="agencyTable" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No</th>
                                                                <th>Agency name</th>
                                                                <th>Address</th>
                                                                <th>District</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="agencyTableBody">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="form-control mb-3">
                                                    <table id="agencyTableList" class="table table-bordered table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No</th>
                                                                <th>Person Name</th>
                                                                <th>Designation</th>
                                                                <th>Mobile No 1</th>
                                                                <th>Office No 1</th>
                                                                <th>Mobile No 2</th>
                                                                <th>Office No 2</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="agencyTableListBody">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input type="text" id="agencyname" name="agencyname" class="form-control" readonly="true"/>
                                                    <label for="agencyname">Agency Name</label>
                                                </div>
                                            </div>
                                            <div id="casualtyBlock">
                                                <div class="form-floating mb-3">
                                                    <form:select class="form-select" id="selectCasualty" path="m_casualty.casualtyid" aria-label="Select Casualty">
                                                        <form:option value="${m_casualty.casualtyid}">${m_casualty.casualtydesc}</form:option>
                                                        <c:forEach var="c" items="${casualtylist}" varStatus="i">
                                                            <form:option value="${c.casualtyid}">${c.casualtydesc}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                    <label for="selectCasualty">Select Casualty</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" class="form-control" id="inputRecipientName" path="recepientname" placeholder="Recipient Name" required="true" />
                                                <label for="inputRecipientName">Recipient Name&nbsp;&nbsp;<span class="text-danger blink fw-bold">*</span></label>
                                                <form:input type="hidden" id="id" path="call_logid" class="form-control" />
                                                <input type="hidden" name="magencydetailid" id="magencydetailid" class="form-control"/>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating mb-3">
                                                <form:input type="text" class="form-control" id="inputRecipientDesignation"  path="designation"  placeholder="Enter Designation" />
                                                <label for="inputRecipientDesignation">Designation</label>

                                                <form:input type="hidden" id="basic_casedetailsid" path="basic_casedetails.basic_caseid" class="form-control"/>
                                                <input type="hidden" id="caseno"  class="form-control" value="${basic_casedetails.caseno}"/>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <form:input type="text" class="form-control" id="inputCallStatus" path="call_status" placeholder="Call Status" />
                                                <label for="inputCallStatus">Call Status</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-floating">
                                                <form:textarea path="calldesc" class="form-control" id="phoneconversationdetail" required="true" style="height:6rem;"></form:textarea> 
                                                    <label for="phoneconversationdetail">Phone Conversation Details&nbsp;<span class="fw-bold blink">*</span></label>
                                                </div> 
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="filename2">Select Voice/Audio File<span class="text-danger blink fw-bold">*</span></label>
                                            <input type="file" onchange="validateMp3FileType(this)" class="form-control" name="ldoc" id="filename2"/>
                                        </div>

                                        <div class="col-md-12 mb-3">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" name="inputDateType" checked type="radio" id="autodate" value="1">
                                                <label class="form-check-label" for="autodate">Auto Date</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" name="inputDateType" type="radio" id="customdate" value="2">
                                                <label class="form-check-label" for="customdate">Custom Date</label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-3 d-none" id="dateContainer">
                                            <label for="inputIncidentCaseDate">Select Date<span class="text-danger blink">*</span></label>
                                            <input type="date" class="form-control" name="calldate" id="inputIncidentCaseDate" placeholder="Case Date" onclick="getMaxCurrentDate();"/>
                                        </div>

                                        <div class="row">
                                            <div class="col text-center">
                                                <button type="submit" class="btn btn-purple text-white"><i class="fa-solid fa-floppy-disk"></i>&nbsp;&nbsp;Save Call Log</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </form:form>
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
                                                $(document).ready(function () {
                                                    var ct = $('#callerType').val();
                                                    $('#calleragencytype').click(function () {
                                                        $('#radioBasedDiv').removeClass('d-none');
                                                        $('#agencyBlock').show();
                                                        $('#casualtyBlock').hide();
                                                    });
                                                    $('#casualtytype').click(function () {
                                                        $('#radioBasedDiv').removeClass('d-none');
                                                        $('#agencyBlock').hide();
                                                        $('#casualtyBlock').show();
                                                    });
                                                    if (ct === 'Casualty_type') {
                                                        $('#radioBasedDiv').removeClass('d-none');
                                                        $('#agencyBlock').hide();
                                                        $('#casualtyBlock').show();
                                                    } else {
                                                        $('#radioBasedDiv').removeClass('d-none');
                                                        $('#agencyBlock').show();
                                                        $('#casualtyBlock').hide();
                                                    }


                                                    $('#selectAgency').change(function () {
                                                        $('#agencyTableListBody').html('');
                                                        $('#agencyTableBody').html('');
                                                        $('#agencyname').val('');
                                                        var agencyid = $('#selectAgency').val();
                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './getmasteragency.htm',
                                                                    data: 'agencyid=' + agencyid,
                                                                    method: 'GET'
                                                                }).done(function (response) {
                                                                    var res = JSON.parse(response);
                                                                    if (res.length !== 0) {
                                                                        var tb = '';
                                                                        for (var i = 0; i < res.length; i++) {
                                                                            tb += '<tr class="tbhover" onclick="getContactAgencyDetails(&quot;' + res[i].magencydetailid + '&quot;,&quot;' + res[i].agencyname + '&quot;)">'
                                                                                    + '<td>' + parseInt(i + 1) + '</td>'
                                                                                    + '<td>' + res[i].agencyname + '</td>'
                                                                                    + '<td>' + res[i].address + '</td>'
                                                                                    + '<td>' + res[i].district.districtname + '</td>'
                                                                                    + '</tr>';
                                                                        }
                                                                        $('#agencyTableBody').html(tb);
                                                                    }
                                                                    self.close();
                                                                }).fail(function () {
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            }
                                                        });
                                                    });

                                                    $('input[type="radio"]').click(function () {
                                                        if ($(this).attr('id') === 'autodate') {
                                                            $('#dateContainer').addClass('d-none');
                                                            $('#inputIncidentCaseDate').removeAttr('required');
                                                        } else if ($(this).attr('id') === 'customdate') {
                                                            $('#dateContainer').removeClass('d-none');
                                                            $('#inputIncidentCaseDate').attr('required', true);
                                                        }
                                                    });

                                                    $("#pcrscreen").submit(function (e) {
                                                        e.preventDefault();
                                                        var agencytype = $('#selectAgency').val();
                                                        var agencyname = $('#agencyname').val();

                                                        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                        var csrfToken = $("meta[name='_csrf']").attr("content");
                                                        //                    if(agencytype=="" || agencyname==""){
                                                        //                        alert("here")
                                                        //                        document.getElementById("directory").focus();
                                                        //                        $('#txtdir').html("Select Directory !");
                                                        //                        return 1;
                                                        //                    }else{

                                                        var callertype;
                                                        if ($('#calleragencytype').is(':checked')) {
                                                            callertype = "Agency_type";
                                                        } else {
                                                            callertype = "Casualty_type";
                                                        }
                                                        var formData = new FormData($(this)[0]);
                                                        console.log(formData);

                                                        $.confirm({
                                                            content: function () {
                                                                var self = this;
                                                                return $.ajax({
                                                                    url: './saveeditcalllog.htm',
                                                                    method: 'POST',
                                                                    data: formData,
                                                                    contentType: false,
                                                                    processData: false,
                                                                    beforeSend: function (xhr) {
                                                                        xhr.setRequestHeader(csrfHeader, csrfToken);
                                                                    }
                                                                }).done(function (response) {
                                                                    if (response !== "0")
                                                                    {
                                                                        alert("Successfully Saved");
                                                                        location.reload();
                                                                    } else {
                                                                        alert("Save Fail")
                                                                    }
                                                                }).fail(function () {
                                                                    self.setTitle('');
                                                                    self.setContent('Something went wrong.');
                                                                });
                                                            },
                                                            buttons: {
                                                                close: {
                                                                    action: function () {
                                                                        if (ck === 0) {
                                                                            window.location.reload();
                                                                        } else {
                                                                            $('#woFollowupModal').modal('show');
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    });
                                                });
                                                function getContactAgencyDetails(aid, aname) {
                                                    $('#agencyTableListBody').html('');
                                                    $('#agencyname').val(aname);
                                                    $('#magencydetailid').val(aid.trim());
                                                    $.confirm({
                                                        content: function () {
                                                            var self = this;
                                                            return $.ajax({
                                                                url: './getContactAgencyList.htm',
                                                                data: 'magencyid=' + aid,
                                                                method: 'GET'
                                                            }).done(function (response) {
                                                                var res = JSON.parse(response);
//                                                                console.log(res);
                                                                var cont = '';
                                                                for (var i = 0; i < res.length; i++) {
                                                                    cont += '<tr class="tbhover" onclick="setContactAgency(&quot;' + res[i].cagencydetailid + '&quot;)">'
                                                                            + '<td>' + parseInt(i + 1) + '</td>'
                                                                            + '<td>' + res[i].person_name + '</td>'
                                                                            + '<td>' + res[i].designation + '</td>'
                                                                            + '<td>' + res[i].mobile1 + '</td>'
                                                                            + '<td>' + res[i].officephone1 + '</td>'
                                                                            + '<td>' + res[i].mobile2 + '</td>'
                                                                            + '<td>' + res[i].officephone2 + '</td>'
                                                                            + '</tr>';
                                                                }
                                                                $('#agencyTableListBody').html(cont);
                                                                self.close();
                                                            }).fail(function () {
                                                                self.setContent('Something went wrong.');
                                                            });
                                                        }
                                                    });
                                                }

                                                function gotoCaseManagement() {
                                                    var cn = $('#inputCaseNoRO').val();
                                                    window.location.href = "casemanagement.htm?icaseno=" + cn;
                                                }

//                                                function checkFileSize() {
//                                                    var fileInput = document.getElementById('filename2');
//                                                    if (fileInput.files[0].size > (5000000)) {
//                                                        alert('File Size exceeded. Limit is 5 MB');
//                                                        fileInput.value = '';
//                                                        return false;
//                                                    }
//                                                }

                                                function validateMp3FileType(inputFile) {
//                                                    var allowedExtensions = /(\.mp3)$/i;
//                                                    if (!allowedExtensions.exec(inputFile.value)) {
//                                                        alert('Invalid file type. Only MP3 files are allowed.');
//                                                        inputFile.value = '';
//                                                        return false;
//                                                    }
                                                    return true;
                                                }

                                                function getMaxCurrentDate() {
                                                    var casedate = document.getElementById('inputIncidentCaseDate');
                                                    var maxDate = new Date();
                                                    maxDate.setFullYear(maxDate.getFullYear());
                                                    casedate.setAttribute("max", maxDate.toISOString().split('T')[0]);
                                                    casedate.removeAttribute("min");
                                                }
        </script>
    </body>
</html>
