<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />

		<!-- Core CSS - Include with every page -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Page-Level Plugin CSS - Morris -->
		<link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

		<!-- SB Admin CSS - Include with every page -->
		<link href="css/sb-admin.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
    </head>
    <body>

   <div id="wrapper">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Heartbeat</a>
            </div>
            <!-- /.navbar-header -->

            
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
	                    <div class="panel-heading">
	                        Current Location
	                    </div>
	                    <div class="panel-body">
	                    	<p>
	                    		<label>Address Location :</label>
	                    		Makati City
	                    	</p>
	                        <p>
	                        	<label>Latitude :</label>
	                        	14.55027
	                        </p>
	                        <p>
	                        	<label>Longtitue :</label>
	                        	121.03269
	                        </p>
	                    </div>
                	</div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Weather Status
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="weather" class="flipped-icons">
                            	<div class="icons  col-lg-12">
	                            	Sunny Day
                            	</div>
                            	<div class="text  col-lg-12">
                            		37 degrees celcius
                            	</div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Flood Hazards
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="flood" class="flipped-icons">
                            	<div class="icons  col-lg-12">
	                            	Flooded Area's
                            	</div>
                            	<div class="text  col-lg-12">
                            		<p>0 %</p>
                            	</div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Earthquake Hazards
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="earthquake" class="flipped-icons">
                            	<div class="icons  col-lg-12">
	                            	Earthquake
                            	</div>
                            	<div class="text  col-lg-12">
                            		<p>
                            		Low
                            		</p>
                            	</div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Landslide Hazards
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="landslide" class="flipped-icons">
                            	<div class="icons  col-lg-12">
	                            	Landslide Areas
                            	</div>
                            	<div class="text  col-lg-12">
                            		<p>Makati City</p>
                            		<p>Marikina City</p>
                            		<p>Antipolo City</p>
                            	</div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Core Scripts - Include with every page -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Morris -->
    <script src="js/plugins/morris/raphael-2.1.0.min.js"></script>
    <script src="js/plugins/morris/morris.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Morris - Use for reference -->
    <script src="js/demo/morris-demo.js"></script>
    <script src="js/custom.js"></script>
    

    </body>
</html>
