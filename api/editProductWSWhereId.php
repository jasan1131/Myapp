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
			
		$Id = $_GET['Id'];
		$nameProduct = $_GET['nameProduct'];
		$typeProduct = $_GET['typeProduct'];
		$numberProduct = $_GET['numberProduct'];
		$priceProduct = $_GET['priceProduct'];
		$detailProduct = $_GET['detailProduct'];
		$imageProduct = $_GET['imageProduct'];
		
							
		$sql = "UPDATE `productwholesale` SET `nameProduct` = '$nameProduct', `typeProduct` = '$tyPeproDuct', `numberProduct` = '$numberProduct', `priceProduct` = '$priceProduct', `detailProduct` = '$detailProduct', `imagesProduct` = '$imageProduct' WHERE Id = '$Id'";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Shopping";
   
}

	mysqli_close($link);
?>