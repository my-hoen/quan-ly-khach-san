-- Tạo cơ sở dữ liệu
CREATE DATABASE HotelManagement;
GO
USE HotelManagement;
GO

-- Bảng Khách hàng
CREATE TABLE KhachHang (
    MaKH INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(100),
    CMND NVARCHAR(20) UNIQUE,
    SDT NVARCHAR(15),
    Email NVARCHAR(50)
);
GO

-- Bảng Dịch vụ
CREATE TABLE DichVu (
    MaDV INT IDENTITY(1,1) PRIMARY KEY,
    TenDV NVARCHAR(100),
    Gia DECIMAL(10,2)
);
GO

-- Bảng Phòng
CREATE TABLE Phong (
    MaPhong INT IDENTITY(1,1) PRIMARY KEY,
    LoaiPhong NVARCHAR(50),
    GiaPhong DECIMAL(10,2),
    TrangThai NVARCHAR(20) DEFAULT N'Trống'
);
GO

-- Bảng Đặt phòng
CREATE TABLE DatPhong (
    MaDatPhong INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT,
    MaPhong INT,
    NgayDat DATE,
    NgayTra DATE,
    TrangThai NVARCHAR(20) DEFAULT N'Đang đặt',
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);
GO

-- Bảng Sử dụng dịch vụ
CREATE TABLE SuDungDichVu (
    MaSuDung INT IDENTITY(1,1) PRIMARY KEY,
    MaDatPhong INT,
    MaDV INT,
    SoLuong INT,
    FOREIGN KEY (MaDatPhong) REFERENCES DatPhong(MaDatPhong),
    FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV)
);
GO

-- Bảng Thanh toán
CREATE TABLE ThanhToan (
    MaTT INT IDENTITY(1,1) PRIMARY KEY,
    MaDatPhong INT,
    TongTien DECIMAL(10,2),
    NgayTT DATE,
    FOREIGN KEY (MaDatPhong) REFERENCES DatPhong(MaDatPhong)
);
GO

-- Bảng Phản hồi khách hàng
CREATE TABLE PhanHoi (
    MaPhanHoi INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT,
    DanhGia INT CHECK (DanhGia BETWEEN 1 AND 5),
    BinhLuan NVARCHAR(500),
    NgayPhanHoi DATE,
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);
GO

-- Bảng Quản lý bảo trì phòng
CREATE TABLE BaoTriPhong (
    MaBaoTri INT IDENTITY(1,1) PRIMARY KEY,
    MaPhong INT,
    NgayBaoTri DATE,
    MoTa NVARCHAR(500),
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong)
);
GO


--bảng khách hàng
INSERT INTO KhachHang (HoTen, CMND, SDT, Email) VALUES
(N'Nguyen Van A', '123456789', '0987654321', 'a@gmail.com'),
(N'Tran Thi B', '987654321', '0978123456', 'b@gmail.com'),
(N'Pham Van C', '234567890', '0967123456', 'c@gmail.com'),
(N'Le Thi D', '345678901', '0956781234', 'd@gmail.com'),
(N'Hoang Van E', '456789012', '0945678123', 'e@gmail.com'),
(N'Bui Thi F', '567890123', '0934567812', 'f@gmail.com'),
(N'Vu Van G', '678901234', '0923456781', 'g@gmail.com'),
(N'Do Thi H', '789012345', '0912345678', 'h@gmail.com'),
(N'Pham Minh I', '890123456', '0901234567', 'i@gmail.com'),
(N'Nguyen Thi J', '901234567', '0890123456', 'j@gmail.com'),
(N'Tran Van K', '112233445', '0887654321', 'k@gmail.com'),
(N'Le Thi L', '223344556', '0876543210', 'l@gmail.com'),
(N'Hoang Van M', '334455667', '0865432109', 'm@gmail.com'),
(N'Bui Thi N', '445566778', '0854321098', 'n@gmail.com'),
(N'Vu Thi O', '556677889', '0843210987', 'o@gmail.com');
GO



--bảng dịch vụ 
INSERT INTO DichVu (TenDV, Gia) VALUES
(N'Giặt ủi', 100000),
(N'Bữa sáng', 150000),
(N'Đưa đón sân bay', 300000),
(N'Massage', 500000),
(N'Karaoke', 200000),
(N'Thuê xe máy', 150000),
(N'Dịch vụ giường phụ', 200000),
(N'Ăn tối buffet', 350000),
(N'Tour du lịch', 1000000),
(N'Xông hơi', 400000),
(N'Internet tốc độ cao', 50000),
(N'Đồ uống mini bar', 100000),
(N'Dịch vụ spa', 600000),
(N'Đặt vé máy bay', 200000),
(N'Thuê hội trường', 2000000);
GO


--bảng phòng 
INSERT INTO Phong (LoaiPhong, GiaPhong, TrangThai) VALUES
(N'Standard', 500000, N'Trống'),
(N'Deluxe', 1000000, N'Trống'),
(N'Suite', 2000000, N'Trống'),
(N'VIP', 3000000, N'Trống'),
(N'Standard', 500000, N'Trống'),
(N'Deluxe', 1000000, N'Trống'),
(N'Suite', 2000000, N'Trống'),
(N'VIP', 3000000, N'Trống'),
(N'Standard', 500000, N'Trống'),
(N'Deluxe', 1000000, N'Trống'),
(N'Suite', 2000000, N'Trống'),
(N'VIP', 3000000, N'Trống'),
(N'Standard', 500000, N'Trống'),
(N'Deluxe', 1000000, N'Trống'),
(N'Suite', 2000000, N'Trống');
GO

--bảng đặt phòng 
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra, TrangThai) VALUES
(1, 1, '2025-03-01', '2025-03-03', N'Đang đặt'),
(2, 2, '2025-03-02', '2025-03-04', N'Đang đặt'),
(3, 3, '2025-03-03', '2025-03-05', N'Đang đặt'),
(4, 4, '2025-03-04', '2025-03-06', N'Đang đặt'),
(5, 5, '2025-03-05', '2025-03-07', N'Đang đặt'),
(6, 6, '2025-03-06', '2025-03-08', N'Đang đặt'),
(7, 7, '2025-03-07', '2025-03-09', N'Đang đặt'),
(8, 8, '2025-03-08', '2025-03-10', N'Đang đặt'),
(9, 9, '2025-03-09', '2025-03-11', N'Đang đặt'),
(10, 10, '2025-03-10', '2025-03-12', N'Đang đặt'),
(11, 11, '2025-03-11', '2025-03-13', N'Đang đặt'),
(12, 12, '2025-03-12', '2025-03-14', N'Đang đặt'),
(13, 13, '2025-03-13', '2025-03-15', N'Đang đặt'),
(14, 14, '2025-03-14', '2025-03-16', N'Đang đặt'),
(15, 15, '2025-03-15', '2025-03-17', N'Đang đặt');
GO

