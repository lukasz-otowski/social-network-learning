<?php
include('./classes/DB.php');
include('./classes/Login.php');
$showTimeline = False;
if (Login::isLoggedIn()) {
    $userid = Login::isLoggedIn();
    $showTimeline = True;
} else {
    echo 'Not logged in';
}

$followingposts = DB::query('SELECT posts.body, posts.likes, users.`username` FROM users, posts, followers
                            WHERE posts.user_id = followers.user_id
                            AND users.id = posts.user_id
                            AND follower_id = 16
                            ORDER BY posts.likes DESC');

foreach($followingposts as $post) {
    echo $post['body']." ~ ".$post['username']."<hr />";
}
?>