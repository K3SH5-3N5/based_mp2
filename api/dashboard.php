<?php
include "users.php";

if (isset($_GET['getLoggedInUser'])) {
    $response = array(
        "code" => 422,
        "description" => "Logged In User Not Found",
        "loggedin_user" => null
    );

    foreach ($users as $user ) {
        if ($user["username"] === @$_SESSION["logged-user"]) {
            $response["code"] = 200;
            $response["description"] = "Successfully Found";
            $response["loggedin_user"] = $user;
        }
    }

    echo json_encode($response);
}