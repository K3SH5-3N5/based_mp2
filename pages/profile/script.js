const IMAGE_UPLOADER_API = "../../api/uploader.php";

function uploadImage() 
{
    $.blockUI();
    let image = new FormData();
    image.append("image_file", $("#file")[0].files[0])
    image.append("data", "your value");

    /**
     * Same as ^
     * let image = {
     *  image_file =  $("#file")[0].files[0]
     * }
     */

     $.ajax({
        "url" : IMAGE_UPLOADER_API ,
        "type" : "POST",
        "data" : image,
        "enctype" : "multipart/form-data",
        "cache" : false,
        "contentType" : false,
        "processData" : false,
        "success" : function(response) {
            $.unblockUI();
            alert(response)
            // let responseJSON = JSON.parse(response)

            // alert(responseJSON.description);
            
            // return false;
        }
    })
}