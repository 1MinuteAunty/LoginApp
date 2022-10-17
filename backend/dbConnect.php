<?php

    function dbConnect(){
        $con= mysqli_connect('localhost', 'id19723123_root', 'HKYw}7jfdhTJ1z4r','id19723123_mydb') or die('Could not connect the database.');
        return $con;
    }
?>