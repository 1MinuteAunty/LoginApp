<?php

    include("dbConnect.php");
    $con=dbConnect();
    $username="";
    $password="";

    if(isset($_POST["username"]) && isset($_POST["password"])){
        $username=$_POST["username"];
        $password=$_POST["password"];
    }
    else{
        echo "Could not get data.";
        return;
    }

    //Check whether username is existing or not 
    $retrieveUserQuery="SELECT * FROM users WHERE `username`='$username'";

    $res=mysqli_query($con,$retrieveUserQuery);
    $response=[];
    
    if(mysqli_num_rows($res)>0){
        $response["isAlreadyUser"]="true";  
        echo json_encode($response);
        return;   
    }
    else
    {
        $response["isAlreadyUser"]="false";
    }

    $createUserQuery="INSERT INTO users(`username`,`password`) VALUES('$username','$password')";

    $exe=mysqli_query($con,$createUserQuery);
    
    mysqli_close($con);

    if($exe){
        $response["userCreated"]="true";
    }
    else{
        $response["userCreated"]="false";
    }

    echo json_encode($response);
?>