--bảng sử dụng dịch vụ 
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES
(1, 1, 2), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 2),
(6, 6, 1), (7, 7, 1), (8, 8, 2), (9, 9, 1), (10, 10, 1),
(11, 11, 3), (12, 12, 1), (13, 13, 1), (14, 14, 2), (15, 15, 1);
GO


-- Thêm 15 bản ghi mới cho ThanhToan
INSERT INTO ThanhToan (MaDatPhong, TongTien, NgayTT) VALUES
(1, 1300000, '2025-03-18'),  -- Thanh toán khác ngày và số tiền
(2, 1450000, '2025-03-19'),
(3, 2100000, '2025-03-20'),
(4, 3750000, '2025-03-21'),
(5, 800000, '2025-03-22'),
(6, 1250000, '2025-03-23'),
(7, 2350000, '2025-03-24'),
(8, 3900000, '2025-03-25'),
(9, 550000, '2025-03-26'),
(10, 1050000, '2025-03-27'),
(11, 2400000, '2025-03-28'),
(12, 3250000, '2025-03-29'),
(13, 700000, '2025-03-30'),
(14, 1350000, '2025-03-31'),
(15, 2150000, '2025-04-01');
GO

--bảng phản hồi 

INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi) VALUES
(1, 5, N'Dịch vụ tuyệt vời!', '2025-03-03'),
(2, 4, N'Phòng đẹp, nhân viên thân thiện', '2025-03-04'),
(3, 3, N'Giá hơi cao', '2025-03-05'),
(4, 5, N'Rất hài lòng!', '2025-03-06'),
(5, 2, N'Phòng cần sạch hơn', '2025-03-07'),
(6, 4, N'Tốt, sẽ quay lại', '2025-03-08'),
(7, 3, N'Dịch vụ trung bình', '2025-03-09'),
(8, 5, N'Tuyệt vời mọi thứ', '2025-03-10'),
(9, 1, N'Không hài lòng', '2025-03-11'),
(10, 4, N'Khá ổn', '2025-03-12'),
(11, 5, N'Rất đáng tiền', '2025-03-13'),
(12, 3, N'Có thể cải thiện', '2025-03-14'),
(13, 4, N'Khách sạn đẹp', '2025-03-15'),
(14, 2, N'Nhân viên chậm', '2025-03-16'),
(15, 5, N'Tuyệt vời!', '2025-03-17');
GO

--bảng khuyến mãi 
INSERT INTO KhuyenMai (TenKM, MucGiam, NgayBatDau, NgayKetThuc) VALUES
(N'Tết Nguyên Đán', 15.00, '2025-02-01', '2025-02-10'),
(N'Mùa hè rực rỡ', 20.00, '2025-06-01', '2025-06-30'),
(N'Khách VIP', 10.00, '2025-03-01', '2025-03-31'),
(N'Noel ấm áp', 25.00, '2025-12-20', '2025-12-25'),
(N'Khai trương', 30.00, '2025-01-01', '2025-01-15'),
(N'Tháng 3 rực rỡ', 15.00, '2025-03-01', '2025-03-15'),
(N'Giỗ tổ', 10.00, '2025-04-01', '2025-04-10'),
(N'Quốc tế lao động', 20.00, '2025-04-28', '2025-05-02'),
(N'Quốc khánh', 25.00, '2025-09-01', '2025-09-05'),
(N'Trăng rằm', 15.00, '2025-09-15', '2025-09-20'),
(N'Black Friday', 30.00, '2025-11-25', '2025-11-30'),
(N'Halloween', 10.00, '2025-10-25', '2025-10-31'),
(N'Ngày nhà giáo', 15.00, '2025-11-15', '2025-11-20'),
(N'Phụ nữ Việt Nam', 20.00, '2025-10-15', '2025-10-20'),
(N'Năm mới', 25.00, '2025-12-28', '2026-01-05');
GO

--bảng lịch bảo trì phong
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES
(1, '2025-03-01', N'Sửa điều hòa'),
(2, '2025-03-02', N'Thay thảm'),
(3, '2025-03-03', N'Bảo trì điện'),
(4, '2025-03-04', N'Kiểm tra nước'),
(5, '2025-03-05', N'Sơn lại phòng'),
(6, '2025-03-06', N'Sửa cửa'),
(7, '2025-03-07', N'Thay đèn'),
(8, '2025-03-08', N'Kiểm tra wifi'),
(9, '2025-03-09', N'Sửa ống nước'),
(10, '2025-03-10', N'Bảo trì TV'),
(11, '2025-03-11', N'Thay rèm'),
(12, '2025-03-12', N'Sửa giường'),
(13, '2025-03-13', N'Kiểm tra khóa'),
(14, '2025-03-14', N'Sơn tường'),
(15, '2025-03-15', N'Thay chăn ga');
GO	


--in ra bảng khách hàng
SELECT *
FROM KhachHang
ORDER BY MaKH ASC;
GO
-- in ra bảng dịch vụ 
SELECT *
FROM DichVu
ORDER BY MaDV ASC;
GO
--in ra bảng phòng 
SELECT *
FROM Phong
ORDER BY MaPhong ASC;
GO

--in ra bảng đặt phòng 
SELECT *
FROM DatPhong
ORDER BY MaDatPhong ASC;
GO

--in ra bảng sử dụng dịch vụ 
SELECT *
FROM SuDungDichVu
ORDER BY MaSuDung ASC;
GO
--in ra bảng thanh toán 
SELECT *
FROM ThanhToan
ORDER BY MaTT ASC;
GO

--in ra bảng phản hồi 
SELECT *
FROM PhanHoi
ORDER BY MaPhanHoi ASC;
GO

