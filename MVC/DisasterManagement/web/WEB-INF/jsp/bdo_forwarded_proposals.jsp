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
            tr {
                cursor: pointer;
                transition: background-color 0.3s;
            }

            /* Define the hover effect for table rows */
            tr:hover {
                background-color: #f5f5f5; /* Change the background color when hovering */
            }

            /* Define the click effect for table rows */
            tr.clicked {
                background-color: #dcdcdc; /* Change the background color when clicked */
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
                        <c:choose>
                            <c:when test="${(LOGIN.role_code.role_code != '4')}">
                                <h1 class="mt-4 mb-4">Received Proposals</h1>
                            </c:when>
                            <c:otherwise>
                                <h1 class="mt-4 mb-4">Forwarded Proposals</h1>
                            </c:otherwise>
                        </c:choose>
                        <!--Page Content Start-->
                        <input type="text" id="inputBlockcode" value="<c:out escapeXml="true" value="${LOGIN.blockcode.blockcode}" />" class="form-control d-none" readonly="true" />
                        <div class="card">
                            <!--                            <div class="card-header">
                                                            <h5 class="text-center"></h5>
                                                        </div>-->
                            <div class="card-body">
                                <div id="tableContainer" class="mt-4">
                                    <table id="reportTable" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Sl No.</th>
                                                <th>Fir Number</th>
                                                <th>Calamity</th>
                                                <th>Type of Assistance</th>
                                                <th>Date of Incidence</th>
                                                <th>District</th>
                                                <th>Block</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <c:forEach varStatus="i" items="${exlist}" var="p">
                                                <tr>
                                                    <td><c:out escapeXml="true" value="${i.count}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[0]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[1]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[2]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[3]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[4]}" /></td>
                                                    <td><c:out escapeXml="true" value="${p[5]}" /></td>
                                                    <td>
                                                        <button class="btn btn-secondary btn-sm btn-block mb-1 p-1" onclick="viewReport(
                                                                        '<c:out escapeXml="true" value="${p[0]}" />',
                                                                        '<c:out escapeXml="true" value="${p[3]}" />',
                                                                        '<c:out escapeXml="true" value="${p[6]}" />'
                                                                        )">&nbsp;Statement Of Proposal&nbsp;</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--<input type="submit" id="forwardButton" class="btn btn-success float-end mt-4" value="Forward Proposal to Revenue Dept" onclick="forwardReport()"/>-->
                                </div>
                            </div>
                        </div>
                        <!--Page Content End-->
                        <div class="modal fade" id="dSignModal" tabindex="-1" aria-labelledby="dSignModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content">
                                    <div class="modal-header bg-danger">
                                        <h5 class="modal-title fw-bold text-white" id="dSignModalLabel">Digital Sign</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container" id="modal-content">
                                            <div class="col-md-12">
                                                <form id="pdfForm">
                                                    <label for="data">Choose Local File : </label><br /> 
                                                    <input type="file" name="pdfFile" id="pdfFile" accept="application/pdf" />
                                                    <label for="pdfData">Pdf Data(Base64)):</label> <br />
                                                    <textarea id="pdfData" placeholder="Choose pdf file above to show pdf data..." class=""
                                                              cols="60" rows="4" readonly="readonly"></textarea>
                                                    <br /> 
                                                    <label for="cert">Certificate for Signing:</label><br />
                                                    <textarea placeholder="Paste the Base64 encoded certificate from registration here..." class="" id="cert" cols="60" rows="4" required></textarea>
                                                    <br /> 
                                                    Reason : <input type="text" id="signingReason" name="signingReason" maxlength="20" /> <br />
                                                    Location : <input type="text" id="signingLocation" name="signingLocation" maxlength="20" /> <br />
                                                    stampingX : <input type="text" id="stampingX" name="stampingX" maxlength="20" value="200" /> <br />
                                                    stampingY : <input type="text" id="stampingY" name="stampingY" maxlength="20" value="200" /><br />
                                                    <!--                                                    Select TSA URL : -->
                                                    <!--<select name="tsaurls"
                                                             id="tsaurls" onchange="myFunction()">
                                                        <option value="0">--------------------------SELECT---------------------------------</option>
                                                        <option
                                                            value="http://sha256timestamp.ws.symantec.com/sha256/timestamp">
                                                            http://sha256timestamp.ws.symantec.com/sha256/timestamp</option>
                                                        <option value="http://timestamp.comodoca.com/rfc3161">http://timestamp.comodoca.com/rfc3161</option>
                                                        <option value="http://tsa.startssl.com/rfc3161">http://tsa.startssl.com/rfc3161</option>
                                                        <option value="http://timestamp.digicert.com">http://timestamp.digicert.com</option>
                                                        <option value="http://tsa.safecreative.org">http://tsa.safecreative.org</option>
                                                    </select> <br />--> 
                                                    <!--                                                    TSA URL (Optional) : <input type="text" id="tsaURL"
                                                                                                                                                     name="tsaURL" value="" maxlength="100" style="width: 400px;" /> <br />Time
                                                                                                        Server URL (Optional) : <input type="text" id="timeServerURL"
                                                                                                                                       name="timeServerURL"
                                                                                                                                       value="http://localhost:8080/dscapi/getServerTime" maxlength="100"
                                                                                                                                       style="width: 400px;" /><br /> <span style="color: red;">If
                                                                                                            the time server URL is not provided, the client time will be used
                                                                                                            for signing.</span> <br /> -->
                                                    <input id="signPdf" type="button" value=" Sign Pdf " class="btn btn-success"> 
                                                    <input id="submitPdf" type="Submit" style="display: none;"> 
                                                    <a id="downloadDiv" href='#' type="application/pdf" download="SignedPdf.pdf"></a> 
                                                    <input id="btnDecryptVerify" type="button" value=" Decrypt Verify " class="btn btn-danger" />
                                                    <input id="btnDecryptVerifyWithCrt" type="button" value=" Decrypt & Verify " class="btn btn-danger" />
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <%@include file="auth_footer_content.jsp" %>

            </div>
        </div>
        <%@include file="auth_footer_import.jsp" %>
        <script src="jojo/DataTables/datatables.min.js" type="text/javascript"></script>
        <script src="jojo/js/pdfobject.min.js" type="text/javascript"></script>
        <script src="jojo/js/dsign/dsc-signer.js" type="text/javascript"></script>
        <script src="jojo/js/dsign/dscapi-conf.js" type="text/javascript"></script>

        <script>
                                                            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                                                            var csrfToken = $("meta[name='_csrf']").attr("content");
                                                            var reportid;
                                                            $(document).ready(function () {
                                                                $('#reportTable').DataTable();
//                                                                $('#btnDecryptVerify').hide();
                                                                var rows = document.querySelectorAll("tr");
                                                                for (var i = 0; i < rows.length; i++) {
                                                                    rows[i].addEventListener("click", function () {
                                                                        // Toggle the "clicked" class for the clicked row
                                                                        this.classList.toggle("clicked");
                                                                    });
                                                                }
                                                            });

                                                            function viewReport(fir_no, dateofincidence, reportid) {
                                                                console.log("fir_no:: " + fir_no + "dateofincidence:: " + dateofincidence + "reportid:: " + reportid);
                                                                var url = "viewproposal.htm?fir_no=" + fir_no + "&dateofincidence=" + dateofincidence + "&reportid=" + reportid;
                                                                window.open(url, '_blank');
                                                            }

                                                            function mysign() {
                                                                // Make an AJAX request to preview for D-sign
                                                                $.ajax({
                                                                    url: './getdocumenttypesforbeneficiary.htm',
                                                                    method: 'GET',
                                                                    data: {norm_code: normCode},
                                                                    success: function (data) {
                                                                        console.log(data);
                                                                    }
                                                                });
                                                            }



        </script>
        <script type="text/javascript">
            function myFunction() {
                var x = document.getElementById("tsaurls").value;
                if (x != 0) {
                    document.getElementById("tsaURL").value = x;
                } else {
                    document.getElementById("tsaURL").value = "";
                }
            }
            $(document).ready(function () {

                $('#btnDecryptVerify').hide();
                $('#btnDecryptVerifyWithCrt').hide();

                var initConfig = {
                    "preSignCallback": function () {
                        // do something 
                        // based on the return sign will be invoked
                        return true;
                    },
                    "postSignCallback": function (alias, sign, key) {
                        $('#signedPdfData').val(sign);
                        $('#lblEncryptedKey').val(key);

                        //									$('#btnDecryptVerify').show();
                        $('#btnDecryptVerifyWithCrt').show();

                    },
                    signType: 'pdf',
                    mode: 'nostampingv2',
                    certificateData: $('#cert').val()
                            //"certificateSno" : 13705892,
                };
                dscSigner.configure(initConfig);

                $('#cert').bind('input propertychange', function () {
                    var initConfig = {
                        "preSignCallback": function () {
                            // do something before signing
                            alert("Pre-sign event fired");
                            return true;
                        },
                        "postSignCallback": function (alias, sign, key) {
                            //do something after signing
                            $('#signedPdfData').val(sign);
                            $('#lblEncryptedKey').val(key);

                            //											$('#btnDecryptVerify').show();
                            $('#btnDecryptVerifyWithCrt').show();

                        },
                        signType: 'pdf',
                        mode: 'nostampingv2',
                        certificateData: $('#cert').val()
                                //Set the cerificate serial number to skip certificate selection
                                //"certificateSno" : 13705892,
                    };
                    dscSigner.configure(initConfig);
                });

                $('#signPdf').click(function () {
                    var data = $("#pdfData").val();

                    if (data != null || data != '') {
                        dscSigner.sign(data);
                    }
                });

                $('#btnDecryptVerify').click(function () {

                    var sign = $('#signedPdfData').val();
                    var key = $('#lblEncryptedKey').val();

                    // Implement Decrypt Verify here
                    var requestData = {
                        action: "DECRYPT_VERIFY",
                        en_sig: sign,
                        ek: key
                    };

                    $.ajax({
                        url: dscapibaseurl + "/pdfsignature",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify(requestData),
                        async: false
                    }).done(function (data) {
                        if (data.status_cd == 1) {
                            var jsonData = JSON.parse(atob(data.data));
                            $('#decryptedSignature').val(jsonData.sig);
                            $('#decodedSignedXML').val(atob(jsonData.sig));
                            $('#verifiedSignature').val(atob(data.data));
                            $('#verificationResponse').val(atob(data.data));

                            //Set Class to download link
                            $('#downloadDiv').addClass('btn btn-info');
                            //get pdf data
                            var pdfData = jsonData.sig;
                            var dlnk = document.getElementById('downloadDiv');
                            dlnk.href = 'data:application/pdf;base64,' + pdfData;
                            $("#downloadDiv").text("Download Signed PDF File");

                            $('#btnDecryptVerify').hide();
                            $('#btnDecryptVerifyWithCrt').hide();
                        } else {
                            alert("Verification Failed");
                        }

                    }).fail(function (jqXHR, textStatus, errorThrown) {
                        alert(textStatus);
                    });
                });

                $('#btnDecryptVerifyWithCrt').click(function () {

                    $('#verificationResponse').val('');

                    var sign = $('#signedPdfData').val();
                    var key = $('#lblEncryptedKey').val();

                    // Implement Verify here
                    var requestData = {
                        action: "DECRYPT_VERIFY_WITH_CERT",
                        en_sig: sign,
                        ek: key,
                        certificate: $('#cert').val()
                    };
                    $.ajax({
                        url: dscapibaseurl + "/pdfsignature",
                        type: "post",
                        dataType: "json",
                        contentType: 'application/json',
                        data: JSON.stringify(requestData),
                        async: false,
                        headers: {
                            "accept": "application/json",
                            "Access-Control-Allow-Origin": "*"
                        }
                    }).done(function (data) {
                        if (data.status_cd == 1) {
                            var jsonData = JSON.parse(atob(data.data));
                            $('#decryptedSignature').val(jsonData.sig);
                            $('#decodedSignedXML').val(atob(jsonData.sig));
                            $('#verifiedSignature').val(atob(data.data));
                            $('#verificationResponse').val(atob(data.data));

                            //Set Class to download link
                            $('#downloadDiv').addClass('btn btn-info');
                            //get pdf data
                            var pdfData = jsonData.sig;
                            var dlnk = document.getElementById('downloadDiv');
                            dlnk.href = 'data:application/pdf;base64,' + pdfData;
                            $("#downloadDiv").text("Download Signed PDF File");

                            //										$('#btnDecryptVerify').hide();
                            //										$('#btnDecryptVerifyWithCrt').hide();
                        } else {
                            $('#verificationResponse').val(JSON.stringify(data));
                            alert("Verification Failed");
                        }

                    }).fail(function (jqXHR, textStatus, errorThrown) {
                        alert(textStatus);
                    });
                });

                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            var data = e.target.result;
                            var base64 = data.replace(/^[^,]*,/, '');
                            $("#pdfData").val(base64);
                        }

                        reader.readAsDataURL(input.files[0]);
                    }
                }

                $("#pdfFile").change(function () {
                    readURL(this);
                });

            });
        </script>
    </body>
</html>
