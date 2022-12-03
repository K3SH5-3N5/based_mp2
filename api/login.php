<?php
include "users.php";

if (isset($_GET['auth'])) {
    $loginCredentials = json_decode($_GET['auth']);

    $response = array(
        "code" => 422, //Status code unprocessible content
        "description" => "Wrong username and password"
    );

    foreach($users as $user) {
        if ($user['username'] === $loginCredentials->username) {
            if ($user["password"] === $loginCredentials->password) {
                $response["code"] = 200;
                $response["description"] = "Successfully Login";

                $_SESSION["logged-user"] = $loginCredentials->username;
            }
        }
    }
    
    echo json_encode($response);
}