--in ra bảng bảo trì phòng 
SELECT *
FROM BaoTriPhong
ORDER BY MaBaoTri ASC;
GO

--tạo view 
-- VIEW 1: Danh sách khách hàng và số lần đặt phòng
CREATE VIEW View_KhachHang_DatPhong AS
SELECT KH.MaKH, KH.HoTen, COUNT(DP.MaDatPhong) AS SoLanDatPhong
FROM KhachHang KH
LEFT JOIN DatPhong DP ON KH.MaKH = DP.MaKH
GROUP BY KH.MaKH, KH.HoTen;
GO
-- Xóa VIEW 1
DROP VIEW IF EXISTS View_KhachHang_DatPhong;
GO

-- VIEW 2: Thông tin phòng trống
CREATE VIEW View_Phong_Trong AS
SELECT MaPhong, LoaiPhong, GiaPhong
FROM Phong
WHERE TrangThai = N'Trống';
GO
-- Xóa VIEW 2
DROP VIEW IF EXISTS View_Phong_Trong;
GO

-- VIEW 3: Tổng tiền thanh toán theo khách hàng
CREATE VIEW View_TongTien_KhachHang AS
SELECT KH.MaKH, KH.HoTen, SUM(TT.TongTien) AS TongTienThanhToan
FROM KhachHang KH
JOIN DatPhong DP ON KH.MaKH = DP.MaKH
JOIN ThanhToan TT ON DP.MaDatPhong = TT.MaDatPhong
GROUP BY KH.MaKH, KH.HoTen;
GO
-- Xóa VIEW 3
--VIEW 4 tổng dịch vụ sử dụng theo loại phòng 
DROP VIEW IF EXISTS View_TongTien_KhachHang;
GO
CREATE VIEW View_TongDichVu_LoaiPhong AS
SELECT P.LoaiPhong, SUM(SDV.SoLuong) AS TongSoLuongDichVu
FROM Phong P
JOIN DatPhong DP ON P.MaPhong = DP.MaPhong
JOIN SuDungDichVu SDV ON DP.MaDatPhong = SDV.MaDatPhong
GROUP BY P.LoaiPhong;
GO


-- VIEW 5: Phản hồi trung bình theo khách hàng
CREATE VIEW View_PhanHoi_TrungBinh AS
SELECT KH.MaKH, KH.HoTen, AVG(PH.DanhGia) AS DanhGiaTrungBinh
FROM KhachHang KH
JOIN PhanHoi PH ON KH.MaKH = PH.MaKH
GROUP BY KH.MaKH, KH.HoTen;
GO
-- Xóa VIEW 5
DROP VIEW IF EXISTS View_PhanHoi_TrungBinh;
GO

-- VIEW 6: Dịch vụ sử dụng theo đặt phòng
CREATE VIEW View_DichVu_DatPhong AS
SELECT DP.MaDatPhong, DV.TenDV, SDV.SoLuong, (DV.Gia * SDV.SoLuong) AS TongChiPhi
FROM DatPhong DP
JOIN SuDungDichVu SDV ON DP.MaDatPhong = SDV.MaDatPhong
JOIN DichVu DV ON SDV.MaDV = DV.MaDV;
GO
-- Xóa VIEW 6
DROP VIEW IF EXISTS View_DichVu_DatPhong;
GO

-- VIEW 7: Phòng bảo trì gần đây
CREATE VIEW View_Phong_BaoTri AS
SELECT P.MaPhong, P.LoaiPhong, BT.NgayBaoTri, BT.MoTa
FROM Phong P
JOIN BaoTriPhong BT ON P.MaPhong = BT.MaPhong;
GO
-- Xóa VIEW 7
DROP VIEW IF EXISTS View_Phong_BaoTri;
GO

-- view 8. tổng tiền thanh toán của khách hàng cao nhất 
CREATE VIEW View_KhachHang_TongThanhToan_CaoNhat AS
SELECT TOP 1 KH.MaKH, KH.HoTen, SUM(TT.TongTien) AS TongThanhToan
FROM KhachHang KH
JOIN DatPhong DP ON KH.MaKH = DP.MaKH
JOIN ThanhToan TT ON DP.MaDatPhong = TT.MaDatPhong
GROUP BY KH.MaKH, KH.HoTen
ORDER BY TongThanhToan DESC;
GO

--view 9 phòng được baor trì nhiều nhất 
CREATE VIEW View_Phong_BaoTri_NhieuNhat AS
SELECT TOP 1 P.MaPhong, P.LoaiPhong, COUNT(BT.MaBaoTri) AS SoLanBaoTri
FROM Phong P
LEFT JOIN BaoTriPhong BT ON P.MaPhong = BT.MaPhong
GROUP BY P.MaPhong, P.LoaiPhong
ORDER BY SoLanBaoTri DESC;
GO


-- VIEW 10: Doanh thu theo loại phòng
CREATE VIEW View_DoanhThu_LoaiPhong AS
SELECT P.LoaiPhong, SUM(TT.TongTien) AS TongDoanhThu
FROM Phong P
JOIN DatPhong DP ON P.MaPhong = DP.MaPhong
JOIN ThanhToan TT ON DP.MaDatPhong = TT.MaDatPhong
GROUP BY P.LoaiPhong;
GO
-- Xóa VIEW 10
DROP VIEW IF EXISTS View_DoanhThu_LoaiPhong;
GO

-- kiểm tra view
-- 1. Xem tất cả khách hàng và số lần đặt phòng từ View_KhachHang_DatPhong, sắp xếp theo số lần đặt giảm dần
SELECT * FROM View_KhachHang_DatPhong 
ORDER BY SoLanDatPhong DESC;

-- 2. Lấy toàn bộ danh sách phòng trống từ View_Phong_Trong, kèm giá và loại phòng
SELECT MaPhong, LoaiPhong, GiaPhong 
FROM View_Phong_Trong 
ORDER BY GiaPhong ASC;

-- 3. Xem tổng tiền thanh toán của tất cả khách hàng từ View_TongTien_KhachHang, sắp xếp theo tổng tiền giảm dần
SELECT MaKH, HoTen, TongTienThanhToan 
FROM View_TongTien_KhachHang 
ORDER BY TongTienThanhToan DESC;

