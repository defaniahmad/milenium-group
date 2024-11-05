<?php
session_start(); // Mulai sesi

include 'koneksi.php'; // Sertakan file koneksi database

// Proses login jika form disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username']; // Ganti dari 'email' ke 'username'
    $password = md5($_POST['pass']); // Hash password dengan MD5

    // Cek di tabel tb_admin
    $sql = "SELECT * FROM tb_admin WHERE username = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Jika pengguna ditemukan di tb_admin
        $admin = $result->fetch_assoc();

        // Set data sesi untuk admin
        $_SESSION['loggedIn'] = true;
        $_SESSION['id_admin'] = $admin['id_admin']; // Menggunakan id_admin
        $_SESSION['username'] = $admin['username'];
        $_SESSION['role'] = 'admin'; // Tambahkan role
        $_SESSION['nama'] = $admin['nama_admin']; // Tambahkan nama_admin

        // Redirect ke index.php
        header("Location: admin/index.php");
        exit();
    } else {
        // Cek di tabel tb_user jika tidak ditemukan di tb_admin
        $sql = "SELECT * FROM tb_user WHERE username = ? AND password = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            // Jika pengguna ditemukan di tb_user
            $user = $result->fetch_assoc();

            // Set data sesi untuk user
            $_SESSION['loggedIn'] = true;
            $_SESSION['id_user'] = $user['id_user']; // Menggunakan id_user
            $_SESSION['username'] = $user['username'];
            $_SESSION['role'] = 'user'; // Tambahkan role
            $_SESSION['nama'] = $user['nama_user']; // Tambahkan nama_user

            // Redirect ke index.php
            header("Location: user/index.php");
            exit();
        } else {
            // Jika username atau password salah
            $_SESSION['error'] = "Username atau password salah!";
            header("Location: index.php"); // Kembali ke halaman login
            exit();
        }
    }
}

$conn->close(); // Tutup koneksi
