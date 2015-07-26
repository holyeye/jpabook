<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<jsp:include page="../fragments/head.jsp"/>
<body>

<div class="container">

    <jsp:include page="../fragments/bodyHeader.jsp" />


    <div>
        <div>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" name="memberName" class="form-control" placeholder="회원명" value="${orderSearch.memberName}">
                </div>
                <div class="form-group">
                    <select class="form-control" name="orderStatus">
                        <option value="">주문상태</option>
                        <option value="ORDER" <c:if test="${orderSearch.orderStatus eq 'ORDER'}">selected</c:if> >주문</option>
                        <option value="CANCEL" <c:if test="${orderSearch.orderStatus eq 'CANCEL'}">selected</c:if> >취소</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">검색</button>
            </form>
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>회원명</th>
                <th>대표상품 이름</th>
                <th>대표상품 주문가격</th>
                <th>대표상품 주문수량</th>
                <th>상태</th>
                <th>일시</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.member.name}</td>
                    <td>${item.orderItems[0].item.name}</td>
                    <td>${item.orderItems[0].orderPrice}</td>
                    <td>${item.orderItems[0].count}</td>
                    <td>${item.status}</td>
                    <td>${item.orderDate}</td>
                    <td>
                        <c:if test="${item.status == 'ORDER'}">
                        <a href="/orders/${item.id}/cancel" class="btn btn-danger">주문취소</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <jsp:include page="../fragments/footer.jsp" />

</div> <!-- /container -->

</body>
</html>
