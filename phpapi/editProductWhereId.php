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
			
		$id = $_GET['id'];
		$nameproduct = $_GET['nameproduct'];
		$typeproduct = $_GET['typeproduct'];
		$numberproduct = $_GET['numberproduct'];
		$unitproduct = $_GET['unitproduct'];
		$priceproduct = $_GET['priceproduct'];
		$unitprice = $_GET['unitprice'];
		$detailproduct = $_GET['detailproduct'];
		$imagesproduct = $_GET['imagesproduct'];
		
		
		
							
		$sql = "UPDATE `product` SET `nameproduct`='$nameproduct',`typeproduct`='$typeproduct',`numberproduct`='$numberproduct',`unitproduct`='$unitproduct',`priceproduct`='$priceproduct',`unitprice`='$unitprice',`detailproduct`='$detailproduct',`imagesproduct`='$imagesproduct' WHERE id = '$id'";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Shopping456";
   
}

	mysqli_close($link);
?>