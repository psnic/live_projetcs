<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Landing Page | DRMS</title>
        <link href="jojo/css/templatemo-topic-listing.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/css/styles.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/bootstrap-5.2.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="jojo/fontawesome-free-6.4.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .custom-block {
                border-radius: var(--border-radius-medium);
                position: relative;
                /*width: 300px;*/
                overflow: hidden;
                padding: 10px; /* Decrease the padding to reduce card height */
                transition: all 0.3s ease;
                /*margin-right: 5px;*/
                margin-bottom: 20px; /* Add spacing between cards */
            }

            .card {
                border-radius: var(--border-radius-medium);
                position: relative;
                /*width: 300px;*/
                overflow: hidden;
                padding: 10px; /* Decrease the padding to reduce card height */
                transition: all 0.3s ease;
                /*margin-right: 5px;*/
                margin-bottom: 20px; /* Add spacing between cards */
            }

            .custom-block:hover {
                background-color: var(--secondary-color);
                transform: translateY(-3px);
            }

            .custom-block > a {
                width: 100%;
            }

            .custom-block-image {
                display: block;
                width: 110%;
                height: 150px; /* Decrease the height of the image */
                object-fit: cover;
                margin-top: 15px;
            }

            .custom-block .rounded-pill {
                border-radius: 5px !important;
                display: flex;
                justify-content: center;
                text-align: center;
                width: 40px;
                height: 40px;
                line-height: 20px;
            }

            .custom-block-overlay {
                height: 100%;
                min-height: 350px;
                padding: 0;
            }

            .custom-block-overlay > a {
                height: 100%;
            }
            /* Increase the text size for the badge */
            .badge.rounded-pill.ms-auto {
                font-size: 18px; /* Adjust the font size as needed */
                white-space: nowrap;
                overflow: visible;
            }
            .badge.ms-auto {
                font-size: 18px;
                border-radius: 5px !important;
                /*display: flex;*/
                /*justify-content: center;*/
                text-align: center;
                /*width: 40px;*/
                height: 40px;
                line-height: 20px;
            }

            .card-listing-info {
                margin: 30px 20px 20px 30px;
            }

            .card-listing {
                height: inherit;
            }

            .card-listing .custom-block-image {
                width: 200px;
            }
        </style>
    </head>
    <body class="topics-listing-page" id="top">
        <main>
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand text-white" href="index.htm">DRMS</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="d-flex align-content-end collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <button class="btn btn-sm"><a class="nav-link" href="login.htm">Log In</a></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <header class="site-header d-flex flex-column justify-content-center align-items-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb"><a href="index.htm" class="text-white">Homepage</a></li>
                                </ol>
                            </nav>
                            <div class="d-flex">
                                <img src="jojo/images/emblem-light.png" alt=""/>
                                <h2 class="text-white pb-0 px-4 py-3 mb-0">Revenue &AMP; Disaster Management Department</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <section class="section-padding">
                <div class="container">
                    <!--<div class="row">-->
                    <div class="row">
                        <div class="col-md-3 custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
                            <!--<div class="card-body">-->
                            <div class="d-flex">
                                <img src="jojo/images/report.png" class="custom-block-image" style="height: 100px;" alt="">
                                <div class="">
                                    <div>
                                        <h5 class="mb-2">FIRs Registered</h5>
                                        <p class="mb-0">Total FIRs(Pre-Leminary Incidence Report) registered for the current financial year 2023-2024.</p>
                                    </div>
                                    <span class="badge bg-design rounded-pill ms-auto">${pr_count}</span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                        <div class="col-md-3 custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
                            <!--<div class="card-body">-->
                            <div class="d-flex">
                                <img src="jojo/images/approve.png" class="custom-block-image" style="height: 100px;" alt="">
                                <div class="">
                                    <div>
                                        <h5 class="mb-2">Proposals Approved</h5>
                                        <p class="mb-0">Total Proposals approved and sanctioned for the current financial year 2023-2024.</p>
                                    </div>
                                    <span class="badge bg-graphic rounded-pill ms-auto">${apv_count}</span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                        <div class="col-md-3 custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
                            <!--<div class="card-body">-->
                            <div class="d-flex">
                                <img src="jojo/images/get-money.png" class="custom-block-image" style="height: 100px;" alt="">
                                <div class="">
                                    <div>
                                        <h5 class="mb-2">Total Amount Sanctioned</h5>
                                        <p class="mb-0">Total Amount(in Rupees) Sanctioned for the current financial year 2023-2024.</p>
                                    </div>
                                    <span class="badge bg-music ms-auto">1066000</span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                        <div class="col-md-3 custom-block custom-block-topics-listing bg-white shadow-lg mb-5">
                            <!--<div class="card-body">-->
                            <div class="d-flex">
                                <img src="jojo/images/youth.png" class="custom-block-image" style="height: 100px;" alt="">
                                <div class="">
                                    <div>
                                        <h5 class="mb-2">Beneficiaries Registered</h5>
                                        <p class="mb-0">Total number of beneficiaries registered for the current financial year 2023-2024.</p>
                                    </div>
                                    <span class="badge bg-finance rounded-pill ms-auto">${ben}</span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>
                    </div>
                    <!--</div>-->
                </div>
            </section>
        </main>
        <!-- JAVASCRIPT FILES -->
        <script src="jojo/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="jojo/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="js/jquery.sticky.js" type="text/javascript"></script>
        <script src="js/custom.js" type="text/javascript"></script>
        <script src="jojo/fontawesome-free-6.4.0-web/js/all.min.js" type="text/javascript"></script>
        <!--<script src="js/custom.js"></script>-->
    </body>
</html>
