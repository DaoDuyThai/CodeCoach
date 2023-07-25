<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Mentoring</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="account-page">

<div class="main-wrapper">

    <div class="bg-pattern-style bg-pattern-style-register">
        <div class="content">

            <div class="account-content">
                <div class="account-box">
                    <div class="login-right">
                        <div class="login-header">
                            <h3><span>CODECOACH</span>: Register Successfully</h3>
                            <p class="text-muted" id="infoMessage">Access to our dashboard</p>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
<script>
    // ??m ng??c và chuy?n h??ng sau 5 giây
    var countDown = 5;
    var infoMessage = document.getElementById("infoMessage");

    function redirectToHome() {
        if (countDown > 0) {
            infoMessage.textContent = "Redirecting to home page in " + countDown + " seconds...";
            countDown--;
            setTimeout(redirectToHome, 1000);
        } else {
            infoMessage.textContent = "Create new account successfully";
            // Chuy?n h??ng ??n trang home
            window.location.href = "home";
        }
    }

    redirectToHome();
</script>
</body>
</html>



