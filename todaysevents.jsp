<%@ page import="java.util.*, com.example.webapp.servlet.model.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Today's Events | BTech Event Portal</title>

  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Poppins", sans-serif; }

    body {
      min-height: 100vh;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 20px;
    }

    h1 {
      font-size: 2.5rem;
      margin-bottom: 30px;
      color: #fff;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
    }

    .events-table {
      width: 90%;
      max-width: 800px;
      border-collapse: collapse;
      background: rgba(255,255,255,0.1);
      backdrop-filter: blur(8px);
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 6px 20px rgba(0,0,0,0.3);
    }

    .events-table th, .events-table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid rgba(255,255,255,0.2);
    }

    .events-table th {
      background: rgba(30, 64, 175, 0.8);
      font-weight: 600;
    }

    .events-table tr:last-child td {
      border-bottom: none;
    }

    .no-events {
      margin-top: 30px;
      font-size: 1.3rem;
      color: yellow;
    }

    .back-link {
      margin-top: 25px;
      text-decoration: none;
      color: #1e40af;
      font-weight: 500;
      transition: all 0.3s;
    }

    .back-link:hover {
      color: #fff;
    }

    @media (max-width: 480px) {
      .events-table th, .events-table td {
        font-size: 0.9rem;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

<h1>Today's Events</h1>

<%
    List<Event> events = (List<Event>) request.getAttribute("todaysEvents");
    if(events != null && !events.isEmpty()){
%>
<table class="events-table">
  <thead>
    <tr>
      <th>ID</th>
      <th>Event Name</th>
      <th>Date</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <%
      for(Event e : events){
    %>
    <tr>
      <td><%= e.getId() %></td>
      <td><%= e.getEname() %></td>
      <td><%= e.getEdate() %></td>
      <td><%= e.grtEdis() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
<%
    } else {
%>
<p class="no-events">No events are scheduled for today.</p>
<%
    }
%>

<a href="collagedashbord.jsp" class="back-link"> Back to Dashboard</a>

</body>
</html>
