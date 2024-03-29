USE [QLSV]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSV]    Script Date: 6/10/2020 9:44:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[UpdateSV]
	@masinhvien varchar(50),
	@ho nvarchar(10),
	@tendem nvarchar(20),
	@ten nvarchar(10),
	@ngaysinh date,
	@gioitinh tinyint,
	@quequan nvarchar(150),
	@diachi nvarchar(150),
	@dienthoai varchar(30),
	@email varchar(150)
AS
BEGIN
	UPDATE tblSinhVien
	SET
		--masinhvien = @masinhvien,
		ho= @ho,tendem= @tendem, ten= @ten,
		ngaysinh = @ngaysinh,gioitinh= @gioitinh,
		quequan= @quequan,diachi= @diachi,
		dienthoai= @dienthoai,email= @email
	WHERE masinhvien = @masinhvien;
	IF @@ROWCOUNT>0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
	
END
