CREATE DATABASE BankMerdeka;

USE BankMerdeka;

CREATE TABLE karyawan(
	karyawan_id INT NOT NULL,
	umur INT NOT NULL,
	gender VARCHAR(10) NOT NULL,
	CONSTRAINT PK_karyawan PRIMARY KEY (karyawan_id)
);

INSERT INTO karyawan VALUES ("1", 27, "laki-laki");
INSERT INTO karyawan VALUES ("2", 28, "laki-laki");
INSERT INTO karyawan VALUES ("3", 28, "laki-laki");
INSERT INTO karyawan VALUES ("4", 26, "laki-laki");
INSERT INTO karyawan VALUES ("5", 23, "perempuan");
INSERT INTO karyawan VALUES ("6", 25, "laki-laki");
INSERT INTO karyawan VALUES ("7", 26, "perempuan");
INSERT INTO karyawan VALUES ("8", 25, "perempuan");
INSERT INTO karyawan VALUES ("9", 26, "laki-laki");
INSERT INTO karyawan VALUES ("10", 25, "laki-laki");
INSERT INTO karyawan VALUES ("11", 26, "perempuan");
INSERT INTO karyawan VALUES ("12", 25, "laki-laki");
INSERT INTO karyawan VALUES ("13", 26, "perempuan");
INSERT INTO karyawan VALUES ("14", 24, "perempuan");
INSERT INTO karyawan VALUES ("15", 25, "perempuan");

CREATE TABLE manajer(
	manajer_id INT NOT NULL,
	nama VARCHAR(20) NOT NULL,
	kode_divisi VARCHAR(5) NOT NULL,
	CONSTRAINT PK_manajer PRIMARY KEY (manajer_id),
	CONSTRAINT FK_manajer FOREIGN KEY (manajer_id) REFERENCES karyawan(karyawan_id)
);

INSERT INTO manajer VALUES (1, "David", "ML");
INSERT INTO manajer VALUES (2, "Julian", "MS");
INSERT INTO manajer VALUES (3, "Mike", "MN");
INSERT INTO manajer VALUES (4, "Alex", "MO");
INSERT INTO manajer VALUES (5, "Farah", "MC");

CREATE TABLE teller(
	teller_id INT NOT NULL,
	nama VARCHAR(10) NOT NULL,
	no_telepon INT NOT NULL,
	no_counter INT(3) NOT NULL,
	manajer_id INT NOT NULL,
	CONSTRAINT PK_teller PRIMARY KEY (teller_id),
	CONSTRAINT FK_teller FOREIGN KEY (teller_id) REFERENCES karyawan(karyawan_id),
	CONSTRAINT FK_teller_manajer FOREIGN KEY (manajer_id) REFERENCES manajer(manajer_id)
);

INSERT INTO teller VALUES (6, "Miftah", 0856789122, 005, 1);
INSERT INTO teller VALUES (7, "Saila", 0856789163, 004, 2);
INSERT INTO teller VALUES (8, "Putri", 0856789718, 003, 5);
INSERT INTO teller VALUES (9, "Michael", 0856789019, 002, 1);
INSERT INTO teller VALUES (10, "Joseph", 0856789617, 001, 2);

CREATE TABLE customerservices(
	cs_id INT NOT NULL,
	nama VARCHAR(10) NOT NULL,
	no_telepon INT(10) NOT NULL,
	no_counter INT(10) NOT NULL,
	manajer_id INT(10),
	CONSTRAINT PK_CustomerService PRIMARY KEY (cs_id),
	CONSTRAINT FK_CustomerService FOREIGN KEY (cs_id) REFERENCES karyawan(karyawan_id),
	CONSTRAINT FK_CustomerService_manajer FOREIGN KEY (manajer_id) REFERENCES manajer(manajer_id)
);

INSERT INTO customerservices VALUES (11, "Indah", 0812345678, 001,3);
INSERT INTO customerservices VALUES (12, "Dimas", 0823456789, 002,4);
INSERT INTO customerservices VALUES (13, "Deva", 0834567891, 001,3);
INSERT INTO customerservices VALUES (14, "Lia", 0845678912, 002,5);
INSERT INTO customerservices VALUES (15, "Rava", 0856789123, 001,4);

CREATE TABLE Rekening (
	rekening_id INT(13) NOT NULL,
	kredit INT NOT NULL,
	debit INT NOT NULL,
	CONSTRAINT PK_rekening PRIMARY KEY (rekening_id)
);

INSERT INTO Rekening VALUES(1730006551, 300000, 400000);
INSERT INTO Rekening VALUES(1730006552, 400000, 600000);
INSERT INTO Rekening VALUES(1730006553, 500000, 800000);
INSERT INTO Rekening VALUES(1730006554, 600000, 1000000);
INSERT INTO Rekening VALUES(1730006555, 700000, 1200000);

