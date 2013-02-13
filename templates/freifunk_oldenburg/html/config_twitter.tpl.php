<script type="text/javascript">
	document.body.id='tab6';
</script>

<ul id="tabnav">
	<li class="tab1"><a href="./config.php?section=edit">Datenbank</a></li>
	<li class="tab2"><a href="./config.php?section=edit_netmon">Netmon</a></li>
	<li class="tab3"><a href="./config.php?section=edit_community">Community</a></li>
	<li class="tab4"><a href="./config.php?section=edit_email">Email</a></li>
	<li class="tab5"><a href="./config.php?section=edit_jabber">Jabber</a></li>
	<li class="tab6"><a href="./config.php?section=edit_twitter">Twitter</a></li>
	<li class="tab7"><a href="./config.php?section=edit_hardware">Hardware</a></li>
</ul>

<h1>Netmon Twitter client Konfiguration</h1>
<h2>Anmelden</h2>
<p><a href="https://twitter.com/apps/new">Netmon installation bei Twitter anmelden</a><p>

<h2>Twitter Anwendungsdaten</h2>
<form action="./config.php?section=insert_edit_twitter_application_data" method="POST">
	<p>Consumer key:<br><input name="twitter_consumer_key" type="text" size="30" value="{$twitter_consumer_key}"></p>
	<p>Consumer secret:<br><input name="twitter_consumer_secret" type="text" size="30" value="{$twitter_consumer_secret}"></p>
	<p><input type="submit" value="Absenden"></p>
</form>

<h2>Twitter Account</h2>
<form action="./config.php?section=insert_edit_twitter_username" method="POST">
	<p>Twitter Nickname:<br><input name="twitter_username" type="text" size="30" value="{$twitter_username}"></p>
	<p><input type="submit" value="Absenden"></p>
</form>

<h2>Twitter Token holen</h2>
<form action="./config.php?section=get_twitter_token" method="POST">
	<p><input type="submit" value="Token holen"></p>
</form>