<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Product" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>

<html>
<head>
    <title>RESULTS</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="col-12 col-md-8"></div>
    <div class="col-6 col-md-4">
        <a class="btn btn-light my-2" href="./index.jsp">Home page</a>
    </div>
</nav>

<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 100px;">
    <h1 class="text-center">Search results:</h1>

</div>
<%
    int count = 0;
    if (request.getAttribute("prodsList") != null) {
        List<Product> al = (List<Product>) request.getAttribute("prodsList");
        Iterator itr = al.iterator();
        while (itr.hasNext()) {
            count++;
            Product product = (Product) itr.next();
%>
<div class="container">

    <div class="container mb-5" style="height:100%">
    <div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
        <h2 class="text-center"><%=product.getProductName()%></h2>
    </div>

    <div class="row">

        <div class="col">
            <img alt="product picture" src="img/placeholder.png" width="300px" height="300px"
                 style="margin: 0 auto; display: block;">
        </div>

        <div class="col mt-3">
            <h6><b>Available:</b> <%=product.getQuant()%>
            </h6>
            <h6><b>Price:</b> <%=product.getPrice()%>
            </h6>
            <h6><b>Category:</b> <%=product.getCategory()%>
            </h6>
            <h6>Description</h6>
            <p><%=product.getDescription()%>
            </p>
            <h6><b>Location (section number):</b> <%=product.getSectionNum()%>
            </h6>

            <form name="frm" method="get" action="listadder">
                <button class="btn btn-dark my-2" name="productId" value="<%=product.getId()%>">Add to list</button>
            </form>
        </div>

    </div>
    </div>
</div>
        <%
                }
            }
            if (count == 0) {
        %>



<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 150px;">
            <h6>No Record Found..</h6>

        </div>

        <% }
        %>


<jsp:include page="Footer.jsp"/>
</body>
</html>