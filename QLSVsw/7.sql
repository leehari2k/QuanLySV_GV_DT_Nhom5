USE [QLSV]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllSinhVien]    Script Date: 6/8/2020 3:57:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SelectAllSinhVien]

	@tukhoa nvarchar(50)

AS

select 
	
	masinhvien,
	case 
		when LEN(tendem)>0 then
		CONCAT(ho,' ', tendem, ' ', ten)
		else CONCAT(ho, ' ', ten)
	end as hoten,
	CONVERT(varchar(10), ngaysinh, 103) as nsinh, 
	case 
		when gioitinh=1 then N'Nam'
		else N'Nữ'
	end as gt,quequan, diachi, dienthoai,email

from tblSinhVien

where 
	lower(ho) like '%'+lower(@tukhoa)+'%'
	or lower(tendem) like '%'+lower(@tukhoa)+'%'
	or lower(ten) like '%'+lower(@tukhoa)+'%'
	or dienthoai like '%'+lower(@tukhoa)+'%'
	

order by ten



drop procedure SelectAllSinhVien

create procedure SelectAllSinhvien

	@tukhoa nvarchar(50)

AS

select 
	
	masinhvien,
	case 
		when LEN(tendem)>0 then
		CONCAT(ho,' ', tendem, ' ', ten)
		else CONCAT(ho, ' ', ten)
	end as hoten,
	CONVERT(varchar(10), ngaysinh, 103) as nsinh, 
	case 
		when gioitinh=1 then N'Nam'
		else N'Nữ'
	end as gt,quequan

from tblSinhVien

where 
	lower(ho) like '%'+lower(@tukhoa)+'%'
	or lower(tendem) like '%'+lower(@tukhoa)+'%'
	or lower(ten) like '%'+lower(@tukhoa)+'%'
	or dienthoai like '%'+lower(@tukhoa)+'%'
	or masinhvien= @tukhoa

order by ten


exec SelectAllSinhVien '18110178'