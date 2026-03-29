<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="../header.jsp" %>
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
                <h2><i class="bi bi-eye"></i> Chi Tiết Truyện</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/stories">Quản Lý
                            Truyện</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/admin/stories?action=edit&id=${story.id}"
                   class="btn btn-warning">
                    <i class="bi bi-pencil"></i> Chỉnh Sửa
                </a>
                <a href="${pageContext.request.contextPath}/admin/stories" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Quay Lại
                </a>
            </div>
        </div>
    </div>

    <%-- Story Detail Section --%>
    <div class="table-section">
        <div class="row g-4">
            <%-- Left Column: Story Info --%>
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-info-circle"></i> Thông Tin Truyện</h5>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">ID:</div>
                            <div class="col-md-9">${story.id}</div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Tên Truyện:</div>
                            <div class="col-md-9"><h5>${story.title}</h5></div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Tác Giả:</div>
                            <div class="col-md-9">${story.author}</div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Mô Tả:</div>
                            <div class="col-md-9">${story.description}</div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Trạng Thái:</div>
                            <div class="col-md-9">
                                <span class="badge
                                    <c:choose>
                                        <c:when test="${story.status eq 'active'}">bg-success</c:when>
                                        <c:when test="${story.status eq 'completed'}">bg-primary</c:when>
                                        <c:when test="${story.status eq 'paused'}">bg-warning</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${story.status eq 'active'}">Đang tiến hành</c:when>
                                        <c:when test="${story.status eq 'completed'}">Đã hoàn thành</c:when>
                                        <c:when test="${story.status eq 'paused'}">Tạm dừng</c:when>
                                        <c:otherwise>Không xác định</c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Ngày Tạo:</div>
                            <div class="col-md-9">${story.created_at != null ? story.created_at : 'N/A'}</div>
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <div class="col-md-3 fw-bold">Cập Nhật:</div>
                            <%--                            <div class="col-md-9">${story.updated_at != null ? story.updated_at : 'N/A'}</div>--%>
                        </div>
                    </div>
                </div>

                <%-- Chapters List Card --%>
                <div class="card">
                    <div class="card-header bg-warning text-dark d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="bi bi-list-ul"></i> Danh Sách Chương</h5>
                        <a class="btn btn-sm btn-dark"
                           href="${pageContext.request.contextPath}/admin/stories/chapter?action=create&story_id=${story.id}">
                            <i class="bi bi-plus-circle"></i> Thêm Chương Mới
                        </a>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty chapters}">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th style="width: 120px;">Số Chương</th>
                                            <th>Tên Chương</th>
                                            <th style="width: 200px;">Ngày Đăng</th>
                                                <%--                                            <th style="width: 100px; text-align: center;">Lượt Đọc</th>--%>
                                            <th style="width: 120px; text-align: center;">Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${chapters}" var="chapter">
                                            <tr>
                                                <td><span
                                                        class="badge bg-primary">Chương ${chapter.chapter_number}</span>
                                                </td>
                                                <td>${chapter.name}</td>
                                                <td>${chapter.created_at}</td>
                                                    <%--                                                <td style="text-align: center;">${chapter.views}</td>--%>
                                                <td style="text-align: center;">
                                                    <div class="btn-group btn-group-sm">
                                                        <a href="${pageContext.request.contextPath}/admin/stories/chapter?action=view&id=${chapter.id}"
                                                           class="btn btn-outline-info" title="Xem">
                                                            <i class="bi bi-eye"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/admin/stories/chapter?action=edit&id=${chapter.id}"
                                                           class="btn btn-sm btn-outline-warning" title="Sửa">
                                                            <i class="bi bi-pencil"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/admin/stories/chapter?action=delete&id=${chapter.id}&story_id=${story.id}"
                                                           class="btn btn-sm btn-outline-danger" title="Xóa"
                                                           onclick="return confirm('Xóa chương này?')">
                                                            <i class="bi bi-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5 text-muted">
                                    <i class="bi bi-inbox" style="font-size: 3rem;"></i>
                                    <p class="mt-3">Chưa có chương nào</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <%-- Right Column: Cover Image --%>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0"><i class="bi bi-image"></i> Ảnh Bìa</h5>
                    </div>
                    <div class="card-body text-center">
                        <img src="${pageContext.request.contextPath}/${story.cover_image}"
                             alt="${story.title}"
                             class="img-fluid rounded shadow"
                             style="max-width: 100%; max-height: 500px;">
                        <div class="mt-3">
                            <small class="text-muted">Đường dẫn: ${story.cover_image}</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Bootstrap 5 JS Bundle --%>
        <%@ include file="../footer.jsp" %>
</body>
</html>
