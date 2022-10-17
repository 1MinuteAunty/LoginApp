<?php

    include("dbConnect.php");
    $con=dbConnect();
    $username="";
    $password="";

    if(isset($_POST["username"])){
        $username=$_POST["username"];
        $password=$_POST["password"];
    }
    else{
        echo "Could not get data.";
        return;
    }

    $retrieveUserQuery="SELECT * FROM users WHERE `username`='$username' and `password`='$password'";

    $exe=mysqli_query($con,$retrieveUserQuery);
    $arr=[];
    
    if(mysqli_num_rows($exe)>0){
        $arr["isValidUser"]="true";       
    }
    else
    {
        $arr["isValidUser"]="false";
    }
    
    mysqli_close($con);
    echo json_encode($arr);
?>