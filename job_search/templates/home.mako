<%inherit file="base.mako"/>

<head>
    <script src="${request.static_url('job_search:static/js/index.js')}"></script>
</head>

<h1>Job Board</h1>

<div class="col-md-8 col-md-offset-1">
    <div class="row">
        <form>
            <div class="form-group row has-feedback">
                <div class="col-md-8">
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
            </div>

            <input type="submit" class="btn btn-primary" id="job_search" value="Find Jobs">
        </form>
    </div>
</div>

<div class="clearfix"></div>

<div class="col-md-3 scrollbar" id="style-3">
<div  id="results"></div>
</div>

