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
				
		$avatar = $_GET['avatar'];
		$type = $_GET['type'];
		$name = $_GET['name'];
		$seconname = $_GET['seconname'];
		$user = $_GET['user'];
		$password = $_GET['password'];
		$address = $_GET['address'];
		$phone = $_GET['phone'];
		$facebook = $_GET['facebook'];
		$line = $_GET['line'];
		$lat = $_GET['lat'];
		$lng = $_GET['lng'];
		
							
		$sql = "INSERT INTO `user`(`id`, `avatar`, `type`, `name`, `seconname`, `user`, `password`, `address`, `phone`, `facebook`, `line`, `lat`, `lng`) VALUES (Null,'$avatar','$type','$name','$seconname','$user','$password','$address','$phone','$facebook','$line','$lat','$lng')";

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