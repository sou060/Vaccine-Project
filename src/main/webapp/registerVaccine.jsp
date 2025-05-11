<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Vaccine</title>
    <style>
        :root {
            --primary-color: #2196F3;
            --secondary-color: #FFC107;
            --success-color: #4CAF50;
            --danger-color: #f44336;
            --background-color: #f5f5f5;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            width: 95%;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            padding: 20px;
            background: var(--primary-color);
            color: white;
            border-radius: 8px;
        }

        .navigation {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .navigation a {
            margin: 0 15px;
            text-decoration: none;
            color: var(--primary-color);
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .navigation a:hover {
            color: var(--secondary-color);
        }

        h2 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: var(--primary-color);
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: var(--success-color);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
        }

        .back-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0d8bf0;
        }

        .details-container {
            margin-top: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }

        .details-container h3 {
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .details-container p {
            margin: 8px 0;
            color: #333;
        }

        @media screen and (max-width: 768px) {
            .container {
                width: 100%;
                padding: 20px;
            }
            .navigation {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }
        }

        @media screen and (max-width: 480px) {
            body {
                padding: 10px;
            }
            .header h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Vaccine Management System</h1>
        </div>
        
        <div class="navigation">
            <a href="${pageContext.request.contextPath}/show-vaccine">View All Vaccines</a>
        </div>
        
        <h2>Register New Vaccine</h2>

        <form action="${pageContext.request.contextPath}/registerVaccine" method="post">
            <div class="form-group">
                <label for="vaccineName">Vaccine Name:</label>
                <input type="text" id="vaccineName" name="vaccineName" required>
            </div>

            <div class="form-group">
                <label for="vaccineDescription">Description:</label>
                <input type="text" id="vaccineDescription" name="vaccineDescription" required>
            </div>

            <div class="form-group">
                <label for="vaccineType">Vaccine Type:</label>
                <input type="text" id="vaccineType" name="vaccineType" required>
            </div>

            <div class="form-group">
                <label for="vaccineCompany">Company:</label>
                <input type="text" id="vaccineCompany" name="vaccineCompany" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Register Vaccine" class="submit-btn">
            </div>
        </form>

        <c:if test="${not empty vaccine}">
            <div class="details-container">
                <h3>Registered Vaccine Details:</h3>
                <p><strong>Name:</strong> ${vaccine.vaccineName}</p>
                <p><strong>Description:</strong> ${vaccine.vaccineDescription}</p>
                <p><strong>Type:</strong> ${vaccine.vaccineType}</p>
                <p><strong>Company:</strong> ${vaccine.vaccineCompany}</p>
            </div>
            
            <a href="${pageContext.request.contextPath}/show-vaccine" class="back-btn">View All Vaccines</a>
        </c:if>
    </div>
</body>
</html>