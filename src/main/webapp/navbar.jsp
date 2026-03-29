<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-custom fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi bi-book-half"></i> Vlog Truyện
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">
                        <i class="bi bi-house-door me-1"></i> Trang Chủ
                    </a>
                </li>
            </ul>
<%--            <form class="search-form me-3" role="search" action="${pageContext.request.contextPath}/" method="get">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="search" name="search" class="form-control" placeholder="Tìm truyện..." aria-label="Search">--%>
<%--                    <button class="btn btn-warning" type="submit">--%>
<%--                        <i class="bi bi-search"></i>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </form>--%>
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="dropdown">
                        <a class="btn btn-outline-warning dropdown-toggle" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> ${user.username}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2" aria-labelledby="userDropdown">
                            <c:if test="${user.role == 1}">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin"><i class="bi bi-speedometer2 me-2"></i> Quản Trị</a></li>
                                <li><hr class="dropdown-divider"></li>
                            </c:if>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="bi bi-person me-2"></i> Hồ Sơ</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i> Đăng Xuất</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-warning btn-login">
                        <i class="bi bi-person-circle"></i> Đăng Nhập
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
