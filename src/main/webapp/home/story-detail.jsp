<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="../header.jsp" %>
</head>
<body>

<%@ include file="../navbar.jsp" %>

<div class="container story-detail-container">
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">${story.title}</li>
        </ol>
    </nav>

    <div class="story-header-card">
        <div class="row g-0">
            <div class="col-md-3">
                <div class="story-cover-wrapper">
                    <img src="${pageContext.request.contextPath}/${story.cover_image}"
                         class="story-cover-img" alt="${story.title}">
                </div>
            </div>
            <div class="col-md-9">
                <div class="story-info-wrapper">
                    <h1 class="story-title-detail">${story.title}</h1>

                    <div class="story-badges">
                        <span class="badge bg-primary rounded-pill mb-2">Hành Động</span>
                        <span class="badge bg-info rounded-pill mb-2">Phiêu Lưu</span>
                        <span class="badge bg-success rounded-pill mb-2">
                            <c:choose>
                                <c:when test="${story.status == 'active'}">Đang tiến hành</c:when>
                                <c:when test="${story.status == 'paused'}">Tạm dừng</c:when>
                                <c:when test="${story.status == 'completed'}">Đã hoàn thành</c:when>
                                <c:otherwise>Không xác định</c:otherwise>
                            </c:choose>
                        </span>
                    </div>

                    <div class="story-meta">
                        <p><i class="bi bi-person-fill me-2"></i><strong>Tác giả:</strong> ${story.author}</p>
                        <p><i class="bi bi-eye-fill me-2"></i><strong>Lượt xem:</strong> 125,430</p>
                        <p><i class="bi bi-rss-fill me-2"></i><strong>Tình trạng:</strong>
                            <c:choose>
                                <c:when test="${story.status == 'active'}">Đang tiến hành</c:when>
                                <c:when test="${story.status == 'paused'}">Tạm dừng</c:when>
                                <c:when test="${story.status == 'completed'}">Đã hoàn thành</c:when>
                                <c:otherwise>Không xác định</c:otherwise>
                            </c:choose>
                        </p>
                        <p><i class="bi bi-clock-history me-2"></i><strong>Cập nhật:</strong> 2 giờ trước</p>
                    </div>

                    <div class="story-description">
                        ${story.description}
                    </div>

                    <div class="story-actions">
                        <c:if test="${not empty chapters}">
                            <a href="${pageContext.request.contextPath}/read-chapter?id=${chapters[chapters.size()-1].id}"
                               class="btn-read-now">
                                <i class="bi bi-book-fill me-2"></i> Đọc Từ Đầu
                            </a>
                        </c:if>
                        <a href="#" class="btn-follow">
                            <i class="bi bi-heart-fill me-2"></i> Theo Dõi
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Chapter List Section -->
    <div class="chapter-list-card">
        <div class="chapter-list-header">
            <span><i class="bi bi-list-ul me-2"></i> DANH SÁCH CHƯƠNG</span>
            <span class="badge bg-secondary">${chapters.size()} Chương</span>
        </div>

        <div class="chapter-search-box">
            <div class="input-group">
                <span class="input-group-text bg-white border-end-0"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control border-start-0" placeholder="Tìm số chương hoặc tên chương...">
            </div>
        </div>

        <div class="chapter-list">
            <c:forEach var="chapter" items="${chapters}">
                <a href="${pageContext.request.contextPath}/read-chapter?id=${chapter.id}" class="chapter-item-custom">
                    <span class="chapter-name">Chương ${chapter.chapter_number}: ${chapter.name}</span>
                    <span class="chapter-time">${chapter.created_at}</span>
                </a>
            </c:forEach>
            <c:if test="${empty chapters}">
                <div class="p-4 text-center text-muted">Chưa có chương nào được cập nhật.</div>
            </c:if>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>


</body>
</html>
