<%@ page import="model.Users" %>
<%@ page import="model.Expertise" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.*" %>
<%@ page import="model.Skills" %>
<!DOCTYPE html>
<html lang="en">
    <%
        List<Skills> allSkills = new SkillDAO().getAllSkill();
        int mentorID = new MentorDAO().getMentorByUserId(((Users) session.getAttribute("users")).getUserId()).getMentorId();
        List<Expertise> mentorExpertise = new ExpertiseDAO().getExpertiseByMentorId(mentorID);

        for (Expertise expertise : mentorExpertise) {
            for (Skills skills : allSkills) {
                if (skills.getSkillId() == expertise.getSkillId()) {
                    allSkills.remove(skills);
                    break;
                }
            }
        }

        request.setAttribute("allSkills", allSkills);
        request.setAttribute("mentorExpertise", mentorExpertise);

        request.setAttribute("skillDAO", new SkillDAO());

    %>


    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>

    <body>
        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="../header.jsp" %>
            <!--End of header-->


            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">

                            <h2 class="breadcrumb-title">Profile Settings</h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">

                <c:if test="${requestScope.error != null}">
                    <div class="container mt-4">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                        </div>
                    </div>
                </c:if>

                <div class="container-fluid">
                    <div class="row">

                        <!-- mentor sidebar start -->
                        <%@include file="../mentorsidebar.jsp" %>
                        <!-- mentor sidebar end -->




                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h5>Your expertise</h5>
                            <div class="row">

                                <c:forEach var="expertise" items="${mentorExpertise}">
                                    <div class="col-md-6 card">
                                        <div class="card-body justify-content-between align-content-center">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <p>${skillDAO.getSkillBySkillId(expertise.skillId).skillName}</p>
                                                </div>
                                                <div class="col-md-6">
                                                    <a href="mentor-profile?go=delete&expertise-id=${expertise.expertiseId}">
                                                        <button class="btn btn-danger">
                                                            Delete
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <form action="mentor-profile" method="post">
                                        <div class="row form-row">

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>First Name</label>
                                                    <input name="first_name" type="text" class="form-control" value="${sessionScope.users.fName}">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Last Name</label>
                                                    <input name="last_name" type="text" class="form-control" value="${sessionScope.users.lName}">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group" >
                                                    Gender :
                                                    <label for="male">Male</label>
                                                    <input class="form-check-input" type="radio" id="male" name="gender" value="Male" <%if (((Users) session.getAttribute("users")).getGender().equals("Male")) {%> checked <%}%> >

                                                    <label for="female">Female</label>
                                                    <input class="form-check-input" type="radio" id="female" name="gender" value="Female" <%if (((Users) session.getAttribute("users")).getGender().equals("Female")) {%> checked <%}%>>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input readonly name="email" type="email" class="form-control"
                                                           value="<%=((Users) session.getAttribute("users")).getEmail()%>">
                                                </div>
                                            </div>


                                            <div class="col-12 col-md-6">
                                                <div class="form-group" >
                                                    <label>Facebook</label>
                                                    <input name="facebook" type="text" class="form-control"
                                                           value="<%=(((Users) session.getAttribute("users")).getFacebook())%>">
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Mobile</label>
                                                    <input name="phone_number" type="text" value="<%=((Users) session.getAttribute("users")).getPhoneNum()%>" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input name="address" type="text" value="<%=((Users) session.getAttribute("users")).getAddress()%>" class="form-control">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Current District-City</label>
                                                    <input readonly name="current_district" type="email" class="form-control"
                                                           value="<%=new TinhThanhPhoDAO().getTTPNameAndQHName(((Users) session.getAttribute("users")).getUserId())%>">
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>City</label>
                                                    <select class="form-select" name="" id="cityList" onchange="changeCity()">
                                                        <option value="" selected=""></option>
                                                        <c:forEach items="${requestScope.listCity}" var="i">
                                                            <option value="${i.mattp}">${i.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>State</label>
                                                    <label class="form-control-label">District</label>
                                                    <select class="form-select" name="district" id="district" style="display: none" required>
                                                        <option value="${sessionScope.users.maqh}">${sessionScope.users.maqh}</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Experience</label>
                                                    <input name="experience" type="text" class="form-control"
                                                           value="<%=new ExperienceDAO().getExperienceByUserID(((Users) session.getAttribute("users")).getUserId()).getDescription()%>">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Bio</label>
                                                    <input name="bio" type="text" class="form-control"
                                                           value="<%=new MentorDAO().getMentorByUserId(((Users) session.getAttribute("users")).getUserId()).getBio()%>">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Hourly rate</label>
                                                    <input style="width: 50%" name="hourly-rate" type="number" class="form-control"
                                                           value="<%=new MentorDAO().getMentorByUserId(((Users) session.getAttribute("users")).getUserId()).getHourlyRate()%>" min="0" max="100000000000000" step="1000">
                                                </div>
                                            </div>




                                            <h5>Add another expertise</h5>
                                            <div class="row">

                                                <c:forEach var="skill" items="${allSkills}">
                                                    <div class="col-md-4">
                                                        <div class="form-control">
                                                            <input class="form-label" type="checkbox" name="${skill.skillId}" id="${skill.skillId}" value="${skill.skillId}">
                                                            <label class="form-check" for="${skill.skillId}">${skill.skillName}</label>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>


                                        </div>
                                        <div class="submit-section">
                                            <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>


        <script type="text/javascript">
            function changeCity() {
                $.ajax({
                    type: 'POST',
                    data: {
                        id: $('#cityList').val()
                    },
                    url: '${pageContext.request.contextPath}/chooseDistrict',
                    success: function (data, textStatus, jqXHR) {
                        if ($('#cityList').val() !== '') {
                            $('#district').css("display", "inline");
                        } else {
                            $('#district').css("display", "none");
                        }
                        $('#district').html(data)
                    }
                }
                )
            }

            function checkEmailExisted() {
                $.ajax({
                    type: 'POST',
                    data: {
                        email: $('#email').val()
                    },
                    url: '${pageContext.request.contextPath}/checkEmailExisted',
                    success: function (data, textStatus, jqXHR) {
                        if (data) {
                            $('#error').html(data);
                            $('#submit').prop('disabled', true);
                        } else {
                            $('#error').html('');
                            $('#submit').removeAttr('disabled')
                        }
                    }
                }
                )
            }
        </script>

        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("password-confirm").value;
                var message = document.getElementById("message");

                if (password !== confirmPassword) {
                    message.style.color = "red";
                    message.innerHTML = "Password Confirm is not match  ! Please re-enter.";
                    return false; // Ng?n ch?n g?i form
                } else {
                    message.innerHTML = '';
                    return true;
                }

            }
        </script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>


    <!-- Mirrored from mentoring.dreamguystech.com/html/template/profile-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:22 GMT -->

</html>


