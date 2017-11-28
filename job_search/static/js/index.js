$(function() {
    $("#q").focus();

    $("#job_search").click(function(e) {
        e.preventDefault();
        $("#results").html("")

        var checked = []
        $("input:checked").each(function () {
          checked.push($(this).val());
        });

        if (checked.length <= 0) {
          alert("Please select at least one site to view!");
        }
        else{
          $.ajax({
             url: '/job_search',
             data: {
                q: $("#q").val(),
                l: $("#l").val(),
                sites: checked
             },
             error: function() {
                console.log('An error has occurred');
             },
             dataType: 'json',
             success: function(data) {
                  var sites = $.unique(data.job_results.map(function(d) {
                    return d.site
                  }));

                  if (data['job_results'].length > 0) {
                    // For now create a div of the sites that are returned with a result.
                    $.each(sites, function(idx, obj) {
                        if (sites.length <= 1) {
                          var container_div = $("<div class='col-md-12'></div>");
                          var site_header = $("<h3 class='job_heading'>" + obj + "</h3>");
                          var scrollbar = $("<div class='col-md-12 scrollbar' id='style-3'></div>");
                          var base_div = $("<div id='" + obj + "'" + "></div>");

                          container_div.append(site_header);
                          container_div.append(scrollbar.append(base_div));
                        }
                        else if (sites.length == 2) {
                          var container_div = $("<div class='col-md-6'></div>");
                          var site_header = $("<h3 class='job_heading'>" + obj + "</h3>");
                          var scrollbar = $("<div class='col-md-12 scrollbar' id='style-3'></div>");
                          var base_div = $("<div id='" + obj + "'" + "></div>");

                          container_div.append(site_header);
                          container_div.append(scrollbar.append(base_div));
                        }
                        else {
                          var container_div = $("<div class='col-md-4'></div>");
                          var site_header = $("<h3 class='job_heading'>" + obj + "</h3>");
                          var scrollbar = $("<div class='col-md-12 scrollbar' id='style-3'></div>");
                          var base_div = $("<div id='" + obj + "'" + "></div>");

                          container_div.append(site_header);
                          container_div.append(scrollbar.append(base_div));
                        }
                        var ul = $("<ul class='results_list' id='" + obj + "_results'></ul>");
                        base_div.append(ul);

                        $("#results").append(container_div);
                    });

                  $.each(data['job_results'], function(idx, obj) {
                      var li = $("<li></li>");
                      var div = $("<div class='job_details'></div>");
                      var title = $("<div class='wrap'><h3 class='base_heading'><a href=' " + obj['url'] +  "' target='_blank'>" + obj["title"] + "</a></h3></div><p class='info'>" + obj["employer"] + " | " + obj["location"] + " <br>" + obj["posted"] + "</p>");

                      if ($.inArray(obj["site"], sites) > -1) {
                        $("#" + obj["site"] + "_results").append(li.append(div.append(title)));
                      }
                  });

                  $(".test").show();
              }
                  else {
                      $("#results").html("<p>No Results</p>");
                  }
             },
             type: 'GET'
          });
        }
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
