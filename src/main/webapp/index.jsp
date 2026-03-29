<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="header.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container swiper-section">
    <div class="swiper">
        <div class="swiper-wrapper">
            <!-- Slide 1 -->
            <c:forEach items="${stories}" var="item">
                <div class="swiper-slide slide-gradient-1">
                    <div class="slide-overlay">
                        <div class="slide-content">
                            <span class="slide-badge">🔥 Mới Cập Nhật</span>
                            <h2 class="slide-title">${item.title}</h2>
                            <p class="slide-description">${item.description}</p>
                            <div class="slide-buttons">
                                <a href="${pageContext.request.contextPath}/story-detail?id=${item.id}"
                                   class="btn btn-warning">
                                    <i class="bi bi-play-fill"></i> Đọc Ngay
                                </a>
                                <a href="${pageContext.request.contextPath}/story-detail?id=${item.id}"
                                   class="btn btn-outline-light">
                                    <i class="bi bi-info-circle"></i> Xem Chi Tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<div class="container stories-section">
    <div class="section-header">
        <h2 class="section-title">📚 Tất Cả Truyện</h2>
        <a href="#" class="view-more-link">Xem thêm <i class="bi bi-arrow-right"></i></a>
    </div>

    <div class="row">
        <!-- Story 1 -->
        <c:forEach items="${stories}" var="item">
            <div class="col-6 col-md-3 col-lg-3">
                <a href="${pageContext.request.contextPath}/story-detail?id=${item.id}" class="story-card">
                    <div class="story-cover">
                        <img src="${pageContext.request.contextPath}/${item.cover_image}"
                             alt="${item.title}">
                    </div>
                    <div class="story-title">${item.title}</div>
                </a>
            </div>
        </c:forEach>


    </div>
</div>

<%@ include file="footer.jsp" %>

<!-- Initialize Swiper -->
<script>
    const swiper = new Swiper('.swiper', {
        loop: true,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        },
        slidesPerView: 1,
        spaceBetween: 0,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });
</script>
</body>
</html>
