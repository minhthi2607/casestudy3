<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="top-navbar">
    <div class="top-navbar-left">
        <h4>Admin Dashboard</h4>
    </div>
    <div class="top-navbar-right">
        <div class="notification-icon">
            <i class="bi bi-bell"></i>
            <span class="notification-badge">5</span>
        </div>
        <div class="admin-profile">
            <div class="admin-avatar">
                <c:choose>
                    <c:when test="${not empty sessionScope.admin}">
                        ${sessionScope.admin.username.substring(0,1).toUpperCase()}
                    </c:when>
                    <c:otherwise>A</c:otherwise>
                </c:choose>
            </div>
            <span>
                    <c:choose>
                        <c:when test="${not empty sessionScope.admin}">
                            ${sessionScope.admin.username}
                        </c:when>
                        <c:otherwise>Admin</c:otherwise>
                    </c:choose>
                </span>
        </div>
        <button class="btn-logout" onclick="window.location.href='${pageContext.request.contextPath}/logout'">
            <i class="bi bi-box-arrow-right"></i> Đăng Xuất
        </button>
    </div>
</div>