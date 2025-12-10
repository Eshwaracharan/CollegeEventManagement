<%@ page import="java.util.*,com.example.webapp.servlet.model.Student,com.example.webapp.servlet.model.Event,com.example.webapp.servlet.model.Registration" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Confirmation | BTech Event Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            width: 100%;
            padding: 20px 40px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        header h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        header a {
            text-decoration: none;
            color: #fff;
            background: #1e40af;
            padding: 10px 20px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        header a:hover {
            background: #fff;
            color: #000;
        }

        main {
            width: 90%;
            max-width: 600px;
            margin: 60px auto;
            background: rgba(255,255,255,0.1);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            backdrop-filter: blur(12px);
            text-align: center;
        }

        h2 {
            font-size: 1.2rem;
            color: #e0e0e0;
            margin: 10px 0;
        }

        .highlight {
            color: #00e6e6;
            font-weight: 600;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 24px;
            border-radius: 8px;
            background: #1e40af;
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background: #fff;
            color: #000;
        }

        footer {
            margin-top: auto;
            padding: 15px;
            text-align: center;
            font-size: 0.9rem;
            color: #bbb;
        }

        @media (max-width: 768px) {
            main {
                padding: 25px;
            }

            header h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Registration Successful</h1>
    <a href="upcoming" class="back-btn">Back to Events</a>
</header>

<main>
    <%
        Student Stu = (Student) session.getAttribute("student");
        Event ent = (Event) request.getAttribute("event");
        Registration rst = (Registration) request.getAttribute("rig");
    %>

    <h2>Thank you, <span class="highlight"><%= Stu.getName() %></span>!</h2>
    <p style="margin-top: 10px; color: #ccc;">Your registration has been successfully completed.</p>

    <div style="margin-top: 30px; text-align: left;">
        <h2><span class="highlight">Registration ID:</span> <%= rst.Rid %></h2>
        <h2><span class="highlight">Event Name:</span> <%= ent.getEname() %></h2>
        <h2><span class="highlight">Event Date:</span> <%= ent.getEdate() %></h2>
        <h2><span class="highlight">Event ID:</span> <%= ent.getId() %></h2>
        <h2><span class="highlight">Registered On:</span> <%= rst.R_dt %></h2>
    </div>

    <a href="studentdashbord.jsp" class="back-btn" style="margin-top: 30px;"> Back to Dashboard</a>
</main>
</body>
</html>
