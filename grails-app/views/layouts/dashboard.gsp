<!DOCTYPE html>
<html>
    <head>

        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

		<!-- Core CSS - Include with every page -->
		<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
		<link href="${resource(dir:'font-awesome/css',file:'font-awesome.css')}" rel="stylesheet">

		<!-- Page-Level Plugin CSS - Morris -->
		<link href="${resource(dir:'css/plugins/morris',file:'morris-0.4.3.min.css')}" rel="stylesheet">

		<!-- SB Admin CSS - Include with every page -->
		<link href="${resource(dir:'css',file:'sb-admin.css')}" rel="stylesheet">
		<link href="${resource(dir:'css',file:'style.css')}" rel="stylesheet">

        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
		<nav style="margin-bottom: 0" role="navigation" class="navbar navbar-default navbar-fixed-top">
            <!-- /.navbar-header -->

            <!-- /.navbar-top-links -->

            <div role="navigation" class="navbar-default navbar-static-side">
                <div class="sidebar-collapse">
                    <ul id="side-menu" class="nav">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" placeholder="Search..." class="form-control">
                                <span class="input-group-btn">
                                <button type="button" class="btn btn-default">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
							<a href="#">
					        		<label>Location :</label>
					        		Makati City
							</a>
                        </li>
                        <li>
							<a href="#">
				            	<label>Latitude :</label>
				            	14.55027
							</a>
                        </li>
                        <li>
							<a href="#">
				            	<label>Longtitue :</label>
				            	121.03269
							</a>
                        </li>
                    </ul>
                    <!-- /#side-menu -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		
		<div id="page-wrapper">
		
        <g:layoutBody />
		</div>
    </body>
</html>
