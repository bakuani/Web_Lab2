<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Point" %>
<%@ page import="java.util.Locale" %>
<html>
<head>
    <title>Результаты проверки</title>
    <style>


               table, th, td {
                    border: 1px solid black;
                    border-collapse: collapse;
                    padding: 12px;
                    color: #000000;
                    width: -webkit-fill-available;
                    }

                td {
                    text-align: center;
                }

                th {
                    background-color:#C1FF9E;
                }
    </style>
</head>
<body>
        <table id="data-table">
            <thead>
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Попадание</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Point> points = (List<Point>) request.getServletContext().getAttribute("results");
                    if (points == null || points.isEmpty()) {
                %>

                <%
                    } else {
                        for (Point point : points) {
                %>
                    <tr>
                        <td><%= String.format(Locale.US, "%.2f", point.getX()) %></td>
                        <td><%= String.format(Locale.US, "%.2f", point.getY()) %></td>
                        <td><%= String.format(Locale.US, "%.2f", point.getR()) %></td>
                        <td><%= point.isHit() ? "Да" : "Нет" %></td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
</body>
</html>