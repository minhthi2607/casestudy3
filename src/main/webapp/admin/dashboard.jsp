<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ include file="header.jsp" %>
</head>
<body>
<%-- Sidebar Navigation --%>
<%@ include file="sidebar.jsp" %>
<%-- Top Navbar --%>
<%@ include file="top-navbar.jsp" %>

<%-- Main Content Area --%>
<div class="main-content">
    <%-- Stats Overview Section --%>
    <%--    <div class="row g-4">--%>
    <%--        <div class="col-xl-3 col-md-6">--%>
    <%--            <div class="stat-card primary">--%>
    <%--                <div class="d-flex justify-content-between align-items-start">--%>
    <%--                    <div>--%>
    <%--                        <div class="stat-label">Tổng Số Truyện</div>--%>
    <%--                        <div class="stat-number">1,247</div>--%>
    <%--                        <span class="stat-change positive">--%>
    <%--                                <i class="bi bi-arrow-up"></i> +12% tuần này--%>
    <%--                            </span>--%>
    <%--                    </div>--%>
    <%--                    <div class="stat-icon primary">--%>
    <%--                        <i class="bi bi-book"></i>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="col-xl-3 col-md-6">--%>
    <%--            <div class="stat-card success">--%>
    <%--                <div class="d-flex justify-content-between align-items-start">--%>
    <%--                    <div>--%>
    <%--                        <div class="stat-label">Tổng Số Chương</div>--%>
    <%--                        <div class="stat-number">45,892</div>--%>
    <%--                        <span class="stat-change positive">--%>
    <%--                                <i class="bi bi-arrow-up"></i> +24% tuần này--%>
    <%--                            </span>--%>
    <%--                    </div>--%>
    <%--                    <div class="stat-icon success">--%>
    <%--                        <i class="bi bi-file-text"></i>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="col-xl-3 col-md-6">--%>
    <%--            <div class="stat-card warning">--%>
    <%--                <div class="d-flex justify-content-between align-items-start">--%>
    <%--                    <div>--%>
    <%--                        <div class="stat-label">Tổng Người Dùng</div>--%>
    <%--                        <div class="stat-number">23,456</div>--%>
    <%--                        <span class="stat-change positive">--%>
    <%--                                <i class="bi bi-arrow-up"></i> +8% tuần này--%>
    <%--                            </span>--%>
    <%--                    </div>--%>
    <%--                    <div class="stat-icon warning">--%>
    <%--                        <i class="bi bi-people"></i>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="col-xl-3 col-md-6">--%>
    <%--            <div class="stat-card info">--%>
    <%--                <div class="d-flex justify-content-between align-items-start">--%>
    <%--                    <div>--%>
    <%--                        <div class="stat-label">Người Dùng Mới Tháng Này</div>--%>
    <%--                        <div class="stat-number">487</div>--%>
    <%--                        <span class="stat-change positive">--%>
    <%--                                <i class="bi bi-arrow-up"></i> +15% tháng trước--%>
    <%--                            </span>--%>
    <%--                    </div>--%>
    <%--                    <div class="stat-icon info">--%>
    <%--                        <i class="bi bi-person-plus"></i>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--    &lt;%&ndash; Recently Updated Stories Table &ndash;%&gt;--%>
    <%--    <div class="section-header">--%>
    <%--        <h5><i class="bi bi-clock-history"></i> Truyện Cập Nhật Gần Đây</h5>--%>
    <%--        <a href="#" class="btn btn-sm btn-outline-primary">Xem Tất Cả</a>--%>
    <%--    </div>--%>

    <%--    <div class="content-card">--%>
    <%--        <div class="table-responsive">--%>
    <%--            <table class="table table-hover">--%>
    <%--                <thead>--%>
    <%--                <tr>--%>
    <%--                    <th>Tên Truyện</th>--%>
    <%--                    <th>Tác Giả</th>--%>
    <%--                    <th>Thể Loại</th>--%>
    <%--                    <th>Số Chương</th>--%>
    <%--                    <th>Cập Nhật Lần Cuối</th>--%>
    <%--                    <th>Trạng Thái</th>--%>
    <%--                    <th>Thao Tác</th>--%>
    <%--                </tr>--%>
    <%--                </thead>--%>
    <%--                <tbody>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Đấu Phá Thương Khung</strong></td>--%>
    <%--                    <td>Thiên Tàm Thổ Đậu</td>--%>
    <%--                    <td><span class="badge bg-primary">Huyền Huyễn</span></td>--%>
    <%--                    <td>1,648</td>--%>
    <%--                    <td>24/03/2026</td>--%>
    <%--                    <td><span class="badge bg-success">Đang Ra</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Toàn Chức Pháp Sư</strong></td>--%>
    <%--                    <td>Loạn</td>--%>
    <%--                    <td><span class="badge bg-info">Kỳ Huyễn</span></td>--%>
    <%--                    <td>3,234</td>--%>
    <%--                    <td>24/03/2026</td>--%>
    <%--                    <td><span class="badge bg-secondary">Hoàn Thành</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Nguyên Tôn</strong></td>--%>
    <%--                    <td>Thiên Tàm Thổ Đậu</td>--%>
    <%--                    <td><span class="badge bg-primary">Huyền Huyễn</span></td>--%>
    <%--                    <td>1,267</td>--%>
    <%--                    <td>23/03/2026</td>--%>
    <%--                    <td><span class="badge bg-success">Đang Ra</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Vạn Cổ Thần Đế</strong></td>--%>
    <%--                    <td>Phi Thiên Ngư</td>--%>
    <%--                    <td><span class="badge bg-danger">Tiên Hiệp</span></td>--%>
    <%--                    <td>2,456</td>--%>
    <%--                    <td>23/03/2026</td>--%>
    <%--                    <td><span class="badge bg-success">Đang Ra</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Tu La Võ Thần</strong></td>--%>
    <%--                    <td>Thiện Lương Đích Mật Phong</td>--%>
    <%--                    <td><span class="badge bg-warning">Huyền Huyễn</span></td>--%>
    <%--                    <td>4,128</td>--%>
    <%--                    <td>22/03/2026</td>--%>
    <%--                    <td><span class="badge bg-secondary">Hoàn Thành</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                <tr>--%>
    <%--                    <td><strong>Thần Ấn Vương Tọa</strong></td>--%>
    <%--                    <td>Đường Gia Tam Thiếu</td>--%>
    <%--                    <td><span class="badge bg-primary">Kỳ Huyễn</span></td>--%>
    <%--                    <td>1,012</td>--%>
    <%--                    <td>22/03/2026</td>--%>
    <%--                    <td><span class="badge bg-warning">Tạm Dừng</span></td>--%>
    <%--                    <td>--%>
    <%--                        <button class="btn btn-sm btn-outline-info"><i class="bi bi-eye"></i></button>--%>
    <%--                        <button class="btn btn-sm btn-outline-warning"><i class="bi bi-pencil"></i></button>--%>
    <%--                    </td>--%>
    <%--                </tr>--%>
    <%--                </tbody>--%>
    <%--            </table>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--    &lt;%&ndash; New Stories Section &ndash;%&gt;--%>
    <%--    <div class="section-header">--%>
    <%--        <h5><i class="bi bi-star"></i> Truyện Mới Thêm</h5>--%>
    <%--        <a href="#" class="btn btn-sm btn-outline-primary">Xem Tất Cả</a>--%>
    <%--    </div>--%>

    <%--    <div class="row g-4">--%>
    <%--        <div class="col-xl-4 col-md-6">--%>
    <%--            <div class="story-card">--%>
    <%--                <div class="story-cover cover-1">--%>
    <%--                    <i class="bi bi-book"></i>--%>
    <%--                </div>--%>
    <%--                <div class="story-card-body">--%>
    <%--                    <div class="story-title">Ma Đạo Tổ Sư</div>--%>
    <%--                    <div class="story-author">--%>
    <%--                        <i class="bi bi-person"></i> Mặc Hương Đồng Khứu--%>
    <%--                    </div>--%>
    <%--                    <span class="badge bg-danger">Đam Mỹ</span>--%>
    <%--                    <div class="story-meta">--%>
    <%--                            <span class="story-date">--%>
    <%--                                <i class="bi bi-calendar3"></i> 20/03/2026--%>
    <%--                            </span>--%>
    <%--                        <a href="#" class="btn btn-sm btn-primary">--%>
    <%--                            Xem Chi Tiết <i class="bi bi-arrow-right"></i>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="col-xl-4 col-md-6">--%>
    <%--            <div class="story-card">--%>
    <%--                <div class="story-cover cover-2">--%>
    <%--                    <i class="bi bi-heart"></i>--%>
    <%--                </div>--%>
    <%--                <div class="story-card-body">--%>
    <%--                    <div class="story-title">Thiên Quan Tứ Phúc</div>--%>
    <%--                    <div class="story-author">--%>
    <%--                        <i class="bi bi-person"></i> Mặc Hương Đồng Khứu--%>
    <%--                    </div>--%>
    <%--                    <span class="badge bg-info">Cổ Đại</span>--%>
    <%--                    <div class="story-meta">--%>
    <%--                            <span class="story-date">--%>
    <%--                                <i class="bi bi-calendar3"></i> 19/03/2026--%>
    <%--                            </span>--%>
    <%--                        <a href="#" class="btn btn-sm btn-primary">--%>
    <%--                            Xem Chi Tiết <i class="bi bi-arrow-right"></i>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="col-xl-4 col-md-6">--%>
    <%--            <div class="story-card">--%>
    <%--                <div class="story-cover cover-3">--%>
    <%--                    <i class="bi bi-stars"></i>--%>
    <%--                </div>--%>
    <%--                <div class="story-card-body">--%>
    <%--                    <div class="story-title">Nhất Niệm Vĩnh Hằng</div>--%>
    <%--                    <div class="story-author">--%>
    <%--                        <i class="bi bi-person"></i> Nhĩ Căn--%>
    <%--                    </div>--%>
    <%--                    <span class="badge bg-warning">Tiên Hiệp</span>--%>
    <%--                    <div class="story-meta">--%>
    <%--                            <span class="story-date">--%>
    <%--                                <i class="bi bi-calendar3"></i> 18/03/2026--%>
    <%--                            </span>--%>
    <%--                        <a href="#" class="btn btn-sm btn-primary">--%>
    <%--                            Xem Chi Tiết <i class="bi bi-arrow-right"></i>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</div>

<%-- Bootstrap 5 JS Bundle --%>
<%@ include file="footer.jsp" %>
</body>
</html>
