<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
    ProductRepository repo = new ProductRepository();
    Product product = repo.getProductById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shop - 상품 수정</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
    <link href="/static/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/layout/header.jsp" />

<div class="px-4 py-5 my-5 text-center">
    <h1 class="display-5 fw-bold">상품 수정</h1>
    <p class="lead mb-4">Shop 쇼핑몰입니다.</p>
</div>

<div class="container shop">
<form action="update_pro.jsp" method="post" enctype="multipart/form-data">

    <input type="hidden" name="oldFile"   value="<%= product.getFile() %>">
    <input type="hidden" name="productId" value="<%= product.getProductId() %>">

    <div class="input-group mb-3 row">
        <img src="img?id=<%= product.getProductId() %>" class="w-100 p-2">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">상품 이미지</label>
        <input type="file" class="form-control col-md-10" name="file">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">상품 코드</label>
        <input type="text" class="form-control col-md-10" name="productIdView"
               value="<%= product.getProductId() %>" readonly>
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">상품명</label>
        <input type="text" class="form-control col-md-10" name="name"
               value="<%= product.getName() %>">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">가격</label>
        <input type="number" class="form-control col-md-10" name="unitPrice"
               value="<%= product.getUnitPrice() %>">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text w-100">상세 정보</label>
        <textarea class="form-control" name="description" style="height:200px;"><%= product.getDescription() %></textarea>
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">제조사</label>
        <input type="text" class="form-control col-md-10" name="manufacturer"
               value="<%= product.getManufacturer() %>">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">분류</label>
        <input type="text" class="form-control col-md-10" name="category"
               value="<%= product.getCategory() %>">
    </div>

    <div class="input-group mb-3 row">
        <label class="input-group-text col-md-2">재고 수</label>
        <input type="number" class="form-control col-md-10" name="unitsInStock"
               value="<%= product.getUnitsInStock() %>">
    </div>

    <div class="input-group mb-3 row">
        <div class="col-md-2 p-0">
            <label class="input-group-text">상태</label>
        </div>
        <div class="col-md-10 d-flex align-items-center">
            <div class="radio-box d-flex">
                <div class="radio-item mx-5">
                    <input type="radio" class="form-check-input" name="condition"
                           value="NEW" id="c-new"
                           <%= "NEW".equals(product.getCondition()) ? "checked" : "" %>>
                    <label for="c-new">신규</label>
                </div>
                <div class="radio-item mx-5">
                    <input type="radio" class="form-check-input" name="condition"
                           value="OLD" id="c-old"
                           <%= "OLD".equals(product.getCondition()) ? "checked" : "" %>>
                    <label for="c-old">중고</label>
                </div>
                <div class="radio-item mx-5">
                    <input type="radio" class="form-check-input" name="condition"
                           value="RE" id="c-re"
                           <%= "RE".equals(product.getCondition()) ? "checked" : "" %>>
                    <label for="c-re">재생</label>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between mt-5 mb-5">
        <a href="products.jsp" class="btn btn-secondary btn-lg">목록</a>
        <input type="submit" class="btn btn-success btn-lg" value="수정">
    </div>

</form>
</div>

<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
</body>
</html>
