<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Vaccine</title>
    <style>
    :root {
        --primary-color: #2196F3;
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
        max-width: 800px;
        width: 95%;
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
        font-size: 2rem;
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
        font-size: 1rem;
    }

    input[type="text"] {
        width: 100%;
        padding: 12px;
        border: 2px solid #ddd;
        border-radius: 4px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus {
        border-color: var(--primary-color);
        outline: none;
        box-shadow: 0 0 0 2px rgba(33, 150, 243, 0.1);
    }

    .button-group {
        display: flex;
        gap: 15px;
        margin-top: 25px;
        flex-direction: row;
    }

    .submit-btn, .cancel-btn {
        flex: 1;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        font-weight: 500;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .submit-btn {
        background-color: var(--success-color);
        color: white;
    }

    .cancel-btn {
        background-color: var(--danger-color);
        color: white;
        text-decoration: none;
        display: inline-block;
    }

    .submit-btn:hover,
    .cancel-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        .container {
            width: 100%;
            padding: 20px;
            margin: 10px;
        }

        h2 {
            font-size: 1.5rem;
        }

        input[type="text"] {
            padding: 10px;
        }
    }

    @media screen and (max-width: 480px) {
        body {
            padding: 10px;
        }

        .container {
            padding: 15px;
            margin: 0;
        }

        .button-group {
            flex-direction: column;
        }

        .submit-btn, .cancel-btn {
            width: 100%;
            margin: 5px 0;
        }

        h2 {
            font-size: 1.2rem;
            margin-bottom: 20px;
        }

        label {
            font-size: 0.9rem;
        }

        input[type="text"] {
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Update Vaccine Details</h2>
        
        <%--@elvariable id="vaccine" type="crmapp"--%>
        <form:form action="${pageContext.request.contextPath}/updateVaccine" method="post" modelAttribute="vaccine">
            <form:hidden path="vaccineId"/>
            
            <div class="form-group">
                <label>Vaccine Name:</label>
                <form:input path="vaccineName" type="text"/>
            </div>
            
            <div class="form-group">
                <label>Description:</label>
                <form:input path="vaccineDescription" type="text"/>
            </div>
            
            <div class="form-group">
                <label>Vaccine Type:</label>
                <form:input path="vaccineType" type="text"/>
            </div>
            
            <div class="form-group">
                <label>Company:</label>
                <form:input path="vaccineCompany" type="text"/>
            </div>
        <div class="form-group">
          <input type="submit" value="Update Vaccine" class="submit-btn"/>
          <a href="${pageContext.request.contextPath}/show-vaccine" class="cancel-btn">Cancel</a>
        </div>
        </form:form>
    </div>
</body>
</html>