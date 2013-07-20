<?php

require 'Mysql.php';

class membership
	{
	function val_user($un, $pwd, $checkPage)
		{
		$mysql = New Mysql();
		$ensure_credentials = $mysql->verify_Username_and_Pass($un, md5($pwd));

		if($ensure_credentials)
			{
			if($checkPage=="photos")
				{
				$_SESSION['status'] ='authorized';
				header("location: http://www.website.com/photo.php");
				}
			if($checkPage=="resources")
				{
				$_SESSION['status'] ='authorized';
				header("location: http://www.website.com/resources.php");
				}
			if($checkPage=="benefits")
				{
				$_SESSION['status'] ='authorized';
				header("location: http://www.website.com/active.php");
				}
			}	
			else return "Please enter a correct last name and member #";
		}

	function log_User_Out()
		{
		if(isset($_SESSION['status']))
			{
			unset($_SESSION['status']);

			if(isset($_COOKIE[session_name()]))
				setcookie(session_name(), '', time() - 1000);
				session_destroy();
			}
		}

	function confirm_Member()
		{
		session_start();
		if($_SESSION['status'] !='authorized') header("location: https://www.website.com/login.php");
		}
		
	function confirm_MemberP()
		{
		session_start();
		if($_SESSION['status'] !='authorized') header("location: https://www.website.com/loginP.php");
		}

	function confirm_MemberRes()
		{
		session_start();
		if($_SESSION['status'] !='authorized') header("location: https://www.website.com/loginRes.php");
		}	
	}
