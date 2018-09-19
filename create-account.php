<?php
include('classes/DB.php');

//run only when $_POST['createaccount'] is exist
if (isset($_POST['createaccount'])){
    //create variable for handling user
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    
    //run only when specific username is not exist
    if(!DB::query('SELECT username FROM users WHERE username=:username', array(':username'=>$username))){
        
        //validate length of username value
        if (strlen($username) >= 3 && strlen($username) <= 32) {
            
            //validate charachters of username by php regex function
            if (preg_match('/[a-zA-Z0-9_]+/', $username)) {
                    
                //validate length of password
                if(strlen($password)>= 6 && strlen($password) <= 60) {
                    
                    //validate email address
                    if(filter_var($email, FILTER_VALIDATE_EMAIL)) {
                        //insert data into database
                        DB::query('INSERT INTO users VALUES (\'\', :username, :password, :email)', array(':username'=>$username, ':password'=> 
                        //hash password
                        password_hash($password, PASSWORD_BCRYPT),':email'=>$email));
                        echo 'Success!';
                    } else {
                        echo 'Invalid email';
                    }
                } else {
                    echo 'Invalid password';
                }
            } else {
                echo 'Invalid username';
            }
        } else {
            echo 'Username is too short or too long';
        }
        } else {
            echo 'User already exist';
    }
}
?>


<h1>Register</h1>
<!--LOGIN FORM START-->
<form action="create-account.php" method="post">
    <input type="text" name="username" value="" placeholder="Username..."> </p>
    <input type="password" name="password" value="" placeholder="Password..."> </p>
    <input type="email" name="email" value="" placeholder="someone@somesite.com"> </p>
    <input type="submit" name="createaccount" value="Create Account"> </p>
</form>
<!--LOGIN FORM END-->
