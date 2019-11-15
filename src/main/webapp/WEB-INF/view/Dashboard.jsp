<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Management Dashboard</title>
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
        <a class="btn btn-light my-2" href="./">Home page</a>
        <a class="btn btn-light my-2" href="#">Manage Users</a>
        <a class="btn btn-light my-2" href="./">Log out</a>
    </div>
</nav>

<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
    <h1 class="text-center">All products in database</h1>

</div>


<div class="container-fluid d-block mx-auto mt-5 col-sm-8">
    <table class="table">

        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Description</th>
            <th scope="col">Sec.No</th>
            <th></th>
            <th><a class="btn btn-warning btn-sm" href="./addproductpage">Add</a></th>

        </tr>
        </thead>

        <tbody>
        <%
            int count = 0;
            if (request.getAttribute("prodsList") != null) {
                List<Product> al = (List<Product>) request.getAttribute("prodsList");
                Iterator itr = al.iterator();
                while (itr.hasNext()) {
                    count++;
                    Product product = (Product) itr.next();
        %>
        <tr>

            <th scope="row"><%=product.getId()%></th>
            <td><%=product.getProductName()%></td>
            <td><%=product.getQuant()%></td>
            <td><%=product.getPrice()%></td>
            <td><%=product.getCategory()%></td>
            <td><%=product.getDescription()%></td>
            <td><%=product.getSectionNum()%></td>
            <td><form method="get" action="./deleteproduct">
                <button class="btn btn-danger btn-sm" value="<%=product.getId()%>" name="prodId">Remove</button>
            </form>
            </td>
            <td><form method="post" action="./editproduct"><button class="btn btn-success btn-sm" value="<%=product.getId()%>" name="prodId">Edit</button></form></td>

        </tr>



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
        </tbody>
    </table>

</div>


<jsp:include page="Footer.jsp"/>


</body>
</html>
