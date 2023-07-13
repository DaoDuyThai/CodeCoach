<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>View and Edit Settings</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>
        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
            <!--End of header-->

            <!--Admin user start-->
             <c:if test="${users.roleId == 1}">
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <h2 class="breadcrumb-title">View and Edit Settings</h2>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">

                            <!--Admin sidebar start-->
                            <%@include file="adminsidebar.jsp" %>
                            <!--Admin sidebar end-->

                            <div class="col-md-7 col-lg-8 col-xl-9">

                                <!--count info number start-->
                                <div class="row">
                                    <div class="col-md-12 col-lg-2 dash-board-list pink"></div>
                                    <div class="col-md-12 col-lg-8 dash-board-list blue">
                                        <div class="dash-widget">
                                            <div class="circle-bar">
                                                <div class="icon-col">
                                                    <i class="fas fa-users"></i>
                                                </div>
                                            </div>
                                            <div class="dash-widget-info">
                                                <%
                                                    String countInfo = (String) request.getAttribute("countInfo");
                                                %>
                                                <h3><%= countInfo%></h3>
                                                <h6>Info</h6>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-lg-2 dash-board-list pink"></div>
                                </div>
                                <!--count ppat number end-->


                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="mb-4">Info List</h4>

                                        <!--add faq start-->
                                        <button onclick="showAddForm()" type="button" data-bs-toggle="modal" data-bs-target="#addModal" class="btn btn-success">Add more PPAT</button>
                                        <!-- addForm start here -->
                                        <div id="addFormContainer" style="display: none;">
                                            <div class="card card-form">
                                                <div class="card-body">
                                                    <h4 class="card-title">Add Info</h4>
                                                    <form action="viewandeditsettings" method="POST">
                                                        <!-- Form fields -->
                                                        
                                                        <div class="form-group">
                                                            <label for="info">Info:</label>
                                                            <input type="text" class="form-control" id="infor" name="infor" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="href">Link:</label>
                                                            <input class="form-control" id="href" name="href" rows="2" ></input>
                                                        </div>
                                                        <input type="hidden" name="action" value="add">
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                        <button type="button" class="btn btn-secondary" onclick="hideAddForm()">Cancel</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- addForm end here -->
                                        <!--add PPAT end-->

                                        <!--table start-->
                                        <div class="card card-table">
                                            <div class="card-body">
                                                <div class="table-responsive">

                                                    <table style="border-collapse: collapse; width: 100%;" class="table table-hover table-center">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 100px;">No.</th>
                                                                <th style="width: 100px;">Info</th>
                                                                <th style="width: 100px;">Link</th>
                                                                <th style="width: 100px;">ACTION</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% int counter = 1; %>
                                                            <c:forEach items="${cUsList}" var="cUsList">
                                                                <tr>
                                                                    <td style="width: 10px; white-space: pre-wrap;"><%= counter %></td>
                                                                    <td style="width: 100px; white-space: pre-wrap;">${cUsList.infor}</td>
                                                                    <td style="width: 100px; white-space: pre-wrap;">${cUsList.href}</td>
                                                                    <td style="width: 100px;">
                                                                        <button class="btn btn-primary" onclick="toggleEditForm(this)">Edit</button>
                                                                        <a><button onclick="doDelete(${cUsList.id})" class="btn btn-danger">Delete</button></a>
                                                                    </td>
                                                                </tr>
                                                                <%-- Hidden row for the edit form start--%>
                                                                <tr class="edit-row" style="display: none;">
                                                                    <td colspan="4">
                                                                        <form action="updateinfo" method="POST">
                                                                            <input type="hidden" name="id" value="${cUsList.id}">
                                                                            
                                                                            <div class="form-group">
                                                                                <label for="infor">Info:</label>
                                                                                <input type="text" class="form-control" id="infor" name="infor" value="${cUsList.infor}" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="content">Link:</label>
                                                                                <textarea class="form-control" id="href" rows="2" name="href" >${cUsList.href}</textarea>
                                                                            </div>
                                                                            <input type="hidden" name="action" value="update">
                                                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                                                            <button type="button" class="btn btn-secondary" onclick="toggleEditForm(this)">Cancel</button>
                                                                        </form>
                                                                    </td>
                                                                </tr>
                                                                <% counter++; %>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--table end-->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <!--Admin user end-->

            <!--not admin start-->
            <c:if test="${!empty users && users.roleId != 1}">
                <%@include file="accessdenied.jsp" %>
            </c:if>
            <!--not admin end-->

            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
        <script type="text/javascript">
            // prompt if you want to delete
            function doDelete(id) {
                if (confirm("Are you sure to delete this?:")) {
                    window.location = "deleteinfo?id=" + id;
                }
            }
            //show add faq form
            function showAddForm() {
                document.getElementById('addFormContainer').style.display = 'block';
            }
            //hide add faq form
            function hideAddForm() {
                document.getElementById('addFormContainer').style.display = 'none';
            }
            //show and hide edit faq form
            function toggleEditForm(button) {
                var editRow = button.parentNode.parentNode.nextElementSibling;
                var display = editRow.style.display;
                if (display === 'none' || display === '') {
                    // Show the edit form
                    editRow.style.display = 'table-row';
                    button.innerText = 'Cancel';
                } else {
                    // Hide the edit form
                    editRow.style.display = 'none';
                    button.innerText = 'Edit';
                }
            }
        </script>

    </body>
</html>
