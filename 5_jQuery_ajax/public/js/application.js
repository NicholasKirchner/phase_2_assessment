$(document).ready(function(){
    $("#get_color").on("click", function() {
        var request = $.post("/color");
        request.done( function () {
            var response = JSON.parse(request.responseText);
            var cellDOM = $("#color_me li:nth-child(" + response.cell + ")");
            $(cellDOM).css("background-color",response.color);
        });
    });
});
