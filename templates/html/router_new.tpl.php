{literal}
	<!--http://plugins.jquery.com/project/zendjsonrpc-->
	
	<script type="text/javascript" src="lib/classes/extern/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="lib/classes/extern/zend_framework_json-rpc/json2.js"></script>
	<script type="text/javascript" src="lib/classes/extern/zend_framework_json-rpc/jquery.zend.jsonrpc.js"></script>
	<script type="text/javascript">
		function getSubnetInfo(subnet_id) {
			$(document).ready(function(){
				test = jQuery.Zend.jsonrpc({url: 'api_main.php'});
				subnet = test.subnet_info(subnet_id);
				if(subnet.dhcp_kind!='no') {
					document.getElementById('section_dhcp').style.display = 'block';
					
					if(subnet.dhcp_kind=='ips') {
						document.getElementById('dhcp_kind_ips').style.display = 'block';
						document.getElementById('dhcp_kind_subnet').style.display = 'none';
						document.getElementById('dhcp_kind_nat').style.display = 'none';
					} else if(subnet.dhcp_kind=='subnet') {
						document.getElementById('dhcp_kind_subnet').style.display = 'block';
						document.getElementById('dhcp_kind_ips').style.display = 'none';
						document.getElementById('dhcp_kind_nat').style.display = 'none';
					} else if(subnet.dhcp_kind=='nat') {
						document.getElementById('dhcp_kind_nat').style.display = 'block';
						document.getElementById('dhcp_kind_subnet').style.display = 'none';
						document.getElementById('dhcp_kind_ips').style.display = 'none';
					}
				} else {
					document.getElementById('section_dhcp').style.display = 'none';
				}
			});
		}
	</script>
{/literal}

<h1>Einen neuen Router anlegen:</h1>
<form action="./routereditor.php?section=insert" method="POST">
	<h2>Grunddaten</h2>
	<p>
		Hostname: <br><input name="hostname" type="text" size="35" maxlength="50" value="">
	</p>

	<p>
		Anmerkungen: <br><textarea name="description" cols="40" rows="3"></textarea>
	</p>

	<div>
		<h2>Standort</h2>
		<div style="width: 100%; overflow: hidden;">
			<div style="float:left; width: 55%;">
				<script type="text/javascript" src='http://maps.google.com/maps?file=api&amp;v=2&amp;key={$google_maps_api_key}'></script>
				<script type="text/javascript" src="./lib/classes/extern/openlayers/OpenLayers.js"></script>
				<script type="text/javascript" src="./templates/js/OpenStreetMap.js"></script>
				<script type="text/javascript" src="./templates/js/OsmFreifunkMap.js"></script>
				
				<div id="map" style="height:200px; width:400px; border:solid 1px black;font-size:9pt;">
					{literal}
						<script type="text/javascript">
							new_ip_map();
						</script>
					{/literal}
				</div>
			</div>
		
			<div style="float:left; width: 45%;">
				<p>
					Länge: <input id="longitude" name="longitude" size="15" maxlength="15" ><br>
					Breite: <input id="latitude" name="latitude" size="15" maxlength="15" >
				</p>
			</div>
		</div>
	</div>
	
	<p>Kurze Beschreibung des Standorts:<br><input name="location" type="text" size="60" maxlength="60" value=""></p>

	<h2>Hardware</h2>
	<p>
		Chipset:
		<select name="chipset_id">
			{foreach item=chipset from=$chipsets}
				<option value="{$chipset.id}">{$chipset.name}</option>
			{/foreach}
		</select>
	</p>

	<h2>Statusdaten</h2>
	<p>
		Statusaktualisierung:
		<select name="crawl_method" onChange="getProjectInfo(this.options[this.selectedIndex].value)">
			<option value="crawler" selected='selected'>Netmon Crawlt den Router</option>
			<option value="router" >Der Router sendet die Daten selbstständig</option>
		</select>
	</p>

	<p><input type="submit" value="Absenden"></p>
</form>