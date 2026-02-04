<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meter Bill Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Meter Information</h1>
    <div class="container">
        <table>
            <tr>
                <th>Meter No</th>
                <th>Total</th>
                <th>Bill</th>
                <th>Unit</th>
                <th>Month</th>
            </tr>
            <%@page import="java.sql.DriverManager" %>
            <%@page import="java.sql.ResultSet" %>
            <%@page import="java.sql.Statement" %>
            <%@page import="java.sql.Connection" %>
            <%
                String driver = "com.mysql.jdbc.Driver";
                String connectionURL = "jdbc:mysql://localhost:3306/";
                String database = "electricity";
                String userid = "root";
                String password = "";
                try {
                    Class.forName(driver);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    connection = DriverManager.getConnection(connectionURL + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM meter";
                    resultSet = statement.executeQuery(sql);

                    while (resultSet.next()) {
            %>
                        <tr>
                            <td><%= resultSet.getString("meter_no") %></td>
                            <td><%= resultSet.getString("total") %></td>
                            <td><%= resultSet.getString("bill") %></td>
                            <td><%= resultSet.getString("unit") %></td>
                            <td><%= resultSet.getString("month") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
