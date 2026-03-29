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
                <h2><i class="bi bi-pencil-square"></i> Chỉnh Sửa Truyện</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/stories">Quản Lý Truyện</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chỉnh Sửa</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <%-- Edit Form Section --%>
    <div class="table-section">
        <div class="card">
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/admin/stories?action=update" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${story.id}">

                    <div class="row">
                        <div class="col-md-8">
                            <div class="mb-3">
                                <label for="title" class="form-label">Tên Truyện <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="title" name="title" value="${story.title}" required>
                            </div>

                            <div class="mb-3">
                                <label for="author" class="form-label">Tác Giả <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="author" name="author" value="${story.author}">
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Mô Tả</label>
                                <textarea class="form-control" id="description" name="description" rows="5">${story.description}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="status" class="form-label">Trạng Thái</label>
                                <select class="form-select" id="status" name="status">
                                    <option value="active" ${story.status eq 'active' ? 'selected' : ''}>Đang tiến hành</option>
                                    <option value="paused" ${story.status eq 'paused' ? 'selected' : ''}>Tạm dừng</option>
                                    <option value="completed" ${story.status eq 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Ảnh Bìa Hiện Tại</label>
                                <div class="text-center mb-3">
                                    <img src="${pageContext.request.contextPath}/${story.cover_image}"
                                         alt="${story.title}"
                                         class="img-thumbnail"
                                         style="max-width: 100%; max-height: 300px;"
                                         id="currentImage">
                                </div>
                                <input type="hidden" name="current_cover_image" value="${story.cover_image}">
                            </div>

                            <div class="mb-3">
                                <label for="cover_image" class="form-label">Đổi Ảnh Bìa</label>
                                <input type="file" class="form-control" id="cover_image" name="cover_image" accept="image/*" onchange="previewImage(event)">
                                <small class="text-muted">Để trống nếu không muốn thay đổi ảnh</small>
                            </div>

                            <div class="mb-3" id="imagePreview" style="display: none;">
                                <label class="form-label">Xem Trước Ảnh Mới</label>
                                <img id="preview" class="img-thumbnail" style="max-width: 100%; max-height: 300px;">
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-check-circle"></i> Cập Nhật Truyện
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/stories" class="btn btn-secondary">
                            <i class="bi bi-x-circle"></i> Hủy
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%-- Bootstrap 5 JS Bundle --%>
<%@ include file="../footer.jsp" %>

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
</body>
</html>
