$(function() {
    $("#job_search").click(function(e) {
        e.preventDefault();
        $("#results").html("")

        $.ajax({
           url: '/job_search',
           data: {
              q: $("#q").val(),
              l: $("#l").val()
           },
           error: function() {
              console.log('An error has occurred');
           },
           dataType: 'json',
           success: function(data) {
                if (data['job_listing'].length > 0) {
                var ul = $("<ul class='results_list'></ul>");

                $.each(data['job_listing'], function(idx, obj) {
                    var li = $("<li></li>");
                    var div = $("<div class='job_details'></div>");
                    var job_title = $("<div class='wrap'><h3 class='job_title'><a href=' " + obj['job_link'] +  "' target='_blank'>" + obj["job_title"] + "</a></h3></div><p class='job_loc'>" + obj["job_employer"] + " | " + obj["job_loc"] + " <br>" + obj["job_posted"] + "</p>");

                    ul.append(li.append(div.append(job_title)));
                });
                $(".scrollbar").show();
                $("#results").html(ul)
            }
                else {
                    $("#results").html("<p>No Results</p>");
                }
           },
           type: 'GET'
        });
    });
});

$( document ).ajaxStart(function() {
    $(".ajax-overlay").show();
    $("body").addClass("loading");
    $("#q").attr("readonly");
    $("#l").attr("readonly");
});

$( document ).ajaxStop(function() {
    $(".ajax-overlay").hide();
    $("body").removeClass("loading");
    $("#q").removeAttr("readonly");
    $("#l").removeAttr("readonly");
});
