<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vaccines List</title>
    <style>
        :root {
            --primary-color: #2196F3;
            --secondary-color: #FFC107;
            --danger-color: #f44336;
            --success-color: #4CAF50;
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
            max-width: 1200px;
            width: 95%;
            margin: 0 auto;
            background: white;
            padding: 20px;
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

        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin: 0 -15px;
            padding: 0 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #f1f1f1;
            transition: background-color 0.3s ease;
        }

        .action-link {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            color: white;
            font-weight: 500;
            transition: opacity 0.3s ease;
            display: inline-block;
            text-align: center;
            border: none;
            cursor: pointer;
        }

        .update-link {
            background-color: var(--primary-color);
        }

        .delete-link {
            background-color: var(--danger-color);
        }

        .action-link:hover {
            opacity: 0.8;
        }

        .register-btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: var(--success-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
            transition: transform 0.3s ease;
            text-align: center;
        }

        .register-btn:hover {
            transform: translateY(-2px);
        }

        @media screen and (max-width: 768px) {
            .container {
                padding: 10px;
                width: 100%;
            }

            table {
                font-size: 0.9rem;
            }

            th, td {
                padding: 8px;
            }

            .action-link {
                padding: 4px 8px;
                font-size: 0.8rem;
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

            table {
                font-size: 0.8rem;
            }

            th, td {
                padding: 6px;
            }

            .action-link {
                padding: 3px 6px;
                font-size: 0.7rem;
            }

            .register-btn {
                width: 100%;
                text-align: center;
                padding: 10px;
                font-size: 0.9rem;
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
            <a href="${pageContext.request.contextPath}/registerVaccine">Register New Vaccine</a>
        </div>
        
        <h2 style="color: var(--primary-color); text-align: center; margin-bottom: 20px;">Vaccines List</h2>
        
        <!-- Wrap your table in a responsive div -->
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Company</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vaccine}" var="vac">
                        <c:url var="UpdateLink" value="/updateVaccine">
                            <c:param name="vaccineId" value="${vac.vaccineId}"/>
                        </c:url>
                        <tr>
                            <td>${vac.vaccineId}</td>
                            <td>${vac.vaccineName}</td>
                            <td>${vac.vaccineDescription}</td>
                            <td>${vac.vaccineType}</td>
                            <td>${vac.vaccineCompany}</td>
                            <td><a href="${UpdateLink}" class="action-link update-link">Update</a></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/deleteVaccine" method="post" style="display: inline;">
                                    <input type="hidden" name="vaccineId" value="${vac.vaccineId}" />
                                    <button type="submit" class="action-link delete-link" onclick="return confirm('Are you sure you want to delete this vaccine?');">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/registerVaccine" class="register-btn">Register New Vaccine</a>
        </div>
    </div>
</body>
</html>