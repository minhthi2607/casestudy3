<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Truyện - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stories.css">

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
                <h2><i class="bi bi-book"></i> Quản Lý Truyện</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Quản Lý Truyện</li>
                    </ol>
                </nav>
            </div>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStoryModal">
                <i class="bi bi-plus-circle"></i> Thêm Truyện Mới
            </button>
        </div>
    </div>

    <%-- Filter & Search Section --%>
<%--    <div class="filter-section">--%>
<%--        <div class="d-flex gap-3 align-items-center flex-wrap">--%>
<%--            <div class="search-input-wrapper">--%>
<%--                <i class="bi bi-search"></i>--%>
<%--                <input type="text" class="form-control" placeholder="Tìm kiếm theo tên truyện..." id="searchInput">--%>
<%--            </div>--%>
<%--            <select class="form-select" style="width: 200px;" id="statusFilter">--%>
<%--                <option value="">Trạng Thái: Tất cả</option>--%>
<%--                <option value="active">Active</option>--%>
<%--                <option value="paused">Paused</option>--%>
<%--                <option value="completed">Completed</option>--%>
<%--            </select>--%>
<%--            <button class="btn btn-primary" onclick="filterStories()">--%>
<%--                <i class="bi bi-search"></i> Tìm Kiếm--%>
<%--            </button>--%>
<%--            <button class="btn btn-outline-secondary" onclick="resetFilters()">--%>
<%--                <i class="bi bi-arrow-clockwise"></i> Đặt Lại--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>

    <%-- Stories Table --%>
    <div class="table-section">
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                <tr>
                    <th style="width: 50px;">#</th>
                    <th style="width: 100px;">Ảnh Bìa</th>
                    <th style="width: 30%;">Tên Truyện</th>
                    <th style="width: 150px;">Tác Giả</th>
<%--                    <th style="width: 100px; text-align: center;">Số Chương</th>--%>
<%--                    <th style="width: 130px;">Ngày Cập Nhật</th>--%>
                    <th style="width: 120px; text-align: center;">Trạng Thái</th>
                    <th style="width: 150px; text-align: center;">Hành Động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${stories}" varStatus="status">
                    <tr>
                        <!-- STT -->
                        <td>${status.index + 1}</td>

                        <!-- Ảnh Bìa -->
                        <td>
                            <div class="story-thumbnail">
                                <img src="${pageContext.request.contextPath}/${item.cover_image}"
                                     alt="${item.title}" width="50">
                            </div>
                        </td>

                        <!-- Tên truyện + mô tả -->
                        <td>
                            <div class="story-title">${item.title}</div>
                            <p class="story-description">${item.description}</p>
                        </td>

                        <!-- Tác giả -->
                        <td>${item.author}</td>

                        <!-- Số chương -->
<%--                        <td style="text-align: center;">--%>
<%--                            <span class="chapter-badge">${item.chapter_count}</span>--%>
<%--                        </td>--%>

                        <!-- Ngày cập nhật -->
