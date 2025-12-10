<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Event Management Portal</title>
  <style>
    /* Reset & Base Styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      color: #fff;
      transition: all 0.3s ease;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    }

    h1 {
      font-size: 3.5rem;
      margin-bottom: 50px;
      padding-left: 150px;
      color: #fff;
      text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
      letter-spacing: 1px;
    }

    .mn {
      display: flex;
      justify-content: center;
      gap: 60px;
      flex-wrap: wrap;
      width: 60%;
      max-width: 1000px;
    }

    .card {
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 40px 30px;
      width: 260px;
      text-align: center;
      transition: all 0.3s ease;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }

    .card:hover {
      transform: translateY(-4px);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
      border-color: #000;
    }

    .card p {
      font-size: 1.4rem;
      font-weight: 500;
      margin-bottom: 20px;
      color: #f9f9f9;
    }

    .card input[type="text"],
    .card input[type="password"] {
      height: 40px;
      margin-bottom: 10px;
      border-radius: 5px;
      width: 100%;
      border: 1px solid #fff;
      font-size: 16px;
      padding: 0 10px;
      text-align: left;
      background: rgba(255,255,255,0.1);
      color: #fff;
    }

    .card input::placeholder {
      color: #eee;
      text-align: center;
    }

    .card input[type="submit"] {
      display: inline-block;
      width: 100%;
      text-decoration: none;
      background: #1e40af;
      color: #fff;
      padding: 10px 0;
      border-radius: 8px;
      font-weight: 500;
      letter-spacing: 0.5px;
      font-size: 16px;
      cursor: pointer;
      transition: all 0.3s ease;
      border: none;
    }

    .card input[type="submit"]:hover {
      background: #fff;
      color: #000;
    }

    @media (max-width: 768px) {
      h1 {
        font-size: 2.2rem;
        margin-bottom: 30px;
        padding-left: 20px;
      }

      .mn {
        flex-direction: column;
        gap: 25px;
        width: 90%;
        margin: 0 auto;
      }

      .card {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <h1>Event Management Portal</h1>
  <div class="mn">
    <div class="card">
      <%
        String error1=(String)request.getAttribute("mess");
        if(error1!=null && !error1.isEmpty()){
      %>
      <p style="color: red;"><%= error1 %></p>
      <%
        }
      %>
      <p>Login as College</p>
      <form action="collage" method="post">
        <input type="text" name="name" placeholder="Username" required>
        <input type="password" name="pass" placeholder="Password" required>
        <input type="submit" value="GO >>">
      </form>
    </div>
    <div class="card">
      <p>Login as Student</p>
      <%
        String error=(String)request.getAttribute("error");
        if(error!=null && !error.isEmpty()){
      %>
      <p style="color: red;"><%= error %></p>
      <%
        }
      %>
      <form action="stulogin" method="post">
        <input type="text" name="id" placeholder="Student ID" required>
        <input type="password" name="pass" placeholder="Password" required>
        <input type="submit" value="GO >>">
      </form>
    </div>
  </div>
</body>
</html>
