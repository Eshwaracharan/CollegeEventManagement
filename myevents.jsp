<%@ page import="java.util.*,com.example.webapp.servlet.model.MyRigister,com.example.webapp.servlet.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Event Registrations | BTech Event Portal</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        header h1 {
            font-size: 1.8rem;
            letter-spacing: 1px;
        }

        header a {
            color: #fff;
            text-decoration: none;
            background: #1e40af;
            padding: 8px 20px;
            border-radius: 6px;
            transition: all 0.3s;
        }

        header a:hover {
            background: #fff;
            color: #000;
        }

        .content {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            font-size: 1.8rem;
            color: #fff;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            color: #f1f1f1;
        }

        th, td {
            text-align: center;
            padding: 12px 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            font-weight: 600;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }

        .no-events {
            text-align: center;
            color: #ddd;
            font-size: 1.2rem;
            margin: 40px 0;
        }

        .actions {
            text-align: center;
            margin-top: 25px;
        }

        .actions a {
            text-decoration: none;
            background: #1e40af;
            color: #fff;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .actions a:hover {
            background: #fff;
            color: #000;
        }

        footer {
            margin-top: auto;
            padding: 15px;
            text-align: center;
            color: #ccc;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<%
    Student current = (Student) session.getAttribute("student");
%>

<header>
    <h1><%= current != null ? "Welcome, " + current.getName() : "My Events" %></h1>
    <!-- <a href="logout">Logout</a> -->
</header>

<div class="content">
    <h2>My Event Registrations</h2>

    <%
        List<MyRigister> arr = (List<MyRigister>) request.getAttribute("rst");
        if (arr != null && !arr.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Registration ID</th>
                    <th>Event ID</th>
                    <th>Event Name</th>
                    <th>Event Date</th>
                    <th>Registration Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (MyRigister rst : arr) {
                %>
                <tr>
                    <td><%= rst.r_id %></td>
                    <td><%= rst.e_id %></td>
                    <td><%= rst.Ename %></td>
                    <td><%= rst.Edt %></td>
                    <td><%= rst.Rdt %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <div class="no-events">
            <p>You have not registered for any events yet.</p>
        </div>
    <%
        }
    %>

    <div class="actions">
        <a href="studentdashbord.jsp"> Back to Dashboard</a>
    </div>
</div>
</body>
</html>
