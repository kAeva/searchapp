<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>This is your list of products</title>
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

    <style>
        .active {
            display: block;
            background: black;
        }

        .active:before {
            content: '';
            background: url('https://small.pngfans.com/20190527/kk/png-star-blue-icon-computer-icons-clipart-1773a4081f7c00e6.jpg');
            background-size: cover;
            position: absolute;
            width: 20px;
            height: 20px;
            margin-left: 60px;
            margin-top: -530px;
        }
    </style>
    <script>
        <%String titlesec = "3";%>
        $(document).ready(function () {
            $("button.displaySwitcher").click(function () {
                $("area[title='<%=titlesec%>']").toggleClass("active");
            });
        });

    </script>
</head>


<body>
<nav class="navbar navbar-dark bg-dark">

    <div class="col-12 col-md-8"></div>
    <div class="col-6 col-md-4">
        <a class="btn btn-light my-2" href="./index.jsp">Home page</a>
    </div>
</nav>

<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
    <h1 class="text-center">Your search basket</h1>
</div>
<%
    int count = 0;
    if (request.getAttribute("productsList") != null) {
        List<Product> products = (List<Product>) request.getAttribute("productsList");
        Iterator itr = products.iterator();
        while (itr.hasNext()) {
            count++;
            Product product = (Product) itr.next();
%>

<div class="container">

    <div class="container mb-5">

    <div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
        <h2 class="text-center"><%=product.getProductName()%>
        </h2>
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

            <button id="displaySwitcher" class="displaySwitcher btn btn-dark my-2">Show on map</button>
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

<jsp:include page="map1.1.jsp"/>

<jsp:include page="Footer.jsp"/>

</body>
</html>
