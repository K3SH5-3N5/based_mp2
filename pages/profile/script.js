const UPLOADER_API = "../../api/uploader.php";
const PROFILE_API = "../../api/profile.php";

function save(){
    let data = new FormData();
    data.append( 'image_file', $( '#image_file' )[0].files[0] );
    $.ajax({
        url: PROFILE_API,
        data: data,
        processData: false,
        type: 'POST',
        enctype: 'multipart/form-data',
        cache: false,
		contentType: false,
        success: function ( data ) {
            alert( data );
        }
    });
}
