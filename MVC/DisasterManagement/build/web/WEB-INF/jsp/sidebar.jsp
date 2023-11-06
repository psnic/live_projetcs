<%-- 
    Document   : auth_sidebar
    Created on : 6 Jul, 2023, 1:44:22 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel Sidebar</title>
        <!--<link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>-->
        <script src="jojo/fontawesome-free-6.4.0-web/js/all.js" type="text/javascript"></script>
        <link href="jojo/css/adminlte.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        /* Style for the main menu item */

        /* Add the following CSS to fix the footer at the bottom of the sidebar and create a big space */
        /*        #layoutSidenav_nav {
                    display: flex;
                    flex-direction: column;
                    height: 100%;
                }*/

        /*        .sb-sidenav {
                    flex-grow: 1;
                    display: flex;
                    flex-direction: column;
                }*/

        /*        .sb-sidenav-menu {
                    flex-grow: 1;
                    padding-bottom: 50px;  Adjust the value to create a big space between Dashboard and footer 
                }*/

        /*        .sb-sidenav-footer {
                    position: fixed;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    background-color: #222;  Set the background color of the footer if needed 
                    padding: 10px;
                }*/

        /*        .sb-sidenav-footer-content {
                    text-align: center;
                }*/

    </style>
    <body class="layout-fixed">
        <div class="wrapper">
            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-bg-dark sidebar-color-primary shadow">
                <div class="brand-container">
                    <a href="javascript:;" class="brand-link">
                        <!--<img src="./assets/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image opacity-80 shadow">-->
                        <span class="brand-text fw-light">AdminLTE 4</span>
                    </a>
                    <a class="pushmenu mx-1" data-lte-toggle="sidebar-mini" href="javascript:;" role="button"><i class="fas fa-angle-double-left"></i></a>
                </div>
                <!-- Sidebar -->
                <div class="sidebar">
                    <nav class="mt-2">
                        <!-- Sidebar Menu -->
                        <ul class="nav nav-pills nav-sidebar flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
                            <li class="nav-item menu-open">
                                <a href="javascript:;" class="nav-link active">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Dashboard
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="./index.html" class="nav-link active">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Dashboard v1</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="./index2.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Dashboard v2</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="./index3.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Dashboard v3</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item ">
                                <a href="javascript:;" class="nav-link ">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Widgets
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="./pages/widgets/small-box.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Small Box</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="./pages/widgets/info-box.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>info Box</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="./pages/widgets/cards.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Cards</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item ">
                                <a href="javascript:;" class="nav-link ">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Layout Options
                                        <span class="badge bg-info float-end me-3">6</span>
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="./pages/layout/fixed-sidebar.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Fixed Sidebar</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item ">
                                <a href="javascript:;" class="nav-link ">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Forms
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="./pages/forms/general.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>General Elements</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item ">
                                <a href="javascript:;" class="nav-link ">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Tables
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="./pages/tables/simple.html" class="nav-link ">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Simple Tables</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">MULTI LEVEL EXAMPLE</li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>Level 1</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>
                                        Level 1
                                        <i class="end fas fa-angle-right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="javascript:;" class="nav-link">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Level 2</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:;" class="nav-link">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>
                                                Level 2
                                                <i class="end fas fa-angle-right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="javascript:;" class="nav-link">
                                                    <i class="nav-icon far fa-dot-circle"></i>
                                                    <p>Level 3</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="javascript:;" class="nav-link">
                                                    <i class="nav-icon far fa-dot-circle"></i>
                                                    <p>Level 3</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="javascript:;" class="nav-link">
                                                    <i class="nav-icon far fa-dot-circle"></i>
                                                    <p>Level 3</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="javascript:;" class="nav-link">
                                            <i class="nav-icon far fa-circle"></i>
                                            <p>Level 2</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon fas fa-circle"></i>
                                    <p>Level 1</p>
                                </a>
                            </li>
                            <li class="nav-header">LABELS</li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon far fa-circle text-danger"></i>
                                    <p class="text">Important</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon far fa-circle text-warning"></i>
                                    <p>Warning</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:;" class="nav-link">
                                    <i class="nav-icon far fa-circle text-info"></i>
                                    <p>Informational</p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- /.sidebar -->
            </aside>
        </div>
        <script src="jojo/js/scripts.js" type="text/javascript"></script>
    </body>
</html>
