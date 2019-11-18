<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add a new product</title>
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
    <div class="col-12 col-md-6"></div>
    <div class="col-6 col-md-6">
        <a class="btn btn-light my-2" href="./">Home page</a>
        <a class="btn btn-light my-2" href="./userdashboard">Manage Users</a>
        <a href="./dashboard" class="btn btn-light my-2">Back to product dashboard</a>
        <a class="btn btn-light my-2" href="">Log out</a>
    </div>
</nav>

<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
    <h1 class="text-center">Add a new product</h1>
</div>

<div>
    <%
        if (request.getAttribute("prodName") != null) {%>
    <div class="container-fluid alert alert-success" role="alert">
        <p>Your new product <b><%=request.getAttribute("prodName")%></b> added!</p>
    </div>

        <%}
    %>
</div>
    <div class="container-fluid mx-auto mt-5 col-sm-5">


        <form method="post" action="addproduct" class="container-fluid bg-secondary py-5 rounded">

            <label class="w-40 px-5">Name:
                <input type="text" class="form-control mr-sm-5  " name="prodname">
            </label>
            <label class="w-40">Quantity:
                <input type="text" class="form-control mr-sm-5  " name="prodquant">
            </label>
            <label class="w-25 px-5">Price:
                <input type="text" class="form-control mr-sm-5" name="prodprice">
            </label>
            <label class="w-25">Category:
                <input type="text" class="form-control mr-sm-6" name="prodcategory">
            </label>
            <label class="w-25 px-3">Section number:
                <input type="text" class="form-control mr-sm-5 " name="prodsec">
            </label>

            <label class="w-100 px-5">Description:
                <textarea rows="4" cols="50" class="form-control mr-sm-5 " name="proddescr"></textarea>
            </label>
            <br/>
            <label class="w-auto px-5">
            <button type="submit" class="btn btn-outline-dark mx-auto">Save</button>
            </label>
        </form>

</div>


<jsp:include page="Footer.jsp"/>
</body>
</html>
