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
						
		$idSeller = $_GET['idSeller'];
		$nameSeller = $_GET['nameSeller'];
		$idBuyer = $_GET['idBuyer'];
		$nameBuyer = $_GET['nameBuyer'];
		$distance = $_GET['distance'];
		$transport = $_GET['transport'];
		$dateOrder = $_GET['dateOrder'];
		$timeOrder = $_GET['timeOrder'];
		$nameProduct = $_GET['nameProduct'];
		$priceProduct = $_GET['priceProduct'];
		$amount = $_GET['amount'];
		$sum = $_GET['sum'];
		$total= $_GET['total'];

						
		$sql = "INSERT INTO `historyorder`(`id`, `idSeller`, `nameSeller`,  `idBuyer`, `nameBuyer`, `distance`, `transport`, `dateOrder`, `timeOrder`, `nameProduct`, `priceProduct`, `amount`, `sum`, `total`) VALUES (Null,'$idSeller','$nameSeller','$idBuyer','$nameBuyer','$distance','$transport','$dateOrder','$timeOrder','$nameProduct','$priceProduct','$amount','$sum','$total')";

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