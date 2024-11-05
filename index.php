<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Login Sistem Pelayanan Terpadu</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="assets/assets_login/images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/assets_login/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/assets_login/css/main.css">
	<!--===============================================================================================-->

	<!-- SWEETALERT -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<?php
	// Cek apakah ada flashdata untuk error
	$errorMessage = isset($_SESSION['error']) ? $_SESSION['error'] : null;

	// Hapus flashdata setelah ditampilkan
	unset($_SESSION['error']);
	?>
</head>

<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="assets/assets_login/images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post" action="login.php">
					<span class="login100-form-title">
						Login
					</span>

					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<input class="input100" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i> <!-- Mengganti ikon untuk username -->
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>


				</form>

			</div>
		</div>
	</div>


	<!-- SweetAlert untuk menampilkan flashdata jika ada -->
	<?php if ($errorMessage): ?>
		<script>
			Swal.fire({
				title: 'Error!',
				text: '<?php echo $errorMessage; ?>',
				icon: 'error',
				confirmButtonText: 'OK'
			});
		</script>
	<?php endif; ?>

	<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/bootstrap/js/popper.js"></script>
	<script src="assets/assets_login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="assets/assets_login/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<!--===============================================================================================-->
	<script src="assets/assets_login/js/main.js"></script>

</body>

</html>