-- 4. Xem tất cả khách hàng và số lần đặt phòng, sắp xếp theo số lần đặt giảm dần, hiển thị thêm thông tin liên hệ
SELECT KH.MaKH, KH.HoTen, KH.SDT, KH.Email, COUNT(DP.MaDatPhong) AS SoLanDatPhong
FROM KhachHang KH
LEFT JOIN DatPhong DP ON KH.MaKH = DP.MaKH
GROUP BY KH.MaKH, KH.HoTen, KH.SDT, KH.Email
ORDER BY SoLanDatPhong DESC;
GO

-- 5. Xem đánh giá trung bình của tất cả khách hàng từ View_PhanHoi_TrungBinh, kèm tên và mã KH
SELECT MaKH, HoTen, DanhGiaTrungBinh 
FROM View_PhanHoi_TrungBinh 
ORDER BY DanhGiaTrungBinh DESC;

-- 6. Lấy tất cả dịch vụ sử dụng cho mọi đặt phòng từ View_DichVu_DatPhong, tính tổng chi phí
SELECT MaDatPhong, TenDV, SoLuong, TongChiPhi 
FROM View_DichVu_DatPhong 
ORDER BY MaDatPhong, TongChiPhi DESC;

-- 7. Xem toàn bộ lịch sử bảo trì phòng từ View_Phong_BaoTri, sắp xếp theo ngày bảo trì
SELECT MaPhong, LoaiPhong, NgayBaoTri, MoTa 
FROM View_Phong_BaoTri 
ORDER BY NgayBaoTri ASC;
-- 8.Lấy toàn bộ danh sách phòng trống, kèm giá, loại phòng và trạng thái, sắp xếp theo giá tăng dần
SELECT P.MaPhong, P.LoaiPhong, P.GiaPhong, P.TrangThai
FROM Phong P
WHERE P.TrangThai = N'Trống'
ORDER BY P.GiaPhong ASC;
GO
-- 9.Xem tổng tiền thanh toán của tất cả khách hàng, kèm thông tin liên hệ, sắp xếp theo tổng tiền giảm dần
SELECT KH.MaKH, KH.HoTen, KH.SDT, KH.Email, SUM(TT.TongTien) AS TongTienThanhToan
FROM KhachHang KH
JOIN DatPhong DP ON KH.MaKH = DP.MaKH
JOIN ThanhToan TT ON DP.MaDatPhong = TT.MaDatPhong
GROUP BY KH.MaKH, KH.HoTen, KH.SDT, KH.Email
ORDER BY TongTienThanhToan DESC;
GO

-- 10. Xem doanh thu của tất cả loại phòng từ View_DoanhThu_LoaiPhong, kèm tổng cộng
SELECT LoaiPhong, TongDoanhThu 
FROM View_DoanhThu_LoaiPhong 
UNION ALL
SELECT N'Tổng cộng', SUM(TongDoanhThu) 
FROM View_DoanhThu_LoaiPhong 
ORDER BY TongDoanhThu DESC;
GO

--xây dựng các produce 

-- 1. Thêm khách hàng mới
CREATE PROCEDURE sp_ThemKhachHang
    @HoTen NVARCHAR(100),
    @CMND NVARCHAR(20),
    @SDT NVARCHAR(15),
    @Email NVARCHAR(50)
AS
BEGIN
    INSERT INTO KhachHang (HoTen, CMND, SDT, Email)
    VALUES (@HoTen, @CMND, @SDT, @Email);
END;
GO
DROP PROCEDURE IF EXISTS sp_ThemKhachHang;
GO

-- 2. Đặt phòng cho khách hàng
CREATE PROCEDURE sp_DatPhong
    @MaKH INT,
    @MaPhong INT,
    @NgayDat DATE,
    @NgayTra DATE
AS
BEGIN
    IF EXISTS (SELECT * FROM Phong WHERE MaPhong = @MaPhong AND TrangThai = N'Trống')
    BEGIN
        INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra)
        VALUES (@MaKH, @MaPhong, @NgayDat, @NgayTra);
        UPDATE Phong SET TrangThai = N'Đã đặt' WHERE MaPhong = @MaPhong;
    END
    ELSE
        PRINT N'Phòng không trống!';
END;
GO
DROP PROCEDURE IF EXISTS sp_DatPhong;
GO

-- 3. Cập nhật trạng thái phòng
CREATE PROCEDURE sp_CapNhatTrangThaiPhong
    @MaPhong INT,
    @TrangThai NVARCHAR(20)
AS
BEGIN
    UPDATE Phong
    SET TrangThai = @TrangThai
    WHERE MaPhong = @MaPhong;
END;
GO
DROP PROCEDURE IF EXISTS sp_CapNhatTrangThaiPhong;
GO

-- 4. Tính tổng tiền thanh toán cho một đặt phòng
CREATE PROCEDURE sp_TinhTongTien
    @MaDatPhong INT,
    @TongTien DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @TongTien = ISNULL((DATEDIFF(DAY, DP.NgayDat, DP.NgayTra) * P.GiaPhong) + SUM(DV.Gia * SDV.SoLuong),
	 DATEDIFF(DAY, DP.NgayDat, DP.NgayTra) * P.GiaPhong)
    FROM DatPhong DP
    JOIN Phong P ON DP.MaPhong = P.MaPhong
    LEFT JOIN SuDungDichVu SDV ON DP.MaDatPhong = SDV.MaDatPhong
    LEFT JOIN DichVu DV ON SDV.MaDV = DV.MaDV
    WHERE DP.MaDatPhong = @MaDatPhong
    GROUP BY DP.NgayDat, DP.NgayTra, P.GiaPhong;
END;
GO
DROP PROCEDURE IF EXISTS sp_TinhTongTien;
GO

-- 5. Xóa đặt phòng
CREATE PROCEDURE sp_XoaDatPhong
    @MaDatPhong INT
AS
BEGIN
    DECLARE @MaPhong INT;
    SELECT @MaPhong = MaPhong FROM DatPhong WHERE MaDatPhong = @MaDatPhong;
    DELETE FROM DatPhong WHERE MaDatPhong = @MaDatPhong;
    UPDATE Phong SET TrangThai = N'Trống' WHERE MaPhong = @MaPhong;
END;
GO
DROP PROCEDURE IF EXISTS sp_XoaDatPhong;
GO

-- 6. Thêm dịch vụ vào đặt phòng
CREATE PROCEDURE sp_ThemDichVu
    @MaDatPhong INT,
    @MaDV INT,
    @SoLuong INT
