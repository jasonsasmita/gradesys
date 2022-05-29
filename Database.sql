CREATE DATABASE GradeSiswa

CREATE TABLE DataSiswa (
	SiswaID VARCHAR(50) PRIMARY KEY,
	Nama VARCHAR(50),
	DoB VARCHAR(20),
	Gender VARCHAR (10),
	Agama VARCHAR (10),
	Email VARCHAR (320),
	Alamat VARCHAR (200),
	BI1 VARCHAR (10) DEFAULT '0' ,BI2 VARCHAR (10) DEFAULT '0',
	MAT1 VARCHAR (10) DEFAULT '0' , MAT2 VARCHAR (10) DEFAULT '0',
	ING1 VARCHAR (10) DEFAULT '0', ING2 VARCHAR (10) DEFAULT '0',
	IPA1 VARCHAR (10) DEFAULT '0', IPA2 VARCHAR (10) DEFAULT '0'
	)
CREATE PROCEDURE SP_GetData
@SiswaID VARCHAR(50)
AS
BEGIN
	SELECT SiswaID, Nama, Gender, DoB, Agama, Email, Alamat, BI1, BI2, MAT1, MAT2, ING1, ING2, IPA1, IPA2
	FROM DataSiswa
	WHERE SiswaID = @SiswaID
END

EXEC SP_GetData

CREATE PROCEDURE SP_InsertData
@SiswaID VARCHAR(50),
@DoB VARCHAR(20),
@Gender VARCHAR (10),
@Agama VARCHAR (10),
@Email VARCHAR (320),
@Alamat VARCHAR (200),
@BI1 VARCHAR(10),@BI2 VARCHAR(10),
@MAT1 VARCHAR(10),@MAT2 VARCHAR(10),
@ING1 VARCHAR(10),@ING2 VARCHAR(10),
@IPA1 VARCHAR(10),@IPA2 VARCHAR(10)
AS
BEGIN
	UPDATE DataSiswa 
	SET DoB = @DoB, Gender = @Gender, Agama = @Agama, Email = @Email, Alamat = @Alamat ,BI1 = @BI1,
	BI2 = @BI2, MAT1 = @MAT1, MAT2 = @MAT2, ING1 = @ING1, ING2 = @ING2, IPA1 = @IPA1, IPA2 = @IPA2
	WHERE SiswaID = @SiswaID
END

Select * from DataSiswa

INSERT INTO DataSiswa(SiswaID, Nama, Gender, DoB, Agama, Email, Alamat, BI1, BI2, MAT1, MAT2, ING1, ING2, IPA1, IPA2)
VALUES('12217883','Budi','Pria','21/11/2021','Islam','budiyanto11@gmail.com','Jl.Pegangsaan 22 no 10',90.95,80.90,70.75,75.25,80.50,66.66,78.55,80)
INSERT INTO DataSiswa(SiswaID, Nama, Gender, DoB, Agama, Email, Alamat, BI1, BI2, MAT1, MAT2, ING1, ING2, IPA1, IPA2)
VALUES('12217001','Yanti','Wanita','03/04/2002','Katolik','yantisari2@gmail.com','Jl.Jalanan Blok DB no 2',80.90,100,77.50,80.00,72.00,65.88,66.66,75.50)
INSERT INTO DataSiswa(SiswaID, Nama, Gender, DoB, Agama, Email, Alamat)
VALUES('12217231','Bambang','Pria','15/09/2013','Hindu','bangbang351@gmail.com','Jl.Bukittinggi no 65')