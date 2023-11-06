<%-- 
    Document   : coordinatordesk
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
        <sec:csrfMetaTags />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Security-Policy" content="default-src * 'data'; img-src: *; style-src 'self' 'unsafe-inline' https://* http://*; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://* http://*" />
        <title>Coordinator Desk</title>
        <link href="suantonsing/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/fontawesome-6.1.0/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="suantonsing/DataTables/datatables.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .btn-digit {
                font-size: 1.3rem;
            }
            .btn-digit-sub {
                font-size: 0.8rem;
                color: #fefefe;
            }
            .fake-btn {
                cursor: pointer;
            }
            .card-zoom:hover {
                background-color: #902e2e57;
            }
        </style>
    </head>
    <body>
        <%@include file="nav_top.jsp" %>
        <div id="layoutSidenav">
            <c:import url="/nav_side.htm" />
            <div id="layoutSidenav_content">
                <main>
                    <%@include file="banner.jsp" %>
                    <div class="container px-5">
                        <div class="card">
                            <div class="card-header bg-purple"><h4 class="text-white text-center fw-bold font-size-lg">Coordinator Desk</h4></div>
                            <div class="card-body">
                                <div class="row d-flex flex-row justify-content-around">
                                    <div class="col-sm-6">
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="get181cases()">181 Desk</button>
                                        <button type="button" class="btn btn-pink-outline w-100 mb-2 fw-bold" data-bs-toggle="modal" data-bs-target="#generalCaseClassificationModal">General Case Classification</button>
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="getpolicecases()">Police Coordinator Desk</button>
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="getemergencycases()">Emergency Coordinator Desk</button>
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="getintegratedcases()">Integrated Agencies Desk</button>
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="getnonintegratedcases()">Non-Integrated Agencies Desk</button>
                                        <button class="btn btn-pink-outline w-100 mb-2 fw-bold" onclick="callbackdesk()">Call Back Desk</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="px-3">
                                            <div class="bg-light mb-2 p-2 text-center">
                                                Make General Phone calls (Not related with any case)
                                            </div>
                                            <div class="dialpad-display">
                                                <input type="text" id="usercode" value="<c:out escapeXml="true" value="${LOGIN.usercode}" />" class="form-control" readonly="true" />
                                                <input type="text" class="form-control" placeholder="Enter Number To Call" id="phoneInput" />
                                            </div>
                                            <div class="dialpad-buttons mt-2">
                                                <div class="d-flex flex-row justify-content-around">
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('1')">1</button>
                                                    <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('2')">2</button>
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('3')">3</button>
                                                </div>
                                                <div class="d-flex flex-row justify-content-around">
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('4')">4</button>
                                                    <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('5')">5</button>
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('6')">6</button>
                                                </div>
                                                <div class="d-flex flex-row justify-content-around">
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('7')">7</button>
                                                    <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('8')">8</button>
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('9')">9</button>
                                                </div>
                                                <div class="d-flex flex-row justify-content-around">
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('*')">*</button>
                                                    <button class="btn btn-purple w-100 mx-2 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('0')">0</button>
                                                    <button class="btn btn-purple w-100 mb-2 text-white fw-bold btn-digit" onclick="adddialednumber('#')">#</button>
                                                </div>

                                                <div class="d-flex flex-row justify-content-between">
                                                    <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-75 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit" disabled="true">
                                                        <div class="d-flex flex-row justify-content-center align-items-center">
                                                            <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                            <strong class="fw-bold ml-5">Call</strong>
                                                        </div>
                                                    </button>
                                                    <button id="terminateCallBtn" type="button" onclick="terminateCall();" class="d-none w-75 h-100 btn btn-danger mr-1 mb-2 text-white fw-bold btn-digit">
                                                        <div class="d-flex flex-row justify-content-center align-items-center">
                                                            <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                            <strong class="fw-bold ml-5">Hangup</strong>
                                                        </div>
                                                    </button>
                                                    <button class="btn btn-default w-30 ml-auto mb-2 text-purple-hov fw-bold btn-digit" onclick="removenumtodial()"><i class="fa-solid fa-delete-left"></i></button>
                                                </div>

                                                <div class="d-flex flex-row justify-content-between h-100">
                                                    <div class="call-display-timer text-dark w-100">
                                                        <div class="d-flex flex-column text-center justify-content-center align-items-center">
                                                            <p class="fw-bold mb-1" id="softphone-timer">00:00</p>
                                                            <div id="recordingIconContainer" class="blink d-none d-flex flex-column text-center justify-content-center align-items-center">
                                                                <i class="fa-solid fa-microphone" id="softphone-recorder"></i>
                                                                <small class="btn-digit-sub fw-normal text-dark" id="softphone-status">Recording</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--                                                    <button id="makeCallBtn" type="button" onclick="makeCallTo();" class="d-block w-100 h-100 btn btn-success mr-1 mb-2 text-white fw-bold btn-digit">
                                                                                                            <div class="d-flex flex-row justify-content-around align-items-center">
                                                                                                                <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                                                                <strong class="fw-bold ml-5">Call</strong>
                                                                                                            </div>
                                                                                                        </button>
                                                                                                        <button id="terminateCallBtn" type="button" onclick="terminateCall();" class="d-none w-100 h-100 btn btn-danger mr-1 mb-2 text-white fw-bold btn-digit">
                                                                                                            <div class="d-flex flex-row justify-content-around align-items-center">
                                                                                                                <i class="fa-solid fa-phone"></i>&nbsp;&nbsp;
                                                                                                                <strong class="fw-bold ml-5">Hangup</strong>
                                                                                                            </div>
                                                                                                        </button>-->
                                                    <!--<button type="button" class="btn btn-primary ml-1 mb-2 text-white fw-bold btn-digit">-->
                                                    <!--<div class="d-flex flex-column">-->
                                                    <!--<i class="fa-solid fa-right-left"></i>-->
                                                    <!--<small class="btn-digit-sub fw-normal">Transfer</small>-->
                                                    <!--</div>-->
                                                    <!--</button>-->

                                                    <div class="container">
                                                        <div id="controls d-flex align-items-center justify-content-center bg-primary">
                                                            <!--<img id="record" src="suantonsing/assets/mic128.png" onclick="toggleRecording(this);">-->
                                                            <a id="save" href="#"><img src="suantonsing/assets/save.svg" style="width:40px; height:40px" /></a>
                                                            <input hidden="true" type="file" id="audiofile" name="callrecording" accept="audio/*" /> 
                                                        </div>
                                                    </div>
                                                </div>
                                                <audio id="remoteAudio"></audio>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--General Case Classification Modal Start-->
                        <div class="modal fade" id="generalCaseClassificationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="generalCaseClassificationLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="generalCaseClassificationLabel">General Case Classification</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <!--                                                <div class="col">
                                                                                                    <table class="table table-bordered table-striped table-hover">
                                                                                                        <thead>
                                                                                                            <tr>
                                                                                                                <th>ID</th>
                                                                                                                <th>Crime Type</th>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <tbody>
                                                <%--<c:forEach var="st" items="${naturecasetypelist}">--%>
                                                    <tr class="tableactiverow rowclick fake-btn">
                                                        <td><c:out value="${st.natureofcasetypeid}" /></td>
                                                        <td><c:out value="${st.crimetype}" /></td>
                                                    </tr>
                                                <%--</c:forEach>--%>
                                            </tbody>
                                        </table>
                                    </div>-->
                                                <div class="col" id="crimedetail">
                                                    <table class="table table-bordered table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Sl No</th>
                                                                <th>Name</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="st" items="${naturecasetypelist}">
                                                                <tr class="rowclick fake-btn" onclick="get181natureofcases('<c:out escapeXml="true" value="${st.natureofcasetypeid}"/>');">
                                                                    <td><c:out value="${st.natureofcasetypeid}" /></td>
                                                                    <td><c:out value="${st.crimetype}" /></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <!--<button type="button" class="btn btn-primary">Understood</button>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--General Case Classification Modal End-->

                        <!-- Modal for coordinator's Functions -->
                        <div class="modal fade" id="coordinatorModal" tabindex="-1" aria-labelledby="coordinatorModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content">
                                    <div class="modal-header bg-purple-hov">
                                        <h5 class="modal-title fw-bold text-white" id="coordinatorModalLabel">Modal title</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container" id="modal-content">
                                            <!--Dynamic Area Start-->
                                            <!--Dynamic Area End-->
                                        </div>
                                    </div>
                                    <div class="modal-footer" id="modal-footer-content">
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal for coordinator's Functions -->
                        <div class="modal fade" id="coordinatorModalSecond" tabindex="-1" aria-labelledby="coordinatorModalSecondLabel" aria-hidden="true">
                            <div class="modal-dialog modal-fullscreen">
                                <div class="modal-content">
                                    <div class="modal-header bg-purple-hov">
                                        <h5 class="modal-title fw-bold text-white" id="coordinatorModalSecondLabel">Modal title Second</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="" id="modal-content-too">
                                            <!--Dynamic Area Start-->
                                            <!--Dynamic Area End-->
                                        </div>
                                    </div>
                                    <div class="modal-footer" id="modal-footer-content-too">
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/popper.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/bootstrap.bundle.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/scripts.js" type="text/javascript"></script>
            <script src="suantonsing/DataTables/datatables.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/sha256.js" type="text/javascript"></script>
            <script src="suantonsing/fontawesome-6.1.0/js/all.min.js" type="text/javascript"></script>
            <script src="suantonsing/js/coordinator_scripts.js" type="text/javascript"></script>
            <script src="js/jssip-3.9.0.js" type="text/javascript"></script>
            <script src="js/recorder/recorder.js" type="text/javascript"></script>
            <script src="js/sipclients.js" type="text/javascript"></script>
            <script>
                                                                    $(document).ready(function () {
                                                                        $('#phoneInput').on('change', function () {
                                                                            var phn = $(this).val();
                                                                            if (phn.length > 1) {
                                                                                $('#makeCallBtn').removeAttr('disabled');
//                                                                        $("#callBackFormContainer").removeClass('d-none');
                                                                            } else {
                                                                                $('#makeCallBtn').attr('disabled', 'disabled');
//                                                                        $("#callBackFormContainer").addClass('d-none');
                                                                            }
                                                                        });
                                                                    });
            </script>
    </body>
</html>
