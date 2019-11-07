<%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
    <title>RESULTS</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <style>


        .active{
            display:block;
            background: black;

        }
        .active:before {
            content: '';
            background:url('https://small.pngfans.com/20190527/kk/png-star-blue-icon-computer-icons-clipart-1773a4081f7c00e6.jpg');
            background-size:cover;
            position:absolute;
            width:20px;
            height:20px;
            margin-left: 60px;
            margin-top: -530px;
        }
        /*area:hover {border: 1px solid red;}*/
    </style>
    <script>
        <%String titlesec = "3";%>
        $(document).ready(function(){
            $("button.displaySwitcher").click(function(){
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
<div class="container-fluid mx-auto mt-5" style="width: 800px; height: 150px;">
    <h1 class="text-center">Search results:</h1>

</div>


<%
    int count = 0;
    if (request.getAttribute("prodsList") != null) {
        ArrayList al = (ArrayList) request.getAttribute("prodsList");
        System.out.println(al);
        Iterator itr = al.iterator();
        while (itr.hasNext()) {


            count++;
            ArrayList pList = (ArrayList) itr.next();
    %>
<div class="container">
    <div class="row">
        <div class="col">
            <img alt="product picture" src="img/placeholder.png" width="300px" height="300px">

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
            <button class="displaySwitcher">Show on map</button>
            <button class="" name="listadder" onclick="return callservlet();">Add to list</button>

            <script>
                function callservlet() {

                    var servletname = "controller.AddToListServlet";

                    if(servletname== "")
                    {
                        alert("NO value..");
                        return false;
                    }
                    else
                    {
                        document.location.href="listadder";
                        return false;
                    }
                }
            </script>

        </div>
        <%
                }
            }
            if (count == 0) {
        %>
        <div class="container-fluid mx-auto mt-5" style="width: 800px; height: 150px;">
            <h6>No Record Found..</h6>

        </div>

        <%            }
        %>

    </div>
    <div class="w3-container w3-center">


        <img alt="store-layout" src="img/store-layout.png" usemap="#mappy">
        <map name="mappy" class="mappy">
            <area target="" id="29" alt="29" title="29" href="" coords="186,158,148,65" shape="rect">
            <area target="" id="41" alt="41" title="41" href="" coords="533,65,558,158" shape="rect">
            <area target="" id="3" alt="3" title="3" href="" coords="634,360,660,480" shape="rect">
        </map>
    </div>
</div>

</body>
</html>