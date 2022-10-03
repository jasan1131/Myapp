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
				
		$idFood = $_GET['idFood'];
		$imageFood = $_GET['imageFood'];
		$nameFood = $_GET['nameFood'];
		$idstapleFood = $_GET['idstapleFood'];
		$stapleFood = $_GET['stapleFood'];
		$idProduct = $_GET['idProduct'];
		$nameProduct = $_GET['nameProduct'];
		$priceProduct = $_GET['priceProduct'];
		$unitPrice = $_GET['unitPrice'];
		$detailProduct = $_GET['detailProduct'];
		$imageProduct = $_GET['imageProduct'];
						
		$sql = "INSERT INTO `menufood`(`id`, `idFood`, `imageFood`, `nameFood`, `idstapleFood`, `stapleFood`, `idProduct`, `nameProduct`, `priceProduct`, `unitPrice`, `detailProduct`, `imageProduct`) VALUES (Null,'$idFood','$imageFood','$nameFood','$idstapleFood','$stapleFood','$idProduct','$nameProduct','$priceProduct','$unitPrice','$detailProduct','$imageProduct')";

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