AS
BEGIN
    INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong)
    VALUES (@MaDatPhong, @MaDV, @SoLuong);
END;
GO
DROP PROCEDURE IF EXISTS sp_ThemDichVu;
GO
--7 cập nhật giá dịch vụ 
CREATE PROCEDURE sp_CapNhatGiaDichVu
    @MaDV INT,
    @GiaMoi DECIMAL(10,2)
AS
BEGIN
    UPDATE DichVu
    SET Gia = @GiaMoi
    WHERE MaDV = @MaDV;
END;
GO



-- 8. Lấy danh sách phòng trống trong khoảng thời gian
CREATE PROCEDURE sp_DanhSachPhongTrong
    @NgayDat DATE,
    @NgayTra DATE
AS
BEGIN
    SELECT P.MaPhong, P.LoaiPhong, P.GiaPhong
    FROM Phong P
    WHERE P.TrangThai = N'Trống'
    AND NOT EXISTS (
        SELECT * FROM DatPhong DP
        WHERE DP.MaPhong = P.MaPhong
        AND (@NgayDat < DP.NgayTra AND @NgayTra > DP.NgayDat)
    );
END;
GO
DROP PROCEDURE IF EXISTS sp_DanhSachPhongTrong;
GO

-- 9. Thêm phản hồi khách hàng
CREATE PROCEDURE sp_ThemPhanHoi
    @MaKH INT,
    @DanhGia INT,
    @BinhLuan NVARCHAR(500)
AS
BEGIN
    INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi)
    VALUES (@MaKH, @DanhGia, @BinhLuan, GETDATE());
END;
GO
DROP PROCEDURE IF EXISTS sp_ThemPhanHoi;
GO

-- 10. Báo cáo doanh thu theo tháng
CREATE PROCEDURE sp_BaoCaoDoanhThu
    @Thang INT,
    @Nam INT
AS
BEGIN
    SELECT P.LoaiPhong, SUM(TT.TongTien) AS DoanhThu
    FROM ThanhToan TT
    JOIN DatPhong DP ON TT.MaDatPhong = DP.MaDatPhong
    JOIN Phong P ON DP.MaPhong = P.MaPhong
    WHERE MONTH(TT.NgayTT) = @Thang AND YEAR(TT.NgayTT) = @Nam
    GROUP BY P.LoaiPhong;
END;
GO
DROP PROCEDURE IF EXISTS sp_BaoCaoDoanhThu;
GO
-- kiểm tra produc
-- 1. Thêm khách hàng mới
EXEC sp_ThemKhachHang N'Nguyen Van Z', '999999999', '0999999999', 'z@gmail.com';
EXEC sp_ThemKhachHang N'Le Thi P', '888888888', '0888888888', 'p@gmail.com';
EXEC sp_ThemKhachHang N'Tran Van Q', '777777777', '0777777777', 'q@gmail.com';
SELECT * FROM KhachHang WHERE CMND IN ('999999999', '888888888', '777777777');


-- 2. Đặt phòng cho khách hàng
EXEC sp_DatPhong 1, 1, '2025-03-20', '2025-03-22';
EXEC sp_DatPhong 2, 2, '2025-03-21', '2025-03-24';
EXEC sp_DatPhong 3, 3, '2025-03-22', '2025-03-25';
SELECT * FROM DatPhong WHERE MaKH IN (1, 2, 3) AND NgayDat >= '2025-03-20';
SELECT * FROM Phong WHERE MaPhong IN (1, 2, 3);

-- 3. Cập nhật trạng thái phòng
EXEC sp_CapNhatTrangThaiPhong 1, N'Trống';
EXEC sp_CapNhatTrangThaiPhong 2, N'Đang bảo trì';
EXEC sp_CapNhatTrangThaiPhong 3, N'Đã đặt';
SELECT * FROM Phong WHERE MaPhong IN (1, 2, 3);

-- 4. Tính tổng tiền thanh toán cho một đặt phòng
DECLARE @TongTien1 DECIMAL(10,2), @TongTien2 DECIMAL(10,2), @TongTien3 DECIMAL(10,2);
EXEC sp_TinhTongTien 1, @TongTien1 OUTPUT;
EXEC sp_TinhTongTien 2, @TongTien2 OUTPUT;
EXEC sp_TinhTongTien 3, @TongTien3 OUTPUT;
PRINT 'Tong tien dat phong 1: ' + CAST(@TongTien1 AS NVARCHAR(20));
PRINT 'Tong tien dat phong 2: ' + CAST(@TongTien2 AS NVARCHAR(20));
PRINT 'Tong tien dat phong 3: ' + CAST(@TongTien3 AS NVARCHAR(20));
SELECT DP.MaDatPhong, DP.NgayDat, DP.NgayTra, P.GiaPhong, SDV.MaDV, SDV.SoLuong 
FROM DatPhong DP
LEFT JOIN SuDungDichVu SDV ON DP.MaDatPhong = SDV.MaDatPhong
JOIN Phong P ON DP.MaPhong = P.MaPhong
WHERE DP.MaDatPhong IN (1, 2, 3);

-- 5. Xóa đặt phòng
EXEC sp_XoaDatPhong 1;
EXEC sp_XoaDatPhong 2;
SELECT * FROM DatPhong WHERE MaDatPhong IN (1, 2);
SELECT * FROM Phong WHERE MaPhong IN (1, 2);

-- 6. Thêm dịch vụ vào đặt phòng
EXEC sp_ThemDichVu 3, 1, 3; -- 3 lần giặt ủi
EXEC sp_ThemDichVu 3, 2, 2; -- 2 bữa sáng
EXEC sp_ThemDichVu 3, 3, 1; -- 1 đưa đón sân bay
SELECT * FROM SuDungDichVu WHERE MaDatPhong = 3;
-- 7.Cập nhật giá 3 dịch vụ và kiểm tra
EXEC sp_CapNhatGiaDichVu 1, 120000; -- Giặt ủi
EXEC sp_CapNhatGiaDichVu 2, 180000; -- Bữa sáng
EXEC sp_CapNhatGiaDichVu 3, 350000; -- Đưa đón sân bay
SELECT MaDV, TenDV, Gia 
FROM DichVu 
WHERE MaDV IN (1, 2, 3);
GO

