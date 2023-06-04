<%-- 
    Document   : VerifiAccount
    Created on : May 29, 2023, 6:59:19 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Account Verification</h1>
        
        <form action="VerifyAccountController" method="POST">
<!--      Email<input type="text"  name="email" required><br>-->
      <p>Hello : ${sessionScope.email}</p>
      Token : <input type="text"  name="token" required><br>
      <button type="submit">Verify</button>
    </form>
    </body>
</html>
