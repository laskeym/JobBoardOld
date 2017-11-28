<%inherit file="base.mako"/>

<head>
    <script src="${request.static_url('job_search:static/js/index.js')}"></script>
</head>

<div class="container-fluid" id="search_fluid">
    <div class="container" id="search_container">
        <div class="col-md-8 col-md-offset-2">
            <div class="row heading">
                <h3 class="base_heading">Search jobs amongst the most popular search sites in one place!</h3>
                <form id="job_board" class="base_parag">
                    <div class="form-group row has-feedback">
                        <div class="col-md-6">
                            <div class="right-inner-addon">
                                <i class="glyphicon glyphicon-search"></i>
                                <input type="text" class="form-control" id="q" placeholder="Job Title or Keyword" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="right-inner-addon">
                                <i class=" glyphicon glyphicon-map-marker"></i>
                                <input type="text" class="form-control" id="l" placeholder="Location">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="btn btn-primary" id="job_search" value="Find Jobs">
                        </div>
                        <div class="col-md-12 checkboxes">
                            <label for="dice" class="checkbox-inline">
                                <input type="checkbox" value="dice" class="checkbox">Dice
                            </label>
                            <label for="indeed" class="checkbox-inline">
                                <input type="checkbox" value="indeed">Indeed
                            </label>
                            <label for="simplyhired" class="checkbox-inline">
                                <input type="checkbox" value="simplyhired">Simply Hired
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>

<div class="col-md-12 test">
<div  id="results"></div>
</div>

