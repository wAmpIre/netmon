<script type="text/javascript">
	document.body.id='tab3';
</script>

<ul id="tabnav">
	<li class="tab1"><a href="./config.php?section=edit">Netmon</a></li>
	<li class="tab2"><a href="./config.php?section=edit_netmon">Netmon</a></li>
	<li class="tab3"><a href="./config.php?section=edit_community">Community</a></li>
	<li class="tab4"><a href="./config.php?section=edit_email">Email</a></li>
	<li class="tab5"><a href="./config.php?section=edit_jabber">Jabber</a></li>
	<li class="tab6"><a href="./config.php?section=edit_twitter">Twitter</a></li>
	<li class="tab7"><a href="./config.php?section=edit_hardware">Hardware</a></li>
</ul>

<h1>Community Daten</h1>
<form action="./config.php?section=insert_edit_community" method="POST">
	<p>Name der Community:<br><input name="community_name" type="text" size="30" value="{$community_name}"></p>
	<p>Netzwerkpolicy einschalten: <input name="enable_network_policy" type="checkbox" value="1" {if $enable_network_policy==1}checked{/if}>
	<p>Url zur Netzwerkpolicy:<br><input name="network_policy_url" type="text" size="30" value="{$network_policy_url}"></p>
	<p><input type="submit" value="Absenden"></p>
</form>