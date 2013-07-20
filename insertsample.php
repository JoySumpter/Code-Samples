 <?php
 
$mysqli = new mysqli('database.db.database.com', 'user', 'password','database');

$stmt = $mysqli->stmt_init();

if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

if($stmt->prepare("INSERT INTO Information (Email, Name, Country, textbox, legal) VALUES (?, ?, ?, ?, ?)"))
	{
	$stmt->bind_param('sssss', base64_decode($_GET["emailP"]), $_GET["nameP"], $_GET["countryP"], $_GET["textboxP"], $_GET["legalP"]);
	$stmt->execute();
	printf("Good");
	$stmt->close();
	}
	else
	{
	printf("Error", $stmt->errno, $stmt->error );
	}

$mysqli->close();

?>