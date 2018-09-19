<?php
include('classes/DB.php');

//check if the form is submitted
if(isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    //compare username from login form to username in database
    if(DB::query('SELECT username FROM users WHERE username=:username', array(':username'=>$username))){
        
        //verify password
        if(password_verify($password, DB::query('SELECT password FROM users WHERE username=:username', array(':username'=>$username))[0]['password'])){
            echo 'Logged in!';
        } else {
            echo 'Incorrect Password!';
        }
        
    } else {
        echo 'User not registered!';
    }
}
?>
<h1>Login to your account</h1>
<form action="login.php" method="post" >
    <input type="text" name="username" value="" placeholder="Username..."><p />
    <input type="password" name="password" value="" placeholder="Password..." ><p />
    <input type="submit" name="login" value="Login" >
</form>