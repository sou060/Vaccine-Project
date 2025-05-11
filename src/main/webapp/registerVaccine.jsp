<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Vaccine</title>
    <style>
        :root {
            --primary-color: #2196F3;
            --secondary-color: #FFC107;
            --success-color: #4CAF50;
            --background-color: #f5f5f5;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
    </style>
</head>
<body>
<h2>Register New Vaccine</h2>

<form action="registerVaccine" method="post">
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
    <h3>Registered Vaccine Details:</h3>
    <p>Name: ${vaccine.vaccineName}</p>
    <p>Description: ${vaccine.vaccineDescription}</p>
    <p>Type: ${vaccine.vaccineType}</p>
    <p>Company: ${vaccine.vaccineCompany}</p>
</c:if>
</body>
</html>