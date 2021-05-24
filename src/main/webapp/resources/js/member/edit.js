$(document).ready(function(){

    var form = $("#modifyForm");

    

    $("#btn_submit").on("click", function(){

        //유효성검사 제외
        
        form.submit();

    });

});