{config_load file=$umLanguageFile section="Newmessage"}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>sentiMail - Write Email</title>
	<link rel="stylesheet" href="inc/themes/senti/webmail.css" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset={$smLabel.default_char_set}">
	<script language="JavaScript" src="inc/themes/senti/webmail.js" type="text/javascript"></script>

{$smJS}

</head>

{if $smAdvancedEditor eq 1}
	<div id="hiddenCompose" style="position: absolute; left: 3; top: -100; visibility: hidden; z-index: 3">	      
	<form name="hiddencomposeForm">
	<textarea name="hiddencomposeFormTextArea">{$smBody|escape:"html"}</textarea>
	</form>
	</div>
{/if}

<body>
<body><br><br>
<table width="760" height="400" border="0" cellpadding="0" cellspacing="0" align="center">
		<form name=composeForm method=post action="newmsg.php" onSubmit="return false;">
		{$smForms}
	<tr valign="bottom">
		<td height="61">
			<img src="inc/themes/senti/images/mail_01.gif" width="18" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:goinbox()"><img src="inc/themes/senti/images/inbox.gif" width="60" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_03.gif" width="33" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:newmsg()"><img src="inc/themes/senti/images/write_selected.gif" width="85" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_05.gif" width="32" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:folderlist()"><img src="inc/themes/senti/images/folders.gif" width="72" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_07.gif" width="36" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:search()"><img src="inc/themes/senti/images/search.gif" width="74" height="61" alt="" border="0"></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_09.gif" width="27" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:addresses()"><img src="inc/themes/senti/images/addresses.gif" width="89" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_11.gif" width="28" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:prefs()"><img src="inc/themes/senti/images/preferences.gif" width="88" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_13.gif" width="31" height="61" alt=""></td>
		<td>
			<a class="menu" href="javascript:goend()"><img src="inc/themes/senti/images/logout.gif" width="70" height="61" border="0" alt=""></a></td>
		<td>
			<img src="inc/themes/senti/images/mail_15.gif" width="17" height="61" alt=""></td>
	</tr>
	<tr><TD width="18"><img src="inc/themes/senti/images/leftside.gif" width="18" height="100%"></TD>
		<td colspan="13" bgcolor="#dddcdc"><br /><br />
			<table width="100%" border=0 cellspacing=0 cellpadding=5 >
				<tr bgcolor=white>
					<td width="26%" height="18" class="headerright">{$smLabel.to_hea} &nbsp;<a href="javascript:addrpopup()"><img src="inc/themes/senti/images/bookmark_it.gif" width="15" height="12" border="0" alt="<!--%address_tip%-->"></a> &nbsp;</td>
					<td class="default">&nbsp;{$smTo}</td>
				</tr>	
				<tr bgcolor=white>
					<td height="18" class="headerright">{$smLabel.cc_hea} &nbsp;<a href="javascript:addrpopup()"><img src="inc/themes/senti/images/bookmark_it.gif" width="15" height="12" border="0" alt="<!--%address_tip%-->"></a> &nbsp;</td>
					<td class="default">&nbsp;{$smCc}</td>
				</tr>	
				<tr bgcolor=white>
					<td height="18" class="headerright">{$smLabel.bcc_hea} &nbsp;<a href="javascript:addrpopup()"><img src="inc/themes/senti/images/bookmark_it.gif" width="15" height="12" border="0" alt="<!--%address_tip%-->"></a> &nbsp;</td>
					<td class="default">&nbsp;{$smBcc}</td>
				</tr>	

				<tr bgcolor=white>
					<td height="18" class="headerright">{$smLabel.subject_hea} &nbsp;</td>
					<td class="default">&nbsp;{$smSubject}</td>
				</tr>	

				<tr>
					<td height="18" class="headerright">{$smLabel.attach_hea}</td>
					<TD>	<table height="100%" width="100%" border=0 cellspacing=0 cellpadding=0>
							{if $smHaveAttachs eq 1}
								<tr width="100%" height="50%">
									<td width="50%" class="header">{$smLabel.attch_name_hea}</td>
									<td width="10%" class="header">{$smLabel.attch_size} &nbsp;</td>
									<td width="30%" class="header">{$smLabel.attch_type_hea}</td>
									<td width="10%" class="header">{$smLabel.attch_dele_hea}</td>
								</tr>

								{section name=i loop=$smAttachList}
									<tr width="100%" height="50%">
										<td width="50%" class="default"> &nbsp;{$smAttachList[i].name|escape:"html"}</td>
										<td width="10%" class="default">{$smAttachList[i].size}Kb&nbsp;</td>
										<td width="30%" class="default"> &nbsp;{$smAttachList[i].type|truncate:23:"...":true}</td>
										<td width="10%" class="default"> &nbsp;<a href="{$smAttachList[i].link}">OK</a></td>
									</tr>
								{/section}
							{else}							
								<tr>
									<td width="100%" class="header" colspan=3> &nbsp;{$smLabel.attch_no_hea}</td>
								</tr>
							{/if}
						</table>
						<table width="100%" border=0 cellspacing=1 cellpadding=0>
							<tr>
								<td width="100%" class="default">&nbsp;<a href="javascript:upwin()" class="navigation"><img src="inc/themes/senti/images/attach.gif"  alt="" border="0">&nbsp;&nbsp;{$smLabel.attch_add_new}</a></td>
							</tr>
						</table>
					</TD>
				</tr>	
				<tr>
					<td class="default">&nbsp;</td>
					<td class="default">
					{if $smAdvancedEditor eq 1}
						{include file="senti/advanced-editor.tpl"}
						<div id="hiddenCompose2" style="position: absolute; left: 3; top: -100; visibility: hidden; z-index: 3">	      
							<textarea cols=50 rows=15 name=body>{$smBody|escape:"html"}</textarea>
						</div>
					{else}
						<textarea cols=50 rows=15 name=body>{$smBody|escape:"html"}</textarea>
					{/if}

					</td>
				</tr>

				{if !$smAddSignature && $smHaveSignature}
				<tr>
					<td  class="headerright">{$smLabel.add_signature} &nbsp;</td>
					<td class="default"><input type=checkbox name=cksig onClick="return addsig()"{if $smAddSignature eq 1} checked disabled{/if}></td>
				</tr>
				{/if}

				<tr>
					<td  class="headerright">{$smLabel.priority_text} &nbsp;</td>
					<td class="default">
						<select name="priority">
							<option value="1"{if $smPriority eq 1} selected{/if}>{$smLabel.priority_high}
							<option value="3"{if $smPriority eq 3} selected{/if}>{$smLabel.priority_normal}
							<option value="5"{if $smPriority eq 5} selected{/if}>{$smLabel.priority_low}
						</select>
					</td>
				</tr>

				<tr>
					<td class="default">&nbsp;</td>
					<td class="default"><input type=button name=bt_enviar value="{$smLabel.send_text}" onClick=enviar() class=button></td>
				</tr>	
			</table>
		</td>
	<TD width="17"><img src="inc/themes/senti/images/rightside.gif" width="17" height="100%"></TD>	</form>
	</tr>
	<tr>
		<td colspan="15" valign="top" height="25">
			<img src="inc/themes/senti/images/footer.gif" width="760" height="25" alt=""></td>
	</tr>
</table>
</body>
</html>
