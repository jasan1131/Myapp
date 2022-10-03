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
				
		$idbuyer = $_GET['idbuyer'];
		$namebuyer = $_GET['namebuyer'];
		$dateDay = $_GET['dateDay'];
		$dateTime = $_GET['dateTime'];	
		$pathslip = $_GET['pathslip'];
		$status = $_GET['status'];
		

						
		$sql = "INSERT INTO `slip`(`id`, `idbuyer`, `namebuyer`, `dateDay`, `dateTime`, `pathslip`, `status`) VALUES (Null,'$idbuyer','$namebuyer','$dateDay','$dateTime','$pathslip','status')";

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