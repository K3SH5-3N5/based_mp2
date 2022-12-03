const DASHBOARD_API = "../../api/dashboard.php";

getLoggedDetails()

function getLoggedDetails() {
    $.ajax({
        "url" : DASHBOARD_API + "?getLoggedInUser",
        "success" : function(response) {
            let responseJSON = JSON.parse(response)

            /**
             * Successful na nakita
             */
            if (responseJSON.code == 200) {
                $("#firstName").text(responseJSON.loggedin_user.firstname);
            } else {
                alert(responseJSON.description)
                window.location.href = "../index.html"
            }
        }
    })
}