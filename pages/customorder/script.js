
//@TODO Change api variable api path
//@var change variable name value
//const SERVICES_API =  "../../api-oop/routes/services.php";
const SERVICES_API = "../../api-dbh/services.php";
const CUSTOMER_TRANSACTION_API =  "../../api-dbh/customertransaction.php";

/** Actual Functions */

/**
 * index = get all informations
 * show?id = get 1 information only
 * store = saving new data or resource
 * destroy?id = delete a resource
 * update?id new resource = to update new resource
 */


//Get all informations
customrTransactionIndex();
function customrTransactionIndex()
{
    //@TODO
    //@var change variable
    $.ajax({
        url : SERVICES_API + "?index",
        "success" : function(response) {
            
            let jsonParse = JSON.parse(response)
            let tr = '';
            let j = 0;
            for (var i = 0; i<jsonParse.records.length; i++) 
            {
                //@TODO Change display iterations
                //jsonParse.records[i].id
                j++;
                tr += "<tr>" +
                    "<th scope='row'>" + j + "</th>" + 
                    "<td>" + jsonParse.records[i].name + "</td>" + 
                    "<td>" + jsonParse.records[i].price + "</td>" + 
                    // "<td>" + jsonParse.records[i].date_time + "</td>" + 
                "</tr>";
            }

            /**
             * Change element to be display
             * @var change records to your html id
             */
            $("#records").html(tr)
        }
    })
}

getJobDetails()

function getJobDetails()
{
    $.ajax({
        "url" : SERVICES_API + "?index",
        "success" : function(response) {
            
            let jsonParse = JSON.parse(response)
            let options = "<option>--Select Transactions--</option>";

            for (var i = 0; i<jsonParse.records.length; i++) 
            {
                options += "<option value='" +jsonParse.records[i].id+"'>" + jsonParse.records[i].name+"</option>"
            }

            $("#select_transaction").html(options)
        }
    })
}

function clearForm() { 
    $(".form-control").val("");
}

//Saving a record
function store()
{

    /**
     * Change json collections
     */
    //@TODO change json collection
    //@var change variable name and value
    let customerTransactionForm = {
        first_name: $("#first_name").val(),
        last_name : $("#last_name").val(),
        company_name: $("#company_name").val(),
        address : $("#address").val(),
        email: $("#mail").val(),
        phone: $("#phone").val(),
        add_info: $("#addinfo").val(),
        service_id: $("#select_transaction").val(),
        service_name: $("#select_transaction option:selected").text()
    }
    console.log(customerTransactionForm);

    $.ajax({
        "url" : CUSTOMER_TRANSACTION_API ,
        "type" : "POST",
        "data" : "store=" + JSON.stringify(customerTransactionForm), //@var dont forget to change
        "success" : function(response) {

            let responseJSON = JSON.parse(response)

            alert(responseJSON.description);

            clearForm();
            
            index();

            return false;
        }
    })

    clearForm();
    return false;
}

