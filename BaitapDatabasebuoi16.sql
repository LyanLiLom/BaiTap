CREATE database QlSanPham
USE QlSanPham

DROP Table nhacungcap ,sanpham, loaisanpham ;

CREATE TABLE nhacungcap(
	ma_ncc int auto_increment,
	ten_ncc varchar(50),
	quocgia varchar(50),
	
	primary key(ma_ncc)
);

CREATE Table loaisanpham(
	maloai_sp int auto_increment,
	loai_sp varchar(100),
	
	primary key(maloai_sp)
);

CREATE table sanpham(
	ma_sp int auto_increment,
	ten_sp varchar(50),
	mota text,
	gianhap decimal,
	giaban decimal,
	soluong int,
	giamgia float,
	sanpham_nhacungcap int,
	sanpham_loaisanpham int,
	
	primary key(ma_sp)
);


ALTER TABLE sanpham add constraint FK_sanpham_nhacungcap_sanpham 
foreign key (sanpham_nhacungcap) references nhacungcap(ma_ncc);

ALTER TABLE sanpham add constraint FK_sanpham_loaisanpham_sanpham 
foreign key (sanpham_loaisanpham) references loaisanpham(maloai_sp);

INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('Xiaomi','Trung Quốc');
INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('Apple','Mỹ');
INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('Samsung','Hàn Quốc');
INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('LG','Hàn Quốc');
INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('Elextrolux','Thụy Điển');
INSERT INTO nhacungcap(ten_ncc,quocgia)
VALUES ('Dior','Pháp');

INSERT INTO loaisanpham(loai_sp)
VALUES ('Tivi');
INSERT INTO loaisanpham(loai_sp)
VALUES ('Son');
INSERT INTO loaisanpham(loai_sp)
VALUES ('Máy giặt');
INSERT INTO loaisanpham(loai_sp)
VALUES ('MacBook');
INSERT INTO loaisanpham(loai_sp)
VALUES ('Tablet');


INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('son DIOR', 20000, 100000,100,0.1,6,2);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('tivi 55inch LG',2000000,5000000,60,0.1,4,1);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('may giat Elextrolux 8kg',3000000,9000000,50,0,5,3);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('may giat Samsung 9kg',2400000,8000000,70,0.15,3,3);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('MacBook air M1 2021',9000000, 18000000,90,0.2,2,4);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('Tablet Samsung Lite',6000000,12000000,70,0.1,3,5);
INSERT INTO sanpham(ten_sp,gianhap,giaban,soluong,giamgia,sanpham_nhacungcap,sanpham_loaisanpham)
VALUES ('Tablet Xiaomi x10',6000000,12000000,70,0.1,1,5);



--Câu 1.1
SELECT *
FROM sanpham s 

--Câu 1.2
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,giamgia
FROM sanpham s 

--Câu 1.3
SELECT ma_sp,ten_sp,gianhap,giaban
FROM sanpham s 
WHERE soluong > 60

--Câu 1.4
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,giamgia
FROM sanpham s 
ORDER BY ma_sp DESC
LIMIT 3

--Câu 1.5
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,giamgia
from sanpham s 
WHERE ten_sp LIKE '%Samsung%'

--Câu 1.6 
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,giamgia
from sanpham s 
WHERE ten_sp LIKE '%MacBook%' and giaban > 7000000

--Câu 1.7
SELECT ten_sp
from sanpham s 
WHERE giaban BETWEEN 8000000 and 10000000

--Câu 2.1
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,ten_ncc
from sanpham s 
left join nhacungcap n on ma_ncc = sanpham_nhacungcap 

--Câu 2.2
SELECT ma_sp,ten_sp,gianhap,giaban,soluong,ma_ncc,ten_ncc,maloai_sp,loai_sp
from sanpham s
left join nhacungcap n on ma_ncc = sanpham_nhacungcap 
left join loaisanpham l on maloai_sp  = sanpham_loaisanpham 
WHERE giaban > 5000000;

--Câu 2.3
SELECT *
FROM sanpham s 
WHERE sanpham_loaisanpham = 5