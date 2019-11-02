<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>

<nav class="navbar navbar-dark bg-dark">

    <div class="col-12 col-md-8"></div>
    <div class="col-6 col-md-4">
        <button type="button" class="btn btn-light my-2">Home page</button>
    </div>
</nav>
<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 150px;">
    <h1 class="text-center">Search results:</h1>

</div>


<%
    int count = 0;
    String color = "#F9EBB3";
    if (request.getAttribute("piList") != null) {
        ArrayList al = (ArrayList) request.getAttribute("piList");
        System.out.println(al);
        Iterator itr = al.iterator();
        while (itr.hasNext()) {

            if ((count % 2) == 0) {
                color = "#eeffee";
            }
            count++;
            ArrayList pList = (ArrayList) itr.next();
%>
<div class="container">
    <div class="row">
        <div class="col">
<%--            <tools:img path="/img/placeholder.jpg"/>--%>
            <img src="img/placeholder.png">

        </div>
        <div class="col">
            <h3><%=pList.get(1)%></h3>
            <h6>Available</h6>
            <p><%=pList.get(2)%></p>
            <h6>Price</h6>
            <p><%=pList.get(3)%></p>
            <h6>Category</h6>
            <p><%=pList.get(4)%></p>
            <h6>Description</h6>
            <p><%=pList.get(5)%></p>
            <h6>Location (section number)</h6>
            <p><%=pList.get(6)%></p>
        </div>
        <%
                }
            }
            if (count == 0) {
        %>
        <tr>
            <td colspan=4 align="center"
                style="background-color:#eeffee"><b>No Record Found..</b></td>
        </tr>
        <%            }
        %>

        <img src="img/store-layout.png">
    </div>

</div>

</body>
</html>