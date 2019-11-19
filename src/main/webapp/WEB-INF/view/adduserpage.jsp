<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add a new user</title>
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
    <h1 class="text-center">Add a new user</h1>
</div>

<div>
    <%
        if (request.getAttribute("username") != null) {%>
    <div class="container-fluid alert alert-success" role="alert">
        <p>A new user <b><%=request.getAttribute("username")%></b> added!</p>
    </div>

    <%}
    %>
</div>
<div class="container-fluid mx-auto col-sm-3">


    <form method="post" action="addnewuser" class="container-fluid bg-secondary py-3 rounded">
        <div class="">

        <label class="w-40 d-block mx-auto">Name/Login:
            <input type="text" class="form-control mr-sm-5  " name="username">
        </label>
        <label class="w-40 d-block mx-auto">Email:
            <input type="email" class="form-control mr-sm-5  " name="email">
        </label>
        <label class="w-40 d-block mx-auto">Password:
            <input type="password" class="form-control mr-sm-5" name="password">
        </label>
        <label class="w-40 d-block mx-auto">Repeat password:
            <input type="password" class="form-control mr-sm-6" name="passwordrepeat">
        </label>
        <label class="w-auto">
            <button type="submit" class="btn btn-outline-dark mx-auto">Save</button>
        </label>
        </div>
    </form>

</div>


<jsp:include page="Footer.jsp"/>
</body>
</html>
