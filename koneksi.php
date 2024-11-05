<?php
// Informasi koneksi database
$host = 'localhost'; // Ini bisa 'localhost' jika Anda bekerja di server lokal
$dbname = 'sistem_pelayanan'; // Nama database yang Anda buat di phpMyAdmin
$username = 'root'; // Username yang Anda gunakan untuk login di phpMyAdmin
$password = ''; // Password yang Anda gunakan, kosongkan jika default tidak ada password

// Membuat koneksi
$conn = new mysqli($host, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
