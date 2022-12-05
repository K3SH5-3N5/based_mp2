<?php
include_once ("config.php");
include_once ("constants.php");
//This is for delete
if (isset($_POST['deleteEmployee']))
{
    $data = json_decode($_POST['deleteEmployee']);

    $sqlCommand = "
    DELETE FROM employees
    WHERE id = {$data->id}
    ";

    $isInserted = $connection->query($sqlCommand);

    $response = array();

    if ($isInserted)
    {
        $response["code"] = SUCCESS;
        $response["description"] = "Successfully Delete Employee";
    } else 
    {
        $response["code"] = SERVER_ERROR; 
        $response["description"] = "Error while deleting employee";
    }

    echo json_encode($response);
}


//This is for update
if (isset($_POST['updateEmployee']))
{
    $data = json_decode($_POST['updateEmployee']);

    $sqlCommand = "
    UPDATE `employees`
    SET `first_name`='{$data->first_name}',
    `department_id`='{$data->department}',
    `salary`='{$data->salary}'
    WHERE id = {$data->id}
    ";

    $isInserted = $connection->query($sqlCommand);

    $response = array();

    if ($isInserted)
    {
        $response["code"] = SUCCESS;
        $response["description"] = "Successfully Updated Employee";
    } else 
    {
        $response["code"] = SERVER_ERROR; 
        $response["description"] = "Error while updating employee";
    }

    echo json_encode($response);

}


/**
 * This condition is for selecting all employee
 */

 if (isset($_GET['getEmployees']))
 {
    $sqlCommand = "SELECT * FROM `employees`;";

    $results = $connection->query($sqlCommand);

    $response = array();

    $records = array();

    while ($row = $results->fetch_assoc()) {
        array_push($records, $row);
    }

    $response["code"] = SUCCESS;
    $response["total_rows"] = $results->num_rows;
    $response["records"] = $records;
    
    echo json_encode($response);
 }

/**
 * This condition is for inserting employee
 */
if (isset($_POST['saveEmployee']))
{
    $data = json_decode($_POST['saveEmployee']);
    
    $sqlCommand = "
    INSERT INTO `employees`
        (
            `first_name`, 
            `last_name`, 
            `department_id`, 
            `salary`, 
            `middle_name`
        ) 
    VALUES 
        (
            '{$data->first_name}',
            '{$data->last_name}',
            '{$data->department}',
            '{$data->salary}',
            '{$data->middle_name}')
    ";

    $isInserted = $connection->query($sqlCommand);

    $response = array();

    if ($isInserted)
    {
        $response["code"] = SUCCESS;
        $response["description"] = "Successfully Saved New Employee";
    } else 
    {
        $response["code"] = SERVER_ERROR; 
        $response["description"] = "Successfully Saved New Employee";
    }

    echo json_encode($response);
}