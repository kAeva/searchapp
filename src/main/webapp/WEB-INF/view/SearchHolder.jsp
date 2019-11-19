<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>This is your list of products</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<c:url value="/js/jquery.imagemapster.min.js"/>"></script>
    <style>
        li {
            display: inline;
            float: left;
            width:25%;
            cursor: pointer;
        }
        ul {
            display: block;
        }
        li.selected {
            background-color: #FFC0CB;
            text-shadow: 0px 1px 1px #FFC0CB;
        }
        #mapster_wrap_0{
            margin: 0 auto;
        }

    </style>
    <script>
        $(document).ready(function () {
            var img = $('img'),
                list = $('#boundList');

            $('img').mapster({
                mapKey: 'state',
                boundList: list.find('li'),
                listKey: 'state',
                listSelectedClass: 'selected'
            });
            $(document).on('click','#boundList li',function(e) {

                var el = $(e.target);

                img.mapster('set',null,el.attr('state'));

            }).on('click','#clearAll',function(e) {
                e.preventDefault();
                img.mapster('set',false,img.mapster('get'));
            });

        });
    </script>
</head>

<body>
<nav class="navbar navbar-dark bg-dark">

    <div class="col-12 col-md-8"></div>
    <div class="col-6 col-md-4">
        <a class="btn btn-light my-2" href="./">Add more</a>
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
<ul id='boundList'>
<div class="container">

    <div class="container mb-5">

    <div class="container-fluid mx-auto mt-5" style="width: 800px; height: 70px;">
        <h2 class="text-center"><%=product.getProductName()%>
        </h2>
    </div>

    <div class="row">
        <div class="col">
            <img alt="product picture" src="images/placeholder.png" width="300px" height="300px"
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

            <li><button state="<%=product.getSectionNum()%>" class="displaySwitcher btn btn-dark my-2">Show on map</button></li>

        </div>
    </div>
    </div>
