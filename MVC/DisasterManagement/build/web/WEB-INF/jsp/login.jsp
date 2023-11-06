<%-- 
    Document   : login
    Created on : 8 Nov, 2022, 11:49:24 AM
    Author     : joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenue &AMP; Disaster Management Department | Login</title>
        <link href="jojo/bootstrap-5.2.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/fontawesome-free-6.4.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/css/jojo_style.css" rel="stylesheet" type="text/css"/>
        <style>
            .login-form-logo {
                height: 70px;
                width: auto;
                margin-right: 15px;
            }

            .layoutAuthentication_content {
                /*add bg img here*/
                background-image: url("jojo/assets/BG2.jpg");
                background-size: cover;
                background-repeat: no-repeat;
            }

            .bg-success-light {
                background-color: #479f76 !important;
            }

            .glass-fx {
                background: rgba( 255, 255, 255, 0.3 ) !important;
                box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ) !important;
                backdrop-filter: blur( 7px ) !important;
                -webkit-backdrop-filter: blur( 7px ) !important;
                border-radius: 7px !important;
                border: 1px solid rgba( 255, 255, 255, 0.18 ) !important;
            }
            .glass-fx-footer {
                background: rgba( 255, 255, 255, 0.15 ) !important;
                box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ) !important;
                backdrop-filter: blur( 4px ) !important;
                -webkit-backdrop-filter: blur( 4px ) !important;
                /*border-radius: 10px !important;*/
                /*border: 1px solid rgba( 255, 255, 255, 0.18 ) !important;*/
            }
            
            
            .glass-fx-toast-header {
                background: rgba( 255, 255, 255, 0.3 ) !important;
                /*box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ) !important;*/
                backdrop-filter: blur( 7px ) !important;
                -webkit-backdrop-filter: blur( 7px ) !important;
                border-radius: 3px !important;
                border: 1px solid rgba( 255, 255, 255, 0.18 ) !important;
            }
            
            .glass-fx-toast {
                background: rgba( 255, 255, 255, 0.2 ) !important;
                box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.10 ) !important;
                backdrop-filter: blur( 4px ) !important;
                -webkit-backdrop-filter: blur( 4px ) !important;
            }
            
            
            
            .text-gray {
                color: #3a3a3a !important;
            }
        </style>
    </head>
    <body class="d-flex flex-column min-vh-100 layoutAuthentication_content">
        <main class="mx-auto my-auto align-items-center">
            <div class="card shadow-lg border-0 rounded-lg glass-fx">
                <div class="card-header d-flex flex-row align-items-center justify-content-center">
                    <img src="jojo/images/emblem.png" class="login-form-logo" />
                    <h5 class="fw-bold">Revenue &AMP; Disaster<br/>Management Department <br><small class="text-gray">Government of Meghalaya</small></h5>
                </div>
                <div class="card-body">
                    <div class=" container">
                        <div class="row">
                            <div class="col-sm-12">
                                <form:form action="./login.htm" id="loginForm" modelAttribute="login" method="POST" autocomplete="off">
                                    <span style="color: #ff0000;"><c:out escapeXml="true" value="${loginerr}" /></span>
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control" id="inputUsername" path="username" type="text" placeholder="Username" required="true"/>
                                        <label for="inputUsername">Username</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <form:input class="form-control" id="inputPassword" path="userpassword" type="password" placeholder="Password" required="true"/>
                                        <label for="inputPassword">Password</label>
                                    </div>
                                    <div class="mb-3">
                                        <img src="./simpleImg" name="refresh" style="width:300px ;height:140px; margin-right: 20px !important;" class="zoom3 img-responsive img img-thumbnail"/>
                                        <img src="jojo/images/retry.png" style="margin-left: 20px !important; width: 24px; height: 24px;" onclick="Start()" class="zoom2"/>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" name="captcha" id="userCaptcha" maxlength="5" placeholder="Enter the Capcha"  class="form-control"  autocomplete="off" required="true"/>
                                        <span style="color: #ff0000;"><c:out escapeXml="true" value="${capchaerror}" /></span>
                                        <label for="userCaptcha">Enter the Captcha</label>
                                    </div>
                                    <div class="d-flex flex-row mt-4 mb-0 justify-content-center align-items-center">
                                        <input type="hidden" name="randomKey" id="randomKey" value="<c:out escapeXml="true" value="${randomKey}" />"/>
                                        <input type="submit" value="Log in" id="loginBtn" name="login" onclick="btnclick()" class="btn btn-default text-uppercase fw-bold text-dark"/>
                                        <!--<i class="fa-solid fa-angles-right fa-beat-fade" style="color: #212529;"></i>-->
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <c:if test="${fn:length(msg) > 1}">
            <div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
                <div id="liveToast" class="toast show glass-fx-toast" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header glass-fx-toast-header">
                        <i class="fa-solid fa-bell fa-shake" style="color: #710404; margin-right: 7px;"></i>
                        <strong class="me-auto" style="color: #710404;"> Alert</strong>
                        <!--<small>11 mins ago</small>-->
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body text-dark">
                        <c:out escapeXml="true" value="${msg}" />
                    </div>
                </div>
            </div>
        </c:if>

        <footer class="py-4 mt-auto glass-fx-footer">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-around small">
                    <div class="text-white text-center fw-semibold">&copy; Revenue & Disaster Management Department, Government of Meghalaya</div>
                    <div class="text-center">
                        <a href="https://meg.nic.in/" class="text-decoration-none text-white fw-semibold">Designed & Developed By: NIC Meghalaya</a>
                    </div>
                </div>
            </div>
        </footer>

    </div>
    <script src="jojo/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="jojo/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="jojo/js/jquery-confirm.min.js"></script>
    <script src="jojo/js/sha256.js" type="text/javascript"></script>
    <script src="jojo/fontawesome-free-6.4.0-web/js/all.min.js" type="text/javascript"></script>
    <script>
                function btnclick() {
                    var pass, get, slt;
                    if (document.getElementById('userCaptcha').value === '') {
                        document.getElementById('userCaptcha').focus();
                    } else {
                        pass = document.getElementById('inputPassword').value;
                        if ((pass.toString()).length === 0) {
                            document.getElementById('inputPassword').value = "";
                        } else {
                            slt = document.getElementById('randomKey').value;
                            get = sha256_digest(sha256_digest(pass) + slt);
                            document.getElementById('inputPassword').value = get;
                        }
                        $("#randomKey").attr("disabled", "disabled");
                    }
                    return true;
                }

                var t = 120;
                image = "simpleImg";
                function Start() {
                    tmp = new Date();
                    tmp = "?" + tmp.getTime();
                    document.images["refresh"].src = image + tmp;
                }

    </script>
</body>
</html>
