<!DOCTYPE html>
<html lang="${request.locale_name}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="pyramid web application">
    <meta name="author" content="Pylons Project">
    <link rel="shortcut icon" href="${request.static_url('job_search:static/pyramid-16x16.png')}">

    <title>Job Board</title>

    <!-- Bootstrap core CSS -->
    <link href="//oss.maxcdn.com/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this scaffold -->
    <link href="${request.static_url('job_search:static/css/theme.css')}" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
      <script src="//oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js" integrity="sha384-f1r2UzjsxZ9T4V1f2zBO/evUqSEOpeaUUZcMTz1Up63bl4ruYnFYeM+BxI4NhyI0" crossorigin="anonymous"></script>
    <![endif]-->
  </head>

  <body>

    <div class="starter-template">
      <div class="container">
            ${ next.body() }
            <div class="ajax-overlay"></div>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    ## <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="//oss.maxcdn.com/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js" integrity="sha384-s1ITto93iSMDxlp/79qhWHi+LsIi9Gx6yL+cOKDuymvihkfol83TYbLbOw+W/wv4" crossorigin="anonymous"></script>

    <!-- GOOGLE MAPS API -->
    <script>
        function activatePlacesSearch() {
            var options = {
                types: ['(regions)'],
                componentRestrictions: {country: "us"}
               };

            var input = document.getElementById("l");
            var location = "us"
            var types = ""
            var autocomplete = new google.maps.places.Autocomplete(input, options);
        }
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDl0EDoK-J8TG7q3LXEuZ9TBVIyE-MGbno&libraries=places&callback=activatePlacesSearch"></script>
  </body>
</html>

