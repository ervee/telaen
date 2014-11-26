<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>{if $webmailTitle}{$webmailTitle} - {/if}{$umLabel.adr_title}</title>
<meta http-equiv="Content-Type" content="text/html; charset={$umLabel.default_char_set}">
{$pageMetas}
	{$umJS}
</head>
<link rel="stylesheet" href="themes/outlook/webmail.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset={$umLabel.default_char_set}">
<script language="JavaScript" src="themes/outlook/webmail.js" type="text/javascript"></script>
{$umJS}

<body>
<iframe id="process" name="process" style="display:none;"></iframe>
<form name='form1' method='post' action='addressbook.php' target='process'>
<input type=hidden name=sid value="{$umSid}">
<input type=hidden name=id value="{$umAddrID}">
<input type=hidden name=lid value="{$umLid}">
<input type=hidden name=tid value="{$umTid}">
<input type=hidden name=opt value="{$umOpt}">
<table width='100%' cellspacing=2 cellpadding=0 class='window_inner'>
  <tr>
    <td><table width='100%' cellpadding='0' cellspacing='0'>
        <tr>
          <td class="window_title"><img src='themes/outlook/images/icon_ab.gif'></td>
          <td width='100%' class="window_title">&nbsp;{if $umAddrID=='N'}{$umLabel.adr_new_entry}{else}{$umLabel.adr_title}{/if}</td>
          <td class='window_title_X'><a href='{$umGoBack}'><img border='0' src='themes/outlook/images/X.png'></a></td>
        </tr>
      </table>
      <table width='100%' cellpadding='0' cellspacing='0'>
        <tr>
          <td height=30 valign='bottom'><table width='100%' cellpadding='0' cellspacing='0'>
              <tr>
                <td id="tab_info" class="tab_info_visible"><table cellpadding='0' cellspacing='0'>
                    <tr>
                      <td><img src="themes/outlook/images/tab_left.gif"></td>
                      <td background="themes/outlook/images/tab_middle.gif" onclick="info.className='tab_visible';edit.className='tab_hidden';tab_info.className='tab_info_visible';tab_edit.className='tab_info_hidden'"><nobr><font class='xx-normal'>&nbsp;{$umLabel.adr_name_hea}&nbsp;</font></nobr></td>
                      <td><img src="themes/outlook/images/tab_right.gif"></td>
                    </tr>
                  </table></td>
                <td id="tab_edit" class="tab_info_hidden"><table cellpadding='0' cellspacing='0'>
                    <tr>
                      <td><img src="themes/outlook/images/tab_left.gif"></td>
                      <td background="themes/outlook/images/tab_middle.gif" onclick="info.className='tab_hidden';edit.className='tab_visible';tab_info.className='tab_info_hidden';tab_edit.className='tab_info_visible'"><nobr><font class='xx-normal'>&nbsp;{$umLabel.adr_edit_hea}&nbsp;</font></nobr></td>
                      <td><img src="themes/outlook/images/tab_right.gif"></td>
                    </tr>
                  </table></td>
                <td class="tab_blank" width='100%'>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width='100%' cellpadding='15' cellspacing='0' class="tab">
        <tr>
          <td width='100%' height='200'><div id="info" class="tab_visible">
              <fieldset>
                <table  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_name}:</td>
                    <td   class="label">&nbsp;{$umAddrName|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_email}:</td>
                    <td  class="label">&nbsp;{$umAddrEmail|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_street}:</td>
                    <td class="label">&nbsp;{$umAddrStreet|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_city}:</td>
                    <td   class="label">&nbsp;{$umAddrCity|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_state}:</td>
                    <td  class="label">&nbsp;{$umAddrState|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_work}:</td>
                    <td   class="label">&nbsp;{$umAddrWork|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_phone}:</td>
                    <td   class="label">&nbsp;{$umAddrPhone|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_cell}:</td>
                    <td   class="label">&nbsp;{$umAddrCell|escape:"html"}</td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_note}:</td>
                    <td   class="label">&nbsp;{$umAddrNote|escape:"html"}</td>
                  </tr>
                </table>
              </fieldset>
            </div>
            <div id="edit" class="tab_hidden">
              <fieldset>
                <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_name}:</td>
                    <td><input type=text name="name" value="{$umAddrName|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_email}:</td>
                    <td><input type=text name="email" value="{$umAddrEmail|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_street}:</td>
                    <td><input type=text name="street" value="{$umAddrStreet|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_city}:</td>
                    <td><input type=text name="city" value="{$umAddrCity|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_state}:</td>
                    <td><input type=text name="state" value="{$umAddrState|escape:"html"}" class="textbox" maxlength=2></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_work}:</td>
                    <td><input type=text name="work" value="{$umAddrWork|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_phone}:</td>
                    <td><input type=text name="phone" value="{$umAddrPhone|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_cell}:</td>
                    <td><input type=text name="cell" value="{$umAddrCell|escape:"html"}" class="textbox"></td>
                  </tr>
                  <tr>
                    <td class="label" align='right'>{$umLabel.adr_note}:</td>
                    <td><textarea type=text name="note" class="textbox">{$umAddrNote|escape:"html"}</textarea></td>
                  </tr>
                </table>
              </fieldset>
            </div></td>
        </tr>
        <tr>
          <td align='left'><input type=submit value="{$umLabel.adr_save}" class=button>
            <input type=button value="{$umLabel.adr_back}" class=button onClick="location = '{$umGoBack}'"></td>
        </tr>
      </table></td>
  </tr>
</table>
{if $umAddrID=='N'} 
<script language="JavaScript">

    info.className='tab_hidden';edit.className='tab_visible';tab_info.className='tab_info_hidden';tab_edit.className='tab_info_visible'
 </script> 
{/if}
</body>
</html>