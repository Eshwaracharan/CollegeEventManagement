<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Student | BTech Event Portal</title>

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
      /* width: 80%; */
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
      width: 320px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
      width: 50%;
    }

    .form-container label {
      display: block;
      margin-bottom: 5px;
      font-weight: 500;
    }

    .form-container input,
    .form-container select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border-radius: 6px;
      border: 1px solid #fff;
      background: rgba(255,255,255,0.1);
      color: #fff;
      font-size: 1rem;
    }

    .form-container input::placeholder {
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

<h1>Add Student</h1>

<div class="form-container">
  <%
      String message = (String) request.getAttribute("msg");
      if (message != null) {
  %>
      <p class="message"><%= message %></p>
  <%
      }
  %>
  <form action="AddStudentServlet" method="post">
    
    <label for="id">Student ID</label>
    <input type="number" name="id" id="id" placeholder="Enter Student ID" required>

    <label for="name">Name</label>
    <input type="text" name="name" id="name" placeholder="Enter full name" required>

    <label for="email">Email</label>
    <input type="email" name="email" id="email" placeholder="Enter email" required>

    <label for="password">Password</label>
    <input type="password" name="password" id="password" placeholder="Enter password" value="root">

    <label for="branch">Branch</label>
    <input type="text" name="branch" id="branch" placeholder="Enter branch">

    <label for="year">Year</label>
    <input type="number" name="year" id="year" placeholder="Enter year" min="1" max="5">

    <input type="submit" value="Add Student">
  </form>

  <a href="collagedashbord.jsp" class="back-link"> Back to Dashboard</a>
</div>

</body>
</html>
