{config_load file=$umLanguageFile section="Newmessage"}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset={$umLabel.default_char_set}">
<title>UebiMiau Webmail &copy 2003 - Skin by Beauvoir.net</title>
<link rel="stylesheet" href="themes/beauvoir/webmail.css" type="text/css">
<script language="JavaScript" src="themes/uebimiau/webmail.js" type="text/javascript"></script>
{$umJS}
</head>
<!--
Skinned by Arnaud BEAUVOIR -  - 

Thank you to let the copyright in place on the login page and in all sources of pages.
This skin is the work of an author, thank you to respect it and not to remove the
copyright, or worse, to put your name at the place.
-->
<body>
<br><br>
<table width="750" border="0" cellspacing="1" cellpadding="0" class="normal" align="center" bgcolor="#999999">
	<tr>
		<td align="center"><img src="themes/beauvoir/logo.gif" border="0" alt="Beauvoir Skin"></td>
	</tr>
</table>
<br><br>
<table width="750" border="0" cellspacing="1" cellpadding="0" class="normal" align="center" bgcolor="#999999">
	<tr>
		<form name="composeForm" method="post" action="newmsg.php" onSubmit="return false;">
		{$umForms}
		<td valign="middle">
			<table cellspacing="0" cellpadding="0" width="100%" border="0" class="normal" >
				<tr><td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="84" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:goinbox()"><img src="themes/beauvoir/inbox.gif" border="0" width="31" height="31"><br>{$umLabel.messages_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="84"><img src="themes/beauvoir/write.gif" border="0" width="31" height="31"><br><font class="inactive">{$umLabel.compose_mnu}</font></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="84"><img src="themes/beauvoir/refresh.gif" border="0" width="31" height="31"><br><font class="inactive">{$umLabel.refresh_mnu}</font></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:folderlist()"><img src="themes/beauvoir/folder.gif" border="0" width="31" height="31"><br>{$umLabel.folders_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:search()"><img src="themes/beauvoir/search.gif" border="0" width="31" height="31"><br>{$umLabel.search_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:addresses()"><img src="themes/beauvoir/contact.gif" border="0" width="31" height="31"><br>{$umLabel.address_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:emptytrash()"><img src="themes/beauvoir/trash.gif" border="0" width="31" height="31"><br>{$umLabel.empty_trash_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:prefs()"><img src="themes/beauvoir/prefs.gif" border="0" width="31" height="31"><br>{$umLabel.prefs_mnu}</a></td>
				<td align="center" valign="middle" bgcolor="#EAEAEA" height="70" width="83" onmouseover="mOvr(this,'#ACB6D1');" onmouseout="mOut(this,'#EAEAEA');" onclick="mClk(this);"><a href="javascript:goend()"><img src="themes/beauvoir/logout.gif" border="0" width="31" height="31"><br>{$umLabel.logoff_mnu}</a></td></tr>
			</table>		
		</td>
	</tr>
	<tr>
		<td valign="center">
			<table cellspacing="1" cellpadding="0" width="100%" border="0" class="normal" bgcolor="#F5F4F4">
			<tr>
				<td height="20">&nbsp;</td>
			</tr>
			{if $umMailSent}
				<tr align="center">
					<td>{$umLabel.result_success}<br><br>> <a href="messages.php?sid={$umSid}&tid={$umTid}&lid={$umLid}">{$umLabel.nav_continue}</a> <</td>
				</tr>
			{else}
				<tr>
					<td align="center">{$umLabel.result_error}<br><br><font class="error">{$umErrorMessage}</font><br><br>> <a href="javascript:history.go(-1)">{$umLabel.nav_back}</a> <</td>
				</tr>
			{/if}
			<tr>
				<td height="20">&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	</tr>
	<tr>
		<td align="center" bgcolor="#EAEAEA" height="30">
		<font class="normal">Webmail powered by <a href="http://uebimiau.sourceforge.net" target="_blank">Uebimiau</a> - Skinned by <a href="" target="_blank">Beauvoir</a></font>
		</td>
	</tr>
</table>
<br><br>
</body>
</html> 