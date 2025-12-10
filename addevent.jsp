<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Event | BTech Event Portal</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      color: #fff;
    }

    h1 {
      font-size: 2.5rem;
      margin-bottom: 30px;
      color: #fff;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
    }

    .form-container {
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 40px 30px;
      width: 360px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    }

    .form-container label {
      display: block;
      margin-bottom: 5px;
      font-weight: 500;
    }

    .form-container input,
    .form-container textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 6px;
      border: 1px solid #fff;
      background: rgba(255,255,255,0.1);
      color: #fff;
      font-size: 1rem;
    }

    .form-container textarea {
      resize: vertical;
      min-height: 80px;
    }

    .form-container input::placeholder,
    .form-container textarea::placeholder {
      color: #eee;
    }

    .form-container input[type="submit"] {
      background: #1e40af;
      border: none;
      color: #fff;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s;
    }

    .form-container input[type="submit"]:hover {
      background: #fff;
      color: #000;
    }

    .back-link {
      display: block;
      margin-top: 15px;
      text-align: center;
      text-decoration: none;
      color: #1e40af;
      font-weight: 500;
      transition: all 0.3s;
    }

    .back-link:hover {
      color: #fff;
    }
    .message {
      text-align: center;
      margin-bottom: 15px;
      font-weight: 500;
      color: yellow;
    }
    @media (max-width: 480px) {
      .form-container {
        width: 90%;
      }
    }
  </style>
</head>
<body>

<h1>Add Event</h1>

<div class="form-container">
    <%
      String message = (String) request.getAttribute("message");
      if (message != null) {
  %>
      <p class="message"><%= message %></p>
  <%
      }
  %>
  <form action="AddEventServlet" method="post">
    <label for="event_name">Event Name</label>
    <input type="text" name="event_name" id="event_name" placeholder="Enter event name" required>

    <label for="event_date">Event Date</label>
    <input type="date" name="event_date" id="event_date" required>

    <label for="description">Description</label>
    <textarea name="description" id="description" placeholder="Enter event description"></textarea>

    <input type="submit" value="Add Event">
  </form>

  <a href="collagedashbord.jsp" class="back-link">Back to Dashboard</a>
</div>

</body>
</html>
