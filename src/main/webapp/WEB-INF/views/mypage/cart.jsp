<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />

<title>CampPing</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
<link href="${path}/css/mypage.css?after" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<script type="text/javascript">



function selectAll(selectAll) {
  const checkboxes 
       = document.getElementsByName('order');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}
/*
var tot = function() {
	let cnt = $("[name=cnt]").val();
	let price = $("#price").text();
	let sum = cnt*price;
	$("#tot").text(sum);
}*/
</script>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 캠핑장 예약</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="reservations"> <span data-feather="file"></span> 캠핑장 에약 조회
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 쇼핑</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#"> <span
							data-feather="file"></span> 주문목록/배송 조회
					</a></li>
					<li class="nav-item"><a class="nav-link active" href="cart">
							<span data-feather="shopping-cart"></span> 장바구니
					</a></li>
				</ul>
				<h6
					class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
					<span>나의 정보</span>
				</h6>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="userConfirm"> <span
							data-feather="users"></span> 개인정보확인/수정
					</a></li>
				</ul>

			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h4" style="padding-top: 30px;">장바구니</h1>
			</div>

			<table class="table">
				<thead>
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="15%">
				</colgroup>
				<tr class="table-light">
					<th><input class="form-check-input" name="order"
						type="checkbox" value="selectall" id="flexCheckChecked"
						onclick="selectAll(this)" checked> 전체선택</th>
					<th>상품정보</th>
					<th>상품금액</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="cart" items="${cartList}">
						<tr>
							<td><input class="form-check-input" name="order"
								type="checkbox" value="" id="flexCheckDefault" checked></td>
							<td>
								<div class="row">
									<img src="${cart.camping_object_image}"
										class="col-md-4 img-thumbnail rounded-start" alt="...">
									<div class="col-md-8">
										<div class="orderName">${cart.camping_object_name}</div>
										<div class="orderInfo">
											<span id="price"><fmt:formatNumber
													value="${cart.camping_object_price}" /> 원</span> <select
												name="cnt" class="form-select form-select-sm"
												aria-label=".form-select-sm example">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>

										</div>

									</div>
								</div>
							</td>
							<td><div id="tot"><fmt:formatNumber value="${cart.camping_object_price}" /> 원</div></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<div class="cart-total-price">
				<div class="price-area">
					총 상품가격 <em class="final-product-price">16,520</em>원 <span
						data-feather="plus-square"></span> 총 배송비 <em
						class="final-delivery-charge">0</em>원 <span
						data-feather="chevron-right"></span>총 주문금액 <em
						class="final-order-price" data-final-order-price="16520">
						16,520원 </em>
				</div>
			</div>

			<div class="order-buttons">
				<button type="button" class="btn btn-secondary btn-lg">계속
					쇼핑하기</button>
				<button type="button" class="btn btn-primary btn-lg">구매하기</button>
			</div>


		</main>
	</div>
</div>



<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script src="${path}/js/dashboard.js"></script>