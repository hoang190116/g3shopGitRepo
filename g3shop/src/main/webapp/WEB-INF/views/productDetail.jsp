<%@include file="include/navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <div class="card">
        <div class="container-fliud">
            <c:forEach items="${productDetail}" var="p">
                <div class="wrapper row">
                    <div class="preview col-md-6">
                        <div class="preview-pic tab-content">
                            <c:forEach var="i" begin="0" end="${fn:length(p.photos)-1}">
                                <div class="tab-pane <c:if test="${i == 0}">active</c:if>" id="pic-${i}"><img style="max-height: 280px; max-width: 500px; object-fit: contain" src="${pageContext.request.contextPath }/img/1/${p.photos[i]}" /></div>
                                </c:forEach>
                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                            <c:forEach var="i" begin="0" end="${fn:length(p.photos)-1}">
                                <li <c:if test="${i == 0}">class="active"</c:if>><a data-target="#pic-${i}" data-toggle="tab"><img  style="max-height: 50px; max-width: 100px; object-fit: contain" src="${pageContext.request.contextPath }/img/1/${p.photos[i]}" /></a></li>
                                    </c:forEach>    
                        </ul>
                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${p.name}</h3>
                        <div class="rating">
                            <div class="stars">
                                <span class="review-no">${p.view} views</span>
                                <br>
                            </div>
                            <br>
                            <h6 class="price"> Price: 
                                <span>$${p.price}</span>
                            </h6>

                            <h6 class="sizes">Release Date:
                                <span  >${p.releaseDate}</span>
                            </h6>
                            <h6 class="sizes">Type:
                                <span  >${p.genre}</span>
                            </h6>
                            <br>

                            <div class="cart mt-2 align-items-center">
                                <div class="d-grid gap-2"  class="action">
                                    <a id="edit_data" class="btn btn-info text-uppercase mr-2 px-4" <c:if test="${login == true && productQuantity < 9}"> data-target="#myModal" data-toggle="modal" </c:if> type="button">add to cart <i class="fa fa-shopping-cart "></i></a>
                                    </div>
                                </div>
                                <div class="cart mt-2 align-items-center">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="d-grid gap-2 mt-2 " class="action">
                                                <a href="cardCheckout?id=${p.product_id}" class="btn btn-warning text-uppercase mr-2 px-4" type="button">(Buy Now) Card payment</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="d-grid gap-2 mt-2 " class="action">
                                            <a href="cashCheckout?id=${p.product_id}" class="btn btn-warning text-uppercase mr-2 px-4" type="button">(Buy Now) Cash payment</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--</c:forEach>--%>
            </div>
        </div>

        <div id="main-content" class="blog-page">
            <div class="container">
                <div class="row clearfix">
                    <div class="col-lg-8 col-md-12 left-box">
                        <div class="card single_post">
                            <div class="body">
                                <h3>Product Detail</h3>
                                <div class="img-post">
                                    <img class="d-block img-fluid" style="max-width:500px; max-height: 280px; object-fit: contain" src="${pageContext.request.contextPath }/img/1/${p.photos[0]}" alt="First slide">
                                </div>
                                <p>${p.detail}</p>
                            </div>
                        </div>
                        <!-- ===============================HIDDEN ID==================================== -->
                        <input type="hidden" id="idP" value="${p.product_id}"></input>
                        <!-- ===============================MODEL FORM==================================== -->
                        <div class="container">
                            <!--<h2>Modal Example</h2>-->
                            <!-- Trigger the modal with a button -->
                            <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="edit_data">Open Modal</button>-->
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Notify</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p><span style="color: red">${p.name}</span> has added to your cart!</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="disMisModal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                            <script>                  var numberCart = ${numberCart};
                            <!-- Display Model -->
                    $(document).ready(function()
                        {
                                    $('#edit_data').on('click', function () {
                            var idP = $('#idP').val();
                            var number = ${productQuantity};
                            if (idP){
                             
                            $.ajax({
                            data:{idP:idP, number:number},
                                    type:"POST",
                                    url:"${pageContext.request.contextPath }/addToCart",
                                    success:function(data){
                                        if (${login} == true){
                                            if(number < 9){
                                                numberCart += 1;
                                                $('#disMisModal').on('click', function(){
                                                $("#numberCart").html("<span class='badge badge-pill bg-danger'>" + numberCart + "</span>");
                                                });
                                            }else{
                                                alert("The Maximum is only 9!! Check it at your cart!");
                                            }
                                        } else{
                                            alert("You should login first!!");
                                            force_load_gfg();
                                        }
                                    }
                           }); }
                }) ;
                });
                        </script>
                    </c:forEach>
                    <div class="card single_post">
                        <div class="comment-wrapper">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    Comment panel
                                </div>
                                <div class="panel-body">
                                <textarea class="form-control" id="cmtText" placeholder="write a comment..." rows="3"></textarea>
                                    <br>
                            <button id="postBtn" type="button" class="btn btn-info pull-right">Post</button>
                            <script>
                            $("#postBtn").click(function(event){
                            var cmt = $('#cmtText').val();
                                    var idP = $('#idP').val();
                            if (cmt) {
                                    $.ajax({
                                    type: 'POST', data: {cmt: cmt, idP: idP},
                                    url: '${pageContext.request.contextPath }/uploadCmt',
                                    success: function (result) {
                                    if (${login} === true) {
                                    location.reload();
                                    } else {
                                    alert("You should login first!!");
                                    force_load_gfg();
                                    }
                            //                                                         $('#result').html(result);
                                    }
                            });
                            }
                            }); 
                                    
                                    function force_load_gfg() {
                                        var id = $('#idP').val();
                                        window.location =
                                        "${pageContext.request.contextPath }/goLogin/" + id;
                                    } 
                                    </script>
                                            <div class="clearfix"></div>
                                        <hr>
                                            <ul class="media-list">
                                            <c:forEach items="${cmtList}" var="cmt">
                                        <li class="media" style="list-style-type: none;">
                                    <div>
                                        <a href="#" class="pull-left">
                                        <img style="border-radius: 50%; height: 60px; width: 60px; object-fit: contain" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtj_sjTE-ysDaNvfV3aNpRE1m2bPYzYC9ALg&usqp=CAU" alt="" class="img-circle">
                                    </a>
                                </div>
                <div class="media-body">
                    <span class="text-muted pull-right">
                        <span class="">${cmt.timeAgo}</span>
                    </span>
                    <strong class="text-success">&nbsp;&nbsp;${cmt.fname}</strong>
                    <div style="margin-left: 80px;" class="show-read-more">${cmt.commen}</div>
                </div>
                        </li>
                        </c:forEach>
                            <!-- JS for read more -->
                                                                <script type="text/javascript">
                                                                    $(document).ready(function(){
                                                                        var maxLength = 100;
                                                                        $(".show-read-more").each(function(){
                                                                        var myStr = $(this).text();
                                                                        if (myStr.length > maxLength){
                                                                                var newStr = myStr.substring(0, maxLength);
                                                                                var removedStr = myStr.substring(maxLength, $(this).text().length);
                                                                                $(this).empty().html(newStr);
                                                                                $(this).append('<a href="javascript:void(0);" class="read-more">Read more...</a>');
                                                                                $(this).append('<span class="more-text" style="display: none;">'+removedStr+'</span>');
                                                                        }
                                                                        });
                                                                        $(".read-more").click(function(){
                                                                                    $(this).siblings(".more-text").contents().unwrap();
                                                                                    $(this).remove();
                                                                        });
                                                                    });
                                                                                            </script>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-12 right-box">

                                                                                <div class="card">
                                                                                    <div class="header">
                                                                                        <h2>Similar products</h2>
                                                                                    </div>
                                                                                    <div class="body widget popular-post">
                                                                                        <div class="row">
                                                                                            <div class="col-lg-12">
                                                                                                <c:forEach items="${randomList}" var="ran">
                                                                                                    <div class="single_post">
                                                                                                        <a style="text-decoration: none; color: inherit" href="${pageContext.request.contextPath }/productView?id=${ran.product_id}">
                                                                                                            <p class="m-b-0" style="font-weight: bold">${ran.name}</p></a>
                                                                                                        <span>${ran.releaseDate}</span><span style="float: right; color: orange; font-weight: bold">${ran.price}$</span>
                                                                                                        <div style="border-top: 1px solid gray; padding-bottom: 20px"></div>
                                                                                                        <div class="img-post">
                                                                                                            <a style="text-decoration: none; color: inherit" href="${pageContext.request.contextPath }/productView?id=${ran.product_id}">
                                                                                                                <img style="max-height: 200px; max-width: 200px; border-radius: 10%; object-fit: contain" src="${pageContext.request.contextPath }/img/1/${ran.photos[0]}" alt="Awesome Image"></a>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </c:forEach>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            </div>

                                                                            </div>
                                                                            </div>
                                                                            </div>

                                                                            <%@include file="include/footer.jsp" %>