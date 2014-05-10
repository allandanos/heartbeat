<html>
    <head>
        <title>Dashboard</title>
        <meta name="layout" content="dashboard" />
    </head>
    <body>
				    <div class="row">
				        <div class="col-lg-12">
				            <h1 class="page-header">Dashboard</h1>
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

			<!-- Core Scripts - Include with every page -->
			<script src="${resource(dir:'js',file:'jquery-1.10.2.js')}"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>

			<!-- Page-Level Plugin Scripts - Morris -->
			<script src="js/plugins/morris/raphael-2.1.0.min.js"></script>
			<script src="js/plugins/morris/morris.js"></script>

			<!-- SB Admin Scripts - Include with every page -->
			<script src="js/sb-admin.js"></script>

			<!-- Page-Level Demo Scripts - Morris - Use for reference -->
			<script src="${resource(dir:'js',file:'custom.js')}"></script>
		<script>
			jQuery(document).ready(function() {
				obj = {};
				displayWeather(obj);

				displayFloodReport();

				displayEarthquakeReport();

				displayLandslideReport();
	
			});
		</script>
    </body>
</html>
