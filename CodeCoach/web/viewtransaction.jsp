<%-- 
    Document   : viewtransaction
    Created on : Jul 10, 2023, 1:55:53 PM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View transaction</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->

        <!--content start-->
        <div class="main-wrapper">


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">View Transactions</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-wrapper">
                <div class="content container-fluid">







                    <div class="row">
                        <!-- mentee side bar start -->
                        <%@include file="adminsidebar.jsp" %>
                        <!-- mentee side bar end -->

                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="datatable table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Invoice Number</th>
                                                    <th>Mentee ID</th>
                                                    <th>Mentee Name</th>
                                                    <th>Total Amount</th>
                                                    <th class="text-center">Status</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0001</a></td>
                                                    <td>#01</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Jonathan Doe </a>
                                                        </h2>
                                                    </td>
                                                    <td>$100.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0002</a></td>
                                                    <td>#02</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user1.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Julie Pennington </a>
                                                        </h2>
                                                    </td>
                                                    <td>$200.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0003</a></td>
                                                    <td>#03</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user2.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Tyrone Roberts</a>
                                                        </h2>
                                                    </td>
                                                    <td>$250.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0004</a></td>
                                                    <td>#04</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user3.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Allen Davis </a>
                                                        </h2>
                                                    </td>
                                                    <td>$150.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0005</a></td>
                                                    <td>#05</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user4.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Patricia Manzi </a>
                                                        </h2>
                                                    </td>
                                                    <td>$350.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0006</a></td>
                                                    <td>#06</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user5.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Elsie Gilley</a>
                                                        </h2>
                                                    </td>
                                                    <td>$300.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0007</a></td>
                                                    <td>#07</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user11.jpg" alt="User Image"></a>
                                                            <a href="profile.html"> Joan Gardner</a>
                                                        </h2>
                                                    </td>
                                                    <td>$250.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0008</a></td>
                                                    <td>#08</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user12.jpg" alt="User Image"></a>
                                                            <a href="profile.html"> Daniel Griffing</a>
                                                        </h2>
                                                    </td>
                                                    <td>$150.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0009</a></td>
                                                    <td>#09</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user8.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Walter Roberson</a>
                                                        </h2>
                                                    </td>
                                                    <td>$100.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><a href="invoice.html">#IN0010</a></td>
                                                    <td>#10</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm me-2"><img
                                                                    class="avatar-img rounded-circle"
                                                                    src="assets/img/user/user9.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Robert Rhodes </a>
                                                        </h2>
                                                    </td>
                                                    <td>$120.00</td>
                                                    <td class="text-center">
                                                        <span class="badge badge-pill bg-success inv-badge">Paid</span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <a data-bs-toggle="modal" href="#edit_invoice_report"
                                                               class="btn btn-sm bg-success-light me-2">
                                                                <i class="fe fe-pencil"></i> Edit
                                                            </a>
                                                            <a class="btn btn-sm bg-danger-light" data-bs-toggle="modal"
                                                               href="#delete_modal">
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <div class="modal fade" id="edit_invoice_report" aria-hidden="true" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Transactions</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="row form-row">
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Invoice Number</label>
                                        <input type="text" class="form-control" value="#INV-0001">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Mentee ID</label>
                                        <input type="text" class="form-control" value="	#01">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Mentee Name</label>
                                        <input type="text" class="form-control" value="Jonathan Doe">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Mentee Image</label>
                                        <input type="file" class="form-control">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Total Amount</label>
                                        <input type="text" class="form-control" value="$200.00">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Created Date</label>
                                        <input type="text" class="form-control" value="29th Oct 2019">
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block w-100">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="delete_modal" aria-hidden="true" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">
                        <div class="form-content p-2">
                            <h4 class="modal-title">Delete</h4>
                            <p class="mb-4">Are you sure want to delete?</p>
                            <button type="button" class="btn btn-primary">Delete </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <div class="row">

            <!--Footer start-->
            <%@include file="footer.jsp" %>
            <!-- Footer end -->
        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <script src="assets/js/script.js"></script>

        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
    </body>
</html>