-- 8. Lấy danh sách phòng trống trong khoảng thời gian
EXEC sp_DanhSachPhongTrong '2025-03-20', '2025-03-22';
EXEC sp_DanhSachPhongTrong '2025-04-01', '2025-04-05';

-- 9. Thêm phản hồi khách hàng
EXEC sp_ThemPhanHoi 1, 5, N'Dịch vụ tuyệt vời, rất hài lòng!';
EXEC sp_ThemPhanHoi 2, 4, N'Phòng sạch sẽ, nhân viên nhiệt tình.';
EXEC sp_ThemPhanHoi 3, 3, N'Giá hơi cao so với chất lượng.';
SELECT * FROM PhanHoi WHERE MaKH IN (1, 2, 3) AND NgayPhanHoi = '2025-03-03';

-- 10. Báo cáo doanh thu theo tháng
EXEC sp_BaoCaoDoanhThu 3, 2025;
EXEC sp_BaoCaoDoanhThu 4, 2025;


--trigger
-- 1. Cập nhật trạng thái phòng khi đặt phòng
CREATE TRIGGER tr_CapNhatTrangThaiPhong_DatPhong
ON DatPhong
AFTER INSERT
AS
BEGIN
    UPDATE Phong
    SET TrangThai = N'Đã đặt'
    FROM Phong P
    JOIN inserted I ON P.MaPhong = I.MaPhong;
END;
GO
DROP TRIGGER IF EXISTS tr_CapNhatTrangThaiPhong_DatPhong;
GO

-- 2. Cập nhật trạng thái phòng khi xóa đặt phòng
CREATE TRIGGER tr_CapNhatTrangThaiPhong_XoaDatPhong
ON DatPhong
AFTER DELETE
AS
BEGIN
    UPDATE Phong
    SET TrangThai = N'Trống'
    FROM Phong P
    JOIN deleted D ON P.MaPhong = D.MaPhong;
END;
GO
DROP TRIGGER IF EXISTS tr_CapNhatTrangThaiPhong_XoaDatPhong;
GO

-- 3. Kiểm tra số lượng dịch vụ hợp lệ
CREATE TRIGGER tr_KiemTraSoLuongDichVu
ON SuDungDichVu
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE SoLuong <= 0)
    BEGIN
        RAISERROR (N'Số lượng dịch vụ phải lớn hơn 0!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
DROP TRIGGER IF EXISTS tr_KiemTraSoLuongDichVu;
GO

-- 4. Tự động thêm ngày thanh toán khi thêm bản ghi
CREATE TRIGGER tr_ThemNgayThanhToan
ON ThanhToan
AFTER INSERT
AS
BEGIN
    UPDATE ThanhToan
    SET NgayTT = GETDATE()
    FROM ThanhToan TT
    JOIN inserted I ON TT.MaTT = I.MaTT
    WHERE TT.NgayTT IS NULL;
END;
GO
DROP TRIGGER IF EXISTS tr_ThemNgayThanhToan;
GO

-- 5. Kiểm tra đánh giá phản hồi hợp lệ
CREATE TRIGGER tr_KiemTraDanhGia
ON PhanHoi
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE DanhGia < 1 OR DanhGia > 5)
    BEGIN
        RAISERROR (N'Đánh giá phải từ 1 đến 5!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
DROP TRIGGER IF EXISTS tr_KiemTraDanhGia;
GO

-- 6. Cập nhật tổng tiền thanh toán khi thêm dịch vụ
CREATE TRIGGER tr_CapNhatTongTien_DichVu
ON SuDungDichVu
AFTER INSERT
AS
BEGIN
    UPDATE ThanhToan
    SET TongTien = TongTien + (SELECT DV.Gia * I.SoLuong
                               FROM inserted I
                               JOIN DichVu DV ON I.MaDV = DV.MaDV
                               WHERE I.MaDatPhong = ThanhToan.MaDatPhong)
    FROM ThanhToan
    JOIN inserted I ON ThanhToan.MaDatPhong = I.MaDatPhong;
END;
GO
DROP TRIGGER IF EXISTS tr_CapNhatTongTien_DichVu;
GO

--7. kiểm tra giá dịch vụ 
CREATE TRIGGER tr_KiemTraGiaDichVu
ON DichVu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Gia < 0)
    BEGIN
        RAISERROR (N'Giá dịch vụ không được nhỏ hơn 0!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 8. Kiểm tra ngày bảo trì hợp lệ
CREATE TRIGGER tr_KiemTraNgayBaoTri
ON BaoTriPhong
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE NgayBaoTri < GETDATE())
    BEGIN
        RAISERROR (N'Ngày bảo trì không được nhỏ hơn ngày hiện tại!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
DROP TRIGGER IF EXISTS tr_KiemTraNgayBaoTri;
GO

-- 9. Tự động cập nhật trạng thái phòng khi bảo trì
CREATE TRIGGER tr_CapNhatTrangThaiPhong_BaoTri
ON BaoTriPhong
AFTER INSERT
AS
BEGIN
    UPDATE Phong
    SET TrangThai = N'Đang bảo trì'
    FROM Phong P
    JOIN inserted I ON P.MaPhong = I.MaPhong;
END;
GO
DROP TRIGGER IF EXISTS tr_CapNhatTrangThaiPhong_BaoTri;
GO

-- 10. Kiểm tra ngày đặt phòng và ngày trả phòng
CREATE TRIGGER tr_KiemTraNgayDatPhong
ON DatPhong
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE NgayDat >= NgayTra)
    BEGIN
        RAISERROR (N'Ngày đặt phải nhỏ hơn ngày trả!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
DROP TRIGGER IF EXISTS tr_KiemTraNgayDatPhong;
GO

--kiểm tra trigger
-- 1. Cập nhật trạng thái phòng khi đặt phòng
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (1, 1, '2025-03-25', '2025-03-27');
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (2, 2, '2025-03-26', '2025-03-28');
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (3, 3, '2025-03-27', '2025-03-29');
SELECT * FROM DatPhong WHERE MaPhong IN (1, 2, 3) AND NgayDat >= '2025-03-25';
SELECT * FROM Phong WHERE MaPhong IN (1, 2, 3);


-- 2. Cập nhật trạng thái phòng khi xóa đặt phòng
DELETE FROM DatPhong WHERE MaDatPhong IN (1, 2);
SELECT * FROM DatPhong WHERE MaDatPhong IN (1, 2);
SELECT * FROM Phong WHERE MaPhong IN (1, 2);


-- 3. Kiểm tra số lượng dịch vụ hợp lệ
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 1, 0);
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 2, -1);
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 3, 2);
SELECT * FROM SuDungDichVu WHERE MaDatPhong = 1 AND MaDV IN (1, 2, 3);


