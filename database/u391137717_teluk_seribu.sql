-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 29, 2026 at 10:07 AM
-- Server version: 11.8.6-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u391137717_teluk_seribu`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip_customer`
--

CREATE TABLE `arsip_customer` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `tgl_terima` date DEFAULT NULL,
  `id_progres` int(11) DEFAULT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_kavling` int(11) NOT NULL,
  `id_status_progres` int(11) DEFAULT NULL,
  `kode_customer` varchar(15) DEFAULT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `no_ktp_p` varchar(25) DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text DEFAULT NULL,
  `alamat_domisili` text DEFAULT NULL,
  `no_telp` varchar(25) DEFAULT NULL,
  `no_wa` varchar(25) NOT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `id_marketing` int(11) NOT NULL,
  `ket_reject` varchar(255) DEFAULT NULL,
  `id_freelance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_rek` varchar(255) DEFAULT NULL,
  `pemilik_rek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `nama`, `no_rek`, `pemilik_rek`) VALUES
(9, 'Bank Central Asia', '0293307773', 'PT. TANAH KAVLING INDONESIA'),
(10, 'Admin keuangan', 'tunai', 'vivi');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `jenis_content` varchar(25) DEFAULT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `url_item` varchar(35) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `artikel` text DEFAULT NULL,
  `icon` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `jenis_content`, `judul`, `url_item`, `nama_file`, `artikel`, `icon`) VALUES
(1, '8', 'Beranda', NULL, 'KOP_PT_1766487167.webp', NULL, NULL),
(2, '8', 'About Us', NULL, 'bener_kantor_1765943597.webp', NULL, NULL),
(3, '8', 'Fasilitas', NULL, 'Site_plan_Sirandu_1766487254.webp', NULL, NULL),
(4, '8', 'Siteplan', 'siteplan', NULL, NULL, NULL),
(5, '8', 'Produk', 'produk', NULL, NULL, NULL),
(6, '8', 'Document', 'document', NULL, NULL, NULL),
(12, '2', 'PT. MULIA ASRI SENTOSA', NULL, 'IMG-20251207-WA0010_1765935389.webp', 'PT Mulia Asri Sentosa, berkedudukan di Kabupaten Pemalang, dengan akta pendiriannya sebagaimana dimuat dalam Akta Pendirian Perseroan Terbatas No. 1 tanggal 23 Februari 2022, Akta Pendirian Perseroan Terbatas telah memperoleh pengesahan Menteri Hukum dan Hak Asasi Manusia Republik Indonesia sebagaimana ternyata dari Surat Keputusannya No. AHU- 0014258.AH.01.01.Tahun 2022 tanggal 24 Februari 2022', NULL),
(13, '6', 'Lingkungan Hijau', NULL, 'IMG-20251207-WA0007.webp', '- Lokasi strategis dekat dengan pemukiman\r\n- Pinggir jalan utama\r\n- Sarana ibadah \r\n- Akses mudah \r\n- Dekat dengan Sekolahan\r\n- Dekat dengan Perkantoran\r\n- Dekat dengan pusat Kota', 'fa-solid fa-building-wheat'),
(14, '6', 'Keamanan 24 Jam', 'fasilitas', NULL, 'Dilengkapi dengan sistem keamanan modern dan petugas keamanan yang berjaga selama 24 jam, memastikan Anda dan keluarga merasa aman dan tenang setiap saat.', 'fa-solid fa-lock'),
(15, '6', 'Fasilitas Umum', NULL, NULL, 'Taman bermain yang aman dan menyenangkan dengan berbagai permainan edukatif, membuat anak-anak dapat bermain dan bersosialisasi dengan teman sebaya.', 'fa-solid fa-tree'),
(16, '3', 'Warureja Kavling', NULL, 'IMG-20251207-WA0005_1767628963.webp', 'Investasi Tanah Kavling Strategis – Pilihan Cerdas Masa Depan\r\n\r\nMiliki tanah kavling siap bangun di lokasi strategis dengan nilai investasi yang terus meningkat. Cocok untuk hunian, usaha, maupun tabungan aset jangka panjang.', NULL),
(17, '3', 'Warureja Asri', NULL, 'IMG-20251207-WA0007_1767627285.webp', 'DIJUAL KAVLING SIAP BANGUN\r\n*Investasi Cerdas, Masa Depan Cerah...!!*\r\n\r\nLokasi Strategis\r\n- Dekat Pusat Kota\r\n- Akses Jalan Mudah\r\n- Lingkungan aman dan nyaman\r\nSpesifikasi Kavling\r\n- Luas Kavling 108 m\r\n- Jalan Lebar \r\n- Sertifikat; SHM\r\n- Cukup untuk tempat tinggal atau investasi\r\nHarga terjangkau\r\n- mulai dari 65jtan saja \r\n- Bisa Cash ataupun kredit\r\n- tanpa bunga\r\n- angsuran menyesuaikan', NULL),
(18, '3', 'SIRANDU ASRI', NULL, 'Site_plan_Sirandu_1767628075.webp', 'Tanah Kavling Siap Bangun harga terjangkau cocok untuk investasi masa depan yang ceria', NULL),
(19, '4', 'Brosur', NULL, 'Site_Plan_Warureja.pdf', NULL, NULL),
(20, '7', 'PT. MULIA ASRI SENTOSA', NULL, 'cover_1765868297.webp', 'Perumahan kami menghadirkan hunian nyaman dan lingkungan yang asri, dengan fasilitas lengkap untuk memenuhi kebutuhan keluarga modern. Setiap rumah dirancang dengan konsep ramah lingkungan dan keamanan terjamin, memberikan Anda tempat tinggal ideal untuk membangun masa depan yang bahagia dan harmonis.', NULL),
(21, '1', NULL, NULL, 'kantor_1767628529.webp', NULL, NULL),
(23, '11', 'PT. Mulia Asri Sentosa', NULL, 'KOP_PT.webp', 'PT Mulia Asri Sentosa sejak tahun 2021 beroperasi di bidang penyediaan dan penjualan tanah kavling siap bangun untuk hunian di wilayah Kabupaten Pemalang sampai Kabupaten Tegal dan sekitarnya (termasuk penawaran dengan fasilitas umum dan opsi angsuran)\r\nContak Person : 0831-5454-1205', NULL),
(24, '1', NULL, NULL, 'kavling_1767671787.webp', NULL, NULL),
(25, '3', 'WARUREJA ASRI', NULL, 'Brosur_Kavling_Warureja.webp', 'Harga mulai dari 65 jutaan saja', NULL),
(27, '4', 'Pamflet', NULL, 'Site_plan_Sirandu_1767626301.webp', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `kode_customer` varchar(50) NOT NULL,
  `jenis_user` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_status_progres` int(11) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `no_ktp_p` varchar(25) DEFAULT NULL,
  `nama_lengkap_p` varchar(100) DEFAULT NULL,
  `tanggal_lahir_p` date DEFAULT NULL,
  `tempat_lahir_p` varchar(100) DEFAULT NULL,
  `alamat_p` varchar(100) DEFAULT NULL,
  `pekerjaan_p` varchar(100) DEFAULT NULL,
  `no_kk` varchar(25) NOT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `alamat_domisili` text DEFAULT NULL,
  `no_telp` varchar(25) DEFAULT NULL,
  `no_wa` varchar(25) NOT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `npwp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `penghasilan` int(11) DEFAULT NULL,
  `nama_saudara` varchar(75) DEFAULT NULL,
  `no_telp_saudara` varchar(35) DEFAULT NULL,
  `kode_token` varchar(25) DEFAULT NULL,
  `id_marketing` int(11) NOT NULL,
  `atas_nama` varchar(150) DEFAULT NULL,
  `no_surat` varchar(255) DEFAULT NULL,
  `keterangan_legalitas` text DEFAULT NULL,
  `keterangan_stt` varchar(200) DEFAULT NULL,
  `ket_reject` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `ket_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cashback` int(11) DEFAULT NULL,
  `harga_bersih` int(11) DEFAULT NULL,
  `referal_fee` int(11) DEFAULT NULL,
  `sumber_informasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rangking` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ket_cashback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_pembelian` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_perumahan` varchar(35) DEFAULT NULL,
  `jumlah_bulan` int(11) DEFAULT NULL,
  `jum_twp` int(11) DEFAULT NULL,
  `jum_asabri` int(11) DEFAULT NULL,
  `jum_pribadi` int(11) DEFAULT NULL,
  `inhouse_perbulan` int(11) DEFAULT NULL,
  `inhouse_tenor` int(11) DEFAULT NULL,
  `inhouse_jatuh_tempo` date DEFAULT NULL,
  `keterangan_belum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_sertipikat` varchar(35) DEFAULT NULL,
  `norek_air` varchar(35) DEFAULT NULL,
  `norek_listrik` varchar(35) DEFAULT NULL,
  `id_admin_pemberkasan` int(11) DEFAULT NULL,
  `id_reg` int(11) NOT NULL DEFAULT 0,
  `pembayaran_booking` int(11) DEFAULT 0,
  `tgl_batas_booking` date DEFAULT NULL,
  `jumlah_bulan_x` int(11) DEFAULT NULL,
  `dp_kredit` bigint(20) NOT NULL,
  `id_bank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `kode_customer`, `jenis_user`, `id_lokasi`, `id_status_progres`, `nama_lengkap`, `no_ktp`, `no_ktp_p`, `nama_lengkap_p`, `tanggal_lahir_p`, `tempat_lahir_p`, `alamat_p`, `pekerjaan_p`, `no_kk`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `alamat_domisili`, `no_telp`, `no_wa`, `email`, `npwp`, `pekerjaan`, `penghasilan`, `nama_saudara`, `no_telp_saudara`, `kode_token`, `id_marketing`, `atas_nama`, `no_surat`, `keterangan_legalitas`, `keterangan_stt`, `ket_reject`, `discount`, `ket_discount`, `cashback`, `harga_bersih`, `referal_fee`, `sumber_informasi`, `rangking`, `ket_cashback`, `jenis_pembelian`, `jenis_perumahan`, `jumlah_bulan`, `jum_twp`, `jum_asabri`, `jum_pribadi`, `inhouse_perbulan`, `inhouse_tenor`, `inhouse_jatuh_tempo`, `keterangan_belum`, `no_sertipikat`, `norek_air`, `norek_listrik`, `id_admin_pemberkasan`, `id_reg`, `pembayaran_booking`, `tgl_batas_booking`, `jumlah_bulan_x`, `dp_kredit`, `id_bank`) VALUES
(1, 'MGR-0001', NULL, 1, 3, 'Agus Yoga Utomo', '7326211012970001', '', NULL, NULL, NULL, NULL, NULL, '', 'Laki-laki', 'Batam', '1990-12-12', 'Jl. Andi Djemma No.102 Ruko Depan Cafe Enzyme Kota Palopo', 'Jl. Andi Djemma No.102 Ruko Depan Cafe Enzyme Kota Palopo', '08115532323', '08115532323', 'rumvan@appkita.cloud', NULL, 'Wiraswasta', 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'oke', 'Kredit', NULL, NULL, NULL, NULL, NULL, 6250000, 12, '2026-05-20', NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 5000000, 9),
(2, 'MGR-0002', NULL, 1, 26, 'Faisal Damanik', '7326211012970111', '', NULL, NULL, NULL, NULL, NULL, '', 'Laki-laki', 'BALIKPAPAN', '1994-11-11', 'Jl. Merdeka 123', 'Jl. Merdeka 123', '081808444800', '081808444800', '', NULL, 'PNS', 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'tidak ada', 'Cash Keras', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_nasabah`
--

CREATE TABLE `file_nasabah` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_customer` int(11) NOT NULL,
  `folder` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `lampiran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto_kavling`
--

CREATE TABLE `foto_kavling` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_kavling` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `lampiran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `lihat` int(11) NOT NULL,
  `beranda` int(11) NOT NULL DEFAULT 0,
  `tambah` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `hapus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`id`, `id_user`, `id_menu`, `lihat`, `beranda`, `tambah`, `edit`, `hapus`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0),
