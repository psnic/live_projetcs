<%-- 
    Document   : nav_top
    Created on : 8 Nov, 2022, 5:21:16 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="suantonsing/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-purple-hov">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home.htm">181 Women Helpline</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
                <c:if test="${LOGIN.m_usertype.usertypeid == '2' || LOGIN.m_usertype.usertypeid == '3'}">
                <!-- Navbar Search   -->
<!--                <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0" style="width: 35rem;" autocomplete="off" action="casemanagement.htm" method="GET">
                    <div class="input-group">
                        <input name="icaseno" class="form-control" type="text" placeholder="Enter Case Number to Search..." aria-label="Enter Case Number to Search..." aria-describedby="btnNavbarSearch" />
                        <button class="btn btn-pink" id="btnNavbarSearch" type="button"><i class="fas fa-search text-white"></i></button>
                        <button class="btn btn-pink" id="btnNavbarSearch" type="submit"><i class="fas fa-search text-white"></i></button>
                    </div>
                </form>-->
                <!-- Navbar-->
            </c:if>
            <!--<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">-->
            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="accountdetails.htm">My Account</a></li>
                        <!--<li><a class="dropdown-item" href="#!">Activity Log</a></li>-->
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item logoutbtn" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <script src="suantonsing/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="suantonsing/js/jquery-confirm.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('.logoutbtn').click(function () {
                    $.confirm({
                        title: 'Are you sure to logout?',
                        content: '',
                        buttons: {
                            cancel: function () {
                                $.alert('Canceled!');
                            },
                            logout: {
                                text: 'Logout',
                                btnClass: 'btn-blue',
                                action: function () {
                                    $.confirm({
                                        content: function () {
                                            var self = this;
                                            return $.ajax({
                                                url: 'logout.htm',
                                                method: 'GET'
                                            }).done(function (response) {
                                                if (response === '1') {
                                                    self.close();
                                                    window.location.replace('login.htm');
                                                } else {
                                                    self.setTitle('Error Occurred!');
                                                    self.setContent('Unable to logout. Please try again!');
                                                }
                                            }).fail(function () {
                                                self.setTitle('');
                                                self.setContent('Something went wrong.');
                                            });
                                        }
                                    });
                                }
                            }
                        }
                    });
                });
            });
        </script>
    </body>
</html>
