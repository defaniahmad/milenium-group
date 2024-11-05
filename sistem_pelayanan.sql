-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Okt 2024 pada 18.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_pelayanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `no_hp`, `username`, `password`, `create_at`) VALUES
(1, 'Axel', '085161546489', 'admin', '202cb962ac59075b964b07152d234b70', '2024-10-24 11:44:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berkas_lpj`
--

CREATE TABLE `tb_berkas_lpj` (
  `id_lpj` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `berkas` text NOT NULL,
  `status` enum('Dalam Antrian','Diproses','Selesai') NOT NULL DEFAULT 'Dalam Antrian',
  `fee_invoice` text NOT NULL,
  `tgl_upload` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_berkas_lpj`
--

INSERT INTO `tb_berkas_lpj` (`id_lpj`, `id_transaksi`, `id_user`, `no_surat`, `berkas`, `status`, `fee_invoice`, `tgl_upload`) VALUES
(3, 8, 1, '1234108082', '5 lembar.pdf', 'Selesai', 'fee_invoice_1729779726_671a580ec2fa5.pdf', '2024-10-24 20:31:48'),
(4, 8, 1, '091230812', '12 lembar.pdf', 'Selesai', 'fee_invoice_1729779972_671a590402365.pdf', '2024-10-24 20:32:01'),
(7, 8, 9, '981982', 'lpj_671a4ebb5d2be4.08269382.pdf', 'Dalam Antrian', '', '2024-10-24 20:42:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berkas_sppd`
--

CREATE TABLE `tb_berkas_sppd` (
  `id_sppd` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `berkas` text NOT NULL,
  `tgl_upload` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_berkas_sppd`
--

INSERT INTO `tb_berkas_sppd` (`id_sppd`, `no_surat`, `berkas`, `tgl_upload`) VALUES
(8, '8917298719', '6719f953e5d1b-surat_lamaran_septian.pdf', '2024-10-24 14:37:55'),
(9, '189720919', '6719fa2a3c7a3-ijaza_adhin.pdf', '2024-10-24 14:41:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_surat_keluar`
--

CREATE TABLE `tb_surat_keluar` (
  `id_surat_keluar` int(11) NOT NULL,
  `nama_surat` varchar(255) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `berkas` text NOT NULL,
  `waktu_upload` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_surat_keluar`
--

INSERT INTO `tb_surat_keluar` (`id_surat_keluar`, `nama_surat`, `no_surat`, `tgl_keluar`, `nama_admin`, `berkas`, `waktu_upload`) VALUES
(2, 'TEST 1 - KELUAR', '892791782301', '2024-10-17', 'Axel', '671a0091abfc7-adhin_transkip_nilai.pdf', '2024-10-24 15:08:49'),
(3, 'TEST 2 - KELUAR', '290810931', '2024-10-18', 'Axel', '671a009e05922-ijaza_adhin.pdf', '2024-10-24 15:09:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_surat_masuk`
--

CREATE TABLE `tb_surat_masuk` (
  `id_surat_masuk` int(11) NOT NULL,
  `nama_surat` varchar(255) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `berkas` text NOT NULL,
  `waktu_upload` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_surat_masuk`
--

INSERT INTO `tb_surat_masuk` (`id_surat_masuk`, `nama_surat`, `no_surat`, `tgl_masuk`, `nama_admin`, `berkas`, `waktu_upload`) VALUES
(3, 'TEST 1', '091290381', '2024-10-17', 'Axel', '6719fea070eaa-ijaza_adhin.pdf', '2024-10-24 15:00:32'),
(4, 'TEST 2', '290309810', '2024-10-18', 'Axel', '6719ffa842e64-ijaza_adhin.pdf', '2024-10-24 15:04:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nama_transaksi` varchar(255) NOT NULL,
  `id_sppd` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `nama_transaksi`, `id_sppd`, `id_admin`) VALUES
(8, 'TEST 1', 8, 1),
(9, 'TEST 2', 9, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `no_hp`, `username`, `password`, `create_at`) VALUES
(1, 'BAGAS PANDA', '019209102', 'user', '202cb962ac59075b964b07152d234b70', '2024-10-24 12:00:23'),
(9, 'PANDU AJA', '92839081703', 'pandu', '202cb962ac59075b964b07152d234b70', '2024-10-24 20:41:34');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `nama_admin` (`nama_admin`);

--
-- Indeks untuk tabel `tb_berkas_lpj`
--
ALTER TABLE `tb_berkas_lpj`
  ADD PRIMARY KEY (`id_lpj`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tb_berkas_sppd`
--
ALTER TABLE `tb_berkas_sppd`
  ADD PRIMARY KEY (`id_sppd`);

--
-- Indeks untuk tabel `tb_surat_keluar`
--
ALTER TABLE `tb_surat_keluar`
  ADD PRIMARY KEY (`id_surat_keluar`),
  ADD KEY `nama_admin` (`nama_admin`);

--
-- Indeks untuk tabel `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  ADD PRIMARY KEY (`id_surat_masuk`),
  ADD KEY `nama_admin` (`nama_admin`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_sppd` (`id_sppd`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_berkas_lpj`
--
ALTER TABLE `tb_berkas_lpj`
  MODIFY `id_lpj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_berkas_sppd`
--
ALTER TABLE `tb_berkas_sppd`
  MODIFY `id_sppd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_surat_keluar`
--
ALTER TABLE `tb_surat_keluar`
  MODIFY `id_surat_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  MODIFY `id_surat_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_berkas_lpj`
--
ALTER TABLE `tb_berkas_lpj`
  ADD CONSTRAINT `tb_berkas_lpj_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_berkas_lpj_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_surat_keluar`
--
ALTER TABLE `tb_surat_keluar`
  ADD CONSTRAINT `tb_surat_keluar_ibfk_1` FOREIGN KEY (`nama_admin`) REFERENCES `tb_admin` (`nama_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  ADD CONSTRAINT `tb_surat_masuk_ibfk_1` FOREIGN KEY (`nama_admin`) REFERENCES `tb_admin` (`nama_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_ibfk_1` FOREIGN KEY (`id_sppd`) REFERENCES `tb_berkas_sppd` (`id_sppd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_transaksi_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
