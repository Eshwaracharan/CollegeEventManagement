<%@ page import="java.util.*,com.example.webapp.servlet.model.Student,com.example.webapp.servlet.model.Event,com.example.webapp.servlet.model.MyRigister" %>
<%@ page import="com.example.webapp.servlet.dao.Studentdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details | BTech Event Portal</title>

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
            max-width: 1000px;
            margin: 40px auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            backdrop-filter: blur(12px);
        }

        .student-info {
            background: rgba(255,255,255,0.08);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .student-info h2 {
            text-align: center;
            font-size: 1.6rem;
            margin-bottom: 20px;
            text-transform: uppercase;
            color: #f2f2f2;
        }

        .student-info p {
            font-size: 1rem;
            margin: 10px 0;
            color: #e0e0e0;
        }

        .student-info strong {
            color: #4fc3f7;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        th {
            background: rgba(255,255,255,0.15);
            text-transform: uppercase;
            font-weight: 600;
            color: #fff;
        }

        td {
            color: #e0e0e0;
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        .no-events, .invalid {
            text-align: center;
            padding: 40px 0;
            font-size: 1.3rem;
            color: #ccc;
        }

        .btn-back {
            display: inline-block;
            text-decoration: none;
            background: #1e40af;
            color: #fff;
            padding: 12px 25px;
            border-radius: 8px;
            transition: 0.3s ease;
            text-align: center;
            margin-top: 30px;
        }

        .btn-back:hover {
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
                padding: 20px;
            }
            th, td {
                padding: 10px;
                font-size: 0.9rem;
            }
            header h1 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>

<body>
<header>
    <h1>Student Registration Details</h1>
    <a href="allstudents">Back to All Students</a>
</header>

<main>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        Studentdao obj = new Studentdao();
        Student stu = obj.getById(id);
        List<MyRigister> arr = (List<MyRigister>) request.getAttribute("rst");

        if (stu == null) {
    %>
        <div class="invalid">Enter a valid Student ID.</div>
    <%
        } else {
    %>
    <div class="student-info">
        <h2>Student Information</h2>
        <p><strong>Student ID:</strong> <%= stu.getId() %></p>
        <p><strong>Name:</strong> <%= stu.getName() %></p>
        <p><strong>Branch:</strong> <%= stu.getBranch() %></p>
        <p><strong>Year:</strong> <%= stu.getYear() %></p>
    </div>

    <h2 style="text-align:center; text-transform:uppercase; color:#f2f2f2;">Registered Events</h2>
    <%
        if (arr == null || arr.isEmpty()) {
    %>
        <div class="no-events">This student has not registered for any events yet.</div>
    <%
        } else {
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
        }
    }
    %>

    <div style="text-align:center;">
        <a href="allstudents" class="btn-back"> Go Back</a>
    </div>
</main>
</body>
</html>
