<%-- 
    Document   : nostampcert
    Created on : 18 Oct, 2023, 4:58:33 PM
    Author     : HP
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Digital Signature | DRMS</title>
        <script src="resources/js/jquery.js"></script>
        <link href="jojo/bootstrap-5.2.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="jojo/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <!--<script src="resources/js/bootstrap.min.js"></script>-->
        <script src="resources/js/dsc-signer.js" type="text/javascript"></script>
        <script src="resources/js/dscapi-conf.js" type="text/javascript"></script>
        <!--<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css">-->
        <link type="text/css" rel="stylesheet" href="resources/css/dsc-signer.css">
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                padding: 20px;
            }
            .card {
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 2px 2px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }
            .card-header {
                background-color: #007BFF;
                color: #fff;
                padding: 10px;
            }
            .card-body {
                padding: 20px;
            }
            h5.card-title {
                font-size: 18px;
                margin-bottom: 10px;
            }
            p.card-text {
                font-size: 16px;
            }
            .checkbox-label {
                display: flex;
                align-items: center;
                margin-top: 10px;
            }
            .checkbox-input {
                margin-right: 10px;
            }
            .btn-success {
                background-color: #28a745;
                color: #fff;
            }
            .btn-success:hover {
                background-color: #218838;
            }
            .btn-danger {
                background-color: #dc3545;
                color: #fff;
            }
            .btn-danger:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="d-flex justify-content-center mt-4">
            <h1>Digital Signature</h1>
        </div>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Terms &amp; Conditions</h4>
                        </div>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae tempus quam pellentesque nec. Aenean vel elit scelerisque mauris pellentesque. Sed cras ornare arcu dui vivamus arcu. Ac tortor vitae purus faucibus ornare. Vel fringilla est ullamcorper eget nulla facilisi etiam. Platea dictumst vestibulum rhoncus est. In egestas erat imperdiet sed euismod nisi porta lorem. Egestas sed sed risus pretium quam vulputate dignissim suspendisse. In pellentesque massa placerat duis ultricies lacus sed turpis.<br><br>
                                Integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque. Dolor sed viverra ipsum nunc aliquet. Adipiscing elit pellentesque habitant morbi tristique senectus et. Integer enim neque volutpat ac. Et odio pellentesque diam volutpat commodo sed egestas. Velit scelerisque in dictum non consectetur a erat. Porttitor leo a diam sollicitudin tempor id eu nisl. Porta non pulvinar neque laoreet suspendisse interdum. Ultricies mi eget mauris pharetra et. Proin nibh nisl condimentum id venenatis. Hac habitasse platea dictumst quisque sagittis. In est ante in nibh mauris cursus mattis molestie a. Consectetur libero id faucibus nisl tincidunt eget nullam non. Mi eget mauris pharetra et ultrices neque ornare.<br><br>
                                Eu facilisis sed odio morbi quis. Ultrices sagittis orci a scelerisque. Pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper. Id neque aliquam vestibulum morbi blandit. Cursus risus at ultrices mi tempus imperdiet. Turpis cursus in hac habitasse. Bibendum arcu vitae elementum curabitur vitae nunc sed. At erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Nec feugiat nisl pretium fusce id velit ut tortor pretium. Neque aliquam vestibulum morbi blandit cursus.<br><br>
                            </p>
                            <label class="checkbox-label">
                                <input type="checkbox" class="checkbox-input" id="agreeCheckbox">
                                <b>I agree to the terms and conditions mentioned.</b>
                            </label>
                        </div>
                    </div>
                    <div class="well-sm">
                        <form id="pdfForm">
                            <div class="d-none">
                                <label for="data">Choose Local File : </label><br /> <input
                                    type="file" name="pdfFile" id="pdfFile" accept="application/pdf" />
                                <label for="pdfData">Pdf Data(Base64)):</label> <br />
                                <!--                                        <textarea id="pdfData"
                                                                        placeholder="Choose pdf file above to show pdf data..."
                                                                        cols="60" rows="4" readonly="readonly"></textarea>-->
                                <input value="${base64}" id="pdfData"
                                       placeholder="Choose pdf file above to show pdf data..."
                                       cols="60" rows="4" readonly="readonly"/>
                                <br /> <label for="cert" id="labelCert" class="d-none">Certificate for Signing:</label><br />
                                <textarea
                                    placeholder="Paste the Base64 encoded certificate from registration here..."
                                    id="cert" cols="60" rows="4" required class="d-none"></textarea>
                                <br /> Reason : <input type="text" id="signingReason"
                                                       name="signingReason" maxlength="20" /> <br />Location : <input
                                                       type="text" id="signingLocation" name="signingLocation"
                                                       maxlength="20" /> <br /> stampingX : <input type="text"
                                                       id="stampingX" name="stampingX" maxlength="20" value="200" /> <br />stampingY
                                : <input type="text" id="stampingY" name="stampingY" maxlength="20"
                                         value="200" /><br />Select TSA URL : <select name="tsaurls"
                                         id="tsaurls" onchange="myFunction()">
                                    <option value="0">--------------------------SELECT---------------------------------</option>
                                    <option
                                        value="http://sha256timestamp.ws.symantec.com/sha256/timestamp">
                                        http://sha256timestamp.ws.symantec.com/sha256/timestamp</option>
                                    <option value="http://timestamp.comodoca.com/rfc3161">http://timestamp.comodoca.com/rfc3161</option>
                                    <option value="http://tsa.startssl.com/rfc3161">http://tsa.startssl.com/rfc3161</option>
                                    <option value="http://timestamp.digicert.com">http://timestamp.digicert.com</option>
                                    <option value="http://tsa.safecreative.org">http://tsa.safecreative.org</option>
                                </select> <br /> TSA URL (Optional) : <input type="text" id="tsaURL"
                                                                             name="tsaURL" value="" maxlength="100" style="width: 400px;" /> <br />Time
                                Server URL (Optional) : <input type="text" id="timeServerURL"
                                                               name="timeServerURL"
                                                               value="http://localhost:8080/dscapi/getServerTime" maxlength="100"
                                                               style="width: 400px;" /><br /> <span style="color: red;">If
                                    the time server URL is not provided, the client time will be used
                                    for signing.</span> <br />
                            </div>
                            <input id="signPdf" type="button" value=" Sign Pdf " class="btn btn-success"> 
                            <input id="submitPdf" type="Submit" style="display: none;"> 
                            <a id="downloadDiv" href='#' type="application/pdf" download="SignedPdf.pdf"></a> 
                            <input id="btnDecryptVerify" type="button" value=" Decrypt Verify " class="btn btn-danger" />
                            <input id="btnDecryptVerifyWithCrt" type="button" value=" Verify " class="btn btn-danger" onclick="savesignedpdf_drms();"/>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4 d-none">
                    <div class="well-sm">
                        <label for="signedPdfData">Signed Pdf Data(Base64):</label> <br />
                        <textarea placeholder="After signing, the encrypted signature will be shown here..."
                                  id="signedPdfData" cols="60" rows="8" disabled>
                        </textarea>
                        <br /> <label>Encryption Key:</label>
                        <textarea 
                            placeholder="The random key used for encrypting the signature will be shown here..."
                            id="lblEncryptedKey" cols="60" rows="4" disabled></textarea>
                        <br /> <label>Verification Response:</label>
                        <textarea 
                            placeholder="The signature verification result from DSCAPI server will be shown here..."
                            id="verificationResponse" cols="60" rows="8" disabled></textarea>
                    </div>
                </div>
            </div>
        </div>

        <div id="panel"></div>
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
                $('#cert').hide();
                $('#labelCert').hide();

                var signingReason = "test";
                var signingLocation = "test";

                $('#signingReason').val(signingReason);
                $('#signingLocation').val(signingLocation);


                var token_cert = "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"
                $('#cert').html(token_cert);
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