-- 4. Tự động thêm ngày thanh toán khi thêm bản ghi
INSERT INTO ThanhToan (MaDatPhong, TongTien) VALUES (1, 1000000);
INSERT INTO ThanhToan (MaDatPhong, TongTien) VALUES (2, 2000000);
INSERT INTO ThanhToan (MaDatPhong, TongTien) VALUES (3, 3000000);
SELECT * FROM ThanhToan WHERE MaDatPhong IN (1, 2, 3) AND NgayTT = '2025-03-03';


-- 5. Kiểm tra đánh giá phản hồi hợp lệ
INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi) VALUES (1, 6, N'Test cao', '2025-03-03');
INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi) VALUES (2, 0, N'Test thấp', '2025-03-03');
INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi) VALUES (3, 4, N'Tốt', '2025-03-03');
SELECT * FROM PhanHoi WHERE MaKH IN (1, 2, 3) AND NgayPhanHoi = '2025-03-03';


-- 6. Cập nhật tổng tiền thanh toán khi thêm dịch vụ
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 1, 1); -- Giặt ủi: 100000
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 2, 2); -- Bữa sáng: 300000
INSERT INTO SuDungDichVu (MaDatPhong, MaDV, SoLuong) VALUES (1, 3, 1); -- Đưa đón: 300000
SELECT * FROM SuDungDichVu WHERE MaDatPhong = 1;
SELECT * FROM ThanhToan WHERE MaDatPhong = 1;

-- 7.Thêm và cập nhật dịch vụ 
INSERT INTO DichVu (TenDV, Gia) VALUES (N'Test DV 2', 75000); -- Thành công
UPDATE DichVu SET Gia = 150000 WHERE MaDV = 1; -- Thành công
SELECT MaDV, TenDV, Gia 
FROM DichVu 
WHERE TenDV LIKE N'Test DV%' OR MaDV = 1;
GO


-- 8. Kiểm tra ngày bảo trì hợp lệ
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (1, '2025-03-01', N'Sửa điều hòa cũ');
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (2, '2025-02-28', N'Thay thảm cũ');
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (3, '2025-03-05', N'Sơn lại phòng');
SELECT * FROM BaoTriPhong WHERE MaPhong IN (1, 2, 3) AND NgayBaoTri >= '2025-03-01';


-- 9. Tự động cập nhật trạng thái phòng khi bảo trì
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (1, '2025-03-05', N'Sửa điều hòa');
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (2, '2025-03-06', N'Thay thảm');
INSERT INTO BaoTriPhong (MaPhong, NgayBaoTri, MoTa) VALUES (3, '2025-03-07', N'Bảo trì điện');
SELECT * FROM BaoTriPhong WHERE MaPhong IN (1, 2, 3) AND NgayBaoTri >= '2025-03-05';
SELECT * FROM Phong WHERE MaPhong IN (1, 2, 3);

-- 10. Kiểm tra ngày đặt phòng và ngày trả phòng
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (1, 1, '2025-03-25', '2025-03-24');
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (2, 2, '2025-03-26', '2025-03-26');
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (3, 3, '2025-03-27', '2025-03-29');
SELECT * FROM DatPhong WHERE MaKH IN (1, 2, 3) AND NgayDat >= '2025-03-25';

--phân quyền và bảo vệ dữ liệu 
-- 1. Tạo các tài khoản người dùng
CREATE LOGIN QuanLyLogin WITH PASSWORD = 'QuanLy123!';
CREATE USER QuanLyUser FOR LOGIN QuanLyLogin;
CREATE LOGIN NhanVienLogin WITH PASSWORD = 'NhanVien123!';
CREATE USER NhanVienUser FOR LOGIN NhanVienLogin;
CREATE LOGIN KhachHangLogin WITH PASSWORD = 'KhachHang123!';
CREATE USER KhachHangUser FOR LOGIN KhachHangLogin;
GO
DROP USER IF EXISTS QuanLyUser;
DROP LOGIN IF EXISTS QuanLyLogin;
DROP USER IF EXISTS NhanVienUser;
DROP LOGIN IF EXISTS NhanVienLogin;
DROP USER IF EXISTS KhachHangUser;
DROP LOGIN IF EXISTS KhachHangLogin;
GO

-- 2. Phân quyền cho Quản lý (toàn quyền)
GRANT SELECT, INSERT, UPDATE, DELETE ON KhachHang TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON DichVu TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON Phong TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON DatPhong TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON SuDungDichVu TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ThanhToan TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON LichLamViec TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON PhanHoi TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON KhuyenMai TO QuanLyUser;
GRANT SELECT, INSERT, UPDATE, DELETE ON BaoTriPhong TO QuanLyUser;
GO
REVOKE SELECT, INSERT, UPDATE, DELETE ON KhachHang FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON NhanVien FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON DichVu FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON Phong FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON DatPhong FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON SuDungDichVu FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON ThanhToan FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON LichLamViec FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON PhanHoi FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON KhuyenMai FROM QuanLyUser;
REVOKE SELECT, INSERT, UPDATE, DELETE ON BaoTriPhong FROM QuanLyUser;
GO

