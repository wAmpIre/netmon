<script language="JavaScript">
<!--
function Uhr_anzeigen(){
var Datum = new Date()
var std = Datum.getHours()
var min = Datum.getMinutes()
var sec = Datum.getSeconds()
Zeit = ((std < 10) ? " 0" : " ") + std
Zeit += ((min < 10) ? ":0" : ":") + min
Zeit += ((sec < 10) ? ":0" : ":") + sec
Zeit += " Uhr"
document.uhr.zeit.value = Zeit

timerid = setTimeout("Uhr_anzeigen()",1000)
}
// -->
</script>
<form name="uhr">
<input type="text" name="zeit" size=10 value ="">
</form>
<script language="javascript">
//<!--
Uhr_anzeigen();
//-->
</script>


<h1>News</h1>

{if empty($rss_exception)}
	<h1><a href="{$feed_channels.ID}" target="_blank">{$feed_channels.TITLE} (letztes Update: {$feed_channels.UPDATED|date_format:"%e.%m.%Y"})</a></h1>
	{foreach item=feed_item from=$feed_items}
		<h2><a href="{$feed_item.ID}" target="_blank">{$feed_item.TITLE}</a></h2>
		<p>{$feed_item.SUMMARY}</p>
		<p>{$feed_item.AUTHOR.NAME} am {$feed_item.UPDATED|date_format:"%e.%m.%Y %H:%M"}</p> 
	{/foreach}
{else}
	<h1>Freifunk Oldenburg Blog</h1>
	<p>{$rss_exception}</p>
{/if}
<!--
{if empty($trac_rss_exception)}
	<h1><a href="{$trac_feed_channels.LINK}" target="_blank">Freifunk Oldenburg Trac Timeline</a></h1>
	<p>
		{foreach item=trac_feed_item from=$trac_feed_items}
			{$trac_feed_item.PUBDATE|date_format:"%e.%m.%Y %H:%M"}: <a href="{$trac_feed_item.LINK}" target="_blank">{$trac_feed_item.TITLE}</a><br>
		{/foreach}
	</p>
{else}
	<h1>Freifunk Oldenburg Trac Timeline</h1>
	<p>{$trac_rss_exception}</p>
{/if}-->