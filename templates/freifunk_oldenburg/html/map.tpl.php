<h1>Karte der Router</h1>
<div style="margin-right: 10px;">
	<script src='https://maps.google.com/maps?file=api&amp;v=2&amp;key={$google_maps_api_key}'></script>
	<script src="https://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2&mkt=en-us"></script> 
	<script type="text/javascript" src="./lib/classes/extern/openlayers/OpenLayers.js"></script>

	<script type="text/javascript" src="./templates/{$template}/js/OpenStreetMap.js"></script>
	<script type="text/javascript" src="./templates/{$template}/js/OsmFreifunkMap.js"></script>
	
	<div id="map" style="height:600px; width:100%; border:solid 1px black;font-size:9pt;">
		<script type="text/javascript">
			fullmap();
		</script>
	</div>
</div>
<br>
<h3>Legende</h3>
<div style="float: left; margin-right: 20px;">
<img src="templates/{$template}/img/ffmap/green_button.png"> Router ist online<br>
<img src="templates/{$template}/img/ffmap/ip_offline.png"> Router ist offline<br>
<img src="templates/{$template}/img/ffmap/traffic_6.png" width="20"> Router hat Traffic<br>
</div>
<div>
<img src="templates/{$template}/img/ffmap/clients_2_4.png" width="20"> Router hat Clients<br>
<img src="templates/{$template}/img/ffmap/mesh_line.png" width="20"> Mesh Verbindung (grün: gut verbindung, rot: schlechte verbindung)<br>
</div>