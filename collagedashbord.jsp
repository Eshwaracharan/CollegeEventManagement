<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>College Dashboard | Event Management Portal</title>

  <style>
    /* Reset & Base Styles */
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
      color: #fff;
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      overflow-x: hidden;
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
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
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

    h2 {
      margin-top: 60px;
      font-size: 2.5rem;
      color: #fff;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.6);
      letter-spacing: 1px;
    }

    .mn {
      margin-top: 50px;
      display: flex;
      justify-content: center;
      gap: 50px;
      flex-wrap: wrap;
      width: 80%;
      max-width: 1000px;
    }

    .card {
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.3);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 40px 30px;
      width: 240px;
      text-align: center;
      transition: all 0.3s ease;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
      border-color: #000;
    }

    .card a {
      display: block;
      text-decoration: none;
      color: #fff;
      background: #1e40af;
      padding: 12px 0;
      border-radius: 8px;
      font-weight: 500;
      font-size: 1.1rem;
      transition: all 0.3s ease;
      margin-top: 10px;
    }

    .card a:hover {
      background: #fff;
      color: #000;
    }

    .card p {
      font-size: 1.4rem;
      font-weight: 500;
      margin-bottom: 20px;
      color: #f9f9f9;
    }

    footer {
      margin-top: auto;
      padding: 20px;
      text-align: center;
      color: #ccc;
      font-size: 0.9rem;
    }

    @media (max-width: 768px) {
      h2 {
        font-size: 2rem;
        margin-top: 40px;
      }

      .mn {
        width: 90%;
        flex-direction: column;
        align-items: center;
        gap: 25px;
      }

      .card {
        width: 90%;
      }
    }
  </style>
</head>
<body>

<header>
    <h1> welcome!</h1>
    <a href="logout">Logout</a>
</header>

<h2>College Dashboard</h2>

<div class="mn">
  <div class="card">
    <p>Add Student</p>
    <a href="addstudent.jsp">Go >></a>
  </div>

  <div class="card">
    <p>Add Event</p>
    <a href="addevent.jsp">Go >></a>
  </div>

  <div class="card">
    <p>Upcoming Events</p>
    <a href="upcoming">Go >></a>
  </div>

  <div class="card">
    <p>Today's Events</p>
    <a href="todayevents">Go >></a>
  </div>
  <div class="card">
    <p>About Students</p>
    <a href="allstudents">Go >></a>
  </div>
</div>
</body>
</html>