CREATE TABLE ATM (
	no_kartu BIGINT NOT NULL,
	jenis VARCHAR(20) NOT NULL,
	waktu_berlaku date NOT NULL,
	rekening_id INT,
	CONSTRAINT PK_ATM PRIMARY KEY (no_kartu),
	CONSTRAINT FK_ATM FOREIGN KEY (rekening_id) REFERENCES Rekening(rekening_id)
);

INSERT INTO ATM VALUES (1163637263, 'platinum', '2025-02-03', 1730006551);
INSERT INTO ATM VALUES (1163637264, 'gold', '2025-03-03', 1730006552);
INSERT INTO ATM VALUES (1163637265, 'silver', '2025-04-03', 1730006553);
INSERT INTO ATM VALUES (1163637266, 'gold', '2025-05-03', 1730006554);
INSERT INTO ATM VALUES (1163637267, 'platinum', '2025-06-03', 1730006555);

CREATE TABLE BukuTabungan (
	tabungan_id INT(16) NOT NULL,
	kode_transaksi INT(3),
	rekening_id INT,
	CONSTRAINT PK_BukuTabungan PRIMARY KEY (tabungan_id),
	CONSTRAINT FK_BukuTabungan FOREIGN KEY (rekening_id) REFERENCES Rekening(rekening_id)
);

INSERT INTO BukuTabungan VALUES (176253781, 001, 1730006551);
INSERT INTO BukuTabungan VALUES (176253782, 002, 1730006552);
INSERT INTO BukuTabungan VALUES (176253783, 003, 1730006553);
INSERT INTO BukuTabungan VALUES (176253784, 004, 1730006554);
INSERT INTO BukuTabungan VALUES (176253785, 005, 1730006555);

CREATE TABLE Customer (
	customer_id INT NOT NULL,
	nama VARCHAR(30) NOT NULL,
	alamat VARCHAR (200),
	no_telp bigint(15) unsigned NOT NULL,
	nik bigint(16) unsigned NOT NULL,
	tanggal_lahir date NOT NULL,
	rekening_id INT,
	CONSTRAINT PK_Customer PRIMARY KEY (customer_id),
	CONSTRAINT FK_Customer FOREIGN KEY (rekening_id) REFERENCES Rekening(rekening_id)
);

INSERT INTO Customer VALUES (1, "Robert", "Jakarta", 087871834579, 3645782637485764, '1989-12-02', 1730006551);
INSERT INTO Customer VALUES (2, "Bllory", 'Bogor', 081384760217, 3546576898765345, '2000-10-03', 1730006552);
INSERT INTO Customer VALUES (3, "Raks", "Bekasi", 081367860222, 2345670987634567, '1999-11-01', 1730006553);
INSERT INTO Customer VALUES (4, "Joule", 'Depok', 087871834580, 3456789087654324, '2002-04-04', 1730006554);
INSERT INTO Customer VALUES (5, "David", 'Kalimantan', 08138476020, 9876334345678901, '1987-12-12', 1730006555);

CREATE TABLE Transaksi (
	transaksi_id INT NOT NULL,
	waktu TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	tempat VARCHAR(20) NOT NULL,
    rekening_id INT,
    teller_id INT,
	CONSTRAINT PK_transaksi PRIMARY KEY (transaksi_id),
	CONSTRAINT FK_transaksi FOREIGN KEY (rekening_id) REFERENCES Rekening(rekening_id),
	CONSTRAINT FK_transaksi_teller FOREIGN KEY (teller_id) REFERENCES Teller(teller_id) ON DELETE CASCADE
);

INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (1, '2021-04-25 07:01:1', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (2, '2021-01-23 05:02:2', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (3, '2021-02-28 12:31:3', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (4, '2021-04-03 19:01:4', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (5, '2021-04-14 13:01:5', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (6, '2021-04-25 07:01:6', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (7, '2021-04-03 19:01:7', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (8, '2021-01-23 05:02:8', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (9, '2021-04-14 13:01:9', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (10, '2021-04-03 19:01:10', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (11, '2021-04-25 07:01:11', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (12, '2021-01-23 05:02:12', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (13, '2021-04-14 13:01:13', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (14, '2021-01-23 05:02:14', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (15, '2021-02-28 12:31:15', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (16, '2021-04-25 07:01:16', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (17, '2021-04-14 13:01:17', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (18, '2021-01-23 05:02:18', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (19, '2021-04-03 19:01:19', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (20, '2021-01-23 05:02:20', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (21, '2021-04-25 07:01:21', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (22, '2021-04-03 19:01:22', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (23, '2021-02-28 12:31:23', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (24, '2021-01-23 05:02:24', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (25, '2021-04-14 13:01:25', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (26, '2021-04-25 07:01:26', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (27, '2021-02-28 12:31:27', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (28, '2021-04-03 19:01:28', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (29, '2021-04-14 13:01:29', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (30, '2021-01-23 05:02:30', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (31, '2021-04-25 07:01:31', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (32, '2021-01-23 05:02:32', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (33, '2021-04-14 13:01:33', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (34, '2021-04-03 19:01:34', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (35, '2021-02-28 12:31:35', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (36, '2021-04-25 07:01:36', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (37, '2021-04-14 13:01:37', 'Depok', 1730006554, 7);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (38, '2021-01-23 05:02:38', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (39, '2021-02-28 12:31:39', 'Bogor', 1730006552, 9);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (40, '2021-04-03 19:01:40', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (41, '2021-04-25 07:01:41', 'Kalimantan', 1730006555, 6);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (42, '2021-01-23 05:02:42', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (43, '2021-04-03 19:01:43', 'Bekasi', 1730006553, 8);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (44, '2021-01-23 05:02:44', 'Jakarta', 1730006551, 10);
INSERT INTO Transaksi(transaksi_id, waktu, tempat, rekening_id, teller_id) VALUES (45, '2021-04-14 13:01:45', 'Depok', 1730006554, 7);

CREATE TABLE KirimUang (
	transaksi_id INT NOT NULL,
	jumlah INT UNSIGNED,
	rekening_penerima BIGINT,
	CONSTRAINT FK_KirimUang FOREIGN KEY (transaksi_id) REFERENCES Transaksi(transaksi_id) ON DELETE CASCADE,
	CONSTRAINT PK_KirimUang PRIMARY KEY (transaksi_id)
);

INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (1, 210000, 1327385268961);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (2, 280000, 1327385268962);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (3, 350000, 1327385268963);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (4, 420000, 1327385268964);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (5, 490000, 1327385268965);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (6, 560000, 1327385268966);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (7, 630000, 1327385268967);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (8, 700000, 1327385268968);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (9, 770000, 1327385268969);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (11, 910000, 1327385269611);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (12, 980000, 1327385269612);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (13, 1050000, 1327385269613);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (14, 1120000, 1327385269614);
INSERT INTO KirimUang (transaksi_id, jumlah, rekening_penerima) VALUES (15, 1190000, 1327385269615);

CREATE TABLE SetorTarikUang (
	transaksi_id INT NOT NULL,
	jumlah INT UNSIGNED,
	waktu TIME,
	lokasi VARCHAR (200),
	CONSTRAINT PK_SetorTarikUang PRIMARY KEY (transaksi_id),
	CONSTRAINT FK_SetorTarikUang FOREIGN KEY (transaksi_id) REFERENCES Transaksi(transaksi_id) ON DELETE CASCADE
);

INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (16, 480000, '13:56:21', 'cabang pertama');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (17, 38000, '12:19:40', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (18, 60000, '18:36:12', 'cabang ketiga');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (19, 2160000, '21:39:10', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (20, 66000, '18:36:12', 'cabang ketiga');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (21, 630000, '13:56:21', 'cabang pertama');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (22, 2400000, '21:39:10', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (23, 240000, '09:27:07', 'cabang pertama');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (24, 78000, '18:36:12', 'cabang ketiga');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (25, 54000, '12:19:40', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (26, 780000, '13:56:21', 'cabang pertama');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (27, 280000, '09:27:07', 'cabang pertama');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (28, 2880000, '21:39:10', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (29, 62000, '12:19:40', 'cabang kedua');
INSERT INTO SetorTarikUang (transaksi_id, jumlah, waktu, lokasi) VALUES (30, 96000, '18:36:12', 'cabang ketiga');

CREATE TABLE BukaRekening (
	transaksi_id INT NOT NULL,
	kode_transaksi INT(3),
	cs_id INT,
	CONSTRAINT FK_BukaRekening FOREIGN KEY (transaksi_id) REFERENCES Transaksi(transaksi_id) ON DELETE CASCADE,
	CONSTRAINT PK_BukaRekening PRIMARY KEY (transaksi_id),
	CONSTRAINT FK_BukaRekening_CS FOREIGN KEY (cs_id) REFERENCES customerservices(cs_id) ON DELETE CASCADE
);

INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (31, 001, 11);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (32, 005, 15);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (33, 002, 12);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (34, 003, 13);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (35, 004, 14);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (36, 001, 11);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (37, 002, 12);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (38, 005, 15);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (39, 004, 14);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (40, 003, 13);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (41, 001, 11);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (42, 005, 15);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (43, 003, 13);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (44, 005, 15);
INSERT INTO BukaRekening (transaksi_id, kode_transaksi, cs_id) VALUES (45, 002, 12);
