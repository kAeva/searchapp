<%@ page import="model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <title>Product editing</title>

</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="col-12 col-md-8"></div>
    <div class="col-6 col-md-4">
        <button type="button" class="btn btn-light my-2">Admin panel</button>
    </div>
</nav>
<div>

    <div class="container-fluid mx-auto mt-5" style="width: 800px; height: 150px;">
        <% Product product = (Product) request.getAttribute("editproduct");
        %>
        <h1 class="text-center">You are editing: <%=product.getProductName()%></h1>


    </div>
    <div class="container-fluid mx-auto mt-5" style="width: 800px; height: auto;">
        <form action="updateproduct" method="post">

            <label>Product name</label>
            <input type="hidden" name="prodId" id="prodId" value="<%=product.getId()%>">
            <input class="form-control mr-sm-5  col-md-12" name="prodname" placeholder="<%=product.getProductName()%>"
                   aria-label="editname">
            <label>Quantity</label>
            <input class="form-control mr-sm-5  col-md-12" name="prodquant"  placeholder="<%=product.getQuant()%>"
                   aria-label="editquant">
            <label>Price</label>
            <input class="form-control mr-sm-5  col-md-12" name="prodprice" placeholder="<%=product.getPrice()%>"
                   aria-label="editprice">
            <label>Category</label>
            <input class="form-control mr-sm-5  col-md-12" name="prodcategory" placeholder="<%=product.getCategory()%>"
                   aria-label="editcategory">
            <label>Description</label>
            <textarea rows="4" cols="50" class="form-control mr-sm-5  col-md-12" name="proddescr" placeholder="<%=product.getDescription()%>"
                      aria-label="editdescription"></textarea>
            <label>Section</label>
            <input class="form-control mr-sm-5  col-md-12" name="prodsec" placeholder="<%=product.getSectionNum()%>"
                   aria-label="editsection">
            </br>
            </br>
            </br>
            <button class="btn btn-outline-dark mx-auto" style="width: 200px; margin: 0 auto; display: block;"
                    type="submit">Update
            </button>
        </form>
    </div>
</div>
<jsp:include page="Footer.jsp"/>

</body>
</html>
