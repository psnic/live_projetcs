<%-- 
    Document   : auth_navbar
    Created on : 6 Jul, 2023, 1:44:33 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top Navbar</title>
        <link href="jojo/css/jquery-confirm.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/bootstrap-5.2.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <style>
            .sidebar-emblem-logo {
                height: 30px;
                width: auto;
                margin-right: 7px;
            }
            .nav-title-text {
                margin-left: 7px;
                font-size: 14px;
            }
            .navbar-expand .navbar-nav .dropdown-menu {
                /*right: 0;*/
            }

            /*            .navbar {
                            display: flex;
                            justify-content: space-between;
                        }
            
                        .nav-title-text {
                            margin-left: 10px;  Adjust the value as needed for spacing between the logo and text 
                        }*/
        </style>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home.htm">
                <div class="d-flex flex-row align-items-center justify-content-center align-content-center">
                    <img src="jojo/images/emblem-light.png" alt="emplem" class="sidebar-emblem-logo"/>
                    <p class="nav-title-text pb-0 mb-0">
                        Revenue &amp; Disaster<br/>Management Department
                    </p>
                </div>
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!--<li><a class="dropdown-item" href="settings.htm">Settings</a></li>-->
                        <!--<li><a class="dropdown-item" href="#!">Activity Log</a></li>-->
                        <!--<li><hr class="dropdown-divider" /></li>-->
                        <li><a class="dropdown-item" href="#!" onclick="logout();">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <script src="jojo/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="jojo/js/jquery-confirm.min.js"></script>
        <script src="jojo/js/scripts.js" type="text/javascript"></script>
        <script src="jojo/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script>
                            $(document).ready(function () {
                                $('.logoutbtn').click(function () {
                                    $.confirm({
                                        title: 'Are you sure you want to logout?',
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
                            function logout() {
                                $.confirm({
                                    title: 'Confirm!',
                                    content: 'This will end your session and log you out of the system. Please confirm you want to logout.',
                                    type: 'red',
                                    typeAnimated: true,
                                    buttons: {
                                        confirm: {
                                            text: 'Logout',
                                            btnClass: 'btn-red',
                                            action: function () {
                                                window.location.replace('logout.htm');
                                            }
                                        },
                                        cancel: function () {
                                        }
                                    }
                                });
                            }
        </script>
    </body>
</html>
