<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Ongoing Elections</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 85%;
            margin: 0 auto;
            padding: 40px;
        }

        .title {
            text-align: center;
            font-size: 2.5rem;
            color: #34495e;
            margin-bottom: 30px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .election-list {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .election-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
            width: 280px;
            padding: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #ddd;
        }

        .election-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 20px 30px rgba(0, 0, 0, 0.15);
        }

        .election-name {
            font-size: 1.6rem;
            color: #2980b9;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
        }

        .election-details p {
            margin-bottom: 12px;
            color: #555;
            font-size: 1rem;
        }

        .vote-btn {
            display: block;
            padding: 12px 25px;
            background-color: #27ae60;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            margin-top: 15px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .vote-btn:hover {
            background-color: #2ecc71;
            transform: scale(1.05);
        }

        .no-election-msg {
            text-align: center;
            font-size: 1.4rem;
            color: #e74c3c;
            margin-top: 40px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
            }

            .election-card {
                width: 100%;
                margin-bottom: 20px;
            }

            .title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="title">Ongoing Elections in Your State</h2>

        <!-- Check if there are elections -->
        <c:if test="${not empty activeElections}">
            <div class="election-list">
                <c:forEach var="election" items="${activeElections}">
                    <div class="election-card">
                        <h3 class="election-name">${election.name}</h3>
                        <div class="election-details">
                            <p><strong>Start Date:</strong> ${election.startDate}</p>
                            <p><strong>End Date:</strong> ${election.endDate}</p>
                            <p><strong>State:</strong> ${election.state}</p>
                            <p><strong>District:</strong> ${election.district}</p>
                        </div>
                        <!-- If the election is active, show the vote button -->
                        <c:if test="${election.active}">
                            <a href="/vote/${election.codenum}" class="vote-btn">Vote Now</a>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- If there are no elections or the list is empty, show this message -->
        <c:if test="${empty activeElections}">
            <p class="no-election-msg">No ongoing elections in your state.</p>
        </c:if>
    </div>
</body>
</html>
