<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="../header.jsp" %>

    <style>
        body {
            background: #111;
            color: #fff;

        }
        .chapter-container {
            max-width: 800px;
            margin: auto;
            text-align: center;
        }

        .chapter-container img {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%-- Sidebar Navigation --%>
<%@ include file="../sidebar.jsp" %>

<%-- Top Navbar --%>
<%@ include file="../top-navbar.jsp" %>

<%-- Main Content Area --%>
<div class="main-content">
    <%-- Page Header --%>
    <div class="page-header">
        <div class="page-header-top">
            <div>
                <h2><i class="bi bi-eye"></i> Xem Chương</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/stories">Quản Lý
                            Truyện</a></li>
                        <li class="breadcrumb-item"><a
                                href="${pageContext.request.contextPath}/admin/stories?action=view&id=${chapter.story_id}">Chi
                            Tiết Truyện</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Xem chương</li>
                    </ol>
                </nav>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/admin/stories?action=view&id=${chapter.story_id}"
                   class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Quay Lại
                </a>

            </div>
        </div>
    </div>
        <h2>${chapter.name}</h2>

        <div class="chapter-container">

            <c:forEach var="img" items="${chapter.images}">
                <div class="chapter-image">
                <img  src="${pageContext.request.contextPath}/${img.image_url}" />
                </div>
            </c:forEach>

        </div>


</div>


<%@ include file="../footer.jsp" %>



</body>
</html>
