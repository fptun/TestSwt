<%-- 
    Document   : Admin
    Created on : 13 Oct, 2023, 12:03:22 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.Normalizer" %>
<%@page import="java.util.regex.Pattern" %>
<%@page import="DAL.*" %>
<%@page import="Models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="./style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    </head>
    <body>
        <%@include file="./Header.jsp" %>
        <h3 class="text-danger">${requestScope.mess?requestScope.mess:""}</h3>
        <section>
            <div class="row h-100">
                <div class="col-md-2 h-100 left-nav-admin p-0">
                    <div class="p-5 pe-0 vh-100">
                        <ul>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-3 text-white d-flex align-items-center text-decoration-none">
                                    <i class='bx bxs-dashboard me-3'></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="orderManager"  class="fs-3 text-white text-decoration-none">
                                    <i class='bx bx-cart me-3'></i>
                                    <span>Order</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-3 text-white d-flex align-items-center text-decoration-none">
                                    <i class='bx bx-circle-three-quarter me-3'></i>
                                    <span>Statistic</span>
                                </a>
                            </li> 
                            <li class="py-4 ps-3 mb-3  active">
                                <a href="ManageProduct" class="fs-3 text-white d-flex align-items-center text-decoration-none">
                                    <i class='bx bxs-data me-3'></i>
                                    <span>Products</span>
                                </a>
                            </li> 
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-3 text-white d-flex align-items-center text-decoration-none">
                                    <i class='bx bx-line-chart me-3'></i>
                                    <span>Stock</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center text-decoration-none">
                                    <i class='bx bx-purchase-tag-alt me-3'></i>
                                    <span>Offer</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 h-100">
                    <h1 class="fw-bold my-4">Product</h1>
                    <div class="row my-5">
                        <a href="?Service=addProduct" class="text-decoration-none fs-3 text-success
                           border px-3 py-2 fw-bold w-25 mx-auto text-center rounded-lg" >
                            Add more product
                        </a>
                    </div>
                    <div class="row my-5">
                        <div class="col-md-6">
                            <form action="ManageProduct"
                                  class="w-50 bg-white border d-flex align-items-center rounded-md overflow-hidden">
                                <button type="submit" class="p-3 border-0 text-black-weak" name="Service"
                                        value="SearchProduct"
                                        />
                                <i class="fa-solid fa-magnifying-glass fs-3"></i>
                                </button>
                                <input type="text" placeholder="Search Product By Id" 
                                       value="${valueSearch}"
                                       class="border-0 w-100 py-4 px-3 fs-4"
                                       name="searchId"
                                       />
                            </form>
                        </div>
                        <div class="col-md-6">
                            <select class="form-select w-50 ms-auto fs-3" aria-label="Default select example">
                                <option value="1">Order list by: Id</option>
                                <option value="2">Order list by: Date</option>
                                <option value="3">Order list by: Total</option>
                            </select>
                        </div>
                    </div>
                    <div class="">
                        <div class="row bg-weak rounded-lg px-3 py-4 fs-4">
                            <div class="col">product_id</div>
                            <div class="col">image</div>
                            <div class="col">name</div>
                            <div class="col">price</div>
                            <div class="col">discount</div>
                            <div class="col">category</div>
                            <div class="col">brand</div>
                            <div class="col">quantity</div>
                            <div class="col">date</div>
                            <div class="col">Setting</div>
                        </div>
                        <div class="">
                            <h3 class="text-danger my-3">${mess}</h3>
                            <c:forEach var="product" items="${requestScope.listProduct}">
                                <div class="mt-5 border-top bg-white rounded-lg border">
                                    <div class="row position-relative fs-4 px-3 py-4 d-flex align-items-center justify-content-between">
                                        <div class="col">${product.product_id}</div>
                                        <div class="col">
                                            <img src="./images/${product.product_img}" alt="alt"/>
                                        </div>
                                        <div class="col">${product.product_name}</div>
                                        <div class="col">${product.list_price}</div>
                                        <div class="col">${product.discount}</div>
                                        <div class="col">${product.getCategoryName()}</div>
                                        <div class="col">${product.getBrandName()}</div>
                                        <div class="col">${product.quantity}</div>
                                        <div class="col">${product.date_added}</div>
                                        <div class="col d-flex">
                                            <a href="ManageProduct?Service=Update&pid=${product.product_id}" class="me-4 text-info fw-bold fs-5">Update</a>
                                            <a href="ManageProduct?Service=Delete&pid=${product.product_id}" class="text-danger fw-bold fs-5">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>  
                        </div>
                    </div> 
                </div>
        </section>
        <%--<%@include file="./Footer.jsp" %>--%>
        <script src="../js/app.js"></script>
    </body>
</html>
