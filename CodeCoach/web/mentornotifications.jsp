<%-- 
    Document   : mentornotifications
    Created on : Jun 19, 2023, 1:43:32 PM
    Author     : giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor Notification</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
       <div class="container">
        <div class="card">
            <div class="card-header">
                Notification
            </div>
            <div class="card-body">
                <div class="alert alert-primary" role="alert">
                    Bạn có một thông báo mới.
                </div>
                <div class="alert alert-success" role="alert">
                    Thông báo đã được gửi thành công.
                </div>
                <div class="alert alert-danger" role="alert">
                    Không thể gửi thông báo. Vui lòng thử lại sau.
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
