
const EMPLOYEE_API =  "../../api/employee.php";
const DEPARTMENT_API = "../../api/department.php";

getDepartments()

function getDepartments()
{
    $.ajax({
        "url" : DEPARTMENT_API + "?getDepartments",
        "success" : function(response) {
            
            let jsonParse = JSON.parse(response)
            let options = '';

            for (var i = 0; i<jsonParse.records.length; i++) 
            {
                options += "<option value='" +jsonParse.records[i].id+ "'>" + jsonParse.records[i].name + "</option>"
            }

            $("#department").html(options)
        }
    })
}

getEmployees();
function getEmployees()
{
    $.ajax({
        "url" : EMPLOYEE_API + "?getEmployees",
        "success" : function(response) {
            
            let jsonParse = JSON.parse(response)
            let tr = '';

            for (var i = 0; i<jsonParse.records.length; i++) 
            {
                //jsonParse.records[i].id
                tr += "<tr>" +
                    "<td>" + jsonParse.records[i].id + "</td>" + 
                    "<td>" + jsonParse.records[i].first_name + "</td>" + 
                    "<td>" + jsonParse.records[i].middle_name + "</td>" + 
                    "<td>" + jsonParse.records[i].last_name + "</td>" + 
                    "<td>" + jsonParse.records[i].department_id + "</td>" + 
                    "<td>" + jsonParse.records[i].salary + "</td>" + 
                    "<td><button onclick='edit(" +jsonParse.records[i].id+ ")'>EDIT</button>&nbsp;"+
                    "<button onclick='deleteEmployee(" +jsonParse.records[i].id+ ")'>DELETE</button></td>" + 
                "</tr>";
            }

            $("#records").html(tr)
        }
    })
}
function deleteEmployee(id) {
    let deleteEmployee = {
        id : id
	}

    $.ajax({
        "url" : EMPLOYEE_API ,
        "type" : "POST",
        "data" : "deleteEmployee=" + JSON.stringify(deleteEmployee),
        "success" : function(response) {

            let responseJSON = JSON.parse(response)

            alert(responseJSON.description);

            getEmployees();
            
            return false;
        }
    })
}

function edit(id) 
{
    let employeeFormUpdate = {
        id : id,
		first_name : $("#first_name").val(),
        department : $("#department").val(),
        salary : $("#salary").val()
	}

    $.ajax({
        "url" : EMPLOYEE_API ,
        "type" : "POST",
        "data" : "updateEmployee=" + JSON.stringify(employeeFormUpdate),
        "success" : function(response) {

            let responseJSON = JSON.parse(response)

            alert(responseJSON.description);

            getEmployees();
            
            return false;
        }
    })
}

function saveEmployee() 
{
    let employeeForm = {
		first_name : $("#first_name").val(),
        middle_name : $("#middle_name").val(),
        last_name : $("#last_name").val(),
        department : $("#department").val(),
        salary : $("#salary").val()
	}

    $.ajax({
        "url" : EMPLOYEE_API ,
        "type" : "POST",
        "data" : "saveEmployee=" + JSON.stringify(employeeForm),
        "success" : function(response) {

            let responseJSON = JSON.parse(response)

            alert(responseJSON.description);

            getEmployees();
            
            return false;
        }
    })

    return false;
}