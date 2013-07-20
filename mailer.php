<?php

$subject = $_POST['subject'];
$name_field = $_POST['name'];
$email_field = $_POST['email'];
$message = $_POST['message'];
if (!isset($_POST['submit']))
	{
	header( "Location: http://www.website.com.com/contact.html" );
	}
	elseif(empty($subject)|| empty($name_field)  || empty($email_field)  || empty($message) )
		{
		echo "Please fill out all the fields";
		}
		else
			{
			$to = "joynisha@website.com.com";
			$body = "From: $name_field\n E-Mail: $email_field\n Message:\n $message";
 
			header ("Location: http://www.website.com.com/");
			mail($to, $subject, $body);
			} 
	
?>