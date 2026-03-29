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
<div class="main-content">
    <div class="page-header">
        <div class="page-header-top d-flex justify-content-between align-items-center">
            <div>
                <h2><i class="bi bi-plus-circle"></i> Chỉnh Sửa Chương</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/stories">Quản Lý
                            Truyện</a></li>
                        <li class="breadcrumb-item"><a
                                href="${pageContext.request.contextPath}/admin/stories?action=view&id=${chapter.story_id}">Chi
                            Tiết Truyện</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Chỉnh sửa chương</li>
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
    <div class="card mt-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="bi bi-pencil-square"></i> Thông Tin Chương</h5>
        </div>
        <div class="card-body">
            <form action="chapter?action=update_chapter" method="post"
                  class="p-4 bg-light border rounded shadow-sm">
                <input type="hidden" name="id" value="${chapter.id}">
                <input type="hidden" name="story_id" value="${chapter.story_id}">
                <div class="mb-3">
                    <label class="form-label fw-bold">Số Chương</label>
                    <input type="number" class="form-control"
                           name="chapter_number"
                           value="${chapter.chapter_number}" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên Chương</label>
                    <input type="text" class="form-control"
                           name="name"
                           value="${chapter.name}" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">
                    <i class="bi bi-save"></i> Cập Nhật Chapter
                </button>

            </form>

            <div class="mt-4 p-4 bg-light border rounded shadow-sm">
                <label class="form-label fw-bold">Ảnh Hiện Tại</label>

                <c:if test="${not empty chapter.images}">
                    <div class="row">
                        <c:forEach var="img" items="${chapter.images}">
                            <div class="col-md-3 mb-3 text-center ">
                                <div class="image-container border rounded">
                                <img src="${pageContext.request.contextPath}/${img.image_url}"
                                     class="img-fluid rounded mb-2"
                                     style="height:700px; object-fit:contain;">
                                <div class="image-item d-flex flex-row gap-2 align-items-center">

                                    <a href="chapter?action=deleteImage&id=${img.id}&chapter_id=${chapter.id}"
                                       class="btn btn-danger btn-sm w-100"
                                       onclick="return confirm('Xóa ảnh này?')">
                                        <i class="bi bi-trash"></i> Xóa
                                    </a>
                                    <input class="form-control" type="file" onchange="replaceImage(this, ${img.id})">
                                </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <c:if test="${empty chapter.images}">
                    <p class="text-muted">Chưa có ảnh</p>
                </c:if>
            </div>
            <div class="mt-4 p-4 bg-light border rounded shadow-sm">
                <div class="mb-3">
                    <label for="images" class="form-label fw-bold">Chọn Ảnh Chapter</label>
                    <input type="file" class="form-control" id="images" name="images" multiple accept="image/*">
                    <input type="hidden" name="chapter_id" value="${chapter.id}">
                    <div class="form-text">Bạn có thể chọn nhiều ảnh. Hãy đảm bảo ảnh đã được đặt tên theo thứ tự.</div>
                </div>
                <button type="button" class="btn btn-primary" onclick="uploadImages()">Thêm ảnh</button>
            </div>
            <ul id="result"></ul>
        </div>
    </div>
</div>
<script>

    async function uploadImages() {
        console.log('uploading images...');
        const files = document.getElementById("images").files;
        const chapterId = document.querySelector("input[name='chapter_id']").value;
        let index = 0;
        const MAX = 5;
        let hasError = false;
        async function worker() {
            while (index < files.length) {
                let currentIndex = index;     // 🔥 giữ lại thứ tự
                let file = files[index++];   // lấy file

                let result = await uploadSingle(file, chapterId, currentIndex);

                if (!result) {
                    hasError = true;
                }
            }
        }
        let workers = [];
        for (let i = 0; i < MAX; i++) {
            workers.push(worker());
        }
        await Promise.all(workers);
        if (!hasError) {
            location.reload();
        } else {
            alert("Có ảnh upload thất bại! Bạn có thể retry từng ảnh.");
        }
    }



    async function uploadSingle(file, chapterId, order) {
        let li = document.createElement("li");
        li.innerText = "Uploading: " + file.name;
        document.getElementById("result").appendChild(li);

        let formData = new FormData();
        formData.append("image", file);
        formData.append("chapter_id", chapterId);
        formData.append("image_order", order); // 🔥 THÊM DÒNG NÀY
        formData.append("action", "uploadSingle");

        try {
            let res = await fetch("/admin/stories/chapter", {
                method: "POST",
                body: formData
            });

            if (res.ok) {
                li.innerText = "Success " + file.name;
                return true;
            } else {
                showRetry(li, file, chapterId, order); // 🔥 nhớ truyền order
                return false;
            }

        } catch (err) {
            showRetry(li, file, chapterId, order); // 🔥 nhớ truyền order
            return false;
        }
    }

    function showRetry(li, file, chapterId, order) {
        li.innerText = "Failed: " + file.name;

        let btn = document.createElement("button");
        btn.innerText = "Retry";

        btn.onclick = async () => {
            li.innerText = "Retrying: " + file.name;
            let ok = await uploadSingle(file, chapterId, order);
            if (ok) {
                li.innerText = "Success " + file.name;
                btn.remove();
            }
        };

        li.appendChild(btn);
    }

    async function replaceImage(input, imageId) {
        let file = input.files[0];
        if (!file) return;

        let formData = new FormData();
        formData.append("image", file);
        formData.append("image_id", imageId);
        formData.append("action", "replaceImage");

        let res = await fetch("/admin/stories/chapter", {
            method: "POST",
            body: formData
        });

        if (res.ok) {
            location.reload();
        } else {
            alert("Upload thất bại");
        }
    }
</script>
<%@ include file="../footer.jsp" %>

</body>
</html>