<%--                        <td>${item.updated_at}</td>--%>

                        <!-- Trạng thái dynamic -->
                        <td style="text-align: center;">
                    <span class="badge
                          <c:choose>
                              <c:when test="${item.status eq 'active'}">bg-success</c:when>
                              <c:when test="${item.status eq 'completed'}">bg-primary</c:when>
                              <c:when test="${item.status eq 'paused'}">bg-warning</c:when>
                              <c:otherwise>bg-secondary</c:otherwise>
                          </c:choose>">
                        <c:choose>
                            <c:when test="${item.status eq 'active'}">Đang tiến hành</c:when>
                            <c:when test="${item.status eq 'completed'}">Đã hoàn thành</c:when>
                            <c:when test="${item.status eq 'paused'}">Tạm dừng</c:when>
                            <c:otherwise>Không xác định</c:otherwise>
                        </c:choose>
                    </span>
                        </td>

                        <!-- Hành động -->
                        <td>
                            <div class="btn-group-actions">
                                <!-- Xem -->
                                <a href="${pageContext.request.contextPath}/admin/stories?action=view&id=${item.id}"
                                   class="btn btn-sm btn-outline-info" title="Xem">
                                    <i class="bi bi-eye"></i>
                                </a>

                                <!-- Sửa -->
                                <a href="${pageContext.request.contextPath}/admin/stories?action=edit&id=${item.id}"
                                   class="btn btn-sm btn-outline-warning" title="Sửa">
                                    <i class="bi bi-pencil"></i>
                                </a>

                                <!-- Xóa -->
                                <a href="${pageContext.request.contextPath}/admin/stories?action=delete&id=${item.id}"
                                   class="btn btn-sm btn-outline-danger" title="Xóa"  onclick="return confirm('Xóa truyện này?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc muốn xóa truyện <strong id="deleteStoryTitle"></strong> không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <form id="deleteForm" method="post" action="">
                    <input type="hidden" name="id" id="deleteStoryId">
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%-- Add Story Modal (Placeholder) --%>
<div class="modal fade" id="addStoryModal" tabindex="-1" aria-labelledby="addStoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <form action="stories?action=create" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="addStoryModalLabel">
                        <i class="bi bi-plus-circle"></i> Thêm Truyện Mới
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="mb-3">
                        <label for="title" class="form-label">Tên Truyện</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Nhập tên truyện">
                    </div>
                    <div class="mb-3">
                        <label for="author" class="form-label">Tác Giả</label>
                        <input type="text" class="form-control" id="author" name="author"
                               placeholder="Nhập tên tác giả">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Mô Tả</label>
                        <textarea class="form-control" id="description" rows="3" name="description"
                                  placeholder="Nhập mô tả truyện"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="cover_image" class="form-label">Ảnh bìa</label>
                        <input type="file" class="form-control" id="cover_image" name="cover_image" accept="image/*" onchange="previewImage(event)">
                    </div>
                    <div class="mb-3" id="imagePreview" style="display: none;">
                        <img id="preview" class="img-thumbnail" style="max-width: 100%; max-height: 300px;">
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Trạng Thái</label>
                        <select class="form-select" id="status" name="status">
                            <option value="active">Đang tiến hành</option>
                            <option value="paused">Tạm dừng</option>
                            <option value="completed">Đã hoàn thành</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle"></i> Hủy
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-check-circle"></i> Thêm Truyện
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- Bootstrap 5 JS Bundle --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function showDeleteModal(title, id) {
        // Hiển thị tên truyện trong modal
        document.getElementById('deleteStoryTitle').textContent = title;

        // Gán id vào input ẩn
        document.getElementById('deleteStoryId').value = id;

        // Gán action form (nếu bạn muốn gửi đến servlet xóa)
        document.getElementById('deleteForm').action = '${pageContext.request.contextPath}/admin/stories/delete';

        // Hiển thị modal (Bootstrap 5)
        var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        deleteModal.show();
    }
</script>
<script>
    // Preview image before upload
    function previewImage(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
                document.getElementById('imagePreview').style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            document.getElementById('imagePreview').style.display = 'none';
        }
    }
</script>
<%--<script>--%>
<%--    // Store story ID for deletion--%>
<%--    let storyToDeleteId = null;--%>

<%--    // Show delete confirmation modal--%>
<%--    function showDeleteModal(storyName, storyId) {--%>
<%--        document.getElementById('storyNameToDelete').textContent = storyName;--%>
<%--        storyToDeleteId = storyId;--%>
<%--        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));--%>
<%--        deleteModal.show();--%>
<%--    }--%>

<%--    // Confirm deletion--%>
<%--    function confirmDelete() {--%>
<%--        if (storyToDeleteId) {--%>
<%--            // Here you would send AJAX request to delete the story--%>
<%--            console.log('Deleting story with ID:', storyToDeleteId);--%>

<%--            // Close modal--%>
<%--            const deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));--%>
<%--            deleteModal.hide();--%>

<%--            // Show success message (you can implement a toast notification)--%>
<%--            alert('Đã xóa truyện thành công!');--%>

<%--            // Reset the story ID--%>
<%--            storyToDeleteId = null;--%>
<%--        }--%>
<%--    }--%>

<%--    // Filter stories (placeholder function)--%>
<%--    function filterStories() {--%>
<%--        const searchValue = document.getElementById('searchInput').value;--%>
<%--        const statusValue = document.getElementById('statusFilter').value;--%>
<%--        console.log('Searching for:', searchValue, 'Status:', statusValue);--%>
<%--        // Implement filtering logic here--%>
<%--    }--%>

<%--    // Reset filters--%>
<%--    function resetFilters() {--%>
<%--        document.getElementById('searchInput').value = '';--%>
<%--        document.getElementById('statusFilter').value = '';--%>
<%--        console.log('Filters reset');--%>
<%--        // Implement reset logic here--%>
<%--    }--%>

<%--    // Enable search on Enter key--%>
<%--    document.getElementById('searchInput').addEventListener('keypress', function(e) {--%>
<%--        if (e.key === 'Enter') {--%>
<%--            filterStories();--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