</div>
</ul>

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
<div class="container-fluid mx-auto">
    <img src="images/store-layout.png" usemap="#Map" style="width:1008px; height: 612px">

    <map name="Map" id="usa_image_map">

        <area id="29" state="29" full="29" alt="" title="29" href="#" coords="186,163,141,66" shape="rect">
        <area id="30" state="30" full="30" alt="" title="30" href="#" coords="188,67,234,163" shape="rect">
        <area id="31" state="31" full="31" title="31" href="#" coords="238,66,273,160,273,66" shape="rect">
        <area id="32" state="32" alt="32" title="32" href="#" coords="273,66,311,158" shape="rect">
        <area id="33" state="33" alt="33" title="33" href="#" coords="312,66,346,158,348,68" shape="rect">
        <area id="34" state="34" alt="34" title="34" href="#" coords="346,66,382,157" shape="rect">
        <area id="35" state="35" alt="35" title="35" href="#" coords="384,66,411,158" shape="rect">
        <area id="36" state="36" alt="36" title="36" href="#" coords="412,65,434,158" shape="rect">
        <area id="37" state="37" alt="37" title="37" href="#" coords="435,65,458,158" shape="rect">
        <area id="38" state="38" alt="38" title="38" href="#" coords="458,65,481,158" shape="rect">
        <area id="39" state="39" alt="39" title="39" href="#" coords="482,67,506,158" shape="rect">
        <area id="40" state="40" alt="40" title="40" href="#" coords="506,66,531,158" shape="rect">
        <area id="41" state="41" alt="41" title="41" href="#" coords="533,66,560,158" shape="rect">
        <area id="42" state="42" alt="42" title="42" href="#" coords="561,66,586,158" shape="rect">
        <area id="43" state="43" alt="43" title="43" href="#" coords="587,66,615,158" shape="rect">
        <area id="44" state="44" alt="44" title="44" href="#" coords="613,66,637,158" shape="rect">
        <area id="45" state="45" alt="45" title="45" href="#" coords="637,65,662,158" shape="rect">
        <area id="46" state="46" title="46" href="#" coords="663,66,688,158" shape="rect">
        <area id="47" state="47" title="47" href="#" coords="688,66,713,158" shape="rect">
        <area id="48" state="48" title="48" href="#" coords="716,66,740,159" shape="rect">
        <area id="49" state="49" alt="49" title="49" href="#" coords="741,66,763,158" shape="rect">
        <area id="1A" state="1A" alt="1A" title="1A" href="#" coords="765,65,784,160" shape="rect">
        <area id="1B" state="1B" alt="1B" title="1B" href="#" coords="786,64,809,157" shape="rect">
        <area id="1C" state="1C" alt="1C" title="1C" href="#" coords="809,63,833,157" shape="rect">
        <area id="1D" state="1D" alt="1D" title="1D" href="#" coords="835,63,856,155" shape="rect">
        <area id="1E" state="1E" alt="1E" title="1E" href="#" coords="858,64,881,156" shape="rect">
        <area id="51" state="51" alt="51" title="51" href="#" coords="828,159,937,184" shape="rect">
        <area id="52" state="52" alt="52" title="52" href="#" coords="829,184,936,210" shape="rect">
        <area id="53" state="53" alt="53" title="53" href="#" coords="828,210,951,234" shape="rect">
        <area id="54" state="54" alt="54" title="54" href="#" coords="828,236,935,263" shape="rect">
        <area id="55" state="55" alt="55" title="55" href="#" coords="829,263,936,293" shape="rect">
        <area id="56" state="56" alt="56" title="56" href="#" coords="847,291,935,319" shape="rect">
        <area id="57" state="57" alt="57" title="57" href="#" coords="935,345,831,319" shape="rect">
        <area id="58" state="58" alt="58" title="58" href="#" coords="830,348,950,374" shape="rect">
        <area id="59" state="59" alt="59" title="59" href="#" coords="830,375,934,399" shape="rect">
        <area id="60" state="60" alt="60" title="60" href="#" coords="934,430,859,403" shape="rect">
        <area id="61" state="61" alt="61" title="61" href="#" coords="860,430,935,457" shape="rect">
        <area id="62" state="62" alt="62" title="62" href="#" coords="935,483,830,458" shape="rect">
        <area id="63" state="63" alt="63" title="63" href="#" coords="935,514,823,486" shape="rect">
        <area id="1" state="1" alt="1" title="1" href="#" coords="680,361,693,480" shape="rect">
        <area id="2" state="2"  alt="2" title="2" href="#" coords="658,359,678,450" shape="rect">
        <area id="HD" state="HD"  alt="HD" title="HD" href="#" coords="671,486,648,451,758,542" shape="rect">
        <area id="3" state="3"  alt="3" title="3" href="#" coords="635,360,658,452" shape="rect">
        <area id="4" state="4"  alt="4" title="4" href="#" coords="615,360,635,480" shape="rect">
        <area id="5" state="5"  alt="5" title="5" href="#" coords="593,361,614,482" shape="rect">
        <area id="6" state="6"  alt="6" title="6" href="#" coords="571,360,591,450" shape="rect">
        <area id="7" state="7"  alt="7" title="7" href="#" coords="549,360,571,480" shape="rect">
        <area id="8" state="8"  alt="8" title="8" href="#" coords="527,359,548,479" shape="rect">
        <area id="9" state="9"  alt="9" title="9" href="#" coords="508,361,526,479" shape="rect">
        <area id="10" state="10" alt="10" title="10" href="#" coords="486,359,507,480" shape="rect">
        <area id="11" state="11" alt="11" title="11" href="#" coords="468,360,484,480" shape="rect">
        <area id="13" state="13" alt="13" title="13" href="#" coords="450,360,465,481" shape="rect">
        <area id="14" state="14" alt="14" title="14" href="#" coords="426,360,448,480" shape="rect">
        <area id="15" state="15" alt="15" title="15" href="#" coords="401,360,426,481" shape="rect">
        <area id="16" state="16" alt="16" title="16" href="#" coords="376,358,399,481" shape="rect">
        <area id="17" state="17" alt="17" title="17" href="#" coords="352,359,376,481" shape="rect">
        <area id="18" state="18" alt="18" title="18" href="#" coords="332,360,351,481" shape="rect">
        <area id="19" state="19" alt="19" title="19" href="#" coords="307,360,329,480" shape="rect">
        <area id="20" state="20" alt="20" title="20" href="#" coords="289,360,305,481" shape="rect">
        <area id="21" state="21" alt="21" title="21" href="#" coords="273,363,288,473" shape="rect">
        <area id="12" state="12" alt="12" title="12" href="#" coords="316,497,473,516" shape="rect">
        <area id="HA" state="HA" alt="HA" title="HA" href="#" coords="793,256,671,205" shape="rect">
        <area id="3A" state="3A" alt="3A" title="3A" href="#" coords="618,201,648,330" shape="rect">
        <area id="4A" state="4A" alt="4A" title="4A" href="#" coords="588,201,618,329" shape="rect">
        <area id="5A" state="5A" alt="5A" title="5A" href="#" coords="560,202,586,330" shape="rect">
        <area id="6A" state="6A" alt="6A" title="6A" href="#" coords="532,201,561,330" shape="rect">
        <area id="7A" state="7A" alt="7A" title="7A" href="#" coords="503,201,532,330" shape="rect">
        <area id="8A" state="8A" alt="8A" title="8A" href="#" coords="468,202,503,330" shape="rect">
        <area id="22" state="22" alt="22" title="22" href="#" coords="298,334,441,357" shape="rect">
        <area id="23" state="23" alt="23" title="23" href="#" coords="298,307,441,332" shape="rect">
        <area id="24" state="24" alt="24" title="24" href="#" coords="298,277,442,306" shape="rect">
        <area id="25" state="25" alt="25" title="25" href="#" coords="298,251,442,278" shape="rect">
        <area id="26" state="26" alt="26" title="26" href="#" coords="298,223,442,252" shape="rect">
        <area id="27" state="27" alt="27" title="27" href="#" coords="298,194,398,222" shape="rect">
        <area id="28" state="28" alt="28" title="28" href="#" coords="297,176,398,195" shape="rect">
        <area id="28A" state="28A" alt="28A" title="28A" href="#" coords="186,176,268,197" shape="rect">
        <area id="27A" state="27A" alt="27A" title="27A" href="#" coords="187,197,268,226" shape="rect">
        <area id="26A" state="26A" alt="26A" title="26A" href="#" coords="268,256,173,227" shape="rect">
        <area tid="GB" state="GB" alt="GB" title="GB" href="#" coords="61,278,273,361" shape="rect">
        <area id="OG" state="OG" alt="OG" title="OG" href="#" coords="61,361,174,574" shape="rect">
        <area id="GH" state="GH" alt="GH" title="GH" href="#" coords="175,361,273,574" shape="rect">
    </map>
</div>
<jsp:include page="Footer.jsp"/>


</body>
</html>
