<%@ page import="model.Users" %>
<%@ page import="dal.TinhThanhPhoDAO" %>
<!DOCTYPE html>
<html lang="en">


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
    <div class="container-fluid">
      <div class="row">

        

        <div class="col-md12 col-lg-12 col-xl-12">
          <div class="card">
            <div class="card-body">
              <form action="general-profile" method="post">
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
                      <input class="form-check-input" type="radio" id="male" name="gender" value="Male" <%if(((Users) session.getAttribute("users")).getGender().equals("Male")){%> checked <%}%> >

                      <label for="female">Female</label>
                      <input class="form-check-input" type="radio" id="female" name="gender" value="Female" <%if(((Users) session.getAttribute("users")).getGender().equals("Female")){%> checked <%}%>>
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
                if(data){
                  $('#error').html(data);
                  $('#submit').prop('disabled',true);
                }
                else {
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
    }
    else{
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


