<?php
require_once 'classes/membership.php';

class time
{
function sessionX()
	{
	$membership = New Membership();
    $logLength = 1800;
    $ctime = strtotime("now");

    if(!isset($_SESSION['sessionX']))
    	{


        $_SESSION['sessionX'] = $ctime;
   		 }
    else
    	{

        if(((strtotime("now") - $_SESSION['sessionX']) > $logLength) && $_SESSION['status'] ='authorized')
        	{

            $membership->log_User_Out();

            header("Location: https://www.website.com/login.php");
            exit;
       		}
   		 else
    		{
       		 $_SESSION['sessionX'] = $ctime;
        	}
   	 	}
	}
}

