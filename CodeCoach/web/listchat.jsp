<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatRoom"%>
<%@page import="model.ChatMessages"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Chat</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="chat-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <div class="main-wrapper">
            <div class="content">
                <div class="container-fluid">
                    <div class="settings-back mb-3">
                        <a href="home">
                            <i class="fas fa-long-arrow-alt-left"></i> <span>Back</span>
                        </a>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 mb-4">
                            <div class="chat-window">
                                <div class="chat-cont-left">
                                    <div class="chat-header">
                                        <span>Chat</span>
                                    </div>
                                    <div class="chat-users-list">
                                        <div class="chat-scroll">
                                            <% List<ChatRoom> chatRooms = (List<ChatRoom>) request.getAttribute("chatRooms"); %> 
                                            <ul class="list-group">
                                                <% for (ChatRoom chatRoom : chatRooms) {%>
                                                <li class="list-group-item">
                                                    <a href="listchat?chatRoomId=<%= chatRoom.getChatRoomId()%>"><%= chatRoom.getChatRoomName()%></a>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat-cont-right">
                                    <% String selectedChatRoomId = (String) request.getAttribute("selectedChatRoomId"); %>
                                    <% List<ChatMessages> listChatMessages = (List<ChatMessages>) request.getAttribute("listChatMessages"); %>
                                    <% List<ChatRoom> listChatRooms = (List<ChatRoom>) request.getAttribute("listChatRooms"); %>
                                    <% List<Users> listUsers = (List<Users>) request.getAttribute("listUsers"); %>
                                    <% if (selectedChatRoomId != null) { %>
                                    <div class="row">
                                        <div class="col-sm">
                                            <h2><%
                                                for (ChatRoom chatroom : listChatRooms) {
                                                    if (chatroom.getChatRoomId() == Integer.parseInt(selectedChatRoomId)) {
                                                        out.print(chatroom.getChatRoomName());
                                                    }
                                                }
                                                %></h2>
                                        </div>    

                                        <div class="col-sm" style="text-align: right">
                                            <div class="chat-options">
                                                <a href="" data-bs-toggle="modal"
                                                   data-bs-target="#voice_call">
                                                    <i class="material-icons">local_phone</i>
                                                </a>
                                                <a href="" data-bs-toggle="modal"
                                                   data-bs-target="#video_call">
                                                    <i class="material-icons">videocam</i>
                                                </a>
                                                <a href="">
                                                    <i class="material-icons">more_vert</i>
                                                </a>
                                            </div>  
                                        </div>

                                    </div>    
                                    <hr>    
                                    <div class="chat-messages">
                                        <% for (ChatMessages chatMessage : listChatMessages) {%>
                                        <div class="media received d-flex">
                                            <div class="avatar flex-shrink-0">
                                                <img src="assets/images/users/<%=chatMessage.getUserId()%>.png" alt="User Image"
                                                     class="avatar-img rounded-circle">
                                            </div>
                                            <div class="media-body flex-grow-1">
                                                <p><strong><%
                                                    for (Users user : listUsers) {
                                                        if (user.getUserId() == chatMessage.getUserId()) {
                                                            out.print(user.getfName() + " " + user.getlName());
                                                        }
                                                    }
                                                        %></strong> - <%= chatMessage.getSentDateTime().substring(0, 16)%></p>
                                                <p><%= chatMessage.getMessage()%></p>
                                            </div>
                                            


                                        </div>
                                            <br><br>
                                        <% }%>
                                    </div>
                                    <form action="listchat" method="post" class="chat-form">
                                        <div class="input-group mb-3">
                                            <input type="text" name="message" class="form-control" placeholder="Type your message" required>
                                            <div class="input-group-append">
                                                <input type="hidden" name="chatRoomId" value="<%= selectedChatRoomId%>">
                                                <button type="submit" class="btn btn-primary">Send</button>
                                            </div>
                                        </div>
                                    </form>
                                    <% }%>
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
        <%@include file="footer.jsp" %>
    </body>
</html>
