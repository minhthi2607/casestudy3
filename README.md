# VlogTruyen - Website Đọc Truyện Trực Tuyến

VlogTruyen là một ứng dụng web được xây dựng bằng Java Servlet/JSP, cho phép người dùng đọc các bộ truyện trực tuyến và quản trị viên quản lý nội dung truyện, chương.

## 🚀 Tính năng chính

### Đối với Người dùng
- **Xem danh sách truyện:** Hiển thị các bộ truyện mới nhất, nổi bật.

[//]: # (- **Tìm kiếm truyện:** Tìm kiếm theo tiêu đề hoặc tác giả.)
- **Đọc truyện:** Giao diện đọc truyện thân thiện, hỗ trợ chuyển chương tiếp theo/quay lại.
- **Đăng ký & Đăng nhập:** Quản lý tài khoản cá nhân.

### Đối với Quản trị viên (Admin)
- **Quản lý truyện:** Thêm, sửa, xóa các bộ truyện.
- **Quản lý chương:** Thêm, sửa, xóa các chương (chapters) của từng bộ truyện.
- **Quản lý người dùng:** Xem và quản lý danh sách thành viên.
- **Dashboard:** Thống kê cơ bản về hoạt động của hệ thống.

## 🛠 Công nghệ sử dụng

- **Backend:** Java 8, Servlet, JSP.
- **Frontend:** HTML5, CSS3, JavaScript (JSTL).
- **Database:** MySQL.
- **Build Tool:** Gradle.
- **Thư viện hỗ trợ:**
    - MySQL Connector (Kết nối CSDL).
    - jBCrypt (Mã hóa mật khẩu).
    - JSTL (Thẻ tùy chỉnh trong JSP).

## 📋 Hướng dẫn cài đặt

### 1. Yêu cầu hệ thống
- JDK 1.8 hoặc cao hơn.
- MySQL Server.
- Gradle.
- Một máy chủ Web (ví dụ: Apache Tomcat 9.0).

### 2. Thiết lập cơ sở dữ liệu
- Tạo một database mới trong MySQL có tên là `vlogtruyen`.
- Cấu hình thông tin kết nối (username, password) tại:
  `src/main/java/org/example/vlogtruyen/utils/DBConnection.java`

### 3. Cấu hình biến môi trường
Để ứng dụng có thể lưu trữ và hiển thị ảnh (truyện/chương), bạn cần thiết lập biến môi trường `VLOGTRUYEN_UPLOAD_PATH` trỏ tới thư mục `uploads` trong dự án:
- **Windows:**
  - Biến: `VLOGTRUYEN_UPLOAD_PATH`
  - Giá trị: `C:\Users\ADMIN\IdeaProjects\vlogtruyen\uploads` (hoặc đường dẫn tuyệt đối đến thư mục `uploads` của bạn).
- **Cách thiết lập trên IntelliJ IDEA:**
  - Mở `Run/Debug Configurations`.
  - Chọn cấu hình Tomcat của bạn.
  - Tại tab `Server` hoặc `Startup/Connection`, tìm phần `Environment variables`.
  - Thêm `VLOGTRUYEN_UPLOAD_PATH` với đường dẫn tương ứng.

### 4. Tài khoản mặc định (Admin)
Sau khi chạy ứng dụng, bạn có thể sử dụng tài khoản sau để đăng nhập vào trang quản trị:
- **Tài khoản:** `admin`
- **Mật khẩu:** `123456`

### 5. Chạy ứng dụng
- Clone project về máy.
- Sử dụng Gradle để build project:
  ```bash
  ./gradlew build
  ```
- Deploy file `.war` vào Tomcat hoặc chạy trực tiếp thông qua IDE (IntelliJ IDEA/Eclipse).

## 📂 Cấu trúc dự án
- `src/main/java`: Chứa mã nguồn xử lý logic (Controller, DAO, Service, Model).
- `src/main/webapp`: Chứa các file giao diện (JSP, CSS, JS).
- `uploads`: Thư mục lưu trữ hình ảnh truyện và các chương.

---
*Dự án được phát triển bởi [Tên của bạn/Nhóm của bạn]*
