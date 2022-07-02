<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {
				
		$idProduct = $_GET['idProduct'];
		$nameProduct = $_GET['nameProduct'];
		$typeProduct = $_GET['typeProduct'];
		$numberProduct = $_GET['numberProduct'];
		$priceProduct = $_GET['priceProduct'];
		$detailProduct = $_GET['detailProduct'];
		$imageProduct = $_GET['imageProduct'];


		
						
		$sql = "INSERT INTO `productwholesale`(`Id`, `idProduct`, `nameProduct`, `typeProduct`, `numberProduct`, `priceProduct`, `detailProduct`, `imageProduct`) VALUES (Null,'$idProduct','$nameProduct','$typeProduct','$numberProduct','$priceProduct','$detailProduct','$imageProduct')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Shopping??";
   
}
	mysqli_close($link);
?>