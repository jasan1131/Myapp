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
				
		$idproduct = $_GET['idproduct'];
		$category = $_GET['category'];
		$nameproduct = $_GET['nameproduct'];
		$typeproduct = $_GET['typeproduct'];
		$numberproduct = $_GET['numberproduct'];
		$unitproduct = $_GET['unitproduct'];
		$priceproduct = $_GET['priceproduct'];
		$unitprice = $_GET['unitprice'];
		$detailproduct = $_GET['detailproduct'];
		$imageproduct = $_GET['imageproduct'];
						
		$sql = "INSERT INTO `product`(`id`, `idproduct`, `category`, `nameproduct`, `typeproduct`, `numberproduct`, `unitproduct`, `priceproduct`, `unitprice`, `detailproduct`, `imagesproduct`) VALUES (Null,'$idproduct','$category','$nameproduct','$typeproduct','$numberproduct','$unitproduct','$priceproduct','$unitprice','$detailproduct','$imagesproduct')";

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