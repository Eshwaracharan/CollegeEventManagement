<%@ page import="java.util.*,com.example.webapp.servlet.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | BTech Event Portal</title>

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
            width: 85%;
            max-width: 900px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }

        .content h2 {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: #fff;
        }

        .content p {
            font-size: 1rem;
            line-height: 1.7;
            margin-bottom: 15px;
            color: #eee;
        }

        .student-info {
            margin-top: 25px;
            background: rgba(255,255,255,0.08);
            padding: 20px;
            border-radius: 10px;
        }

        .student-info h3 {
            font-size: 1.4rem;
            margin-bottom: 10px;
        }

        .student-info p {
            font-size: 1.1rem;
            margin-bottom: 6px;
            color: #e0e0e0;
        }

        .actions {
            margin-top: 30px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .actions a {
            text-decoration: none;
            background: #1e40af;
            color: #fff;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            letter-spacing: 0.5px;
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
    <h1>Welcome, <%= current.getName() %> </h1>
    <a href="logout">Logout</a>
</header>

<div class="content">
    <h2>About the Event Management Portal</h2>
    <p>
        The <strong>BTech Event Management Portal</strong> is your all-in-one digital platform for exploring, registering,
        and tracking college events. Stay updated with the latest cultural, technical, and academic events right from your dashboard.
    </p>

    <p>
        Seamlessly connect with event organizers, manage your registrations, and keep track of your achievements  
        all while enjoying a clean and easy-to-navigate interface.
    </p>

    <div class="student-info">
        <h3>Your Profile</h3>
        <p><strong>Student ID:</strong> <%= current.getId() %></p>
        <p><strong>Name:</strong> <%= current.getName() %></p>
        <p><strong>Branch:</strong> <%= current.getBranch() %></p>
        <p><strong>Year:</strong> <%= current.getYear() %></p>
    </div>

    <div class="actions">
        <a href="changepass.jsp">Change Password</a>
        <a href="upcoming">Upcoming Events</a>
        <a href="MyEvents">My Registrations</a>
    </div>
</div>
</body>
</html>