-- 3. Phân quyền cho Nhân viên (quyền hạn chế)
GRANT SELECT, INSERT, UPDATE ON KhachHang TO NhanVienUser;
GRANT SELECT ON NhanVien TO NhanVienUser;
GRANT SELECT ON DichVu TO NhanVienUser;
GRANT SELECT, UPDATE ON Phong TO NhanVienUser;
GRANT SELECT, INSERT, UPDATE ON DatPhong TO NhanVienUser;
GRANT SELECT, INSERT ON SuDungDichVu TO NhanVienUser;
GRANT SELECT, INSERT ON ThanhToan TO NhanVienUser;
GRANT SELECT ON LichLamViec TO NhanVienUser;
GRANT SELECT ON PhanHoi TO NhanVienUser;
GRANT SELECT ON KhuyenMai TO NhanVienUser;
GRANT SELECT, INSERT ON BaoTriPhong TO NhanVienUser;
DENY DELETE ON KhachHang TO NhanVienUser;
DENY DELETE ON DatPhong TO NhanVienUser;
GO
REVOKE SELECT, INSERT, UPDATE ON KhachHang FROM NhanVienUser;
REVOKE SELECT ON NhanVien FROM NhanVienUser;
REVOKE SELECT ON DichVu FROM NhanVienUser;
REVOKE SELECT, UPDATE ON Phong FROM NhanVienUser;
REVOKE SELECT, INSERT, UPDATE ON DatPhong FROM NhanVienUser;
REVOKE SELECT, INSERT ON SuDungDichVu FROM NhanVienUser;
REVOKE SELECT, INSERT ON ThanhToan FROM NhanVienUser;
REVOKE SELECT ON LichLamViec FROM NhanVienUser;
REVOKE SELECT ON PhanHoi FROM NhanVienUser;
REVOKE SELECT ON KhuyenMai FROM NhanVienUser;
REVOKE SELECT, INSERT ON BaoTriPhong FROM NhanVienUser;
GO

-- 4. Phân quyền cho Khách hàng (chỉ xem thông tin cá nhân)
GRANT SELECT ON KhachHang TO KhachHangUser;
GRANT SELECT, INSERT ON DatPhong TO KhachHangUser;
GRANT SELECT ON Phong TO KhachHangUser;
GRANT SELECT ON DichVu TO KhachHangUser;
GRANT SELECT ON ThanhToan TO KhachHangUser;
GRANT SELECT, INSERT ON PhanHoi TO KhachHangUser;
GRANT SELECT ON KhuyenMai TO KhachHangUser;
DENY INSERT, UPDATE, DELETE ON KhachHang TO KhachHangUser;
DENY UPDATE, DELETE ON DatPhong TO KhachHangUser;
GO
REVOKE SELECT ON KhachHang FROM KhachHangUser;
REVOKE SELECT, INSERT ON DatPhong FROM KhachHangUser;
REVOKE SELECT ON Phong FROM KhachHangUser;
REVOKE SELECT ON DichVu FROM KhachHangUser;
REVOKE SELECT ON ThanhToan FROM KhachHangUser;
REVOKE SELECT, INSERT ON PhanHoi FROM KhachHangUser;
REVOKE SELECT ON KhuyenMai FROM KhachHangUser;
GO

-- 5. Bảo vệ cơ sở dữ liệu (mã hóa mật khẩu - ví dụ đơn giản)
CREATE FUNCTION fn_MaHoaMatKhau (@MatKhau NVARCHAR(50))
RETURNS VARBINARY(256)
AS
BEGIN
    RETURN HASHBYTES('SHA2_256', @MatKhau);
END;
GO
ALTER TABLE NhanVien ADD MatKhau VARBINARY(256);
GO
UPDATE NhanVien SET MatKhau = dbo.fn_MaHoaMatKhau('123456') WHERE MaNV = 1;
GO
DROP FUNCTION IF EXISTS fn_MaHoaMatKhau;
ALTER TABLE NhanVien DROP COLUMN IF EXISTS MatKhau;
GO


-- 1. Tạo các tài khoản người dùng
-- Không có kiểm tra trực tiếp, chỉ tạo tài khoản
SELECT name FROM sys.database_principals WHERE name IN ('QuanLyUser', 'NhanVienUser', 'KhachHangUser');


-- 2. Phân quyền cho Quản lý (toàn quyền)
EXECUTE AS USER = 'QuanLyUser';
INSERT INTO KhachHang (HoTen, CMND, SDT, Email) VALUES (N'Test Quan Ly 1', '111111111', '0111111111', 'ql1@gmail.com');
UPDATE NhanVien SET Luong = 20000000 WHERE MaNV = 1;
DELETE FROM DichVu WHERE MaDV = 15;
SELECT * FROM KhachHang WHERE CMND = '111111111';
SELECT * FROM NhanVien WHERE MaNV = 1;
SELECT * FROM DichVu WHERE MaDV = 15;
REVERT;


-- 3. Phân quyền cho Nhân viên (quyền hạn chế)
EXECUTE AS USER = 'NhanVienUser';
INSERT INTO KhachHang (HoTen, CMND, SDT, Email) VALUES (N'Test Nhan Vien 1', '222222222', '0222222222', 'nv1@gmail.com');
UPDATE Phong SET TrangThai = N'Trống' WHERE MaPhong = 1;
DELETE FROM KhachHang WHERE CMND = '222222222'; -- Sẽ bị từ chối
SELECT * FROM KhachHang WHERE CMND = '222222222';
SELECT * FROM Phong WHERE MaPhong = 1;
SELECT * FROM NhanVien WHERE MaNV = 1; -- Chỉ xem được
REVERT;


-- 4. Phân quyền cho Khách hàng (chỉ xem thông tin cá nhân)
EXECUTE AS USER = 'KhachHangUser';
INSERT INTO DatPhong (MaKH, MaPhong, NgayDat, NgayTra) VALUES (1, 1, '2025-03-25', '2025-03-27');
INSERT INTO PhanHoi (MaKH, DanhGia, BinhLuan, NgayPhanHoi) VALUES (1, 5, N'Tuyệt vời!', '2025-03-03');
UPDATE KhachHang SET HoTen = N'Test KH' WHERE MaKH = 1; -- Sẽ bị từ chối
SELECT * FROM DatPhong WHERE MaKH = 1 AND NgayDat = '2025-03-25';
SELECT * FROM PhanHoi WHERE MaKH = 1 AND NgayPhanHoi = '2025-03-03';
SELECT * FROM KhachHang WHERE MaKH = 1;
REVERT;


-- 5. Bảo vệ cơ sở dữ liệu (mã hóa mật khẩu)
UPDATE NhanVien SET MatKhau = dbo.fn_MaHoaMatKhau('abc123') WHERE MaNV = 2;
UPDATE NhanVien SET MatKhau = dbo.fn_MaHoaMatKhau('xyz789') WHERE MaNV = 3;
SELECT MaNV, HoTen, MatKhau FROM NhanVien WHERE MaNV IN (1, 2, 3);


