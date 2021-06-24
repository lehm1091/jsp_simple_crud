<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>View Users</title>
    </head>
    <body>

        <%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <h1>Users List</h1>

        <%

                    List<User> list = new ArrayList<User>();
                    try {
                        list = UserDao.getAllRecords();
                        pageContext.setAttribute("list", list);


                        //out.println(list.toString());
                    } catch (Exception e) {
                        out.println("An exception occurred: " + e.getMessage());
                    }
        %>

        <table border="1" width="90%">
            <tr><th>Id</th><th>Name</th><th>Password</th><th>Email</th><th>Sex</th><th>Country</th><th>Edit</th><th>Delete</th></tr>
            <c:forEach items="${list}" var="u">
             <tr><td>${u.id}</td>
                 <td>${u.name}</td>
                 <td>${u.password}</td>
                 <td>${u.email}</td>
                 <td>${u.sex}</td>
                 <td>${u.country}</td>
                 <td><a href="editform.jsp?id=${u.id}">Edit</a></td>
                 <td><a href="deleteuser.jsp?id=${u.id}">Delete</a></td></tr>

                </c:forEach>
        </table>
        <br/><a href="adduserform.jsp">Add New User</a>

    </body>
</html>