(3, 1, 2, 1, 0, 0, 0, 0),
(5, 1, 3, 1, 0, 0, 0, 0),
(7, 1, 4, 1, 0, 0, 0, 0),
(9, 1, 5, 1, 0, 0, 0, 0),
(11, 1, 7, 1, 0, 0, 0, 0),
(13, 1, 8, 1, 0, 0, 0, 0),
(15, 1, 9, 1, 0, 0, 0, 0),
(17, 1, 11, 1, 0, 1, 1, 1),
(19, 1, 12, 1, 0, 1, 1, 1),
(21, 1, 13, 1, 0, 1, 0, 1),
(23, 1, 14, 1, 0, 0, 0, 1),
(25, 1, 15, 1, 0, 1, 1, 1),
(27, 1, 16, 1, 0, 1, 1, 1),
(29, 1, 17, 1, 0, 0, 1, 0),
(31, 1, 18, 1, 0, 1, 1, 1),
(33, 1, 19, 1, 0, 0, 1, 0),
(35, 1, 20, 1, 0, 0, 1, 0),
(37, 1, 21, 1, 0, 0, 1, 0),
(39, 1, 22, 1, 0, 1, 1, 1),
(41, 1, 23, 1, 0, 1, 1, 1),
(43, 1, 24, 1, 0, 1, 1, 1),
(45, 1, 25, 1, 0, 1, 1, 1),
(47, 1, 27, 1, 0, 0, 1, 0),
(49, 1, 28, 1, 0, 0, 1, 0),
(51, 1, 29, 1, 0, 1, 1, 1),
(53, 1, 30, 1, 0, 1, 1, 1),
(55, 1, 31, 1, 0, 1, 1, 1),
(57, 1, 32, 1, 0, 1, 1, 1),
(59, 1, 33, 1, 0, 1, 1, 1),
(61, 1, 34, 1, 0, 1, 1, 1),
(63, 1, 35, 1, 0, 1, 1, 1),
(65, 1, 36, 1, 0, 0, 0, 0),
(253, 1, 37, 1, 0, 1, 1, 1),
(347, 17, 1, 0, 0, 0, 0, 0),
(348, 17, 2, 0, 0, 0, 0, 0),
(349, 17, 3, 1, 0, 0, 0, 0),
(350, 17, 4, 0, 0, 0, 0, 0),
(351, 17, 5, 0, 0, 0, 0, 0),
(352, 17, 7, 0, 0, 0, 0, 0),
(353, 17, 8, 0, 0, 0, 0, 0),
(354, 17, 11, 1, 1, 0, 0, 0),
(355, 17, 12, 0, 0, 0, 0, 0),
(356, 17, 13, 0, 0, 0, 0, 0),
(357, 17, 14, 1, 0, 0, 0, 0),
(358, 17, 15, 1, 0, 0, 0, 0),
(359, 17, 16, 1, 0, 0, 0, 0),
(360, 17, 17, 1, 0, 0, 0, 0),
(361, 17, 18, 1, 0, 0, 0, 0),
(362, 17, 19, 1, 0, 0, 0, 0),
(363, 17, 20, 1, 0, 0, 0, 0),
(364, 17, 21, 1, 0, 0, 0, 0),
(365, 17, 22, 1, 0, 0, 0, 0),
(366, 17, 23, 1, 0, 0, 0, 0),
(367, 17, 27, 0, 0, 0, 0, 0),
(368, 17, 28, 1, 0, 0, 0, 0),
(369, 17, 29, 1, 0, 0, 0, 0),
(370, 17, 30, 0, 0, 0, 0, 0),
(371, 17, 31, 0, 0, 0, 0, 0),
(372, 17, 32, 0, 0, 0, 0, 0),
(373, 17, 33, 0, 0, 0, 0, 0),
(374, 17, 34, 0, 0, 0, 0, 0),
(375, 17, 35, 0, 0, 0, 0, 0),
(376, 17, 36, 0, 0, 0, 0, 0),
(377, 17, 37, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE `hutang` (
  `id` int(11) NOT NULL,
  `tanggal_hutang` date NOT NULL,
  `id_bank` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `nominal` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `terbayar` int(11) NOT NULL,
  `sisa_bayar` int(11) NOT NULL,
  `tgl_pelunasan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pembayaran`
--

CREATE TABLE `jenis_pembayaran` (
  `id` int(11) NOT NULL,
  `nama_jenis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan_jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_pembayaran`
--

INSERT INTO `jenis_pembayaran` (`id`, `nama_jenis`, `urutan`, `keterangan_jenis`) VALUES
(1, 'CASH KERAS', 1, 'Uang Tanda Jadi'),
(2, 'Cicilan', 4, 'Cicilan Umum'),
(3, 'Pencairan KPR', 5, ''),
(4, 'Pencairan TWP', 6, ''),
(8, 'Pencairan Asabri', 7, ''),
(9, 'Cicilan Pribadi', 8, ''),
(10, 'Booking Fee', 2, ''),
(11, 'Pembayaran DP', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pengeluaran`
--

CREATE TABLE `jenis_pengeluaran` (
  `id` int(11) NOT NULL,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan_jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_pengeluaran`
--

INSERT INTO `jenis_pengeluaran` (`id`, `nama_jenis`, `urutan`, `keterangan_jenis`) VALUES
(1, 'A-BANK', 1, 'Uang Tanda Jadi'),
(2, 'A-FEE', 2, 'Cicilan Umum'),
(3, 'A-NOTARIS', 3, ''),
(4, 'HUTANG', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `jenis_kategori` varchar(15) NOT NULL,
  `stt_fix` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`, `jenis_kategori`, `stt_fix`) VALUES
(1, 'CASH KERAS', 'PEMASUKAN', 1),
(2, 'CICILAN CASH LUNAK', 'PEMASUKAN', 1),
(3, 'PENCAIRAN KPR', 'PEMASUKAN', 1),
(4, 'PENCAIRAN TWP', 'PEMASUKAN', 1),
(7, 'PEMBAYARAN PIUTANG', 'PEMASUKAN', 0),
(8, 'PENCAIRAN ASABRI', 'PEMASUKAN', 1),
(9, 'CICILAN PRIBADI', 'PEMASUKAN', 1),
(10, 'PEMBAYARAN UTJ', 'PEMASUKAN', 1),
(11, 'PEMBAYARAN DP', 'PEMASUKAN', 1),
(12, 'PENCAIRAN DANA', 'PEMASUKAN', 0),
(13, 'PEMBELIAN ATK', 'PENGELUARAN', 0),
(14, 'PEMBAYARAN INTERNET', 'PENGELUARAN', 0),
(15, 'OPERASIONAL', 'PENGELUARAN', 0),
(16, 'KONSUMSI', 'PENGELUARAN', 0),
(17, 'LOGISTIK', 'PENGELUARAN', 0),
(18, 'HR', 'PENGELUARAN', 0),
(19, 'DIR', 'PENGELUARAN', 0),
(20, 'ADMIN', 'PENGELUARAN', 0),
(23, 'ANGSURAN PTT', 'PENGELUARAN', 0),
(24, 'PELUNASAN', 'PEMASUKAN', NULL),
(25, 'PEMBAYARAN LOKASI/TANAH', 'PENGELUARAN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_transaksi`
--

CREATE TABLE `kategori_transaksi` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `jenis_kategori` varchar(15) NOT NULL,
  `stt_fix` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_transaksi`
--

INSERT INTO `kategori_transaksi` (`id`, `kode`, `kategori`, `jenis_kategori`, `stt_fix`) VALUES
(25, '001', 'Booking Fee Kavling/REVENUE', 'PEMASUKAN', 0),
(26, '002', 'Uang Muka (DP) Kavling', 'PEMASUKAN', 0),
(27, '003', 'Pelunasan Kavling', 'PEMASUKAN', 0),
(28, '004', 'Cicilan Kavling', 'PEMASUKAN', 0),
(29, '005', 'Pembayaran Cash Bertahap', 'PEMASUKAN', 0),
(30, '006', 'Biaya Administrasi Pembelian', 'PEMASUKAN', 0),
(31, '007', 'Biaya Pemesanan Kavling', 'PEMASUKAN', 0),
(32, '008', 'Biaya Balik Nama Sertifikat', 'PEMASUKAN', 0),
(33, '009', 'Biaya Pengurusan Sertifikat', 'PEMASUKAN', 0),
(34, '010', 'Biaya AJB / Notaris dari Pembeli', 'PEMASUKAN', 0),
(35, '011', 'Denda Keterlambatan Pembayaran', 'PEMASUKAN', 0),
(36, '012', 'Denda Pembatalan Pembelian', 'PEMASUKAN', 0),
(37, '013', 'Pencairan Hutang', 'PEMASUKAN', 0),
(38, '014', 'Pengembalian Dana Proyek', 'PEMASUKAN', 0),
(39, '015', 'Pendapatan Kerjasama Investor', 'PEMASUKAN', 0),
(40, '016', 'Pendapatan Komisi Kerjasama', 'PEMASUKAN', 0),
(41, '017', 'Pendapatan Bunga Bank', 'PEMASUKAN', 0),
(42, '018', 'Pendapatan Penjualan Aset', 'PEMASUKAN', 0),
(43, '019', 'Pendapatan Penjualan Tanah Sisa', 'PEMASUKAN', 0),
(44, '020', 'Pendapatan Lain-lain', 'PEMASUKAN', 0),
(45, '101', 'Pembelian Tanah/AKUISISI', 'PENGELUARAN', 0),
(46, '102', 'DP Pembelian Tanah', 'PENGELUARAN', 0),
(47, '103', 'Pelunasan Pembelian Tanah', 'PENGELUARAN', 0),
(48, '104', 'Biaya Notaris Pembelian', 'PENGELUARAN', 0),
(49, '105', 'Pajak Pembelian Tanah', 'PENGELUARAN', 0),
(50, '106', 'Biaya Survey Tanah', 'PENGELUARAN', 0),
(51, '107', 'Biaya Pengukuran Tanah', 'PENGELUARAN', 0),
(52, '108', 'Biaya Konsultan Tanah', 'PENGELUARAN', 0),
(53, '120', 'Pematangan Lahan / PENGEMBANGAN LAHAN', 'PENGELUARAN', 0),
(54, '121', 'Cut and Fill Tanah', 'PENGELUARAN', 0),
(55, '122', 'Pembuatan Jalan Kavling', 'PENGELUARAN', 0),
(56, '123', 'Pembuatan Drainase', 'PENGELUARAN', 0),
(57, '124', 'Pemasangan Gorong-gorong', 'PENGELUARAN', 0),
(58, '125', 'Pagar Kawasan', 'PENGELUARAN', 0),
(59, '126', 'Gerbang Kawasan', 'PENGELUARAN', 0),
(60, '127', 'Pemasangan Listrik', 'PENGELUARAN', 0),
(61, '128', 'Pemasangan Air / PDAM', 'PENGELUARAN', 0),
(62, '129', 'Biaya Alat Berat', 'PENGELUARAN', 0),
(63, '130', 'Upah Tukang', 'PENGELUARAN', 0),
(64, '131', 'Material Pembangunan', 'PENGELUARAN', 0),
(65, '140', 'Biaya Pemecahan Sertifikat', 'PENGELUARAN', 0),
(66, '141', 'Biaya Balik Nama', 'PENGELUARAN', 0),
(67, '142', 'Biaya AJB', 'PENGELUARAN', 0),
(68, '143', 'Biaya Notaris Penjualan', 'PENGELUARAN', 0),
(69, '144', 'Pajak Penjualan Tanah', 'PENGELUARAN', 0),
(70, '145', 'Biaya Pembuatan SHM', 'PENGELUARAN', 0),
(71, '146', 'Biaya Pembuatan SHGB', 'PENGELUARAN', 0),
(72, '147', 'Biaya Legal Konsultan', 'PENGELUARAN', 0),
(73, '160', 'Iklan Facebook / Instagram', 'PENGELUARAN', 0),
(74, '161', 'Iklan Google Ads', 'PENGELUARAN', 0),
(75, '162', 'Biaya Konten Marketing', 'PENGELUARAN', 0),
(76, '163', 'Desain Brosur', 'PENGELUARAN', 0),
(77, '164', 'Cetak Brosur', 'PENGELUARAN', 0),
(78, '165', 'Spanduk / Banner', 'PENGELUARAN', 0),
(79, '166', 'Komisi Sales', 'PENGELUARAN', 0),
(80, '167', 'Bonus Sales', 'PENGELUARAN', 0),
(81, '168', 'Event Promosi', 'PENGELUARAN', 0),
(82, '169', 'Biaya Survey Konsumen', 'PENGELUARAN', 0),
(83, '180', 'Gaji Karyawan', 'PENGELUARAN', 0),
(84, '181', 'Bonus Karyawan', 'PENGELUARAN', 0),
(85, '182', 'Sewa Kantor', 'PENGELUARAN', 0),
(86, '183', 'Internet Kantor', 'PENGELUARAN', 0),
(87, '184', 'Telepon Kantor', 'PENGELUARAN', 0),
(88, '185', 'ATK Kantor', 'PENGELUARAN', 0),
(89, '186', 'Transportasi Operasional', 'PENGELUARAN', 0),
(90, '187', 'BBM Kendaraan', 'PENGELUARAN', 0),
(91, '188', 'Perawatan Kendaraan', 'PENGELUARAN', 0),
(92, '189', 'Listrik Kantor', 'PENGELUARAN', 0),
(93, '190', 'Air Kantor', 'PENGELUARAN', 0),
(94, '191', 'Konsumsi Meeting', 'PENGELUARAN', 0),
(95, '192', 'Perjalanan Dinas', 'PENGELUARAN', 0),
(96, '193', 'Administrasi Bank', 'PENGELUARAN', 0),
(97, '194', 'Perawatan Kantor', 'PENGELUARAN', 0),
(98, '195', 'Biaya Software / Hosting', 'PENGELUARAN', 0),
(99, '196', 'Biaya Keamanan', 'PENGELUARAN', 0),
(100, '197', 'Biaya Kebersihan', 'PENGELUARAN', 0),
(101, '198', 'Biaya Lain-lain', 'PENGELUARAN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kavling_peta`
--

CREATE TABLE `kavling_peta` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `cluster` varchar(10) DEFAULT NULL,
  `kode_kavling` varchar(15) NOT NULL,
  `id_projek` int(11) DEFAULT NULL,
  `panjang_kanan` double(11,1) NOT NULL,
  `panjang_kiri` double(11,1) NOT NULL,
  `lebar_depan` double(11,1) NOT NULL,
  `lebar_belakang` double(11,1) NOT NULL,
  `luas_tanah` int(11) NOT NULL,
  `tipe_bangunan` varchar(50) DEFAULT NULL,
  `daya_listrik` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `luas_bangunan` varchar(15) DEFAULT NULL,
  `hrg_meter` int(11) NOT NULL,
  `hrg_jual` int(11) NOT NULL,
  `id_rumah_sikumbang` varchar(50) DEFAULT NULL,
  `no_sertifikat` varchar(35) NOT NULL,
  `jenis_map` varchar(15) NOT NULL,
  `map` text NOT NULL,
  `matrik` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `atas_nama_surat` varchar(100) NOT NULL,
  `stt_cicilan` int(11) DEFAULT NULL,
  `status_ready` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kavling_peta`
--

INSERT INTO `kavling_peta` (`id`, `id_lokasi`, `cluster`, `kode_kavling`, `id_projek`, `panjang_kanan`, `panjang_kiri`, `lebar_depan`, `lebar_belakang`, `luas_tanah`, `tipe_bangunan`, `daya_listrik`, `luas_bangunan`, `hrg_meter`, `hrg_jual`, `id_rumah_sikumbang`, `no_sertifikat`, `jenis_map`, `map`, `matrik`, `status`, `keterangan`, `atas_nama_surat`, `stt_cicilan`, `status_ready`) VALUES
(1, 1, '', 'A-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '3239,5173 3173,3142 1299,3204 1985,5214 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -34190.6 12669.4)', 0, '', '', NULL, 1),
(2, 1, '', 'A-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '4624,5128 4558,3096 3225,3140 3292,5172 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -32551.9 12661.9)', 0, '', '', NULL, 1),
(3, 1, '', 'A-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6025,5082 5959,3049 4610,3094 4677,5126 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -31149.3 12612.7)', 0, '', '', NULL, 1),
(4, 1, '', 'A-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '7418,5037 7351,3003 6011,3047 6078,5081 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -29762.4 12567.5)', 0, '', '', NULL, 1),
(5, 1, '', 'A-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8815,4991 8748,2956 7404,3001 7471,5035 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -28358.7 12531.6)', 0, '', '', NULL, 1),
(6, 1, '', 'A-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '10198,4946 10148,2910 8801,2955 8868,4989 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -26967.7 12468.1)', 0, '', '', NULL, 1),
(7, 1, '', 'A-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11601,4900 11534,2864 10201,2908 10250,4944 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -25559.5 12437.6)', 0, '', '', NULL, 1),
(8, 1, '', 'A-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '12987,4855 12920,2818 11587,2862 11654,4898 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -24181.8 12391.1)', 0, '', '', NULL, 1),
(9, 1, '', 'A-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14376,4809 14310,2772 12973,2816 13039,4853 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -22785.8 12338.5)', 0, '', '', NULL, 1),
(10, 1, '', 'A-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '15769,4764 15703,2726 14362,2770 14429,4808 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -21384.8 12248.1)', 0, '', '', NULL, 1),
(11, 1, '', 'A-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17155,4719 17088,2680 15755,2724 15822,4762 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -19986 12161.9)', 0, '', '', NULL, 1),
(12, 1, '', 'A-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18566,4673 18499,2633 17141,2678 17208,4717 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -18604.8 12152.7)', 0, '', '', NULL, 1),
(13, 1, '', 'A-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19967,4627 19900,2586 18552,2631 18619,4671 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -17189.7 12104.1)', 0, '', '', NULL, 1),
(14, 1, '', 'A-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21352,4581 21286,2540 19953,2584 20019,4625 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -15806.2 12058)', 0, '', '', NULL, 1),
(15, 1, '', 'A-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22742,4536 22675,2494 21338,2538 21405,4580 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -14409.9 12022.3)', 0, '', '', NULL, 1),
(16, 1, '', 'A-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24142,4490 24057,2448 22728,2492 22794,4534 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -13013.8 11959.2)', 0, '', '', NULL, 1),
(17, 1, '', 'A-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25517,4445 25450,2402 24110,2446 24195,4489 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -11628.8 11928.3)', 0, '', '', NULL, 1),
(18, 1, '', 'A-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '26910,4400 26843,2356 25503,2400 25569,4444 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -10243.9 11882.1)', 0, '', '', NULL, 1),
(19, 1, '', 'A-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28317,4354 28229,2310 26896,2354 26963,4398 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -8835.15 11829.5)', 0, '', '', NULL, 1),
(20, 1, '', 'A-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29689,4309 29643,2263 28282,2308 28370,4352 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -7480.56 11831.7)', 0, '', '', NULL, 1),
(21, 1, '', 'A-21', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29696,2261 29742,4307 31077,4264 31012,2217 ', 'matrix(0.34202 -0.939693 0.939693 0.34202 -6070.16 11746.1)', 0, '', '', NULL, 1),
(22, 1, '', 'B-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '3382,9016 5020,8959 4927,6239 2458,6310 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -18333.5 -22596.3)', 0, '', '', NULL, 1),
(23, 1, '', 'B-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '5022,9012 3399,9068 5206,14360 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -17787.5 -20555.2)', 0, '', '', NULL, 1),
(24, 1, '', 'C-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6055,7518 8098,7452 8054,6116 6010,6179 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -15012.1 -23406)', 0, '', '', NULL, 1),
(25, 1, '', 'C-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8150,7450 10194,7383 10150,6053 8106,6115 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12965.7 -23469.4)', 0, '', '', NULL, 1),
(26, 1, '', 'C-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6102,8908 8143,8841 8099,7504 6057,7571 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -15012.4 -22014.6)', 0, '', '', NULL, 1),
(27, 1, '', 'C-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8196,8840 10239,8773 10195,7436 8152,7503 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12932.1 -22083.5)', 0, '', '', NULL, 1),
(28, 1, '', 'C-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6150,10313 8189,10246 8145,8894 6104,8961 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14969.2 -20617.3)', 0, '', '', NULL, 1),
(29, 1, '', 'C-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8242,10245 10285,10178 10241,8826 8198,8893 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12871.1 -20686.4)', 0, '', '', NULL, 1),
(30, 1, '', 'C-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6197,11696 8235,11627 8191,10299 6152,10365 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14909.8 -19223.2)', 0, '', '', NULL, 1),
(31, 1, '', 'C-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8287,11625 10329,11556 10286,10231 8244,10297 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12835.1 -19292.2)', 0, '', '', NULL, 1),
(32, 1, '', 'C-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6244,13082 8280,13016 8236,11680 6199,11749 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14868.8 -17839.7)', 0, '', '', NULL, 1),
(33, 1, '', 'C-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8333,13014 10375,12948 10331,11609 8289,11678 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12732.3 -17911.4)', 0, '', '', NULL, 1),
(34, 1, '', 'C-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6291,14478 8326,14411 8282,13068 6246,13135 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14726.3 -16453.1)', 0, '', '', NULL, 1),
(35, 1, '', 'C-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8379,14410 10420,14343 10376,13000 8335,13067 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12684.8 -16518.5)', 0, '', '', NULL, 1),
(36, 1, '', 'C-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6339,15879 8372,15813 8328,14464 6293,14530 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14727.6 -15051.9)', 0, '', '', NULL, 1),
(37, 1, '', 'C-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8425,15811 10466,15745 10422,14396 8380,14462 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12650.9 -15120.6)', 0, '', '', NULL, 1),
(38, 1, '', 'C-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '6385,17256 8417,17189 8374,15866 6341,15932 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14683.5 -13662.9)', 0, '', '', NULL, 1),
(39, 1, '', 'C-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8470,17188 10510,17121 10467,15798 8426,15864 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12590.2 -13731.8)', 0, '', '', NULL, 1),
(40, 1, '', 'C-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8419,17242 6387,17308 6407,17880 7151,20016 8509,19973 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -14419.3 -11861.7)', 0, '', '', NULL, 1),
(41, 1, '', 'C-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8516,18579 10556,18513 10512,17174 8472,17240 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12554.4 -12346.5)', 0, '', '', NULL, 1),
(42, 1, '', 'C-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '10557,18566 8517,18632 8561,19971 10601,19905 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12495.5 -10955.3)', 0, '', '', NULL, 1),
(43, 1, '', 'D-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11277,7345 13320,7279 13276,5944 11232,6006 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9799.32 -23578.9)', 0, '', '', NULL, 1),
(44, 1, '', 'D-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13373,7277 15416,7211 15373,5880 13329,5942 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7752.94 -23642.3)', 0, '', '', NULL, 1),
(45, 1, '', 'D-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11325,8735 13365,8669 13322,7331 11279,7398 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9799.68 -22187.5)', 0, '', '', NULL, 1),
(46, 1, '', 'D-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13418,8667 15461,8601 15418,7263 13374,7330 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7719.35 -22256.4)', 0, '', '', NULL, 1),
(47, 1, '', 'D-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11372,10140 13412,10073 13367,8721 11326,8788 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9756.47 -20790.2)', 0, '', '', NULL, 1),
(48, 1, '', 'D-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13464,10072 15507,10005 15463,8653 13420,8720 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7658.33 -20859.3)', 0, '', '', NULL, 1),
(49, 1, '', 'D-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11419,11524 13457,11454 13413,10126 11374,10192 ', 'matrix(0.994522 -0.104528 0.104528 0.994522 -11241 -18197)', 0, '', '', NULL, 1),
(50, 1, '', 'D-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13510,11453 15552,11383 15508,10058 13466,10124 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7622.34 -19465.1)', 0, '', '', NULL, 1),
(51, 1, '', 'D-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11466,12909 13502,12843 13459,11507 11421,11576 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9656.05 -18012.6)', 0, '', '', NULL, 1),
(52, 1, '', 'D-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13555,12841 15597,12775 15553,11436 13511,11505 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7519.57 -18084.3)', 0, '', '', NULL, 1),
(53, 1, '', 'D-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11513,14305 13548,14239 13504,12896 11468,12962 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9513.6 -16626)', 0, '', '', NULL, 1),
(54, 1, '', 'D-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13601,14237 15642,14170 15599,12827 13557,12894 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7472.08 -16691.3)', 0, '', '', NULL, 1),
(55, 1, '', 'D-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11561,15706 13594,15640 13550,14291 11515,14357 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9514.84 -15224.8)', 0, '', '', NULL, 1),
(56, 1, '', 'D-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13647,15639 15688,15572 15644,14223 13603,14290 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7438.17 -15293.5)', 0, '', '', NULL, 1),
(57, 1, '', 'D-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11608,17083 13639,17017 13596,15693 11563,15759 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9470.75 -13835.8)', 0, '', '', NULL, 1),
(58, 1, '', 'D-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13692,17015 15733,16949 15690,15625 13649,15691 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7377.43 -13904.7)', 0, '', '', NULL, 1),
(59, 1, '', 'D-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11655,18474 13685,18408 13641,17069 11609,17135 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9411.67 -12452)', 0, '', '', NULL, 1),
(60, 1, '', 'D-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13738,18406 15778,18340 15734,17001 13694,17068 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7341.68 -12519.4)', 0, '', '', NULL, 1),
(61, 1, '', 'D-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13687,18461 11657,18527 11702,19865 13731,19800 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9370.44 -11060.6)', 0, '', '', NULL, 1),
(62, 1, '', 'D-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '15780,18393 13740,18459 13783,19798 15823,19732 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7337.82 -11125.2)', 0, '', '', NULL, 1),
(63, 1, '', 'E-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16508,7164 18551,7098 18507,5763 16463,5825 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4555.08 -23760.4)', 0, '', '', NULL, 1),
(64, 1, '', 'E-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18603,7096 20647,7030 20603,5699 18560,5761 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2508.67 -23823.8)', 0, '', '', NULL, 1),
(65, 1, '', 'E-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16555,8554 18596,8488 18552,7151 16510,7217 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4555.43 -22369.1)', 0, '', '', NULL, 1),
(66, 1, '', 'E-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18649,8486 20692,8420 20648,7082 18605,7149 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2475.09 -22437.9)', 0, '', '', NULL, 1),
(67, 1, '', 'E-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16603,9959 18642,9893 18598,8541 16557,8607 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4512.21 -20971.8)', 0, '', '', NULL, 1),
(68, 1, '', 'E-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18695,9891 20738,9824 20694,8472 18651,8539 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2414.09 -21040.8)', 0, '', '', NULL, 1),
(69, 1, '', 'E-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16650,11343 18688,11274 18644,9945 16605,10012 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4452.84 -19577.6)', 0, '', '', NULL, 1),
(70, 1, '', 'E-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18740,11272 20782,11203 20739,9877 18697,9944 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2378.09 -19646.6)', 0, '', '', NULL, 1),
(71, 1, '', 'E-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16697,12728 18733,12662 18689,11326 16652,11395 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4411.79 -18194.1)', 0, '', '', NULL, 1),
(72, 1, '', 'E-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18786,12660 20828,12594 20784,11255 18742,11325 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2275.32 -18265.8)', 0, '', '', NULL, 1),
(73, 1, '', 'E-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16744,14124 18779,14058 18735,12715 16699,12781 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4269.35 -16807.5)', 0, '', '', NULL, 1),
(74, 1, '', 'E-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18832,14056 20873,13990 20829,12647 18788,12713 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2227.83 -16872.9)', 0, '', '', NULL, 1),
(75, 1, '', 'E-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16792,15526 18825,15459 18781,14110 16746,14177 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4270.58 -15406.3)', 0, '', '', NULL, 1),
(76, 1, '', 'E-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18878,15458 20919,15391 20875,14042 18833,14109 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2193.91 -15475)', 0, '', '', NULL, 1),
(77, 1, '', 'E-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16839,16902 18870,16836 18827,15512 16794,15578 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4226.5 -14017.3)', 0, '', '', NULL, 1),
(78, 1, '', 'E-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18923,16834 20963,16768 20920,15444 18880,15510 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2133.18 -14086.2)', 0, '', '', NULL, 1),
(79, 1, '', 'E-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16886,18293 18916,18227 18872,16889 16840,16955 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4167.42 -12633.6)', 0, '', '', NULL, 1),
(80, 1, '', 'E-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18969,18226 21009,18159 20965,16820 18925,16887 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2097.44 -12701)', 0, '', '', NULL, 1),
(81, 1, '', 'E-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '18918,18280 16887,18346 16933,19684 18962,19619 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4126.19 -11242.2)', 0, '', '', NULL, 1),
(82, 1, '', 'E-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21010,18212 18970,18278 19014,19617 21054,19552 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -2093.57 -11306.7)', 0, '', '', NULL, 1),
(83, 1, '', 'F-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21721,7000 23764,6933 23720,5598 21676,5660 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 666.954 -23925.7)', 0, '', '', NULL, 1),
(84, 1, '', 'F-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23816,6931 25860,6865 25817,5534 23773,5596 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2713.34 -23989.1)', 0, '', '', NULL, 1),
(85, 1, '', 'F-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21769,8389 23809,8323 23765,6986 21723,7052 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 666.594 -22534.4)', 0, '', '', NULL, 1),
(86, 1, '', 'F-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23862,8321 25905,8255 25862,6918 23818,6984 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2746.94 -22603.2)', 0, '', '', NULL, 1),
(87, 1, '', 'F-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21816,9794 23855,9728 23811,8376 21770,8442 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 709.816 -21137.1)', 0, '', '', NULL, 1),
(88, 1, '', 'F-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23908,9726 25951,9660 25907,8308 23864,8374 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2807.95 -21206.1)', 0, '', '', NULL, 1),
(89, 1, '', 'F-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21863,11178 23901,11109 23857,9781 21818,9847 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 769.183 -19742.9)', 0, '', '', NULL, 1),
(90, 1, '', 'F-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23954,11107 25996,11038 25952,9712 23910,9779 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2843.93 -19811.9)', 0, '', '', NULL, 1),
(91, 1, '', 'F-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21910,12563 23946,12497 23903,11162 21865,11231 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 810.238 -18359.4)', 0, '', '', NULL, 1),
(92, 1, '', 'F-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23999,12495 26041,12429 25997,11090 23955,11160 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2946.71 -18431.1)', 0, '', '', NULL, 1),
(93, 1, '', 'F-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21957,13959 23992,13893 23948,12550 21912,12616 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 952.68 -16972.8)', 0, '', '', NULL, 1),
(94, 1, '', 'F-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24045,13891 26086,13825 26043,12482 24001,12548 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2994.2 -17038.2)', 0, '', '', NULL, 1),
(95, 1, '', 'F-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22005,15361 24038,15295 23994,13946 21959,14012 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 951.444 -15571.6)', 0, '', '', NULL, 1),
(96, 1, '', 'F-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24091,15293 26132,15226 26088,13877 24047,13944 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3028.1 -15640.3)', 0, '', '', NULL, 1),
(97, 1, '', 'F-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22052,16737 24083,16671 24040,15347 22007,15413 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 995.532 -14182.6)', 0, '', '', NULL, 1),
(98, 1, '', 'F-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24136,16669 26177,16603 26134,15279 24093,15346 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3088.86 -14251.5)', 0, '', '', NULL, 1),
(99, 1, '', 'F-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22099,18128 24129,18062 24085,16724 22053,16790 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1054.6 -12798.9)', 0, '', '', NULL, 1),
(100, 1, '', 'F-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24182,18061 26222,17994 26178,16656 24138,16722 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3124.6 -12866.2)', 0, '', '', NULL, 1),
(101, 1, '', 'F-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24131,18115 22101,18181 22146,19519 24175,19454 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1095.84 -11407.5)', 0, '', '', NULL, 1),
(102, 1, '', 'F-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '26224,18047 24184,18113 24227,19452 26267,19387 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3128.46 -11472)', 0, '', '', NULL, 1),
(103, 1, '', 'G-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '26959,6832 29001,6765 28958,5430 26914,5493 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 5885.44 -24091.7)', 0, '', '', NULL, 1),
(104, 1, '', 'G-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29054,6764 31098,6697 31054,5366 29010,5429 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7931.84 -24155.2)', 0, '', '', NULL, 1),
(105, 1, '', 'G-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27006,8222 29047,8155 29003,6818 26961,6885 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 5885.09 -22700.4)', 0, '', '', NULL, 1),
(106, 1, '', 'G-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29100,8154 31143,8087 31099,6750 29056,6816 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7965.44 -22769.2)', 0, '', '', NULL, 1),
(107, 1, '', 'G-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27054,9626 29093,9560 29049,8208 27008,8274 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 5928.3 -21303.1)', 0, '', '', NULL, 1),
(108, 1, '', 'G-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29146,9558 31188,9492 31144,8140 29102,8206 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8026.43 -21372.1)', 0, '', '', NULL, 1),
(109, 1, '', 'G-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27101,11010 29138,10941 29095,9613 27056,9679 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 5987.67 -19908.9)', 0, '', '', NULL, 1),
(110, 1, '', 'G-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29191,10939 31233,10870 31190,9545 29148,9611 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8062.44 -19977.9)', 0, '', '', NULL, 1),
(111, 1, '', 'G-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27148,12396 29184,12330 29140,10994 27103,11063 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6028.74 -18525.4)', 0, '', '', NULL, 1),
(112, 1, '', 'G-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29237,12328 31279,12261 31235,10923 29193,10992 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8165.21 -18597.1)', 0, '', '', NULL, 1),
(113, 1, '', 'G-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27195,13791 29230,13725 29186,12382 27150,12449 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6171.18 -17138.8)', 0, '', '', NULL, 1),
(114, 1, '', 'G-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29283,13724 31324,13657 31280,12314 29239,12381 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8212.69 -17204.2)', 0, '', '', NULL, 1),
(115, 1, '', 'G-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27243,15193 29276,15127 29232,13778 27197,13844 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6169.93 -15737.6)', 0, '', '', NULL, 1),
(116, 1, '', 'G-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29329,15125 31369,15059 31326,13710 29284,13776 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8246.61 -15806.3)', 0, '', '', NULL, 1),
(117, 1, '', 'G-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27289,16569 29321,16503 29278,15180 27244,15246 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6214.04 -14348.6)', 0, '', '', NULL, 1),
(118, 1, '', 'G-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29374,16502 31414,16435 31371,15112 29330,15178 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8307.34 -14417.5)', 0, '', '', NULL, 1),
(119, 1, '', 'G-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27337,17961 29367,17895 29323,16556 27291,16622 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6273.1 -12964.9)', 0, '', '', NULL, 1),
(120, 1, '', 'G-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29419,17893 31460,17827 31416,16488 29376,16554 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8343.09 -13032.3)', 0, '', '', NULL, 1),
(121, 1, '', 'G-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29368,17947 27338,18014 27384,19352 29412,19286 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6314.34 -11573.5)', 0, '', '', NULL, 1),
(122, 1, '', 'G-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '31461,17879 29421,17946 29465,19285 31505,19219 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8346.94 -11638)', 0, '', '', NULL, 1),
(123, 1, '', 'H-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '7999,22455 10692,22362 10646,21038 7547,21129 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12960.9 -8476.62)', 0, '', '', NULL, 1),
(124, 1, '', 'H-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '8468,23830 10739,23752 10694,22415 8017,22507 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12752.2 -7097.77)', 0, '', '', NULL, 1),
(125, 1, '', 'H-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '10741,23805 8486,23882 10996,31242 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -12302.2 -5306.46)', 0, '', '', NULL, 1),
(126, 1, '', 'I-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11784,22316 13827,22249 13783,20914 11739,20976 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9205.13 -8612.98)', 0, '', '', NULL, 1),
(127, 1, '', 'I-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13879,22248 15923,22181 15880,20850 13836,20913 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7158.73 -8676.4)', 0, '', '', NULL, 1),
(128, 1, '', 'I-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11832,23706 13872,23639 13828,22302 11786,22368 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9205.48 -7221.63)', 0, '', '', NULL, 1),
(129, 1, '', 'I-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13925,23637 15968,23571 15925,22234 13881,22300 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7125.15 -7290.45)', 0, '', '', NULL, 1),
(130, 1, '', 'I-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11879,25110 13918,25044 13874,23692 11833,23758 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9162.27 -5824.33)', 0, '', '', NULL, 1),
(131, 1, '', 'I-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13971,25042 16014,24976 15970,23624 13927,23690 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7064.14 -5893.4)', 0, '', '', NULL, 1),
(132, 1, '', 'I-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11926,26494 13964,26425 13920,25097 11881,25163 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9102.89 -4430.18)', 0, '', '', NULL, 1),
(133, 1, '', 'I-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14017,26423 16059,26354 16015,25029 13973,25095 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7028.14 -4499.19)', 0, '', '', NULL, 1),
(134, 1, '', 'I-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '11973,27880 14009,27813 13966,26478 11928,26547 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -9061.84 -3046.68)', 0, '', '', NULL, 1),
(135, 1, '', 'I-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14062,27812 16104,27745 16060,26407 14018,26476 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6925.37 -3118.36)', 0, '', '', NULL, 1),
(136, 1, '', 'I-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '12020,29275 14055,29209 14011,27866 11975,27932 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -8919.39 -1660.05)', 0, '', '', NULL, 1),
(137, 1, '', 'I-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14108,29207 16149,29141 16106,27798 14064,27864 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6877.88 -1725.44)', 0, '', '', NULL, 1),
(138, 1, '', 'I-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '12068,30677 14101,30611 14057,29262 12022,29328 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -8920.64 -258.847)', 0, '', '', NULL, 1),
(139, 1, '', 'I-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14154,30609 16195,30543 16151,29194 14110,29260 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6843.97 -327.567)', 0, '', '', NULL, 1),
(140, 1, '', 'I-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '12115,32053 14146,31987 14103,30663 12070,30730 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -8876.54 1130.11)', 0, '', '', NULL, 1),
(141, 1, '', 'I-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14199,31985 16240,31919 16196,30595 14156,30662 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6783.22 1061.2)', 0, '', '', NULL, 1),
(142, 1, '', 'I-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '12162,33445 14192,33379 14148,32040 12116,32106 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -8817.47 2513.87)', 0, '', '', NULL, 1),
(143, 1, '', 'I-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14245,33377 16285,33310 16241,31972 14201,32038 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6747.48 2446.48)', 0, '', '', NULL, 1),
(144, 1, '', 'I-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '14194,33431 12164,33497 12209,34835 14238,34770 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -8776.23 3905.25)', 0, '', '', NULL, 1),
(145, 1, '', 'I-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16287,33363 14246,33430 14290,34768 16330,34703 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6743.63 3840.73)', 0, '', '', NULL, 1),
(146, 1, '', 'J-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17023,22140 19065,22074 19021,20739 16977,20801 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4010.43 -8786.21)', 0, '', '', NULL, 1),
(147, 1, '', 'J-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19118,22072 21161,22006 21118,20675 19074,20737 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1964.03 -8849.63)', 0, '', '', NULL, 1),
(148, 1, '', 'J-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17070,23530 19111,23464 19067,22127 17024,22193 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -4010.78 -7394.86)', 0, '', '', NULL, 1),
(149, 1, '', 'J-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19163,23462 21206,23396 21163,22059 19119,22125 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1930.44 -7463.68)', 0, '', '', NULL, 1),
(150, 1, '', 'J-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17117,24935 19157,24869 19112,23517 17072,23583 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3967.57 -5997.56)', 0, '', '', NULL, 1),
(151, 1, '', 'J-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19209,24867 21252,24801 21208,23449 19165,23515 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1869.44 -6066.63)', 0, '', '', NULL, 1),
(152, 1, '', 'J-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17164,26319 19202,26250 19158,24921 17119,24988 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3908.19 -4603.4)', 0, '', '', NULL, 1),
(153, 1, '', 'J-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19255,26248 21297,26179 21254,24853 19211,24920 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1833.44 -4672.42)', 0, '', '', NULL, 1),
(154, 1, '', 'J-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17211,27704 19248,27638 19204,26302 17166,26372 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3867.14 -3219.91)', 0, '', '', NULL, 1),
(155, 1, '', 'J-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19300,27636 21342,27570 21298,26231 19256,26301 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1730.67 -3291.58)', 0, '', '', NULL, 1),
(156, 1, '', 'J-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17259,29100 19293,29034 19249,27691 17213,27757 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3724.7 -1833.28)', 0, '', '', NULL, 1),
(157, 1, '', 'J-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19346,29032 21387,28966 21344,27623 19302,27689 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1683.19 -1898.67)', 0, '', '', NULL, 1),
(158, 1, '', 'J-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17306,30502 19339,30436 19295,29087 17260,29153 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3725.94 -432.08)', 0, '', '', NULL, 1),
(159, 1, '', 'J-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19392,30434 21433,30367 21389,29018 19348,29085 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1649.28 -500.81)', 0, '', '', NULL, 1),
(160, 1, '', 'J-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17353,31878 19385,31812 19341,30488 17308,30554 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3681.85 956.89)', 0, '', '', NULL, 1),
(161, 1, '', 'J-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19437,31810 21478,31744 21435,30420 19394,30487 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1588.54 887.97)', 0, '', '', NULL, 1),
(162, 1, '', 'J-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17400,33269 19430,33203 19386,31865 17355,31931 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3622.78 2340.65)', 0, '', '', NULL, 1),
(163, 1, '', 'J-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19483,33202 21523,33135 21479,31797 19439,31863 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1552.79 2273.24)', 0, '', '', NULL, 1),
(164, 1, '', 'J-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19432,33256 17402,33322 17447,34660 19476,34595 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3581.54 3732.02)', 0, '', '', NULL, 1),
(165, 1, '', 'J-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '21525,33188 19485,33254 19529,34593 21568,34528 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1548.93 3667.51)', 0, '', '', NULL, 1),
(166, 1, '', 'K-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22233,21969 24275,21903 24231,20568 22187,20630 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1159.05 -8955.2)', 0, '', '', NULL, 1),
(167, 1, '', 'K-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24328,21901 26371,21834 26328,20504 24284,20566 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3205.44 -9018.63)', 0, '', '', NULL, 1),
(168, 1, '', 'K-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22280,23359 24320,23293 24277,21955 22234,22022 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1158.69 -7563.85)', 0, '', '', NULL, 1),
(169, 1, '', 'K-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24373,23291 26416,23224 26373,21887 24329,21954 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3239.03 -7632.68)', 0, '', '', NULL, 1),
(170, 1, '', 'K-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22327,24764 24367,24697 24322,23345 22281,23412 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1201.9 -6166.55)', 0, '', '', NULL, 1),
(171, 1, '', 'K-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24419,24696 26462,24629 26418,23277 24375,23344 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3300.04 -6235.63)', 0, '', '', NULL, 1),
(172, 1, '', 'K-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22374,26147 24412,26078 24368,24750 22329,24816 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1261.28 -4772.4)', 0, '', '', NULL, 1),
(173, 1, '', 'K-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24465,26077 26507,26007 26464,24682 24421,24748 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3336.04 -4841.42)', 0, '', '', NULL, 1),
(174, 1, '', 'K-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22421,27533 24457,27467 24414,26131 22376,26200 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1302.33 -3388.9)', 0, '', '', NULL, 1),
(175, 1, '', 'K-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24510,27465 26552,27399 26508,26060 24466,26129 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3438.81 -3460.58)', 0, '', '', NULL, 1),
(176, 1, '', 'K-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22468,28929 24503,28862 24459,27519 22423,27586 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1444.79 -2002.28)', 0, '', '', NULL, 1),
(177, 1, '', 'K-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24556,28861 26597,28794 26554,27451 24512,27518 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3486.3 -2067.67)', 0, '', '', NULL, 1),
(178, 1, '', 'K-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22516,30330 24549,30264 24505,28915 22470,28981 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1443.55 -601.076)', 0, '', '', NULL, 1),
(179, 1, '', 'K-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24602,30262 26643,30196 26599,28847 24558,28913 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3520.21 -669.796)', 0, '', '', NULL, 1),
(180, 1, '', 'K-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22563,31707 24594,31641 24551,30317 22518,30383 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1487.64 787.894)', 0, '', '', NULL, 1),
(181, 1, '', 'K-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24647,31639 26688,31572 26645,30249 24604,30315 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3580.95 718.984)', 0, '', '', NULL, 1),
(182, 1, '', 'K-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22610,33098 24640,33032 24596,31693 22564,31759 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1546.71 2171.65)', 0, '', '', NULL, 1),
(183, 1, '', 'K-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24693,33030 26733,32964 26689,31625 24649,31692 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3616.7 2104.25)', 0, '', '', NULL, 1),
(184, 1, '', 'K-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24642,33085 22612,33151 22657,34489 24686,34424 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1587.95 3563.03)', 0, '', '', NULL, 1),
(185, 1, '', 'K-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '26735,33017 24695,33083 24739,34422 26778,34356 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3620.55 3498.51)', 0, '', '', NULL, 1),
(186, 1, '', 'L-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27458,21805 29501,21739 29457,20404 27413,20466 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6400.44 -9119.88)', 0, '', '', NULL, 1),
(187, 1, '', 'L-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29553,21737 31597,21671 31553,20340 29509,20402 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8446.83 -9183.3)', 0, '', '', NULL, 1),
(188, 1, '', 'L-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27505,23195 29546,23129 29502,21791 27460,21858 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6400.09 -7728.54)', 0, '', '', NULL, 1),
(189, 1, '', 'L-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29599,23127 31642,23061 31598,21723 29555,21790 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8480.43 -7797.36)', 0, '', '', NULL, 1),
(190, 1, '', 'L-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27553,24600 29592,24533 29548,23181 27507,23248 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6443.3 -6331.24)', 0, '', '', NULL, 1),
(191, 1, '', 'L-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29645,24532 31688,24465 31644,23113 29601,23180 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8541.43 -6400.3)', 0, '', '', NULL, 1),
(192, 1, '', 'L-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27600,25984 29638,25914 29594,24586 27555,24652 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6502.67 -4937.08)', 0, '', '', NULL, 1),
(193, 1, '', 'L-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29690,25913 31732,25843 31689,24518 29647,24584 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8577.43 -5006.09)', 0, '', '', NULL, 1),
(194, 1, '', 'L-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27647,27369 29683,27303 29639,25967 27602,26036 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6543.73 -3553.58)', 0, '', '', NULL, 1),
(195, 1, '', 'L-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29736,27301 31778,27235 31734,25896 29692,25965 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8680.2 -3625.26)', 0, '', '', NULL, 1),
(196, 1, '', 'L-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27694,28765 29729,28699 29685,27356 27649,27422 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6686.17 -2166.96)', 0, '', '', NULL, 1),
(197, 1, '', 'L-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29782,28697 31823,28630 31779,27287 29738,27354 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8727.69 -2232.35)', 0, '', '', NULL, 1),
(198, 1, '', 'L-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27742,30166 29775,30100 29731,28751 27696,28817 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6684.93 -765.757)', 0, '', '', NULL, 1),
(199, 1, '', 'L-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29828,30099 31869,30032 31825,28683 29783,28750 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8761.6 -834.477)', 0, '', '', NULL, 1),
(200, 1, '', 'L-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27788,31543 29820,31477 29777,30153 27744,30219 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6729.03 623.213)', 0, '', '', NULL, 1),
(201, 1, '', 'L-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29873,31475 31913,31409 31870,30085 29829,30151 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8822.34 554.303)', 0, '', '', NULL, 1),
(202, 1, '', 'L-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27836,32934 29866,32868 29822,31529 27790,31595 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6788.09 2006.97)', 0, '', '', NULL, 1),
(203, 1, '', 'L-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29919,32866 31959,32800 31915,31461 29875,31528 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8858.08 1939.57)', 0, '', '', NULL, 1),
(204, 1, '', 'L-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29868,32921 27837,32987 27883,34325 29911,34260 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6829.34 3398.34)', 0, '', '', NULL, 1),
(205, 1, '', 'L-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '31960,32853 29920,32919 29964,34258 32004,34192 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8861.94 3333.83)', 0, '', '', NULL, 1),
(206, 1, '', 'M-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13109,37274 16416,37162 16370,35826 12609,35938 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7591.32 6328.37)', 0, '', '', NULL, 1),
(207, 1, '', 'M-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '13622,38644 16463,38557 16417,37215 13129,37326 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -7357.76 7710.19)', 0, '', '', NULL, 1),
(208, 1, '', 'M-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '16464,38610 13641,38696 16748,46989 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -6911.25 9637)', 0, '', '', NULL, 1),
(209, 1, '', 'N-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17498,37109 19540,37043 19496,35708 17452,35770 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3588.97 6185.9)', 0, '', '', NULL, 1),
(210, 1, '', 'N-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19593,37041 21636,36975 21593,35644 19549,35706 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1542.57 6122.48)', 0, '', '', NULL, 1),
(211, 1, '', 'N-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17545,38499 19586,38433 19542,37096 17500,37162 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3589.32 7577.24)', 0, '', '', NULL, 1),
(212, 1, '', 'N-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19639,38431 21681,38365 21638,37027 19595,37094 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1508.99 7508.41)', 0, '', '', NULL, 1);
INSERT INTO `kavling_peta` (`id`, `id_lokasi`, `cluster`, `kode_kavling`, `id_projek`, `panjang_kanan`, `panjang_kiri`, `lebar_depan`, `lebar_belakang`, `luas_tanah`, `tipe_bangunan`, `daya_listrik`, `luas_bangunan`, `hrg_meter`, `hrg_jual`, `id_rumah_sikumbang`, `no_sertifikat`, `jenis_map`, `map`, `matrik`, `status`, `keterangan`, `atas_nama_surat`, `stt_cicilan`, `status_ready`) VALUES
(213, 1, '', 'N-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17593,39904 19632,39838 19588,38486 17547,38552 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3546.11 8974.54)', 0, '', '', NULL, 1),
(214, 1, '', 'N-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19685,39836 21727,39769 21683,38417 19640,38484 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1447.97 8905.48)', 0, '', '', NULL, 1),
(215, 1, '', 'N-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17640,41288 19677,41219 19634,39890 17594,39957 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3486.73 10368.7)', 0, '', '', NULL, 1),
(216, 1, '', 'N-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19730,41217 21772,41148 21729,39822 19686,39889 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1411.98 10299.7)', 0, '', '', NULL, 1),
(217, 1, '', 'N-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17687,42673 19723,42607 19679,41271 17641,41340 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3445.68 11752.2)', 0, '', '', NULL, 1),
(218, 1, '', 'N-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19776,42605 21817,42539 21774,41200 19732,41270 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1309.21 11680.5)', 0, '', '', NULL, 1),
(219, 1, '', 'N-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17734,44069 19769,44003 19725,42660 17688,42726 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3303.24 13138.8)', 0, '', '', NULL, 1),
(220, 1, '', 'N-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19821,44001 21863,43935 21819,42592 19777,42658 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1261.73 13073.4)', 0, '', '', NULL, 1),
(221, 1, '', 'N-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17781,45470 19815,45404 19770,44055 17736,44122 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3304.48 14540)', 0, '', '', NULL, 1),
(222, 1, '', 'N-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19867,45403 21908,45336 21864,43987 19823,44054 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1227.81 14471.3)', 0, '', '', NULL, 1),
(223, 1, '', 'N-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17828,46847 19860,46781 19816,45457 17783,45523 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3260.38 15929)', 0, '', '', NULL, 1),
(224, 1, '', 'N-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19913,46779 21953,46713 21910,45389 19869,45455 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1167.07 15860.1)', 0, '', '', NULL, 1),
(225, 1, '', 'N-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '17875,48238 19905,48172 19862,46834 17830,46900 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3201.32 17312.8)', 0, '', '', NULL, 1),
(226, 1, '', 'N-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19958,48170 21998,48104 21955,46765 19914,46832 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1131.33 17245.4)', 0, '', '', NULL, 1),
(227, 1, '', 'N-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '19907,48225 17877,48291 17922,49629 19951,49564 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -3160.07 18704.1)', 0, '', '', NULL, 1),
(228, 1, '', 'N-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22000,48157 19960,48223 20004,49562 22044,49496 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 -1127.47 18639.6)', 0, '', '', NULL, 1),
(229, 1, '', 'O-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22724,36937 24766,36870 24722,35535 22678,35597 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1650.09 6012.91)', 0, '', '', NULL, 1),
(230, 1, '', 'O-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24819,36868 26862,36802 26819,35471 24775,35533 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3696.48 5949.49)', 0, '', '', NULL, 1),
(231, 1, '', 'O-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22771,38326 24811,38260 24768,36923 22725,36989 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1649.74 7404.26)', 0, '', '', NULL, 1),
(232, 1, '', 'O-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24864,38258 26907,38192 26864,36855 24820,36921 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3730.08 7335.43)', 0, '', '', NULL, 1),
(233, 1, '', 'O-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22818,39731 24858,39665 24813,38313 22772,38379 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1692.95 8801.55)', 0, '', '', NULL, 1),
(234, 1, '', 'O-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24910,39663 26953,39597 26909,38245 24866,38311 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3791.08 8732.49)', 0, '', '', NULL, 1),
(235, 1, '', 'O-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22865,41115 24903,41046 24859,39718 22820,39784 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1752.32 10195.7)', 0, '', '', NULL, 1),
(236, 1, '', 'O-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '24956,41044 26998,40975 26955,39649 24912,39716 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3827.07 10126.7)', 0, '', '', NULL, 1),
(237, 1, '', 'O-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22912,42500 24948,42434 24905,41099 22867,41168 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1793.38 11579.2)', 0, '', '', NULL, 1),
(238, 1, '', 'O-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25001,42433 27043,42366 26999,41028 24957,41097 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3929.85 11507.5)', 0, '', '', NULL, 1),
(239, 1, '', 'O-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '22960,43896 24994,43830 24950,42487 22914,42553 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1935.83 12965.8)', 0, '', '', NULL, 1),
(240, 1, '', 'O-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25047,43828 27088,43762 27045,42419 25003,42485 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 3977.35 12900.5)', 0, '', '', NULL, 1),
(241, 1, '', 'O-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23007,45298 25040,45232 24996,43883 22961,43949 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1934.59 14367)', 0, '', '', NULL, 1),
(242, 1, '', 'O-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25093,45230 27134,45164 27090,43815 25049,43881 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 4011.26 14298.3)', 0, '', '', NULL, 1),
(243, 1, '', 'O-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23054,46674 25085,46608 25042,45284 23009,45350 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 1978.68 15756)', 0, '', '', NULL, 1),
(244, 1, '', 'O-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25138,46606 27179,46540 27136,45216 25095,45283 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 4071.99 15687.1)', 0, '', '', NULL, 1),
(245, 1, '', 'O-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '23101,48065 25131,47999 25087,46661 23056,46727 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2037.75 17139.8)', 0, '', '', NULL, 1),
(246, 1, '', 'O-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25184,47998 27224,47931 27180,46593 25140,46659 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 4107.74 17072.4)', 0, '', '', NULL, 1),
(247, 1, '', 'O-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '25133,48052 23103,48118 23148,49456 25177,49391 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 2078.99 18531.1)', 0, '', '', NULL, 1),
(248, 1, '', 'O-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27226,47984 25186,48050 25230,49389 27269,49324 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 4111.6 18466.6)', 0, '', '', NULL, 1),
(249, 1, '', 'P-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '27959,36762 30001,36696 29957,35361 27913,35423 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6892.9 5837.8)', 0, '', '', NULL, 1),
(250, 1, '', 'P-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30054,36694 32097,36628 32054,35297 30010,35359 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8939.3 5774.38)', 0, '', '', NULL, 1),
(251, 1, '', 'P-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28006,38152 30047,38086 30003,36749 27960,36815 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6892.55 7229.14)', 0, '', '', NULL, 1),
(252, 1, '', 'P-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30099,38084 32142,38018 32099,36681 30055,36747 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8972.88 7160.32)', 0, '', '', NULL, 1),
(253, 1, '', 'P-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28053,39557 30093,39491 30048,38139 28008,38205 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6935.76 8626.45)', 0, '', '', NULL, 1),
(254, 1, '', 'P-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30145,39489 32188,39423 32144,38070 30101,38137 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9033.9 8557.38)', 0, '', '', NULL, 1),
(255, 1, '', 'P-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28100,40941 30138,40872 30094,39543 28055,39610 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 6995.14 10020.6)', 0, '', '', NULL, 1),
(256, 1, '', 'P-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30191,40870 32233,40801 32190,39475 30147,39542 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9069.89 9951.59)', 0, '', '', NULL, 1),
(257, 1, '', 'P-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28147,42326 30184,42260 30140,40924 28102,40994 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7036.19 11404.1)', 0, '', '', NULL, 1),
(258, 1, '', 'P-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30236,42258 32278,42192 32234,40853 30192,40923 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9172.66 11332.4)', 0, '', '', NULL, 1),
(259, 1, '', 'P-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28195,43722 30229,43656 30185,42313 28149,42379 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7178.64 12790.7)', 0, '', '', NULL, 1),
(260, 1, '', 'P-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30282,43654 32323,43588 32280,42245 30238,42311 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9220.15 12725.3)', 0, '', '', NULL, 1),
(261, 1, '', 'P-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28242,45124 30275,45057 30231,43708 28196,43775 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7177.4 14191.9)', 0, '', '', NULL, 1),
(262, 1, '', 'P-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30328,45056 32369,44989 32325,43640 30284,43707 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9254.07 14123.2)', 0, '', '', NULL, 1),
(263, 1, '', 'P-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28289,46500 30321,46434 30277,45110 28244,45176 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7221.5 15580.9)', 0, '', '', NULL, 1),
(264, 1, '', 'P-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30373,46432 32414,46366 32371,45042 30330,45108 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9314.81 15512)', 0, '', '', NULL, 1),
(265, 1, '', 'P-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '28336,47891 30366,47825 30322,46487 28291,46553 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7280.56 16964.6)', 0, '', '', NULL, 1),
(266, 1, '', 'P-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30419,47824 32459,47757 32415,46419 30375,46485 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9350.55 16897.2)', 0, '', '', NULL, 1),
(267, 1, '', 'P-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '30368,47878 28338,47944 28383,49282 30412,49217 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 7321.8 18356)', 0, '', '', NULL, 1),
(268, 1, '', 'P-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32461,47810 30421,47876 30465,49215 32504,49150 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 9354.41 18291.5)', 0, '', '', NULL, 1),
(269, 1, '', 'Q-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32590,51601 32548,50256 29103,50376 29151,51707 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8771.94 20759)', 0, '', '', NULL, 1),
(270, 1, '', 'Q-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32632,52984 32591,51654 29152,51760 29200,53111 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8767.87 22162)', 0, '', '', NULL, 1),
(271, 1, '', 'Q-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32676,54394 32634,53037 29202,53163 29250,54500 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8817.72 23548.2)', 0, '', '', NULL, 1),
(272, 1, '', 'Q-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32719,55788 32677,54447 29251,54553 29299,55893 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8848.88 24949.2)', 0, '', '', NULL, 1),
(273, 1, '', 'Q-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '32762,57181 32720,55840 29301,55946 29348,57287 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8906.66 26343.3)', 0, '', '', NULL, 1),
(274, 1, '', 'Q-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '29406,58904 32781,57799 32764,57234 29350,57339 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 8944.69 27525.2)', 0, '', '', NULL, 1),
(275, 1, '', 'R-01', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34177,5192 34134,3862 32096,3928 32140,5259 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11062.5 -25663)', 0, '', '', NULL, 1),
(276, 1, '', 'R-02', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34222,6580 34179,5245 32142,5311 32186,6646 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11057.9 -24275)', 0, '', '', NULL, 1),
(277, 1, '', 'R-04', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34313,9369 34269,8029 32234,8095 32278,9435 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11137.5 -21489.6)', 0, '', '', NULL, 1),
(278, 1, '', 'R-05', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34359,10769 34315,9421 32280,9487 32324,10835 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11194.8 -20092.9)', 0, '', '', NULL, 1),
(279, 1, '', 'R-06', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34404,12166 34360,10821 32326,10887 32371,12232 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11244.4 -18695)', 0, '', '', NULL, 1),
(280, 1, '', 'R-07', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34449,13563 34406,12219 32372,12285 32417,13629 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11299.3 -17297)', 0, '', '', NULL, 1),
(281, 1, '', 'R-08', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34494,14950 34451,13616 32418,13682 32463,15016 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11326.3 -15904.5)', 0, '', '', NULL, 1),
(282, 1, '', 'R-09', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34540,16337 34496,15003 32464,15069 32508,16403 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11385.2 -14517.5)', 0, '', '', NULL, 1),
(283, 1, '', 'R-10', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34585,17728 34541,16390 32510,16456 32554,17794 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11474.8 -13131)', 0, '', '', NULL, 1),
(284, 1, '', 'R-11', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34630,19117 34586,17780 32556,17846 32601,19183 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11572.3 -11744.5)', 0, '', '', NULL, 1),
(285, 1, '', 'R-13', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34820,21908 34722,20573 32649,20618 32693,21962 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11665.7 -8956.12)', 0, '', '', NULL, 1),
(286, 1, '', 'R-14', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '34922,23296 34824,21961 32695,22015 32740,23360 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11726.3 -7563.83)', 0, '', '', NULL, 1),
(287, 1, '', 'R-15', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35024,24683 34926,23349 32742,23413 32787,24764 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11812.2 -6167.12)', 0, '', '', NULL, 1),
(288, 1, '', 'R-16', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35127,26080 35028,24736 32789,24817 32833,26147 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11890.8 -4783.36)', 0, '', '', NULL, 1),
(289, 1, '', 'R-17', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35229,27462 35131,26132 32835,26199 32880,27543 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 11973.9 -3386)', 0, '', '', NULL, 1),
(290, 1, '', 'R-18', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35331,28855 35232,27514 32882,27596 32926,28927 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12029.9 -2002.77)', 0, '', '', NULL, 1),
(291, 1, '', 'R-19', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35434,30250 35335,28907 32928,28979 32974,30323 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12117.7 -608.439)', 0, '', '', NULL, 1),
(292, 1, '', 'R-20', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35536,31641 35438,30303 32976,30375 33022,31710 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12137.9 785.771)', 0, '', '', NULL, 1),
(293, 1, '', 'R-21', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35638,33030 35540,31694 33024,31762 33070,33102 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12264.8 2174.21)', 0, '', '', NULL, 1),
(294, 1, '', 'R-22', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35740,34416 35642,33082 33071,33155 33118,34493 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12289.8 3566.38)', 0, '', '', NULL, 1),
(295, 1, '', 'R-23', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35843,35813 35744,34469 33119,34545 33166,35908 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12367.2 4967.34)', 0, '', '', NULL, 1),
(296, 1, '', 'R-24', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35945,37201 35847,35866 33168,35961 33213,37291 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12435.3 6356.4)', 0, '', '', NULL, 1),
(297, 1, '', 'R-25', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36046,38575 35949,37253 33215,37344 33260,38671 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12514.4 7740.77)', 0, '', '', NULL, 1),
(298, 1, '', 'R-26', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36076,39970 36105,39364 36050,38627 33262,38724 33308,40066 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12577.5 9124.06)', 0, '', '', NULL, 1),
(299, 1, '', 'R-27', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36011,41376 36074,40023 33310,40119 33356,41462 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12588.5 10521.2)', 0, '', '', NULL, 1),
(300, 1, '', 'R-28', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35946,42777 36009,41429 33357,41515 33403,42849 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12561.2 11918.2)', 0, '', '', NULL, 1),
(301, 1, '', 'R-29', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35882,44164 35944,42830 33405,42902 33449,44265 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12565.8 13325.9)', 0, '', '', NULL, 1),
(302, 1, '', 'R-30', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '35817,45570 35880,44217 33451,44317 33495,45652 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12544.6 14714.2)', 0, '', '', NULL, 1),
(303, 1, '', 'R-31', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36044,46954 35815,45625 35815,45623 33497,45705 33541,47044 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12701.2 16109.5)', 0, '', '', NULL, 1),
(304, 1, '', 'R-32', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36282,48341 36053,47006 33542,47096 33586,48426 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12793.2 17495.3)', 0, '', '', NULL, 1),
(305, 1, '', 'R-33', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36522,49737 36291,48393 33588,48479 33632,49823 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 12937.8 18887.2)', 0, '', '', NULL, 1),
(306, 1, '', 'R-34', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36758,51112 36531,49789 33634,49876 33677,51211 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 13065 20278)', 0, '', '', NULL, 1),
(307, 1, '', 'R-35', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '36996,52496 36767,51164 33679,51263 33723,52603 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 13218.2 21662.3)', 0, '', '', NULL, 1),
(308, 1, '', 'R-36', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '37233,53881 37005,52549 33725,52655 33769,53999 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 13363.7 23051.8)', 0, '', '', NULL, 1),
(309, 1, '', 'R-37', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '37472,55269 37242,53933 33771,54052 33815,55395 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 13515 24442.9)', 0, '', '', NULL, 1),
(310, 1, '', 'R-38', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'polygon', '33882,57439 37634,56211 37481,55322 33816,55448 ', 'matrix(0.99863 -0.052336 0.052336 0.99863 13290 25857.4)', 0, '', '', NULL, 1),
(311, 1, '', 'R-03', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'path', 'M34268 7977l-44 -1336c0,-3 1,-6 2,-8l-2038 66 44 1344 2036 -66z', 'matrix(0.99863 -0.052336 0.052336 0.99863 11106.8 -22883.1)', 0, '', '', NULL, 1),
(312, 1, '', 'R-12', NULL, 0.0, 0.0, 0.0, 0.0, 0, NULL, NULL, '0', 0, 85000000, NULL, '', 'path', 'M34718 20520l-76 -1030c-1,-7 2,-13 6,-18 -4,-5 -7,-11 -7,-18l-9 -284 -2030 66 45 1330 2071 -46z', 'matrix(0.99863 -0.052336 0.052336 0.99863 11589.5 -10355.9)', 0, '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id` int(11) NOT NULL,
  `nama_perusahaan` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `hape` varchar(15) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `npwp_perusahaan` varchar(75) NOT NULL,
  `nama_bank` varchar(35) NOT NULL,
  `no_rekening` varchar(25) NOT NULL,
  `nama_pemilik_rek` varchar(40) NOT NULL,
  `front_page` int(11) NOT NULL,
  `folder_svg` varchar(255) NOT NULL,
  `wprogres_0` varchar(15) NOT NULL,
  `wprogres_1` varchar(15) NOT NULL,
  `wprogres_2` varchar(15) NOT NULL,
  `wprogres_3` varchar(15) NOT NULL,
  `wprogres_4` varchar(15) NOT NULL,
  `wprogres_oke` varchar(15) NOT NULL,
  `pesan_jatuh_tempo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id`, `nama_perusahaan`, `alamat`, `email`, `telp`, `hape`, `fax`, `npwp_perusahaan`, `nama_bank`, `no_rekening`, `nama_pemilik_rek`, `front_page`, `folder_svg`, `wprogres_0`, `wprogres_1`, `wprogres_2`, `wprogres_3`, `wprogres_4`, `wprogres_oke`, `pesan_jatuh_tempo`) VALUES
(1, 'BK', 'JL. Imam Bonjol – Martapura II No. 08 Benua Melayu Laut, Kec. Pontianak Selatan Kota Pontianak, Kalimantan Barat 78243', 'tanahkavlingindonesia@gmail.com', '089510383438', '089510383438', '0542 - 8800930', '77.491.888.4-502.000', 'BRI', '064601000899302', 'Gesya Group', 0, '/home/u180361449/domains/gesyagroup.id/public_html', 'ffffff', 'fcfa7c', 'f2a30f', '74f278', '6979f0', 'fc4798', 'salam\r\n\r\nbapak ibu [[nama_customer]], \r\nsaat ini sistem kami mencatat banhwa anda memiliki tagihan [[jumlah_bulan]] bulan, \r\ndengan total Rp. [[jumlah_tagihan]].\r\n\r\ndemi kelancaran bersama mohon agar segera menyelesaikan pembayaran. terima kasih');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_media`
--

CREATE TABLE `konfigurasi_media` (
  `id` int(11) NOT NULL,
  `jenis_data` varchar(150) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `nama_file` varchar(150) NOT NULL,
  `urutan` int(11) NOT NULL,
  `jenis_download` int(11) NOT NULL,
  `stt_aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konfigurasi_media`
--

INSERT INTO `konfigurasi_media` (`id`, `jenis_data`, `keterangan`, `nama_file`, `urutan`, `jenis_download`, `stt_aktif`) VALUES
(1, 'logo website', 'Logo yang ditampilkan pada halaman login', 'logo-website_1777243941.webp', 1, 0, 1),
(2, 'fav icon', 'Logo yang ditampilkna pada judul tab aplikasi', 'fav-icon_1772328627.webp', 2, 0, 1),
(14, 'kop surat', 'Background Cetak Rekap pada menu pembayaran	', 'kop-surat_1771205831.webp', 3, 0, 1),
(15, 'kwitansi', 'Logo Kwitansi Pembayaran', 'kwitansi_1772328636.webp', 4, 0, 1),
(16, 'Background Login', 'Background Login', 'background-login_1777244543.webp', 5, 0, 1),
(17, 'Background aplikasi', 'Background aplikasi', 'background-aplikasi_1777244550.webp', 6, 0, 1),
(18, 'Background Sidebar', 'Background Sidebar', 'background-sidebar_1777246001.webp', 7, 0, 1),
(19, 'Background Card1', 'Background untuk card pada dashboard ', 'background-card1_1777257062.webp', 8, 0, 1),
(20, 'Background Card2', 'Background untuk card pada dashboard ', 'background-card2_1777257072.webp', 9, 0, 1),
(21, 'Background card3', 'Background untuk card pada dashboard ', 'background-card3_1777257082.webp', 10, 0, 1),
(22, 'Background card4', 'Background untuk card pada dashboard ', 'background-card4_1777257099.webp', 11, 0, 1),
(23, 'Background Header Card', 'Background untuk setiap header card yang ada', 'background-header-card_1777258875.webp', 12, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_wa`
--

CREATE TABLE `konfigurasi_wa` (
  `id` int(11) NOT NULL,
  `api_key` varchar(75) NOT NULL,
  `number_key` varchar(75) NOT NULL,
  `stt_keteangan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konfigurasi_wa`
--

INSERT INTO `konfigurasi_wa` (`id`, `api_key`, `number_key`, `stt_keteangan`) VALUES
(1, 'CQBZLJP8VFITUMIC', 'xQyZmjmIwXGUd7YZ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `listrik_air`
--

CREATE TABLE `listrik_air` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_kavling` int(11) NOT NULL,
  `norek_listrik` varchar(35) NOT NULL,
  `foto_listrik` varchar(150) DEFAULT NULL,
  `foto_listrik_2` varchar(255) DEFAULT NULL,
  `norek_air` varchar(35) NOT NULL,
  `foto_air` varchar(150) DEFAULT NULL,
  `foto_air_2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kavling`
--

CREATE TABLE `lokasi_kavling` (
  `id` int(11) NOT NULL,
  `nama_kavling` varchar(200) NOT NULL,
  `foto_kavling` varchar(255) NOT NULL,
  `nama_singkat` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `urutan` int(11) NOT NULL,
  `header` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_perusahaan` varchar(200) NOT NULL,
  `telp_perusahaan` varchar(35) NOT NULL,
  `bg_kwitansi` varchar(50) NOT NULL,
  `kop_surat` varchar(50) NOT NULL,
  `kota_penandatangan` varchar(35) NOT NULL,
  `nama_penandatangan` varchar(50) NOT NULL,
  `jabatan_penandatangan` varchar(50) NOT NULL,
  `nama_mengetahui` varchar(50) NOT NULL,
  `stt_tampil` int(11) NOT NULL DEFAULT 0,
  `nama_admin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lokasi_kavling`
--

INSERT INTO `lokasi_kavling` (`id`, `nama_kavling`, `foto_kavling`, `nama_singkat`, `alamat`, `urutan`, `header`, `nama_perusahaan`, `alamat_perusahaan`, `telp_perusahaan`, `bg_kwitansi`, `kop_surat`, `kota_penandatangan`, `nama_penandatangan`, `jabatan_penandatangan`, `nama_mengetahui`, `stt_tampil`, `nama_admin`) VALUES
(1, 'Manggar Raya', 'fSuNMoRpM2jiAVaMqHaDHdpez2gJBCGiHAjllN3D.jpeg', 'MGR', 'Jl. Merdeka Manggar Balikpapan Timur', 1, 'Manggar Raya', 'PT. TANAH KAVLING BALIKPAPAN', 'Jl. Merdeka Manggar Balikpapan Timur', '081250274777', 'vhh1MKRsrHsJLDtfZ9dF8dJ00Na4pBv3CVwm6Alx.jpeg', 'us3UP0Gq6IXjJTETFKRTMvSTkgMbl8ChvagzZfI6.jpeg', 'pontianak', 'ANGGA SAPUTRA', 'Direktur', 'Angga saputra', 1, 'Vivi Ratnasari'),
(2, 'Kariangau Permai', 'fSuNMoRpM2jiAVaMqHaDHdpez2gJBCGiHAjllN3D.jpeg', 'KRG', 'Jl. Soekarno Hatta 123', 1, 'Kariangau Permai', 'PT. TANAH KAVLING BALIKPAPAN', 'Jl. Soekarno Hatta 123', '081250274777', 'vhh1MKRsrHsJLDtfZ9dF8dJ00Na4pBv3CVwm6Alx.jpeg', 'us3UP0Gq6IXjJTETFKRTMvSTkgMbl8ChvagzZfI6.jpeg', 'pontianak', 'ANGGA SAPUTRA', 'Direktur', 'Angga saputra', 3, 'Vivi Ratnasari');

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

CREATE TABLE `marketing` (
  `id` int(11) NOT NULL,
  `kode_marketing` varchar(15) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_marketing` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `alamat` varchar(150) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `sosmed` varchar(150) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `upload_id` varchar(255) DEFAULT NULL,
  `foto` varchar(200) NOT NULL DEFAULT '',
  `banned` timestamp NULL DEFAULT NULL,
  `id_level` int(11) NOT NULL,
  `stt_marketing` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketing`
--

INSERT INTO `marketing` (`id`, `kode_marketing`, `nik`, `password`, `nama_marketing`, `jenis_kelamin`, `alamat`, `tgl_lahir`, `email`, `no_telp`, `pekerjaan`, `sosmed`, `deskripsi`, `status`, `upload_id`, `foto`, `banned`, `id_level`, `stt_marketing`, `create_at`, `update_at`) VALUES
(1, 'M-0001', NULL, NULL, 'SISKA', 'Perempuan', 'JL.A.R HAKIM GG. A.R HAKIM DALAM NO 1', NULL, NULL, '085828613292', 'MARKETING Cab. Kubu Raya', NULL, NULL, '1', NULL, '1772359671_69a40ff729f56.webp', NULL, 0, 0, '2026-03-01 10:01:23', NULL),
(2, 'M-0002', NULL, NULL, 'MARDIANTO,SP.d', 'Laki-laki', 'JL. TANJUNG RAYA 2', NULL, NULL, '085820473095', 'MARKETING', NULL, NULL, '1', NULL, '1772359687_69a41007b1846.webp', NULL, 0, 0, '2026-03-01 10:03:31', NULL),
(3, 'M-0003', NULL, NULL, 'BASTU ROHMAN', 'Laki-laki', 'SUNGAI JAWI PONTIANAK', NULL, NULL, '08881010491280', 'MARKETING', NULL, NULL, '1', NULL, '1772359709_69a4101d43d4a.webp', NULL, 0, 0, '2026-03-01 10:05:46', NULL),
(4, 'M-0004', NULL, NULL, 'DETA MARCHA AYUNDA WANING', 'Perempuan', 'Jl. Danau Sentarum Komp. Sentarum Permai', NULL, NULL, '085347455239', '', NULL, NULL, '1', NULL, '', NULL, 0, 0, '2026-03-12 02:14:35', NULL),
(5, 'M-0005', NULL, NULL, 'Lindra Sagita', 'Perempuan', 'Jl. Tabrani Achmad Komp. Mandau Permai L.2', NULL, NULL, '081258379742', 'KARYAWAN SWASTA', NULL, NULL, '1', NULL, '', NULL, 0, 0, '2026-03-31 08:46:25', NULL),
(6, 'M-0006', NULL, NULL, 'Marton Hadiwardoyo', 'Laki-laki', 'JL. Husein Hamzah', NULL, NULL, '087819028007', 'KARYAWAN SWASTA', NULL, NULL, '1', NULL, '', NULL, 0, 0, '2026-04-14 05:59:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_svg`
--

CREATE TABLE `master_svg` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `header_xml` varchar(255) NOT NULL,
  `header_svg` longtext NOT NULL,
  `polygon_svg` text NOT NULL,
  `path_svg` text NOT NULL,
  `body_svg` text NOT NULL,
  `footer_svg` text NOT NULL,
  `lebar` int(11) NOT NULL,
  `tinggi` int(11) NOT NULL,
  `ukuran_dashboard` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_svg`
--

INSERT INTO `master_svg` (`id`, `id_lokasi`, `header_xml`, `header_svg`, `polygon_svg`, `path_svg`, `body_svg`, `footer_svg`, `lebar`, `tinggi`, `ukuran_dashboard`) VALUES
(1, 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>', '<svg id=\"svg-image-1\" xmlns=\"http://www.w3.org/2000/svg\" xml:space=\"preserve\" width=\"400mm\" height=\"630mm\" version=\"1.1\" style=\"shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd\"\nviewBox=\"0 0 40000 63000\"\n xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n <defs>\n  <font id=\"FontID0\" horiz-adv-x=\"647\" font-variant=\"normal\" style=\"fill-rule:nonzero\" font-style=\"normal\" font-weight=\"400\">\n	<font-face \n		font-family=\"Bahnschrift\">\n		<font-face-src>\n			<font-face-name name=\"Bahnschrift\"/>\n		</font-face-src>\n	</font-face>\n   <missing-glyph><path d=\"M0 0z\"/></missing-glyph>\n   <glyph unicode=\"D\" horiz-adv-x=\"656\" d=\"M155.339 0l0 94.6774 160.659 0c52.332,0 92.9984,13.6499 121.672,40.819 28.8262,27.1691 43.3266,65.5023 43.3266,115l0 209.001c0,49.4974 -14.5003,87.8306 -43.3266,115 -28.6736,27.1691 -69.34,40.6664 -121.672,40.6664l-160.659 0 0 94.83 157.65 0c86.0208,0 152.352,-22.1539 199.516,-66.6579 46.9898,-44.504 70.4956,-106.997 70.4956,-187.828l0 -201.173c0,-53.6622 -10.51,-99.4963 -31.6609,-137.328 -21.1727,-38.0061 -52.005,-67.0068 -92.3443,-87.002 -40.3393,-19.9952 -89.1607,-30.0037 -146.486,-30.0037l-157.171 0zm-67.5083 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0z\"/>\n   <glyph unicode=\"3\" horiz-adv-x=\"528\" d=\"M256.841 -7.32649c-40.0122,0 -75.1837,7.32649 -105.166,21.6524 -30.1781,14.5003 -54.3381,35.4986 -72.5017,62.8421 -18.338,27.3217 -30.0037,60.5089 -35.1715,99.6707l0 0 101.502 0 0 0c4.49183,-30.6797 16.659,-53.008 36.1527,-67.1813 19.5155,-14.1515 44.504,-21.3253 75.1837,-21.3253 32.8166,0 58.5029,8.83103 76.6664,26.3405 18.1636,17.6621 27.3217,42.3235 27.3217,74.3333l0 21.4997c0,35.4986 -8.65659,62.8203 -25.8389,82.1613 -17.3132,19.4937 -41.6476,29.1751 -73.3303,29.1751l-50.1515 0 0 94.6556 50.1515 0c27.9976,0 49.6718,8.32952 64.8481,24.8359 15.0019,16.659 22.6554,40.1648 22.6554,70.343l0 21.9795c0,28.0195 -8.15508,49.6718 -24.16,65.0008 -16.1793,15.3507 -39.0092,22.8517 -68.664,22.8517 -25.0104,0 -46.3357,-6.99941 -63.6707,-21.1727 -17.5094,-14.1733 -29.5022,-36.5016 -36.0001,-67.1595l0 0 -101.001 0 0 0c10.1611,58.6555 32.6639,103.988 67.661,135.998 34.9971,32.1624 79.3267,48.1673 133.011,48.1673 61.1631,0 108.502,-16.1793 142.169,-48.3417 33.4925,-32.3368 50.1515,-77.6695 50.1515,-136.325l0 -11.6657c0,-35.4986 -9.48518,-66.3527 -28.6518,-92.5187 -19.3411,-26.166 -46.5101,-45.4853 -81.6816,-57.8269 38.8347,-8.15508 68.8384,-27.1691 90.1638,-56.9983 21.3471,-29.6548 32.0098,-67.5083 32.0098,-113.495l0 -11.6657c0,-62.1661 -17.8365,-110.333 -53.3351,-144.502 -35.4986,-34.1685 -85.4975,-51.329 -150.324,-51.329z\"/>\n   <glyph unicode=\"0\" horiz-adv-x=\"551\" d=\"M275.833 -7.32649c-67.661,0 -118.336,18.1636 -152.003,54.4907 -33.667,36.1745 -50.5004,85.3448 -50.5004,147.162l0 322.845c0,62.8203 17.0079,111.991 51.1764,147.838 34.1685,35.8256 84.6689,53.8148 151.327,53.8148 67.1595,0 117.66,-17.8147 151.676,-53.4877 33.994,-35.673 50.9801,-85.1704 50.9801,-148.165l0 -322.845c0,-62.8203 -16.9861,-112.165 -50.9801,-147.991 -34.0158,-35.8256 -84.5163,-53.6622 -151.676,-53.6622zm0 94.6556c36.5016,0 62.8421,9.68143 78.8251,28.6736 16.1793,18.9922 24.1818,45.1582 24.1818,78.3236l0 322.845c0,33.4925 -8.00244,59.6585 -24.1818,78.4981 -15.9831,18.9922 -42.3235,28.3247 -78.8251,28.3247 -36.3272,0 -62.6676,-9.33255 -78.8251,-28.3247 -16.1793,-18.8395 -24.1818,-45.0056 -24.1818,-78.4981l0 -322.845c0,-33.1654 8.00244,-59.3315 24.1818,-78.3236 16.1575,-18.9922 42.498,-28.6736 78.8251,-28.6736z\"/>\n   <glyph unicode=\"R\" horiz-adv-x=\"651\" d=\"M131.332 300.342l0 94.6556 242.167 0c29.0007,0 52.332,10.1611 69.8415,30.3308 17.6621,20.1696 26.3187,46.8372 26.3187,80.0026l0 0c0,33.1654 -8.65659,60.0074 -26.3187,80.1771 -17.5094,20.1478 -40.8408,30.1563 -69.8415,30.1563l-242.167 0 0 94.83 238.329 0c41.3423,0 77.5168,-8.65659 108.349,-25.6645 30.9849,-17.1606 54.9923,-40.9934 72.0002,-71.4987 17.1606,-30.6579 25.6645,-66.6579 25.6645,-108l0 0c0,-40.9934 -8.6784,-76.8409 -25.8389,-107.673 -17.335,-30.6579 -41.3423,-54.6652 -72.0002,-71.6513 -30.8323,-17.1824 -66.8324,-25.6645 -108.175,-25.6645l-238.329 0zm-43.501 -300.342l0 710.495 99.6707 0 0 -710.495 -99.6707 0zm399.512 0l-162.665 322.344 99.1474 22.3283 181.679 -344.672 -118.161 0z\"/>\n   <glyph unicode=\"O\" horiz-adv-x=\"645\" d=\"M322.823 -7.32649c-50.1515,0 -93.9796,10.8371 -131.484,32.4895 -37.3302,21.6742 -66.3309,52.1794 -87.002,91.4939 -20.6712,39.5107 -31.0067,85.3448 -31.0067,137.677l0 201.173c0,52.8336 10.3356,98.8203 31.0067,138.004 20.6712,39.1618 49.6718,69.6452 87.002,91.3194 37.5046,21.6742 81.3327,32.5113 131.484,32.5113 50.0207,0 93.8488,-10.8371 131.353,-32.5113 37.3302,-21.6742 66.4835,-52.1576 87.1547,-91.3194 20.6712,-39.1836 31.0067,-85.1704 31.0067,-138.004l0 -201.173c0,-52.332 -10.3356,-98.1662 -31.0067,-137.677 -20.6712,-39.3145 -49.8245,-69.8197 -87.1547,-91.4939 -37.5046,-21.6524 -81.3327,-32.4895 -131.353,-32.4895zm0 98.1662c44.504,0 80.3515,14.653 107.172,44.0025 26.842,29.1533 40.1648,67.9881 40.1648,116.155l0 207.998c0,48.4944 -13.3229,87.3291 -40.1648,116.504 -26.8202,29.0007 -62.6676,43.6755 -107.172,43.6755 -44.3296,0 -79.9808,-14.6748 -106.997,-43.6755 -26.9946,-29.1751 -40.4919,-68.0099 -40.4919,-116.504l0 -207.998c0,-48.1673 13.4973,-87.002 40.4919,-116.155 27.0164,-29.3496 62.6676,-44.0025 106.997,-44.0025z\"/>\n   <glyph unicode=\"-\" horiz-adv-x=\"479\" d=\"M78.171 301.825l328.166 0 0 -94.83 -328.166 0 0 94.83z\"/>\n   <glyph unicode=\"L\" horiz-adv-x=\"573\" d=\"M87.8306 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm49.8463 0l0 94.6774 406.315 0 0 -94.6774 -406.315 0z\"/>\n   <glyph unicode=\"I\" horiz-adv-x=\"275\" d=\"M187.501 709.993l0 -709.993 -99.6707 0 0 709.993 99.6707 0z\"/>\n   <glyph unicode=\"8\" horiz-adv-x=\"562\" d=\"M281.328 -7.32649c-43.3266,0 -81.1583,8.15508 -113.321,24.487 -32.3368,16.1793 -57.3472,39.1836 -75.1837,68.8384 -17.9891,29.5022 -26.8202,64.1722 -26.8202,104.01l0 11.6657c0,35.4986 8.83103,68.8166 26.4931,100.15 17.8365,31.1812 41.495,54.8396 70.9971,70.6701 -24.6615,13.6717 -44.6567,33.5143 -59.9856,59.3315 -15.3507,26.0134 -23.0043,53.1824 -23.0043,81.8342l0 17.1824c0,56.1479 18.338,101.328 54.9923,135.496 36.676,33.994 85.1704,51.0019 145.832,51.0019 60.5089,0 109.003,-17.0079 145.679,-51.0019 36.6542,-34.1685 54.9923,-79.3485 54.9923,-135.496l0 -17.1824c0,-29.3278 -7.828,-56.8239 -23.3314,-82.4884 -15.3289,-25.6645 -35.8256,-45.3326 -61.1631,-58.6773 30.0037,-15.8304 53.9892,-39.4889 72.0002,-70.6701 17.9891,-31.3338 26.9946,-64.6519 26.9946,-100.15l0 -11.6657c0,-39.8378 -8.83103,-74.5078 -26.842,-104.01 -17.8147,-29.6548 -42.8251,-52.6591 -75.1619,-68.8384 -32.1624,-16.332 -69.9941,-24.487 -113.168,-24.487zm0 95.6586c34.8444,0 62.8421,10.0085 84.1674,30.0037 21.3471,20.1696 32.0098,46.3357 32.0098,78.9996l0 6.82497c0,32.8384 -10.6627,59.3315 -32.0098,79.3485 -21.3253,19.9952 -49.323,29.9819 -84.1674,29.9819 -34.8226,0 -62.9947,-9.9867 -84.32,-29.9819 -21.3471,-20.017 -32.0098,-46.6845 -32.0098,-79.85l0 -7.32649c0,-32.6639 10.6627,-58.6555 32.0098,-78.3236 21.3253,-19.8426 49.4974,-29.6766 84.32,-29.6766zm0 320.839c30.1781,0 54.6652,9.65962 73.1776,28.8262 18.4907,19.1666 27.8232,44.6785 27.8232,76.1649l0 6.84678c0,30.3308 -9.33255,54.6652 -27.8232,72.9814 -18.5125,18.338 -42.9995,27.5179 -73.1776,27.5179 -30.3308,0 -54.8178,-9.17991 -73.3303,-27.5179 -18.4907,-18.3162 -27.8232,-42.8251 -27.8232,-73.4829l0 -7.34829c0,-31.1594 9.33255,-56.3224 27.8232,-75.3363 18.5125,-19.1666 42.9995,-28.6518 73.3303,-28.6518z\"/>\n   <glyph unicode=\"F\" horiz-adv-x=\"558\" d=\"M87.8306 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm48.8432 298.838l0 94.6556 344.323 0 0 -94.6556 -344.323 0zm0 316.325l0 94.83 397.985 0 0 -94.83 -397.985 0z\"/>\n   <glyph unicode=\"5\" horiz-adv-x=\"544\" d=\"M271.494 -7.32649c-53.9892,0 -98.3188,15.5034 -132.989,46.6627 -34.67,31.0067 -56.4968,74.9875 -65.1752,131.506l0 0.501515 99.4963 0 0 -0.501515c3.66324,-26.0134 13.9988,-46.183 31.3338,-60.6834 17.1824,-14.5003 39.6633,-21.8268 67.3339,-21.8268 31.8353,0 56.4968,10.6627 74.0062,32.0098 17.335,21.3253 25.9916,51.329 25.9916,90.1638l0 59.4841c0,38.8347 -8.65659,68.6858 -25.9916,89.8367 -17.5094,21.1727 -42.1709,31.8353 -74.0062,31.8353 -17.335,0 -33.8196,-4.99335 -49.8245,-14.653 -16.0049,-9.83406 -30.0037,-23.5058 -41.9965,-41.0152l-90.8397 0 0 374 361.832 0 0 -94.83 -262.162 0 0 -159.656c12.3198,10.1611 26.166,17.9891 41.495,23.484 15.3289,5.51667 30.8323,8.35132 46.8372,8.35132 61.839,0 109.657,-19.014 143.499,-56.8457 33.994,-38.0061 50.8275,-91.4939 50.8275,-160.507l0 -59.4841c0,-69.34 -17.335,-123.002 -52.1576,-161.008 -34.8444,-37.8317 -84.0147,-56.8239 -147.511,-56.8239z\"/>\n   <glyph unicode=\"C\" horiz-adv-x=\"618\" d=\"M320.338 -7.32649c-49.4974,0 -92.8458,10.9897 -129.827,32.991 -37.1776,22.0013 -66.0038,52.8336 -86.5005,92.4969 -20.5185,39.6633 -30.6797,86.1734 -30.6797,139.181l0 194.828c0,53.3351 10.1611,99.9978 30.6797,139.661 20.4967,39.6633 49.323,70.4956 86.5005,92.4969 36.9813,22.0013 80.3297,33.0128 129.827,33.0128 40.9934,0 78.4981,-8.83103 112.492,-26.5149 33.994,-17.4876 62.4932,-41.9965 85.4975,-73.6574 23.0043,-31.5083 38.5077,-68.5114 46.6627,-110.835l0 0 -102.157 0 0 0c-6.17082,22.8299 -16.5064,42.6724 -31.0067,59.833 -14.5003,17.1606 -31.4864,30.3308 -51.0019,39.8378 -19.4937,9.33255 -39.6633,14.1515 -60.4871,14.1515 -43.6755,0 -78.6725,-15.4816 -105.166,-46.1612 -26.6675,-30.8323 -39.8378,-71.3242 -39.8378,-121.825l0 -194.828c0,-50.5004 13.1702,-91.0142 39.8378,-121.672 26.4931,-30.5052 61.4902,-45.8342 105.166,-45.8342 30.8323,0 59.9856,9.83406 87.3291,29.3278 27.3435,19.4937 45.8342,47.6658 55.1667,84.4945l0 0 102.157 0 0 0c-8.15508,-42.3235 -23.8329,-79.3267 -46.9898,-110.835 -23.0043,-31.6609 -51.5035,-56.1479 -85.323,-73.8318 -33.8414,-17.4876 -71.346,-26.3187 -112.339,-26.3187z\"/>\n   <glyph unicode=\"2\" horiz-adv-x=\"516\" d=\"M62.4932 0l0 86.5005 247.509 329.997c14.3259,18.8395 25.4901,38.5077 33.4925,58.6773 8.00244,20.1478 12.0146,39.1618 12.0146,56.9983l0 1.00303c0,28.3247 -8.35132,50.326 -25.0104,65.982 -16.5064,15.6778 -40.1648,23.3314 -70.6701,23.3314 -28.6518,0 -52.005,-8.48215 -70.1686,-25.4901 -17.9891,-17.1606 -29.0007,-41.3423 -32.991,-72.5017l0 -0.501515 -103.007 0 0 0.501515c8.83103,61.1631 31.1812,108.502 67.0068,142.343 35.673,33.667 81.8342,50.5004 138.157,50.5004 63.8451,0 113.015,-16.1793 147.838,-48.3417 34.8444,-32.3368 52.332,-77.8439 52.332,-136.826l0 -0.501515c0,-25.0104 -5.16779,-51.329 -15.656,-78.847 -10.3356,-27.4961 -24.8359,-53.6622 -43.501,-78.8251l-205.512 -279.322 268.507 0 0 -94.6774 -400.34 0z\"/>\n   <glyph unicode=\"Q\" horiz-adv-x=\"657\" d=\"M586.01 -11.6657l-264.669 208.5 51.6561 65.8294 264.669 -207.998 -51.6561 -66.3309zm-263.187 4.3392c-50.1515,0 -93.9796,10.8371 -131.484,32.4895 -37.3302,21.6742 -66.3309,52.1794 -87.002,91.4939 -20.6712,39.5107 -31.0067,85.3448 -31.0067,137.677l0 201.173c0,52.8336 10.3356,98.8203 31.0067,138.004 20.6712,39.1618 49.6718,69.6452 87.002,91.3194 37.5046,21.6742 81.3327,32.5113 131.484,32.5113 50.0207,0 93.8488,-10.8371 131.353,-32.5113 37.3302,-21.6742 66.4835,-52.1576 87.1547,-91.3194 20.6712,-39.1836 31.0067,-85.1704 31.0067,-138.004l0 -201.173c0,-52.332 -10.3356,-98.1662 -31.0067,-137.677 -20.6712,-39.3145 -49.8245,-69.8197 -87.1547,-91.4939 -37.5046,-21.6524 -81.3327,-32.4895 -131.353,-32.4895zm0 98.1662c44.504,0 80.3515,14.653 107.172,44.0025 26.842,29.1533 40.1648,67.9881 40.1648,116.155l0 207.998c0,48.4944 -13.3229,87.3291 -40.1648,116.504 -26.8202,29.0007 -62.6676,43.6755 -107.172,43.6755 -44.3296,0 -79.9808,-14.6748 -106.997,-43.6755 -26.9946,-29.1751 -40.4919,-68.0099 -40.4919,-116.504l0 -207.998c0,-48.1673 13.4973,-87.002 40.4919,-116.155 27.0164,-29.3496 62.6676,-44.0025 106.997,-44.0025z\"/>\n   <glyph unicode=\"N\" horiz-adv-x=\"700\" d=\"M87.8306 0.501515l0 709.492 90.3382 0 347.158 -548.832 -11.6657 -12.6687 0 561.501 98.6677 0 0 -709.492 -91.3194 0 -346.176 540.503 11.6657 12.6687 0 -553.172 -98.6677 0z\"/>\n   <glyph unicode=\"K\" horiz-adv-x=\"641\" d=\"M151.327 162.164l14.6748 149.343 313.491 398.487 122.501 0 -450.666 -547.829zm-63.4962 -162.164l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm421.993 0l-225.66 378.84 78.6725 72.8288 269.009 -451.669 -122.021 0z\"/>\n   <glyph unicode=\"H\" horiz-adv-x=\"678\" d=\"M491.158 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm-403.327 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm62.0135 302.327l0 94.6774 394.148 0 0 -94.6774 -394.148 0z\"/>\n   <glyph unicode=\"7\" horiz-adv-x=\"503\" d=\"M440.003 709.993l0 -88.8336 -183.664 -621.16 -106.016 0 183.685 615.163 -180.676 0 0 -102.004 -99.6707 0 0 196.834 386.341 0z\"/>\n   <glyph unicode=\"E\" horiz-adv-x=\"597\" d=\"M87.8306 0l0 709.993 99.6707 0 0 -709.993 -99.6707 0zm48.3417 0l0 94.6774 407.819 0 0 -94.6774 -407.819 0zm0 305.161l0 94.6774 354.004 0 0 -94.6774 -354.004 0zm0 310.002l0 94.83 407.819 0 0 -94.83 -407.819 0z\"/>\n   <glyph unicode=\"4\" horiz-adv-x=\"568\" d=\"M63.4962 108.829l0 86.5005 238.329 514.162 102.505 0 -232.507 -508.319 348.183 0 0 -92.3443 -456.51 0zm306.164 -109.33l0 418.002 97.1632 0 0 -418.002 -97.1632 0z\"/>\n   <glyph unicode=\"B\" horiz-adv-x=\"645\" d=\"M146.508 0l0 92.3225 192.32 0c52.8336,0 90.1638,10.0085 112.165,30.1781 21.8486,20.1696 32.8384,46.8372 32.8384,79.6755l0 1.48274c0,35.1715 -9.33255,63.1691 -27.9976,84.1674 -18.6651,20.9982 -49.4974,31.5083 -92.4969,31.5083l-216.829 0 0 89.8367 216.829 0c36.6542,0 64.4992,8.65659 83.1643,26.166 18.8395,17.335 28.1721,42.8251 28.1721,76.3394l0 0c0,35.4986 -10.51,61.9917 -31.3338,79.6537 -20.8456,17.5094 -52.005,26.3405 -93.6744,26.3405l-203.157 0 0 92.3225 221.168 0c69.9941,0 121.999,-17.4876 156.32,-52.332 34.1685,-34.8226 51.1764,-81.4854 51.1764,-140.163l0 0c0,-35.3241 -10.3356,-67.8354 -31.1812,-97.3376 -20.8238,-29.5022 -53.6622,-48.3199 -98.1662,-56.3224 43.8499,-6.4979 78.0184,-26.0134 102.331,-58.1758 24.1818,-32.1624 36.349,-69.1655 36.349,-110.835l0 -1.50455c0,-57.8269 -18.6651,-104.664 -56.1697,-140.163 -37.5046,-35.4986 -88.1795,-53.1606 -152.33,-53.1606l-229.498 0zm-58.6773 0l0 709.993 99.1692 0 0 -709.993 -99.1692 0z\"/>\n   <glyph unicode=\"1\" horiz-adv-x=\"332\" d=\"M244.674 709.993l0 -709.993 -99.6707 0 0 601.491 -101.001 -61.9917 0 103.007 101.001 67.4865 99.6707 0z\"/>\n   <glyph unicode=\"P\" horiz-adv-x=\"622\" d=\"M139.16 275.332l0 94.83 227.012 0c32.6639,0 58.6555,11.1642 78.4981,33.667 19.6681,22.5028 29.5022,51.8305 29.5022,88.3321l0 0c0,37.1776 -9.83406,67.0068 -29.5022,89.3352 -19.8426,22.5028 -45.8342,33.667 -78.4981,33.667l-227.012 0 0 94.83 223.676 0c42.9995,0 80.3297,-8.98367 112.339,-27.1691 31.8353,-17.9891 56.6494,-43.3266 74.3333,-75.8161 17.8147,-32.6857 26.6675,-70.8445 26.6675,-114.847l0 0c0,-43.6536 -8.85284,-81.6598 -26.6675,-114.171 -17.6839,-32.6639 -42.498,-57.8269 -74.3333,-75.6634 -32.0098,-17.9891 -69.34,-26.9946 -112.339,-26.9946l-223.676 0zm-51.329 -275.332l0 709.993 99.6707 0 0 -709.993 -99.6707 0z\"/>\n   <glyph unicode=\"M\" horiz-adv-x=\"779\" d=\"M389.678 241.164l208.5 468.83 93.151 0 0 -709.993 -97.1632 0 0 531.672 4.99335 -31.1812 -174.833 -401.823 -69.3182 0 -174.833 391.989 4.81891 41.0152 0 -531.672 -97.1632 0 0 709.993 93.3255 0 208.521 -468.83z\"/>\n   <glyph unicode=\"J\" horiz-adv-x=\"505\" d=\"M195.831 -7.32649c-37.5046,0 -72.0002,7.65356 -103.836,22.9825 -31.6609,15.3507 -57.4998,36.676 -77.3206,64.3466l81.4854 58.6555c9.17991,-15.9831 22.3501,-28.3247 39.5107,-37.1558 17.335,-8.6784 37.3302,-13.1702 60.16,-13.1702 38.6603,0 68.664,12.1672 90.0111,36.1745 21.3253,24.16 31.988,58.0014 31.988,101.502l0 483.984 99.6707 0 0 -484.333c0,-73.9844 -19.3411,-131.332 -57.8269,-171.998 -38.6821,-40.6664 -93.1728,-60.9886 -163.843,-60.9886z\"/>\n   <glyph unicode=\"9\" horiz-adv-x=\"513\" d=\"M146.006 0l178.67 352.5 -0.501515 -17.5094c-8.35132,-15.3289 -20.9982,-26.3187 -37.5046,-33.1654 -16.6808,-6.82497 -35.8475,-10.3356 -57.6743,-10.3356 -51.1546,0 -92.3225,19.014 -123.504,56.8457 -31.3338,38.0061 -46.8154,88.3321 -46.8154,151.174l0 0.47971c0,69.0129 17.3132,122.501 51.9832,160.354 34.67,37.9843 83.3388,56.9983 146.181,56.9983 62.8203,0 111.489,-19.1666 145.985,-57.4998 34.5173,-38.1806 51.8305,-92.3443 51.8305,-162.338l0 -0.501515c0,-28.8262 -4.31739,-60.16 -12.8214,-94.0014 -8.32952,-33.667 -20.8456,-66.5053 -37.0031,-98.8422l-151.327 -304.158 -107.499 0zm110.835 382.329c31.3338,0 55.4938,10.51 72.5017,31.6609 17.1606,21.1727 25.6645,51.0019 25.6645,89.5096l0 0.327075c0,37.5046 -8.50396,66.5053 -25.6645,87.002 -17.0079,20.4967 -41.1679,30.6797 -72.5017,30.6797 -31.5083,0 -55.8427,-10.1829 -73.0032,-30.6797 -17.1824,-20.4967 -25.6645,-49.6718 -25.6645,-87.3291l0 -0.501515c0,-38.5077 8.48215,-68.1625 25.6645,-89.1607 17.1606,-20.9982 41.495,-31.5083 73.0032,-31.5083z\"/>\n   <glyph unicode=\"G\" horiz-adv-x=\"646\" d=\"M327.163 382.329l246.179 0 0 -124.005c0,-53.4877 -10.51,-99.9978 -31.1812,-139.988 -20.6494,-39.8378 -49.4974,-70.6701 -86.6531,-92.6713 -37.0031,-22.0013 -80.6786,-32.991 -130.83,-32.991 -50.3478,0 -94.503,10.3356 -132.335,30.9849 -37.6791,20.6712 -67.0068,49.8463 -87.8524,87.5035 -20.8238,37.5046 -31.1594,81.3327 -31.1594,131.506l0 209.503c0,53.3351 10.3356,99.9978 31.0067,139.661 20.6712,39.6633 49.4974,70.4956 86.5005,92.4969 37.1558,22.0013 80.8312,33.0128 131.005,33.0128 41.3205,0 78.9996,-8.83103 112.994,-26.5149 33.994,-17.4876 62.4932,-41.9965 85.6719,-73.6574 23.1569,-31.5083 38.6603,-68.5114 46.8154,-110.835l0 0 -107.826 0 0 0c-9.15811,36.8287 -26.8202,65.0008 -53.1606,84.4945 -26.4931,19.4937 -54.6652,29.3278 -84.4945,29.3278 -44.3514,0 -79.85,-15.4816 -106.518,-46.1612 -26.6675,-30.8323 -39.9904,-71.3242 -39.9904,-121.825l0 -209.503c0,-46.1612 13.6717,-83.1643 40.9934,-111.009 27.3435,-27.8232 63.4962,-41.822 108.349,-41.822 44.3296,0 79.8282,14.653 106.496,44.0025 26.6675,29.3278 39.9904,70.1686 39.9904,122.501l0 30.8323 -144 0 0 95.1571z\"/>\n   <glyph unicode=\"6\" horiz-adv-x=\"513\" d=\"M256.34 -7.32649c-62.8421,0 -111.511,18.6651 -146.006,56.1697 -34.4955,37.4828 -51.6561,90.1638 -51.6561,158.152l0 0.501515c0,30.6797 4.16476,63.1691 12.6469,97.512 8.50396,34.3211 20.6712,67.3339 36.5016,99.3219l154.336 305.663 107.499 0 -181.156 -353.983 0.501515 17.4876c16.8335,32.3368 46.9898,48.3417 90.3382,48.3417 55.6464,0 98.8203,-18.5125 129.326,-55.3411 30.6579,-37.0031 45.9868,-89.1607 45.9868,-156.495l0 -0.501515c0,-68.664 -17.3132,-121.999 -51.8305,-160.005 -34.4955,-37.8317 -83.317,-56.8239 -146.486,-56.8239zm0 95.6586c31.988,0 56.3224,9.83406 73.3303,29.3278 16.8335,19.5155 25.3374,47.3387 25.3374,83.5132l0 0.501515c0,39.6633 -9.00547,70.3212 -26.842,91.9954 -17.9891,21.6742 -43.501,32.4895 -76.6664,32.4895 -29.6766,0 -52.6591,-10.8153 -68.8384,-32.6639 -16.332,-21.8268 -24.487,-52.6591 -24.487,-92.3225l0 -0.501515c0,-36.1745 8.48215,-63.8451 25.6645,-83.1643 17.1606,-19.5155 41.3205,-29.1751 72.5017,-29.1751z\"/>\n  </font>\n  <style type=\"text/css\">\n   <![CDATA[\n    @font-face { font-family:\"Bahnschrift\";font-variant:normal;font-style:normal;font-weight:normal;src:url(\"#FontID0\") format(svg)}\n    .fil2 {fill:#332C2B}\n    .fil1 {fill:#DCDDDD;fill-rule:nonzero}\n    .fil0 {fill:#332C2B;fill-rule:nonzero}\n    .fnt0 {font-weight:normal;font-size:458.61px;font-family:\'Bahnschrift\'}\n   ]]>\n  </style>\n </defs>\n <g id=\"Layer_x0020_1\">\n  <metadata id=\"CorelCorpID_0Corel-Layer\"/>\n  <path class=\"fil0\" d=\"M22094 19547l-472 -13938c1415,-43 2830,-87 4246,-129 152,4652 303,9305 454,13958 -1409,45 -2818,90 -4227,136l-1 -27zm5238 -167l-473 -13938c1416,-44 2831,-87 4246,-130 152,4653 304,9305 454,13958 -1409,45 -2817,91 -4226,136l-1 -26zm9011 -15599c15,0 26,12 27,26 0,15 -12,27 -26,27l-2157 27 89 2751c0,5 -1,10 -3,14 2,4 4,9 4,14l417 12813c0,6 -3,13 -7,17 5,5 7,10 8,17l1462 19875c0,1 0,3 0,4l-289 6252 1822 10606c2,13 -6,26 -19,30l-16106 5273c-13,4 -28,-3 -33,-17l-6610 -17427 -3061 -8064c-2,-6 -2,-12 0,-17 -4,-3 -7,-8 -9,-13l-11284 -33111c-5,-14 3,-29 16,-34 3,-1 7,-1 10,-1l17446 -444c15,0 27,11 27,26 0,15 -11,27 -26,27l-17412 443 11273 33077c2,6 2,12 0,17 4,3 7,7 9,11l3060 8064 6602 17405 7781 -2548 -303 -8543 -10999 382 -2 -53 14549 -505 234 7580 996 -326 -478 -14579 -285 -8356 -192 -5566 -372 -11133 -460 -13945 2117 -69 0 0 0 0 2184 -27zm-29236 16271l-753 -2162c-134,-3921 -266,-7842 -399,-11762 1416,-44 2831,-87 4246,-130 151,4653 303,9306 454,13958 -1180,38 -2361,76 -3541,114l-7 -18zm23945 -18223l80 2486c-9728,317 -19456,634 -29184,953l-711 -2081 25 -8 -1 -27 29749 -987 -10 -334 52 -2zm-20080 29508l-3498 -10259c1074,-31 2149,-63 3223,-94 119,3455 236,6910 355,10365l-73 8 -7 -20zm-5801 -16915l-2786 -8162c864,-25 1729,-51 2593,-76 94,2749 188,5498 283,8247l-83 11 -7 -20zm28931 -11488l-44 -1218 52 -2 45 1218c701,-15 1403,-23 2139,-25l0 53 -2165 6 -2208 90 -51 -1283 53 -2 49 1230c732,-30 1431,-52 2130,-67zm-17221 16778l-473 -13938c1416,-43 2831,-87 4246,-129 152,4652 304,9305 454,13958 -1408,44 -2817,90 -4226,136l-1 -27zm-164 27345l-4184 -11169c1296,-39 2592,-78 3888,-116 126,3765 254,7530 382,11295l-79 10 -7 -20zm1154 2600l-473 -13938c1415,-43 2831,-86 4246,-129 152,4652 304,9305 454,13958 -1409,45 -2818,91 -4227,136l0 -27zm-476 -14969l-472 -13938c1415,-43 2830,-87 4246,-129 152,4652 304,9305 454,13958 -1409,45 -2818,91 -4227,136l-1 -27zm-5238 175l-472 -13938c1415,-43 2830,-86 4246,-129 150,4653 302,9305 454,13958 -1409,45 -2818,91 -4227,136l-1 -27zm-507 -14970l-472 -13938c1415,-43 2830,-87 4246,-130 150,4653 302,9306 454,13958 -1409,45 -2818,91 -4227,136l-1 -26zm11446 29591l-472 -13938c1415,-42 2830,-86 4246,-129 152,4652 303,9305 454,13958 -1409,45 -2818,91 -4227,136l-1 -27zm5235 -174l-472 -13938c1415,-43 2830,-86 4246,-129 152,4652 304,9305 454,13958 -1409,45 -2818,91 -4227,136l-1 -27zm-500 -14957l-473 -13938c1416,-43 2831,-87 4246,-130 152,4653 304,9306 454,13958 -1409,46 -2817,91 -4226,136l-1 -26zm-5226 164l-472 -13938c1415,-43 2830,-87 4246,-130 152,4653 303,9306 454,13958 -1409,46 -2818,91 -4227,136l-1 -26z\"/>', '<g id=\"_2320004745936\">\n   <polygon class=\"fil1\" points=\"[[1]]\" style=\"fill:[[2]]\"/>\n   <g transform=\"[[3]]\">\n    <text x=\"20000\" y=\"31500\"  class=\"fil2 fnt0\">[[4]]</text>\n   </g>\n  </g>', '<g id=\"_3136681595968\">\n   <path class=\"fil7\" d=\"[[1]]\" style=\"fill:[[2]]\"/>\n   <g transform=\"[[3]]\">\n    <text x=\"25500\" y=\"17500\"  class=\"fil8 fnt0\">[[4]]</text>\n   </g>\n  </g>\n\n<g id=\"_2319830303072\">\n   <path class=\"fil1\" d=\"[[1]]\" style=\"fill:[[2]]\"/>\n   <g transform=\"[[3]]\">\n    <text x=\"20000\" y=\"31500\"  class=\"fil2 fnt0\">[[4]]</text>\n   </g>\n  </g>', '', '</g>\r\n  </svg>', 400, 160, 80),
(2, 2, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>', '<svg id=\"svg-image-1\" xmlns=\"http://www.w3.org/2000/svg\" xml:space=\"preserve\" width=\"400mm\" height=\"297mm\" version=\"1.1\" style=\"shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd\"\r\nviewBox=\"0 0 40000 29700\"\r\n xmlns:xlink=\"http://www.w3.org/1999/xlink\">\r\n <defs>\r\n  <font id=\"FontID0\" horiz-adv-x=\"647\" font-variant=\"normal\" style=\"fill-rule:nonzero\" font-style=\"normal\" font-weight=\"400\">\r\n	<font-face \r\n		font-family=\"Bahnschrift\">\r\n		<font-face-src>\r\n			<font-face-name name=\"Bahnschrift\"/>\r\n		</font-face-src>\r\n	</font-face>\r\n   <missing-glyph><path d=\"M0 0z\"/></missing-glyph>\r\n   <glyph unicode=\"3\" horiz-adv-x=\"528\" d=\"M256.837 -7.33676c-40.002,0 -75.1684,7.33676 -105.166,21.6768 -30.1641,14.4901 -54.342,35.4999 -72.5005,62.8293 -18.3419,27.3294 -29.9973,60.4949 -35.1664,99.6632l0 0 101.497 0 0 0c4.5021,-30.6643 16.6578,-52.9914 36.1669,-67.1647 19.4924,-14.1733 44.5041,-21.3266 75.1684,-21.3266 32.832,0 58.494,8.82078 76.6691,26.329 18.1585,17.6582 27.3294,42.3364 27.3294,74.3347l0 21.4934c0,35.4999 -8.67071,62.8293 -25.8287,82.1717 -17.3414,19.4924 -41.6694,29.1636 -73.3342,29.1636l-50.1734 0 0 94.6608 50.1734 0c27.9964,0 49.6565,8.33722 64.8303,24.8449 14.9903,16.6578 22.6606,40.1687 22.6606,70.3328l0 21.9936c0,27.9964 -8.17048,49.6732 -24.1613,64.997 -16.1742,15.3405 -39.0015,22.844 -68.6654,22.844 -24.995,0 -46.3383,-7.00327 -63.663,-21.1765 -17.5082,-14.1566 -29.5138,-36.5004 -36.0001,-67.1647l0 0 -101.014 0 0 0c10.1714,58.6607 32.6819,103.999 67.6816,135.997 34.9997,32.165 79.3203,48.1725 132.995,48.1725 61.1619,0 108.501,-16.1742 142.166,-48.3392 33.499,-32.3318 50.1567,-77.6696 50.1567,-136.33l0 -11.6721c0,-35.4999 -9.48776,-66.331 -28.6634,-92.4932 -19.3257,-26.1622 -46.4884,-45.5046 -81.6548,-57.827 38.8181,-8.17048 68.8321,-27.1794 90.1587,-57.0099 21.3266,-29.6638 31.9983,-67.4982 31.9983,-113.503l0 -11.6554c0,-62.179 -17.825,-110.335 -53.3249,-144.501 -35.4999,-34.1659 -85.5066,-51.3406 -150.337,-51.3406z\"/>\r\n   <glyph unicode=\"R\" horiz-adv-x=\"651\" d=\"M131.328 300.328l0 94.6758 242.168 0c29.0119,0 52.3405,10.1584 69.8327,30.3221 17.6794,20.1807 26.3404,46.8444 26.3404,80.0082l0 0c0,33.1637 -8.66103,59.9976 -26.3404,80.1613 -17.4922,20.1637 -40.8208,30.169 -69.8327,30.169l-242.168 0 0 94.8289 238.34 0c41.3313,0 77.5068,-8.66103 108.339,-25.6598 30.9857,-17.1689 54.995,-41.008 71.9937,-71.5003 17.1689,-30.6624 25.6598,-66.6678 25.6598,-107.999l0 0c0,-41.008 -8.66103,-76.8262 -25.8299,-107.676 -17.3391,-30.6624 -41.3313,-54.6547 -71.9937,-71.6534 -30.8326,-17.1689 -66.838,-25.6768 -108.169,-25.6768l-238.34 0zm-43.4923 -300.328l0 710.494 99.6614 0 0 -710.494 -99.6614 0zm399.496 0l-162.671 322.33 99.1679 22.3417 181.677 -344.672 -118.175 0z\"/>\r\n   <glyph unicode=\"0\" horiz-adv-x=\"551\" d=\"M275.829 -7.33676c-67.6649,0 -118.322,18.1751 -151.988,54.5088 -33.6824,36.1669 -50.5069,85.3232 -50.5069,147.169l0 322.834c0,62.8293 16.9913,111.986 51.1739,147.819 34.1659,35.8334 84.6562,53.8418 151.321,53.8418 67.1647,0 117.672,-17.8417 151.671,-53.5083 33.9992,-35.6666 51.0071,-85.1564 51.0071,-148.152l0 -322.834c0,-62.846 -17.0079,-112.169 -51.0071,-148.002 -33.9992,-35.8334 -84.5061,-53.675 -151.671,-53.675zm0 94.6775c36.5004,0 62.846,9.65451 78.8368,28.6634 16.1742,18.9922 24.1613,45.1544 24.1613,78.3366l0 322.834c0,33.499 -7.98706,59.6612 -24.1613,78.4866 -15.9908,19.0089 -42.3364,28.3466 -78.8368,28.3466 -36.3336,0 -62.6626,-9.33769 -78.8368,-28.3466 -16.1575,-18.8255 -24.1613,-44.9877 -24.1613,-78.4866l0 -322.834c0,-33.1822 8.00374,-59.3444 24.1613,-78.3366 16.1742,-19.0089 42.5032,-28.6634 78.8368,-28.6634z\"/>\r\n   <glyph unicode=\"A\" horiz-adv-x=\"647\" d=\"M19.4924 0l261.839 709.998 84.8396 0 261.822 -709.998 -107.5 0 -196.825 572.834 -196.675 -572.834 -107.5 0zm120.673 155.839l0 94.6608 373.508 0 0 -94.6608 -373.508 0z\"/>\r\n   <glyph unicode=\"-\" horiz-adv-x=\"479\" d=\"M78.1698 301.841l328.17 0 0 -94.8443 -328.17 0 0 94.8443z\"/>\r\n   <glyph unicode=\"L\" horiz-adv-x=\"573\" d=\"M87.8354 0l0 710 99.6614 0 0 -710 -99.6614 0zm49.8392 0l0 94.6587 406.32 0 0 -94.6587 -406.32 0z\"/>\r\n   <glyph unicode=\"8\" horiz-adv-x=\"562\" d=\"M281.331 -7.33676c-43.3369,0 -81.1712,8.17048 -113.336,24.5114 -32.3318,16.1575 -57.3268,39.1516 -75.1684,68.8321 -17.9917,29.4971 -26.8292,64.1633 -26.8292,103.999l0 11.6554c0,35.4999 8.83746,68.8321 26.4957,100.18 17.8417,31.1645 41.5027,54.8256 70.9998,70.6663 -24.6615,13.6564 -44.6542,33.499 -59.9947,59.3277 -15.3238,25.9955 -22.9941,53.1581 -22.9941,81.8382l0 17.158c0,56.1762 18.3252,101.331 54.9923,135.497 36.6671,33.9992 85.1731,51.0071 145.835,51.0071 60.4949,0 109.001,-17.0079 145.668,-51.0071 36.6671,-34.1659 55.009,-79.3203 55.009,-135.497l0 -17.158c0,-29.347 -7.83699,-56.8432 -23.3442,-82.5052 -15.3238,-25.662 -35.8334,-45.3378 -61.1619,-58.6607 29.9973,-15.8407 53.9919,-39.5018 72.0003,-70.6663 17.9917,-31.348 26.9959,-64.6802 26.9959,-100.18l0 -11.6554c0,-39.8353 -8.83746,-74.5014 -26.8292,-103.999 -17.8417,-29.6805 -42.8367,-52.6746 -75.1684,-68.8321 -32.165,-16.341 -69.9993,-24.5114 -113.169,-24.5114zm0 95.678c34.8329,0 62.8293,9.98799 84.1726,29.9973 21.3266,20.1594 31.9983,46.3216 31.9983,78.9869l0 6.83652c0,32.832 -10.6716,59.3444 -31.9983,79.337 -21.3433,20.0093 -49.3397,29.9973 -84.1726,29.9973 -34.8329,0 -62.9961,-9.98799 -84.3394,-29.9973 -21.3266,-19.9927 -31.9983,-46.6718 -31.9983,-79.8373l0 -7.32008c0,-32.6819 10.6716,-58.6774 31.9983,-78.3366 21.3433,-19.8426 49.5064,-29.6638 84.3394,-29.6638zm0 320.833c30.1641,0 54.6755,9.65451 73.1675,28.8301 18.5086,19.1589 27.8297,44.6542 27.8297,76.1689l0 6.81985c0,30.3475 -9.32102,54.6755 -27.8297,73.0007 -18.492,18.3419 -43.0034,27.5128 -73.1675,27.5128 -30.3308,0 -54.8256,-9.17095 -73.3342,-27.5128 -18.492,-18.3252 -27.8297,-42.82 -27.8297,-73.501l0 -7.32008c0,-31.1645 9.33769,-56.343 27.8297,-75.3352 18.5086,-19.1756 43.0034,-28.6634 73.3342,-28.6634z\"/>\r\n   <glyph unicode=\"5\" horiz-adv-x=\"544\" d=\"M271.493 -7.33676c-53.9919,0 -98.3292,15.5072 -132.995,46.6718 -34.6662,30.9978 -56.493,75.0017 -65.1637,131.495l0 0.500233 99.4964 0 0 -0.500233c3.66838,-25.9955 14.0065,-46.1549 31.3313,-60.6616 17.1747,-14.5068 39.6685,-21.8269 67.3314,-21.8269 31.8482,0 56.5097,10.655 74.0012,31.9983 17.3414,21.3266 26.0121,51.324 26.0121,90.1587l0 59.4944c0,38.8348 -8.67071,68.6821 -26.0121,89.8419 -17.4915,21.1599 -42.153,31.8315 -74.0012,31.8315 -17.3248,0 -33.8325,-5.00233 -49.8233,-14.6735 -16.0075,-9.82125 -29.9973,-23.4943 -42.0029,-40.9858l-90.8257 0 0 373.991 361.819 0 0 -94.8276 -262.156 0 0 -159.675c12.3224,10.1714 26.1622,18.0084 41.5027,23.511 15.3238,5.48589 30.8311,8.32055 46.8219,8.32055 61.8455,0 109.668,-18.9922 143.5,-56.8265 33.9992,-38.0011 50.8404,-91.4927 50.8404,-160.508l0 -59.4944c0,-69.3324 -17.3414,-122.991 -52.1743,-160.992 -34.8329,-37.8343 -83.9892,-56.8432 -147.502,-56.8432z\"/>\r\n   <glyph unicode=\"T\" horiz-adv-x=\"481\" d=\"M191.002 0l0 651.84 99.4912 0 0 -651.84 -99.4912 0zm-200.837 615.171l0 94.8289 500.995 0 0 -94.8289 -500.995 0z\"/>\r\n   <glyph unicode=\"2\" horiz-adv-x=\"516\" d=\"M62.4958 0l0 86.507 247.499 329.987c14.34,18.8421 25.5119,38.5013 33.499,58.6774 8.00374,20.1594 12.0056,39.1683 12.0056,56.9933l0 1.00047c0,28.3299 -8.33722,50.3402 -24.995,65.9975 -16.5077,15.674 -40.1687,23.3442 -70.6663,23.3442 -28.6634,0 -52.0076,-8.50397 -70.1661,-25.5119 -18.0084,-17.158 -28.9969,-41.336 -32.9987,-72.5005l0 -0.500233 -103.015 0 0 0.500233c8.83746,61.1785 31.1812,108.501 67.0146,142.333 35.6666,33.6657 81.8215,50.5069 138.164,50.5069 63.8298,0 113.003,-16.1742 147.836,-48.3392 34.8329,-32.3318 52.3244,-77.8363 52.3244,-136.831l0 -0.500233c0,-24.995 -5.16908,-51.324 -15.6573,-78.8368 -10.3382,-27.4962 -24.8449,-53.6584 -43.5036,-78.8201l-205.496 -279.347 268.492 0 0 -94.6608 -400.337 0z\"/>\r\n   <glyph unicode=\"N\" horiz-adv-x=\"700\" d=\"M87.8354 0.493457l0 709.507 90.3367 0 347.156 -548.827 -11.6558 -12.6768 0 561.504 98.6575 0 0 -709.507 -91.3237 0 -346.169 540.506 11.6558 12.6597 0 -553.166 -98.6575 0z\"/>\r\n   <glyph unicode=\"7\" horiz-adv-x=\"503\" d=\"M440.005 709.998l0 -88.8248 -183.669 -621.173 -105.999 0 183.669 615.17 -180.668 0 0 -101.998 -99.6799 0 0 196.825 386.347 0z\"/>\r\n   <glyph unicode=\"4\" horiz-adv-x=\"568\" d=\"M63.4963 108.834l0 86.507 238.345 514.157 102.498 0 -232.509 -508.337 348.162 0 0 -92.3264 -456.496 0zm306.176 -109.334l0 417.995 97.162 0 0 -417.995 -97.162 0z\"/>\r\n   <glyph unicode=\" \" horiz-adv-x=\"268\" d=\"\"/>\r\n   <glyph unicode=\"B\" horiz-adv-x=\"645\" d=\"M146.502 0l0 92.3264 192.34 0c52.8247,0 90.1587,10.0047 112.152,30.1808 21.8435,20.1594 32.832,46.8219 32.832,79.6538l0 1.5007c0,35.1664 -9.32102,63.1795 -27.9964,84.1726 -18.6587,20.9931 -49.4898,31.498 -92.4932,31.498l-216.835 0 0 89.8419 216.835 0c36.6671,0 64.4968,8.65404 83.1555,26.1622 18.8421,17.3248 28.1798,42.8367 28.1798,76.3356l0 0c0,35.4999 -10.5049,61.9956 -31.3313,79.6538 -20.8431,17.5082 -52.0076,26.3456 -93.677,26.3456l-203.161 0 0 92.3264 221.17 0c69.9993,0 121.99,-17.4915 156.323,-52.3244 34.1659,-34.8329 51.1739,-81.5047 51.1739,-140.165l0 0c0,-35.3498 -10.3382,-67.8483 -31.1645,-97.3454 -20.8431,-29.4971 -53.675,-48.3226 -98.1625,-56.3263 43.8204,-6.50303 77.9864,-25.9955 102.331,-58.1771 24.1613,-32.165 36.3336,-69.1656 36.3336,-110.818l0 -1.5007c0,-57.8437 -18.6754,-104.666 -56.1762,-140.165 -37.5008,-35.4999 -88.1578,-53.1748 -152.338,-53.1748l-229.49 0zm-58.6607 0l0 709.998 99.1629 0 0 -709.998 -99.1629 0z\"/>\r\n   <glyph unicode=\"1\" horiz-adv-x=\"332\" d=\"M244.664 709.998l0 -709.998 -99.6632 0 0 601.497 -100.997 -61.9956 0 102.998 100.997 67.4982 99.6632 0z\"/>\r\n   <glyph unicode=\"J\" horiz-adv-x=\"505\" d=\"M195.835 -7.3338c-37.5028,0 -71.9937,7.67411 -103.83,23.0053 -31.6664,15.3312 -57.4963,36.669 -77.3367,64.3366l81.5056 58.6534c9.15449,-15.9948 22.3247,-28.3313 39.4936,-37.1624 17.3391,-8.66103 37.3326,-13.1702 60.1678,-13.1702 38.6598,0 68.6586,12.1663 89.9964,36.1755 21.3378,24.1624 32.0067,57.9898 32.0067,101.499l0 483.997 99.6614 0 0 -484.337c0,-74.0016 -19.3299,-131.328 -57.8366,-171.995 -38.6598,-40.6677 -93.1614,-61.0015 -163.828,-61.0015z\"/>\r\n   <glyph unicode=\"9\" horiz-adv-x=\"513\" d=\"M146.001 0l178.667 352.498 -0.500233 -17.4915c-8.33722,-15.3405 -20.9931,-26.3456 -37.5008,-33.1655 -16.6744,-6.83652 -35.8334,-10.3382 -57.6602,-10.3382 -51.1739,0 -92.3431,18.9922 -123.508,56.8265 -31.3313,38.0011 -46.8385,88.3412 -46.8385,151.171l0 0.500233c0,68.9989 17.3414,122.507 52.0076,160.341 34.6662,37.9844 83.3389,56.9933 146.168,56.9933 62.8293,0 111.502,-19.1756 146.001,-57.4935 34.4994,-38.1678 51.8242,-92.3431 51.8242,-162.342l0 -0.500233c0,-28.8301 -4.33536,-60.1614 -12.8227,-93.9939 -8.33722,-33.6657 -20.8431,-66.4977 -37.0006,-98.8461l-151.337 -304.159 -107.5 0zm110.835 382.328c31.3313,0 55.4926,10.5049 72.5005,31.6648 17.158,21.1765 25.662,51.0071 25.662,89.5084l0 0.333489c0,37.5008 -8.50397,66.4977 -25.662,86.9906 -17.0079,20.5096 -41.1692,30.681 -72.5005,30.681 -31.498,0 -55.8427,-10.1714 -73.0007,-30.681 -17.1747,-20.4929 -25.662,-49.6565 -25.662,-87.3241l0 -0.500233c0,-38.5013 8.48729,-68.1651 25.662,-89.1749 17.158,-20.9931 41.5027,-31.498 73.0007,-31.498z\"/>\r\n   <glyph unicode=\"6\" horiz-adv-x=\"513\" d=\"M256.336 -7.33676c-62.8293,0 -111.502,18.6754 -146.001,56.1762 -34.4994,37.5008 -51.6741,90.1587 -51.6741,158.157l0 0.500233c0,30.6643 4.16861,63.1628 12.6726,97.4955 8.50397,34.3327 20.6596,67.3481 36.5004,99.3464l154.339 305.659 107.5 0 -181.168 -353.999 0.500233 17.5082c16.8245,32.3318 46.9886,48.3226 90.3255,48.3226 55.676,0 98.8295,-18.492 129.344,-55.3258 30.6643,-37.0006 45.9881,-89.1749 45.9881,-156.506l0 -0.500233c0,-68.6654 -17.3248,-121.99 -51.8242,-159.991 -34.4994,-37.8343 -83.3389,-56.8432 -146.502,-56.8432zm0 95.678c31.9983,0 56.3263,9.82125 73.3342,29.3304 16.8245,19.4924 25.3285,47.3221 25.3285,83.489l0 0.500233c0,39.6685 -9.0042,70.3328 -26.8292,92.0096 -18.0084,21.6601 -43.5036,32.4985 -76.6691,32.4985 -29.6638,0 -52.6746,-10.8384 -68.8321,-32.6652 -16.341,-21.8435 -24.4948,-52.6746 -24.4948,-92.3431l0 -0.500233c0,-36.1669 8.48729,-63.8298 25.662,-83.1555 17.158,-19.5091 41.336,-29.1636 72.5005,-29.1636z\"/>\r\n  </font>\r\n  <style type=\"text/css\">\r\n   <![CDATA[\r\n    @font-face { font-family:\"Bahnschrift\";font-variant:normal;font-style:normal;font-weight:normal;src:url(\"#FontID0\") format(svg)}\r\n    .fil2 {fill:#332C2B}\r\n    .fil1 {fill:#DCDDDD;fill-rule:nonzero}\r\n    .fil0 {fill:#332C2B;fill-rule:nonzero}\r\n    .fnt1 {font-weight:normal;font-size:587.69px;font-family:\'Bahnschrift\'}\r\n    .fnt0 {font-weight:normal;font-size:599.72px;font-family:\'Bahnschrift\'}\r\n   ]]>\r\n  </style>\r\n </defs>\r\n <g id=\"Layer_x0020_1\">\r\n  <metadata id=\"CorelCorpID_0Corel-Layer\"/>\r\n  <path class=\"fil0\" d=\"M35366 22216l-31356 -17760c423,-749 847,-1497 1271,-2246 10464,5924 20925,11853 31388,17777 -424,749 -848,1498 -1272,2246l-31 -17zm2720 -3119l-4104 7246 -62 -35 4104 -7245 62 34zm856 485l-4104 7246 -61 -35 4104 -7245 61 34zm-34594 -18898l-3507 6192 -61 -35 3507 -6192 61 35zm856 485l-3507 6192 -61 -35 3507 -6192 61 35zm28652 23714l-31357 -17760c424,-749 848,-1497 1272,-2246 10464,5924 20924,11853 31387,17777 -423,749 -847,1498 -1271,2246l-31 -17z\"/>\r\n  ', '<g id=\"_2032558526592\">\r\n   <polygon class=\"fil1\" points=\"[[1]]\" style=\"fill:[[2]]\"/>\r\n   <g transform=\"[[3]]\">\r\n    <text x=\"20000\" y=\"14850\"  class=\"fil2 fnt0\">[[4]]</text>\r\n   </g>\r\n  </g>', '<g id=\"_1493380513120\">\r\n   <path class=\"fil5\" d=\"[[1]]\" style=\"fill:[[2]]\"/>\r\n   <g transform=\"[[3]]\">\r\n    <text x=\"20000\" y=\"17500\"  class=\"fil6 fnt0\">[[4]]</text>\r\n   </g>\r\n  </g>', '', '<g transform=\"matrix(0.494167 -0.869367 0.869367 0.494167 13097.2 34390.5)\">\r\n   <text x=\"20000\" y=\"14850\"  class=\"fil2 fnt1\">JALAN TR 03</text>\r\n  </g>\r\n  <g transform=\"matrix(0.494167 -0.869367 0.869367 0.494167 -20482.6 15711.2)\">\r\n   <text x=\"20000\" y=\"14850\"  class=\"fil2 fnt1\">JALAN TR 02</text>\r\n  </g>\r\n</g>\r\n  </svg>', 400, 160, 80);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `urutan` int(11) NOT NULL,
  `lihat` int(11) NOT NULL,
  `tambah` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `hapus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `id_parent`, `title`, `route_name`, `icon`, `urutan`, `lihat`, `tambah`, `edit`, `hapus`) VALUES
(1, 0, 'Beranda', 'beranda', 'bi bi-house-fill', 0, 1, 0, 0, 0),
(2, 0, 'Dashboard', 'dashboard', 'bi bi-grid-fill', 1, 1, 0, 0, 0),
(3, 0, 'Siteplan', 'st-penjualan.index', 'bi bi-map-fill', 2, 1, 0, 0, 0),
(4, 0, 'Keuangan', '#', 'bi bi-cash-stack', 4, 1, 0, 0, 0),
(5, 0, 'Customer', '#', 'bi bi-people-fill', 5, 1, 0, 0, 0),
(7, 0, 'Master Data', '#', 'bi bi-database-fill', 7, 1, 0, 0, 0),
(8, 0, 'Pengaturan', '#', 'bi bi-gear-fill', 8, 1, 0, 0, 0),
(11, 5, 'Customer', 'customer.index', 'bi bi-people-fill', 1, 1, 1, 1, 1),
(12, 5, 'Prospek', 'prospek.index', 'bi bi-person-plus-fill', 2, 1, 1, 1, 1),
(13, 5, 'Upload File', 'upload-file.index', 'bi bi-upload', 3, 1, 1, 0, 1),
(14, 5, 'Arsip Customer', 'arsip-customer.index', 'bi bi-archive-fill', 4, 1, 0, 0, 1),
(15, 7, 'Marketing', 'marketing.index', 'bi bi-megaphone-fill', 0, 1, 1, 1, 1),
(16, 7, 'Lokasi Kavling', 'lokasi-kavling.index', 'bi bi-geo-alt-fill', 1, 1, 1, 1, 1),
(17, 7, 'Kavling', 'kavling.index', 'bi bi-building-fill', 2, 1, 0, 1, 0),
(18, 7, 'Notaris', 'notaris.index', 'bi bi-journal-text', 3, 1, 1, 1, 1),
(19, 8, 'Pengaturan Profile', 'pengaturan-profile.index', 'bi bi-person-badge', 1, 1, 0, 1, 0),
(20, 8, 'Pengaturan Media', 'pengaturan-media.index', 'bi bi-images', 2, 1, 0, 1, 0),
(21, 8, 'Hak Akses', 'hak-akses.index', 'bi bi-key-fill', 4, 1, 0, 1, 0),
(22, 8, 'Pengguna', 'pengguna.index', 'bi bi-people-fill', 5, 1, 1, 1, 1),
(23, 8, 'List Penjualan', 'list-penjualan.index', 'bi bi-cart-fill', 6, 1, 1, 1, 1),
(27, 0, 'Pembayaran', 'pembayaran.index', 'bi bi-cart-fill', 3, 1, 0, 1, 0),
(28, 0, 'Legalitas', 'legalitas.index', 'bi bi-folder-fill', 6, 1, 0, 1, 0),
(29, 8, 'pengaturan landing', 'pengaturanLanding.index', 'fas fa circle', 6, 1, 1, 1, 1),
(30, 4, 'Pemasukan', 'pemasukan.index', '', 1, 1, 1, 1, 1),
(31, 4, 'Pengeluaran', 'pengeluaran.index', '', 2, 1, 1, 1, 1),
(32, 4, 'Hutang', 'hutang.index', '', 3, 1, 1, 1, 1),
(33, 4, 'Piutang', 'piutang.index', '', 4, 1, 1, 1, 1),
(34, 4, 'Kategori Transaksi', 'kategori-transaksi.index', '', 5, 1, 1, 1, 1),
(35, 4, 'Mutasi Saldo', 'mutasi-saldo.index', '', 6, 1, 1, 1, 1),
(36, 4, 'Laporan Arus Kas', 'laporan-arus-kas.index', '', 7, 1, 0, 0, 0),
(37, 8, 'Pengaturan Bank', 'bank.index', '', 3, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `metode_bayar`
--

CREATE TABLE `metode_bayar` (
  `id` int(11) NOT NULL,
  `jenis_bayar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metode_bayar`
--

INSERT INTO `metode_bayar` (`id`, `jenis_bayar`) VALUES
(1, 'Cash'),
(2, 'Transfer'),
(3, 'Bilyet Giro'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_saldo`
--

CREATE TABLE `mutasi_saldo` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `rekening_asal` int(11) NOT NULL,
  `rekening_tujuan` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notaris`
--

CREATE TABLE `notaris` (
  `id` int(11) NOT NULL,
  `nama_notaris` varchar(100) NOT NULL,
  `alamat_notaris` varchar(255) NOT NULL,
  `telp_notaris` varchar(35) NOT NULL,
  `keterangan_notaris` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notaris`
--

INSERT INTO `notaris` (`id`, `nama_notaris`, `alamat_notaris`, `telp_notaris`, `keterangan_notaris`) VALUES
(12, 'Linudya puji rahayu S.H. M.kn', 'Komplek angkasa permai', '081297016075', 'Notaris & PPAT rekanan PT.TKI');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id` int(11) NOT NULL,
  `id_hutang` int(11) NOT NULL DEFAULT 0,
  `id_bank` int(11) NOT NULL DEFAULT 0,
  `id_piutang` int(11) NOT NULL DEFAULT 0,
  `id_mutasi` int(11) NOT NULL DEFAULT 0,
  `id_customer` int(11) NOT NULL DEFAULT 0,
  `id_lokasi` int(11) NOT NULL DEFAULT 0,
  `no_kwitansi` varchar(35) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `nominal` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `id_kategori_transaksi` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`id`, `id_hutang`, `id_bank`, `id_piutang`, `id_mutasi`, `id_customer`, `id_lokasi`, `no_kwitansi`, `tanggal`, `nominal`, `lampiran`, `id_kategori_transaksi`, `keterangan`) VALUES
(1, 0, 9, 0, 0, 1, 0, '0001/MGR/IV/2026', '2026-04-22', 5000000, 'hKb2B6Pg3X1PPDQhHeWlWmMan.jpg', 26, 'DP 1'),
(2, 0, 9, 2, 0, 2, 0, NULL, '2026-04-22', 100000000, '', 5, 'Harga Tanah Kavling di Manggar Raya Blok C-07'),
(3, 0, 9, 0, 0, 1, 0, '0001/MGR/IV/2026', '2026-04-22', 2500000, 'bQhv869F1FB7OqtFR2aPZhKOC.jpg', 28, 'cicilan 1');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `id_hutang` int(11) NOT NULL DEFAULT 0,
  `id_piutang` int(11) NOT NULL DEFAULT 0,
  `id_po` int(11) NOT NULL DEFAULT 0,
  `id_mutasi` int(11) NOT NULL DEFAULT 0,
  `id_proyek_bangunan_detail` int(11) NOT NULL DEFAULT 0,
  `id_proyek_jalan_detail` int(11) NOT NULL DEFAULT 0,
  `id_proyek_saluran_detail` int(11) NOT NULL DEFAULT 0,
  `tanggal` date NOT NULL,
  `id_bank` int(11) NOT NULL DEFAULT 0,
  `nominal` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `id_kategori_transaksi` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan_legal`
--

CREATE TABLE `persyaratan_legal` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `IPH` int(11) DEFAULT 0,
  `SHGB` int(11) DEFAULT 0,
  `pajak` int(11) DEFAULT 0,
  `catatan_kekurangan` text DEFAULT NULL,
  `percakapan_wa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persyaratan_legal`
--

INSERT INTO `persyaratan_legal` (`id`, `id_customer`, `IPH`, `SHGB`, `pajak`, `catatan_kekurangan`, `percakapan_wa`) VALUES
(1, 1, 0, 0, 0, NULL, NULL),
(2, 2, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `id` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL DEFAULT 0,
  `id_customer` int(11) NOT NULL DEFAULT 0,
  `tanggal_piutang` date NOT NULL,
  `deskripsi` text NOT NULL,
  `nominal` int(11) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `terbayar` int(11) NOT NULL,
  `sisa_bayar` int(11) NOT NULL,
  `tgl_pelunasan` date DEFAULT NULL,
  `id_kategori_transaksi` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piutang`
--

INSERT INTO `piutang` (`id`, `id_bank`, `id_customer`, `tanggal_piutang`, `deskripsi`, `nominal`, `lampiran`, `status`, `terbayar`, `sisa_bayar`, `tgl_pelunasan`, `id_kategori_transaksi`) VALUES
(1, 9, 1, '2026-04-22', 'Harga Tanah Kavling di Manggar Raya Blok C-10', 80000000, '', 1, 7500000, 72500000, NULL, 0),
(2, 9, 2, '2026-04-22', 'Harga Tanah Kavling di Manggar Raya Blok C-07', 100000000, '', 2, 100000000, 0, '2026-04-22', 0),
(3, 9, 1, '2026-04-22', 'tambah kanopi', 20000000, '', 1, 0, 20000000, NULL, 63);

-- --------------------------------------------------------

--
-- Table structure for table `progres_list_penjualan`
--

CREATE TABLE `progres_list_penjualan` (
  `id` int(11) NOT NULL,
  `status_progres` varchar(30) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `warna_bootstrap` varchar(35) DEFAULT NULL,
  `short_name` varchar(10) NOT NULL,
  `stt_tampil` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `progres_list_penjualan`
--

INSERT INTO `progres_list_penjualan` (`id`, `status_progres`, `urutan`, `keterangan`, `warna`, `warna_bootstrap`, `short_name`, `stt_tampil`) VALUES
(1, 'Booking Fee', 2, 'Booking Fee', '#2992f5', 'warning', 'BF', 1),
(3, 'Kredit', 6, 'Kredit Berjalan', '#ff2600', 'info', 'kredit', 1),
(24, 'Cash Tempo', 3, 'pembelian cash tempo', '#f410b7', NULL, 'CT', 1),
(25, 'Kredit Macet', 4, 'kredit macet', '#811aff', NULL, 'KM', 1),
(26, 'Cash Keras', 4, 'pembelian kes keras', '#08f718', NULL, 'CK', 1);

-- --------------------------------------------------------

--
-- Table structure for table `progres_unit_ready`
--

CREATE TABLE `progres_unit_ready` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `warna` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `progres_unit_ready`
--

INSERT INTO `progres_unit_ready` (`id`, `keterangan`, `warna`) VALUES
(1, 'Belum Mulai', '#ffffff'),
(2, 'Belum Ready', '#f5f242'),
(3, 'Ready', '#4269f5');

-- --------------------------------------------------------

--
-- Table structure for table `prospek_nasabah`
--

CREATE TABLE `prospek_nasabah` (
  `id` int(11) NOT NULL,
  `tgl_terima` date NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `usia` int(11) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `no_telp` varchar(25) DEFAULT NULL,
  `no_wa` varchar(25) NOT NULL,
  `email` varchar(75) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `penghasilan` int(11) NOT NULL,
  `sumber_informasi` varchar(100) NOT NULL,
  `rangking` varchar(10) NOT NULL,
  `id_marketing` int(11) NOT NULL,
  `keterangan_belum` varchar(255) NOT NULL,
  `stt_delete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Marketing'),
(2, 'Admin'),
(3, 'Manager'),
(4, 'Super Admin'),
(5, 'Direktur');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `lihat` int(11) NOT NULL,
  `beranda` int(11) NOT NULL DEFAULT 0,
  `tambah` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `hapus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `id_role`, `id_menu`, `lihat`, `beranda`, `tambah`, `edit`, `hapus`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0),
(2, 2, 1, 1, 0, 0, 0, 0),
(3, 3, 1, 1, 0, 0, 0, 0),
(4, 4, 1, 1, 0, 0, 0, 0),
(5, 1, 2, 1, 0, 0, 0, 0),
(6, 2, 2, 1, 0, 0, 0, 0),
(7, 3, 2, 1, 0, 0, 0, 0),
(8, 4, 2, 1, 0, 0, 0, 0),
(9, 1, 3, 1, 0, 0, 0, 0),
(10, 2, 3, 1, 0, 0, 0, 0),
(11, 3, 3, 1, 0, 0, 0, 0),
(12, 4, 3, 1, 0, 0, 0, 0),
(13, 1, 4, 1, 0, 0, 0, 0),
(14, 2, 4, 1, 0, 0, 0, 0),
(15, 3, 4, 1, 0, 0, 0, 0),
(16, 4, 4, 1, 0, 0, 0, 0),
(17, 1, 5, 1, 0, 0, 0, 0),
(18, 2, 5, 1, 0, 0, 0, 0),
(19, 3, 5, 1, 0, 0, 0, 0),
(20, 4, 5, 1, 0, 0, 0, 0),
(21, 1, 7, 1, 0, 0, 0, 0),
(22, 2, 7, 1, 0, 0, 0, 0),
(23, 3, 7, 1, 0, 0, 0, 0),
(24, 4, 7, 1, 0, 0, 0, 0),
(25, 1, 8, 1, 0, 0, 0, 0),
(26, 2, 8, 1, 0, 0, 0, 0),
(27, 3, 8, 1, 0, 0, 0, 0),
(28, 4, 8, 1, 0, 0, 0, 0),
(29, 1, 9, 1, 0, 0, 0, 0),
(30, 2, 9, 1, 0, 0, 0, 0),
(31, 3, 9, 1, 0, 0, 0, 0),
(32, 4, 9, 1, 0, 0, 0, 0),
(33, 1, 11, 1, 0, 1, 1, 1),
(34, 2, 11, 1, 0, 1, 1, 1),
(35, 3, 11, 1, 0, 1, 1, 1),
(36, 4, 11, 1, 0, 1, 1, 1),
(37, 1, 12, 1, 0, 1, 1, 1),
(38, 2, 12, 1, 0, 1, 1, 1),
(39, 3, 12, 1, 0, 1, 1, 1),
(40, 4, 12, 1, 0, 1, 1, 1),
(41, 1, 13, 1, 0, 1, 0, 1),
(42, 2, 13, 1, 0, 1, 0, 1),
(43, 3, 13, 1, 0, 1, 0, 1),
(44, 4, 13, 1, 0, 1, 0, 1),
(45, 1, 14, 1, 0, 0, 0, 1),
(46, 2, 14, 1, 0, 0, 0, 1),
(47, 3, 14, 1, 0, 0, 0, 1),
(48, 4, 14, 1, 0, 0, 0, 1),
(49, 1, 15, 1, 0, 1, 1, 1),
(50, 2, 15, 1, 0, 1, 1, 1),
(51, 3, 15, 1, 0, 1, 1, 1),
(52, 4, 15, 1, 0, 1, 1, 1),
(53, 1, 16, 1, 0, 1, 1, 1),
(54, 2, 16, 1, 0, 1, 1, 1),
(55, 3, 16, 1, 0, 1, 1, 1),
(56, 4, 16, 1, 0, 1, 1, 1),
(57, 1, 17, 1, 0, 0, 1, 0),
(58, 2, 17, 1, 0, 0, 1, 0),
(59, 3, 17, 1, 0, 0, 1, 0),
(60, 4, 17, 1, 0, 0, 1, 0),
(61, 1, 18, 1, 0, 1, 1, 1),
(62, 2, 18, 1, 0, 1, 1, 1),
(63, 3, 18, 1, 0, 1, 1, 1),
(64, 4, 18, 1, 0, 1, 1, 1),
(65, 1, 19, 1, 0, 0, 1, 0),
(66, 2, 19, 1, 0, 0, 1, 0),
(67, 3, 19, 1, 0, 0, 1, 0),
(68, 4, 19, 1, 0, 0, 1, 0),
(69, 1, 20, 1, 0, 0, 1, 0),
(70, 2, 20, 1, 0, 0, 1, 0),
(71, 3, 20, 1, 0, 0, 1, 0),
(72, 4, 20, 1, 0, 0, 1, 0),
(73, 1, 21, 1, 0, 0, 1, 0),
(74, 2, 21, 1, 0, 0, 1, 0),
(75, 3, 21, 1, 0, 0, 1, 0),
(76, 4, 21, 1, 0, 0, 1, 0),
(77, 1, 22, 1, 0, 1, 1, 1),
(78, 2, 22, 1, 0, 1, 1, 1),
(79, 3, 22, 1, 0, 1, 1, 1),
(80, 4, 22, 1, 0, 1, 1, 1),
(81, 1, 23, 1, 0, 1, 1, 1),
(82, 2, 23, 1, 0, 1, 1, 1),
(83, 3, 23, 1, 0, 1, 1, 1),
(84, 4, 23, 1, 0, 1, 1, 1),
(85, 1, 24, 1, 0, 1, 1, 1),
(86, 2, 24, 1, 0, 1, 1, 1),
(87, 3, 24, 1, 0, 1, 1, 1),
(88, 4, 24, 1, 0, 1, 1, 1),
(89, 1, 25, 1, 0, 1, 1, 1),
(90, 2, 25, 1, 0, 1, 1, 1),
(91, 3, 25, 1, 0, 1, 1, 1),
(92, 4, 25, 1, 0, 1, 1, 1),
(93, 1, 27, 1, 0, 0, 1, 0),
(94, 2, 27, 1, 0, 0, 1, 0),
(95, 3, 27, 1, 0, 0, 1, 0),
(96, 4, 27, 1, 0, 0, 1, 0),
(97, 1, 28, 1, 0, 0, 1, 0),
(98, 2, 28, 1, 0, 0, 1, 0),
(99, 3, 28, 1, 0, 0, 1, 0),
(100, 4, 28, 1, 0, 0, 1, 0),
(101, 1, 29, 1, 0, 1, 1, 1),
(102, 2, 29, 1, 0, 1, 1, 1),
(103, 3, 29, 1, 0, 1, 1, 1),
(104, 4, 29, 1, 0, 1, 1, 1),
(105, 1, 30, 1, 0, 1, 1, 1),
(106, 2, 30, 1, 0, 1, 1, 1),
(107, 3, 30, 1, 0, 1, 1, 1),
(108, 4, 30, 1, 0, 1, 1, 1),
(109, 1, 31, 1, 0, 1, 1, 1),
(110, 2, 31, 1, 0, 1, 1, 1),
(111, 3, 31, 1, 0, 1, 1, 1),
(112, 4, 31, 1, 0, 1, 1, 1),
(113, 1, 32, 1, 0, 1, 1, 1),
(114, 2, 32, 1, 0, 1, 1, 1),
(115, 3, 32, 1, 0, 1, 1, 1),
(116, 4, 32, 1, 0, 1, 1, 1),
(117, 1, 33, 1, 0, 1, 1, 1),
(118, 2, 33, 1, 0, 1, 1, 1),
(119, 3, 33, 1, 0, 1, 1, 1),
(120, 4, 33, 1, 0, 1, 1, 1),
(121, 1, 34, 1, 0, 1, 1, 1),
(122, 2, 34, 1, 0, 1, 1, 1),
(123, 3, 34, 1, 0, 1, 1, 1),
(124, 4, 34, 1, 0, 1, 1, 1),
(125, 1, 35, 1, 0, 1, 1, 1),
(126, 2, 35, 1, 0, 1, 1, 1),
(127, 3, 35, 1, 0, 1, 1, 1),
(128, 4, 35, 1, 0, 1, 1, 1),
(129, 1, 36, 1, 0, 0, 0, 0),
(130, 2, 36, 1, 0, 0, 0, 0),
(131, 3, 36, 1, 0, 0, 0, 0),
(132, 4, 36, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0Ey3rzbutM9IG4MACxYyV7boHfNqvSD3pfAuVMzD', NULL, '23.111.114.116', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_4_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmFyMHRqQ0hYRHFNc1lvTFVBaTJudlN5RTR2RW5wdnVJNHdUS2M5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777442470),
('1Lg3XP2DFJaGJnyjmNOW3ZERa47eszwyrszVuc4O', NULL, '37.97.119.235', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFc0QXJFVHR4WnJubHZIQmFFc1FqYlhuU1NsbTJ2cXhZYldxRTBwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777447371),
('2bBBxYbAzXdVhZkInTHF2pQb0bqHbqzcQ27Z0hrh', NULL, '31.40.223.158', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmNTdGZ5WDZ0NElyTnVOSERKQjRRWEdKUld5TnpMaHdJWlRjYWl6cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777436205),
('5Xzv2aKdZ4xj3lMGPyuvUlhdqvcc2N19NoLXH4B4', NULL, '192.71.142.134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Viewer/99.9.8853.8', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTVpTGZkN1hNcjFyTjNWVXh2WHlhWWFoQm1sNHVCUFJaTFhiNGVkTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777441098),
('8tNBrgciBedfJbHHf5KUS2jaX5u9lA16conGDq74', NULL, '45.66.51.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDNnSU81NEd1c3hyMzdRbk5XRVJqc0tJTWlQdDN5N2dsaGF0WjVOUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777447359),
('BYeuLSerSxP9muLAwrv2KSr96gPtMoBdDsfpW319', NULL, '185.243.110.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0tqQmhWZUk3aHFNY0c4RGdlSmVkbFlwQXVCWUU4WUlHUHRuZkZEdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777447374),
('ffhAaOt8Yn4JvGamzETPAb1tS1pPacPMxcwc2ufU', NULL, '44.234.253.187', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFBpcHJNSmVyR3BhMUhOQWF3aG9kdW9wZU50dTVNaWxrTkJYN3pHZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777448023),
('fQFJMsen5l39iYBhx4VojtCM798OZF4GfnDhfKHM', NULL, '34.219.145.129', 'Mozilla/5.0 (Macintosh; PPC Mac OS X 10.10; rv:54.0) Gecko/20100101 Firefox/54.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0JtaGFZaER5T0FFQ0ZOaFdDZGoxcVpUaDBxcUdXWDVucjRGUDY2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777448020),
('fy2u3VuTUNeKnqlZpC8c4jtSrxXjusEW7gmZ17h7', NULL, '2a01:4f8:1c1a:3b48::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajl3aG55b0hYS3pPeXk3QmpFU0JQVUprRnZUS1VPQmI2NDFTUTJyZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777452704),
('GAUa7xywQq37vvAhiWkgqRMhPwDeCugEkJU68mTt', NULL, '43.159.63.116', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiamJ4d2tMSWZ3V3l5YlEycXpQeW96cDRlZ05kVDEyTUV5ZzJRSGZnMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cHM6Ly93d3cudGVsdWtzZXJpYnUuY29tL2FkbWluL2JlcmFuZGEiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozOToiaHR0cHM6Ly93d3cudGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777448416),
('hNh1Y3VLxAi6ErRMYhune59Q2ZrVWckLwFfnJwpf', NULL, '23.27.145.46', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3kwOFJqc3hnVlpOVThWZHZoUjN0Zk9vVGdxOUYzSlc0cE83amh2aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777438352),
('IrOqKeiuRoT5teq6BlIF4RjpzciaDl8gAAoljinB', NULL, '2001:448a:50a0:3960:a468:9a0f:d1cd:6a28', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0.1 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkVHVHZkY1JFcE5KRm9pSzZ0UkY0UHVab3Q1MWtybUFkZ3M3aldGaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL3NpdGVwbGFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777445894),
('jT6iH9VudmdHRRQ3t5gmTcbZuHGP7pefWgNnI2u1', NULL, '138.199.60.18', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmNBWmlXcDdLaGVJcUtpd21GT1poM1lGSGo1SHhTYnFyZU10OTBEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777441831),
('NeWygLs27GBhKu0RqFvW2ivJYSG6mOTHixs3ObJV', NULL, '43.156.225.86', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidElSekM0bWJFZXBlYUpuQm44VUhNUDRqOHdsT3R0WnNDcEgwSW1OMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3LnRlbHVrc2VyaWJ1LmNvbS9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1777444579),
('ouG2IYyjj1x42KdhrwSMGPM3wztK7DgqHF7Gm0wI', NULL, '2a01:4f8:1c1a:3b48::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkNpcEpEVXVWUzVXTk04ZHgzem5oYWVGdE9hSWhTWmY3bmN3MDlhbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777442544),
('Rvf9gHjJbCFELK4Koz9NoYSkZFn4eowpd6Ql73B5', NULL, '2404:c0:3561:a2c8:18aa:bc3a:b3a:95f2', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0VTYk1kMWZ5aFV6TEZVRVU2T1l2TjN4YjlDR2xlRTJ6bjZJVlVSdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL3NpdGVwbGFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777440726),
('SeDQG9iw9sgYvjQHeOzrO1YnUQrDHYMNhrvXR4qn', NULL, '98.93.26.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFo2RDdQRlE3c25iaUxqOXlGYzBSUW9SckEzaWM1MUxYUlFLOWdzSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777455209),
('SU6FOBmtiTPLGktlLsYde0QY893F9XQsvPFxNHWK', NULL, '44.234.253.187', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2VDVm5tbDg5aXdkMDhJUWR1c2Jzc3hVQzJHREdDbkdHdVJPSEJOcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777448022),
('szKAgzDrbVWLtD0WXWRAcV4wQ2nHoa2qUGlmo5Uz', NULL, '2a01:4f8:1c1a:3b48::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGpDd29JbUh2RjVJTWZtVzlEZTY0WnhyRGRxSEdDTjQwQWNyQ1BoQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777452703),
('t3qZ3aiPQMvSmCYOBh3FMYvbtrQXjQojpSxFaUTu', NULL, '124.156.200.4', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0lzSnlUZklFVDZiNXdKekZBVG43MTBlYVl1bDd6RHlWamNTQWFCZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777435646),
('TelZNgNNPwnJZYQi0aZKfdYtUD7OwYzIfQtFaOt2', NULL, '45.92.86.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3dUdDRpb2g3T29FRVlrMjMyd2VDR3czd1cydTZjV2ZVa2J6bVFKTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777456702),
('UCZ0ifTCXO1SPQBtygxGEsNsXW8BsKIv5LkPF85s', NULL, '192.71.12.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Viewer/99.9.8853.8', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3BOUGV1TUdjcEh0Z3NLZFBpVWtqRkhadk5QZzVNQ0xFRUhVb1lJQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777441097),
('UNB7nBJYxijPoFibbQ0LX6U8GAa31N7ewXjP9toh', NULL, '2001:448a:50a0:92c:c8bc:b073:e184:e4b6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:150.0) Gecko/20100101 Firefox/150.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1Y0eHlVdUMxSmhhZ3JISlJCNTBBeXhXSVI5VzdKeHpUcUFzbzI0eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL3NpdGVwbGFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777455351),
('uY9HwAVIhGldtGLqCr0nUoIsQlcPBKIhdHxWKPk7', NULL, '13.222.203.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUhQYTY3Nm9nUUFuOGdPY3I1TVZXdm1MT3pqazI5RUJVN0lYUXVqRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777455233),
('vuOl2gTvM0KjR9dik0WOwkg5eNocA5CdXaVcsWPl', NULL, '45.92.86.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTVoMFJHeUxFS3VocDFmU2I5eTFIQ3hIbzF3RHpsT1paY1pObEJUSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777456702),
('wbctxw5GiurtxZXuEpOyDoUTUIMay9NH68E2lXaM', NULL, '46.173.69.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHE3bzBYbWNvdEJPRGNvWGIxSmFUWEZZNFZOTldDME9wRHExQlpOMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777454558),
('WeJsgWhpjbuLxbv935TI0NTZ9QwpGyppis15zYD3', NULL, '23.111.114.116', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_4_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0FnWFR6UkVzM0hhYXBwQ3piVmdnQUNPNXhlUUREc3NSTENSMmd5TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777442471),
('X1nLlHCxzErPjpEqTEiqu2nEwGCTOMG5VRHSXjve', NULL, '43.156.250.82', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkJOWEdBaEtxQ29QamFJMkVzbjI5MFdSdHNUeTR6VG9Yd0tVVW5wRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777455961),
('X9PkDPDyetcvEz0hXW8qTiBCI1qaqEwaSqiBaaEh', NULL, '187.72.149.74', 'python-requests/2.32.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2NaUEFTcGk1ZFE4QU5xRUQ5ZlZPNEVTdzBZc3BZeHRsQWpodlpyUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777452590),
('XsHWTtbeWhSQmmfnG5fnTkfcYczE1pnihP9w83IW', NULL, '46.173.69.40', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjF5NW83b2xmZkFyWnhYZ1dyUnBwWG44SkoyUFNWa2libGxpM0h0aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777454557),
('xxVFWJNmFy7MjjVqOZgBGyqj4Ig8f8UI0A4kUEwm', NULL, '31.40.223.158', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidG10azNkZWU4b2FtTEFhRE41NWxtOTRzVWFnWEkzZE1jWmRUbzM2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777436206),
('ysAcb1sbz1imW6ZpDgQ03Ndvo0tZnGbFLCDQ6LSh', NULL, '2001:448a:50a0:92c:3cbe:be33:46bf:2781', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDZvVVVhNXNBdExqaFpTa25Cdm8zeGVXZWZqV1RVclVIeTZWd0NSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL3NpdGVwbGFuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777442110),
('ZJZlSeohjFmZFwQ0zdOzePcnha11zWRrbZXM0bjY', NULL, '31.133.93.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.7258.156 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWndMMXl0ZGZIcHFKbWFIMWpEZUV0WlBPZWJ1QTkwSzVERGEwSDE2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777435680),
('zkEp2AvIyAt0YfH1tgk8HM9AEp1amvjNesnchilz', NULL, '37.97.119.235', 'Python/3.10 aiohttp/3.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXhHcmpVTzZyd1NjU3UzYVBLalYxTzBldFpjdDl6cU8xeEVRMjlMYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vdGVsdWtzZXJpYnUuY29tL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1777447372);

-- --------------------------------------------------------

--
-- Table structure for table `template_pesan`
--

CREATE TABLE `template_pesan` (
  `id` int(11) NOT NULL,
  `nama_template` varchar(50) NOT NULL,
  `isi_template` text NOT NULL,
  `jenis_pesan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_pesan`
--

INSERT INTO `template_pesan` (`id`, `nama_template`, `isi_template`, `jenis_pesan`) VALUES
(4, 'Untuk pesan pengantar Kwitansi', '_Assalamualaikum_Kepada Bapak / Ibu *{nama}*, terima kasih telah melakukan pembayaran kavling *{kode_kavling}*.  Berikut kami sertakan bukti pembayaran anda.*ttd Admin*', 'kwitansi'),
(5, 'Notif Customer', 'Assalamualaikum\r\n\r\nKepada Bapak/Ibu *{nama}*, berikut ini kami sampaikan tagihan pembelian rumah yang berlokasi di  kavling *{kode_kavling}*. Untuk kebaikan bersama mohon agar menyelesaikan  tagihan sebesar tagihan terlampir .\r\n\r\nAbaikan pesan ini jika anda telah melakukan pelunasan tagihan.\r\n\r\n*Admin Kavling*', 'notif'),
(8, 'Kirim Invoice', 'Assalamualaikum\r\n\r\nKepada Bapak/Ibu *{nama}*, berikut kami kirimkan Invoice pembelian rumah yang berlokasi di  kavling *{kode_kavling}*. \r\n\r\n*Admin Kavling*', 'invoice'),
(9, 'Uang Tanda Jadi', 'Assalamualaikum\r\n\r\nKepada Bapak/Ibu *{nama}*, berikut kami kirimkan kwitansi pembayaran UTJ pembelian rumah yang berlokasi di  kavling *{kode_kavling}*. \r\n\r\n*Admin Kavling*', 'UTJ'),
(10, 'Uang Tanda Jadi', 'Assalamualaikum\r\n\r\nKepada Bapak/Ibu *{nama}*, berikut kami kirimkan kwitansi pembayaran DP pembelian rumah yang berlokasi di  kavling *{kode_kavling}*. \r\n\r\n*Admin Kavling*', 'DP');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_transaksi` enum('Pengeluaran','Pemasukan') NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_pembayaran` int(11) DEFAULT NULL,
  `nominal` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_kavling`
--

CREATE TABLE `transaksi_kavling` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_kavling` int(11) NOT NULL,
  `tgl_terima` date DEFAULT NULL,
  `hrg_rumah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_kavling`
--

INSERT INTO `transaksi_kavling` (`id`, `id_customer`, `id_kavling`, `tgl_terima`, `hrg_rumah`) VALUES
(1, 1, 33, '2026-04-22', 80000000),
(2, 2, 30, '2026-04-22', 100000000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `status` enum('AKTIF','BLOKIR') NOT NULL DEFAULT 'AKTIF',
  `id_role` tinyint(1) NOT NULL DEFAULT 0,
  `id_marketing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `username`, `password`, `email`, `status`, `id_role`, `id_marketing`) VALUES
(1, 'Heru Hidayat', 'dev', '$2y$12$9F1donVySByNOSXvsS7cJud.wf8b3D/WqXYjaUa669.9lyAO3H8vK', 'heru@gmail.com', 'AKTIF', 4, 0),
(17, 'abu syafiq', 'marketing', '$2y$12$dqVH1n1LZF4XE8U71hqwvOkE9FOiMI7D4tuRjbyeCzjSBfrq.ia1K', 'asd@gmail.com', 'AKTIF', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip_customer`
--
ALTER TABLE `arsip_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_nasabah`
--
ALTER TABLE `file_nasabah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foto_kavling`
--
ALTER TABLE `foto_kavling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_pengeluaran`
--
ALTER TABLE `jenis_pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_transaksi`
--
ALTER TABLE `kategori_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kavling_peta`
--
ALTER TABLE `kavling_peta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfigurasi_media`
--
ALTER TABLE `konfigurasi_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfigurasi_wa`
--
ALTER TABLE `konfigurasi_wa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listrik_air`
--
ALTER TABLE `listrik_air`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi_kavling`
--
ALTER TABLE `lokasi_kavling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_svg`
--
ALTER TABLE `master_svg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metode_bayar`
--
ALTER TABLE `metode_bayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_saldo`
--
ALTER TABLE `mutasi_saldo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notaris`
--
ALTER TABLE `notaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persyaratan_legal`
--
ALTER TABLE `persyaratan_legal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progres_list_penjualan`
--
ALTER TABLE `progres_list_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progres_unit_ready`
--
ALTER TABLE `progres_unit_ready`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prospek_nasabah`
--
ALTER TABLE `prospek_nasabah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `template_pesan`
--
ALTER TABLE `template_pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_kavling`
--
ALTER TABLE `transaksi_kavling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer` (`id_customer`),
  ADD KEY `idx_kavling` (`id_kavling`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip_customer`
--
ALTER TABLE `arsip_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_nasabah`
--
ALTER TABLE `file_nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto_kavling`
--
ALTER TABLE `foto_kavling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `hutang`
--
ALTER TABLE `hutang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jenis_pengeluaran`
--
ALTER TABLE `jenis_pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `kategori_transaksi`
--
ALTER TABLE `kategori_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `kavling_peta`
--
ALTER TABLE `kavling_peta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `konfigurasi_media`
--
ALTER TABLE `konfigurasi_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `konfigurasi_wa`
--
ALTER TABLE `konfigurasi_wa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `listrik_air`
--
ALTER TABLE `listrik_air`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lokasi_kavling`
--
ALTER TABLE `lokasi_kavling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `marketing`
--
ALTER TABLE `marketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_svg`
--
ALTER TABLE `master_svg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `metode_bayar`
--
ALTER TABLE `metode_bayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mutasi_saldo`
--
ALTER TABLE `mutasi_saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notaris`
--
ALTER TABLE `notaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persyaratan_legal`
--
ALTER TABLE `persyaratan_legal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `progres_list_penjualan`
--
ALTER TABLE `progres_list_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `progres_unit_ready`
--
ALTER TABLE `progres_unit_ready`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prospek_nasabah`
--
ALTER TABLE `prospek_nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `template_pesan`
--
ALTER TABLE `template_pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_kavling`
--
ALTER TABLE `transaksi_kavling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
