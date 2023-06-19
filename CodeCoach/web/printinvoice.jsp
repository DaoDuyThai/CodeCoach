<%-- 
    Document   : printinvoice
    Created on : Jun 19, 2023, 1:18:51 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Print Invoice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
            <!--End of header-->


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">

                            <h2 class="breadcrumb-title">Invoice View</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="invoice-content">
                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="invoice-logo">
                                                <img src="assets/img/logo.png" alt="logo">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="invoice-details">
                                                <strong>Order:</strong> #00124 <br>
                                                <strong>Issued:</strong> 20/07/2019
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="invoice-info">
                                                <strong class="customer-text">Invoice From</strong>
                                                <p class="invoice-details invoice-details-two">
                                                    Darren Elder <br>
                                                    806 Twin Willow Lane, Old Forge,<br>
                                                    Newyork, USA <br>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="invoice-info invoice-info2">
                                                <strong class="customer-text">Invoice To</strong>
                                                <p class="invoice-details">
                                                    Walter Roberson <br>
                                                    299 Star Trek Drive, Panama City, <br>
                                                    Florida, 32405, USA <br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="invoice-item">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="invoice-info">
                                                <strong class="customer-text">Payment Method</strong>
                                                <p class="invoice-details invoice-details-two">
                                                    Debit Card <br>
                                                    XXXXXXXXXXXX-2541 <br>
                                                    HDFC Bank<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="invoice-item invoice-table-wrap">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="invoice-table table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Description</th>
                                                            <th class="text-center">Quantity</th>
                                                            <th class="text-center">VAT</th>
                                                            <th class="text-end">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>General Consultation</td>
                                                            <td class="text-center">1</td>
                                                            <td class="text-center">$0</td>
                                                            <td class="text-end">$100</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Video Call Booking</td>
                                                            <td class="text-center">1</td>
                                                            <td class="text-center">$0</td>
                                                            <td class="text-end">$250</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xl-4 ms-auto">
                                            <div class="table-responsive">
                                                <table class="invoice-table-two table">
                                                    <tbody>
                                                        <tr>
                                                            <th>Subtotal:</th>
                                                            <td><span>$350</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Discount:</th>
                                                            <td><span>-10%</span></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total Amount:</th>
                                                            <td><span>$315</span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="other-info">
                                    <h4>Other information</h4>
                                    <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        Vivamus sed dictum ligula, cursus blandit risus. Maecenas eget metus non tellus
                                        dignissim aliquam ut a ex. Maecenas sed vehicula dui, ac suscipit lacus. Sed finibus
                                        leo vitae lorem interdum, eu scelerisque tellus fermentum. Curabitur sit amet
                                        lacinia lorem. Nullam finibus pellentesque libero.</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Footer start-->
            <%@include file="footer.jsp" %>
            <!-- Footer end -->


        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>
