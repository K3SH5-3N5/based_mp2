<?php


foreach ($_FILES as $key) {
    $name = time().$key['name'];
    $path = 'upload/'.$name;
    @move_uploaded_file($key['tmp_name'], $path);
}

echo "Uploaded";