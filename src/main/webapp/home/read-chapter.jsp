<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="../header.jsp" %>
    <style>
        .reader-container {
            max-width: 900px;
            margin: 80px auto 20px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .chapter-header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        .chapter-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 10px;
        }
        .story-name {
            font-size: 1.1rem;
            color: #666;
            text-decoration: none;
        }
        .story-name:hover {
            color: #007bff;
        }
        .navigation-tools {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
            position: sticky;
            top: 70px;
            z-index: 100;
            background: rgba(255,255,255,0.9);
            padding: 10px;
            border-radius: 5px;
        }
        .chapter-images {
            text-align: center;
        }
        .chapter-images img {
            max-width: 100%;
            display: block;
            margin: 0 auto;
            margin-bottom: 0;
        }
        .chapter-footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            text-align: center;
        }
        .btn-nav {
            min-width: 120px;
        }
    </style>
</head>
<body style="background-color: #000;">
<%@ include file="../navbar.jsp" %>

<div class="container reader-container">
    <div class="chapter-header">
        <a href="${pageContext.request.contextPath}/story-detail?id=${story.id}" class="story-name">${story.gettitle()}</a>
        <h1 class="chapter-title">Chương ${chapter.chapter_number}: ${chapter.name}</h1>
        <p class="text-muted small">Cập nhật lúc: ${chapter.created_at}</p>
    </div>

    <!-- Navigation Top -->
    <div class="navigation-tools shadow-sm border">
        <c:choose>
            <c:when test="${not empty prevChapter}">
                <a href="${pageContext.request.contextPath}/read-chapter?id=${prevChapter.id}" class="btn btn-primary btn-nav btn-sm">
                    <i class="bi bi-chevron-left"></i> Trước
                </a>
            </c:when>
            <c:otherwise>
                <button class="btn btn-secondary btn-nav btn-sm" disabled>
                    <i class="bi bi-chevron-left"></i> Trước
                </button>
            </c:otherwise>
        </c:choose>

        <select class="form-select form-select-sm w-auto" onchange="window.location.href='${pageContext.request.contextPath}/read-chapter?id=' + this.value">
            <c:forEach items="${chapterList}" var="c">
                <option value="${c.id}" ${c.id == chapter.id ? 'selected' : ''}>Chương ${c.chapter_number}: ${c.name}</option>
            </c:forEach>
        </select>

        <c:choose>
            <c:when test="${not empty nextChapter}">
                <a href="${pageContext.request.contextPath}/read-chapter?id=${nextChapter.id}" class="btn btn-primary btn-nav btn-sm">
                    Sau <i class="bi bi-chevron-right"></i>
                </a>
            </c:when>
            <c:otherwise>
                <button class="btn btn-secondary btn-nav btn-sm" disabled>
                    Sau <i class="bi bi-chevron-right"></i>
                </button>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Content Images -->
    <div class="chapter-images">
        <c:if test="${empty chapter.images}">
            <p class="py-5 text-muted">Chưa có nội dung cho chương này.</p>
        </c:if>
        <c:forEach items="${chapter.images}" var="img">
            <img src="${pageContext.request.contextPath}/${img.image_url}" alt="Page ${img.image_order}" loading="lazy">
        </c:forEach>
    </div>

    <!-- Navigation Bottom -->
    <div class="chapter-footer">
        <div class="d-flex justify-content-center gap-3">
            <c:choose>
                <c:when test="${not empty prevChapter}">
                    <a href="${pageContext.request.contextPath}/read-chapter?id=${prevChapter.id}" class="btn btn-outline-primary btn-nav">
                        <i class="bi bi-chevron-left"></i> Chương trước
                    </a>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-outline-secondary btn-nav" disabled>Chương đầu</button>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${not empty nextChapter}">
                    <a href="${pageContext.request.contextPath}/read-chapter?id=${nextChapter.id}" class="btn btn-outline-primary btn-nav">
                        Chương sau <i class="bi bi-chevron-right"></i>
                    </a>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-outline-secondary btn-nav" disabled>Hết chương</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>
</body>
</html>
