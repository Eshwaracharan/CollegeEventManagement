<%@ page import="java.util.*,com.example.webapp.servlet.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password | Student Portal</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            background-repeat: no-repeat;
            background-size: cover;  
            margin: 0;
            padding: 0;
            color: #333;
            height: 100vh;
        }

        .container {
            max-width: 420px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            margin: 80px auto;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #4a148c;
            font-size: 1.8rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="password"],
        input[type="text"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #6f42c1;
            box-shadow: 0 0 5px rgba(111, 66, 193, 0.4);
        }

        input[type="submit"] {
            background: #203a43;
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background:  #2c5364;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 0.95rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Change Your Password</h1>
        <form action="changepassword" method="post">
            <input type="password" name="currentpass" placeholder="Current Password" required>
            <input type="password" name="newpass1" placeholder="New Password" required>
            <input type="password" name="newpass2" placeholder="Re-enter New Password" required>
            <input type="submit" value="Update Password">
        </form>
        <a href="studentdashbord.jsp" class="back-link">Back to Dashboard</a>
        <%
            String error=(String)request.getAttribute("error");
            String succ=(String)request.getAttribute("succ");
            if(error!=null && !error.isEmpty()){
        %>
        <p style="color: red;"><%= error %></p>
        <%
            }
            else if(succ!=null && !succ.isEmpty()){
        %>
        <p style="color: rgb(43, 142, 43);"><%= succ %></p>
        <%
            }
        %>
    </div>
</body>
</html>
