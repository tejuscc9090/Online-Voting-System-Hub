<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vote for Candidate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 60px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .party-image {
            width: 50px;
            height: 50px;
            object-fit: contain;
            border-radius: 50%;
        }

        .btn-vote {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
        }

        .btn-vote:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%@ include file="usersidebar.jsp" %>

<div class="container">
    <h2>Select a Candidate to Vote</h2>

    <!-- Success and Error Flash Messages -->
    <c:if test="${not empty success}">
        <div class="alert alert-success text-center">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center">${error}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty candidates}">
            <form action="${pageContext.request.contextPath}/vote/cast" method="post">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>Candidate</th>
                            <th>Party</th>
                            <th>State</th>
                            <th>District</th>
                            <th>Party Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${candidates}">
                            <tr>
                                <td>
                                    <input type="radio" name="candidateId" value="${c.candidateId}" required />
                                </td>
                                <td>${c.candidateName}</td>
                                <td>${c.party}</td>
                                <td>${c.state}</td>
                                <td>${c.district}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty c.image}">
                                            <img src="${pageContext.request.contextPath}/candidate/displaypartyimage/${c.candidateId}" 
                                                 alt="Party Image" class="party-image" />
                                        </c:when>
                                        <c:otherwise>No Image</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-center">
                    <input type="hidden" name="codenum" value="${codenum}" />
                    <button type="submit" class="btn btn-vote">
                        <i class="fas fa-vote-yea"></i> Cast Vote
                    </button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center">No candidates available for your district/state.</div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
