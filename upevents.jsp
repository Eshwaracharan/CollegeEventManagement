<%@ page import="java.util.*,com.example.webapp.servlet.model.Student,java.util.List,com.example.webapp.servlet.model.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Events | BTech Event Portal</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
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
        margin-bottom: 20px;
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

form input[type="submit"] {
    padding: 12px 25px;
    border-radius: 8px;
    border: none;
    background: #1e40af;
    color: #fff;
    font-size: 1rem;
    cursor: pointer;
    transition: 0.3s;
}

form input[type="submit"]:hover {
    background: #fff;
    color: #000;
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

        .no-events {
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

<header>
    <h1>Upcoming Events</h1>
    <%
    if(session.getAttribute("student")!=null){
    %>
    <a href="studentdashbord.jsp">Back to Dashboard</a>
    <%
    }
    else{
    %>
    <a href="collagedashbord.jsp">Back to Dashboard</a>
    <%
    }
    %>
</header>

<main>
    <%
        List<Event> res = (List<Event>) request.getAttribute("up");
        if (!res.isEmpty()) {
            String mess=(String)request.getAttribute("mess");
            if(session.getAttribute("student")!=null){
    %>
    <h2>Coming Up!</h2>
    <form action="register" method="post">
        <h1>Event Registration</h1>
        <input type="text" name="id" placeholder="Event Id for Registration">
        <input type="submit" value="register">
    <%
    if(mess!=null && !mess.isEmpty()){
    %>
    <p style="color: #fff; font-size: 30px; text-align: center;font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;"><%= mess %></p>
    </form>
    <%
    }
    }
    %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>About the Event</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Event x : res) {
            %>
            <tr>
                <td><%= x.getId() %></td>
                <td><%= x.getEname() %></td>
                <td><%= x.getEdate() %></td>
                <td><%= x.grtEdis() %></td>
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
            <p> Currently there are no upcoming events. Check back soon!</p>
        </div>
    <%
        }
    %>
</main>
</body>
</html>
