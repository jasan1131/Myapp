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
				
		$idproDuct = $_GET['idproDuct'];
		$nameproDuct = $_GET['nameproDuct'];
		$typeproDuct = $_GET['typeproDuct'];
		$numberproDuct = $_GET['numberproDuct'];
		$priceproDuct = $_GET['priceproDuct'];
		$detailproDuct = $_GET['detailproDuct'];
		$imageproDuct = $_GET['imageproDuct'];


		
						
		$sql = "INSERT INTO `productspecial`(`iD`, `idproDuct`, `nameproDuct`, `typeproDuct`, `numberproDuct`, `priceproDuct`, `detailproDuct`, `imageproDuct`) VALUES (Null,'$idproDuct','$nameproDuct','$typeproDuct','$numberproDuct','$priceproDuct','$detailproDuct','$imageproDuct')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Shopping!!!!";
   
}
	mysqli_close($link);
?>