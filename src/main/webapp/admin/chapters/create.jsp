<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="../header.jsp" %>
</head>
<body>

<%@ include file="../sidebar.jsp" %>

<%-- Top Navbar --%>
<%@ include file="../top-navbar.jsp" %>
<div class="main-content">
    <div class="page-header">
        <div class="page-header-top d-flex justify-content-between align-items-center">
            <div>
                <h2><i class="bi bi-plus-circle"></i> Tạo Chương Mới</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/stories">Quản Lý
                            Truyện</a></li>
                        <li class="breadcrumb-item"><a
                                href="${pageContext.request.contextPath}/admin/stories?action=view&id=${story.id}">Chi
                            Tiết Truyện</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Chương</li>
                    </ol>
                </nav>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/admin/stories?action=view&id=${story.id}"
                   class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Quay Lại
                </a>
            </div>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="bi bi-pencil-square"></i> Thông Tin Chương</h5>
        </div>
        <div class="card-body">
            <form action="chapter?action=create"
                  method="post" enctype="multipart/form-data" class="p-4 bg-light border rounded shadow-sm">
                <input type="hidden" name="story_id" value="${story.id}">
                <div class="mb-3">
                    <label for="chapter_number" class="form-label fw-bold">Số Chương</label>
                    <input type="number" class="form-control" id="chapter_number" name="chapter_number"
                           placeholder="Nhập số chương" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label fw-bold">Tên Chương</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Nhập tên chương"
                    >
                </div>
                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-upload"></i> Tạo Chapter
                </button>
            </form>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
