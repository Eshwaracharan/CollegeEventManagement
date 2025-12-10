<%@ page import="java.util.*,com.example.webapp.servlet.model.Student,java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details | BTech Portal</title>

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

        main h2 {
            text-align: center;
            font-size: 1.7rem;
            margin-bottom: 25px;
            color: #f2f2f2;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        form {
            background: rgba(55, 53, 53, 0.08);
            backdrop-filter: blur(10px);
            padding: 25px 20px;
            margin-bottom: 30px;
            border-radius: 12px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        form h1 {
            width: 100%;
            text-align: center;
            margin-bottom: 15px;
            font-size: 1.5rem;
            color: #f2f2f2;
            letter-spacing: 1px;
        }

        form input[type="text"] {
            padding: 12px 15px;
            border-radius: 8px;
            border: none;
            flex: 1 1 200px;
            max-width: 300px;
            background: rgba(255,255,255,0.15);
            color: #fff;
            font-size: 1rem;
            outline: none;
            transition: 0.3s;
        }

        form input[type="text"]::placeholder {
            color: #ddd;
        }

        form input[type="text"]:focus {
            background: rgba(255,255,255,0.25);
        }

        form input[type="submit"],
        form a {
            padding: 12px 25px;
            border-radius: 8px;
            border: none;
            background: #1e40af;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }

        form input[type="submit"]:hover,
        form a:hover {
            background: #fff;
            color: #000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
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

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        td {
            color: #e0e0e0;
        }

        .no-data {
            text-align: center;
            padding: 40px 0;
            font-size: 1.3rem;
            color: #ccc;
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
<main>
    <form action="MyEvents" method="get">
        <h1>Search Student</h1>
        <input type="text" name="id" placeholder="Enter Student ID">
        <input type="submit" value="Get Data">
        <a href="collagedashbord.jsp">Go Back</a>
    </form>

    <%
        List<Student> all = (List<Student>) request.getAttribute("all");
        if (all != null && !all.isEmpty()) {
    %>
    <h2>Student Records</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Branch</th>
                <th>Year</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Student s : all) {
        %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getEmail() %></td>
                <td><%= s.getBranch() %></td>
                <td><%= s.getYear() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <div class="no-data">
        <p>No student data found. Try searching again!</p>
    </div>
    <%
        }
    %>
</main>
</body>
</html>
