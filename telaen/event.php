<?php
/************************************************************************
Telaen is a GPL'ed software developed by

 - The Telaen Group
 - http://jimjag.github.io/telaen/

*************************************************************************/
define('I_AM_TELAEN', basename($_SERVER['SCRIPT_NAME']));

require './inc/init.php';
/* @var $TLN Telaen */

extract(Telaen::pullFromArray($_GET, ['edate'], 'str'));
extract(Telaen::pullFromArray($_POST, ['eventn', 'edate', 'evsave', 'evdelete', 'starthour', 'stophour', 'startmin', 'stopmin'], 'str'));

$etext = Telaen::caster($_POST["etext_{$eventn}"], "s");

list(, $foo, $dayuid) = explode('_', $edate);
$year = intval(substr($foo, 0, 4));
$month = intval(substr($foo, 4, 2));
$day = intval(substr($foo, 6, 2));
$ymd = sprintf('%4s%02s%02s', $year, $month, $day);
$eventuid = $ymd.'_'.$dayuid;
$newevent = array($ymd.'_0', $ymd.'T090000', $ymd.'T100000', '-- new event --', '09', '00', '10', '00');
$event = array();
$actionDone = false;
// Minor error-check
if ($year > 2009 && $year < 2050 && $month > 0 && $month <  13 && $day > 0 && $day < 32) {
    /*
     * Grab the event array and event, if any, for this date
     */
    $events = new MyMonth($TLN->userdatafolder, $TLN->dirperm, $year, $month);
    $event = $events->getEvent($day);

    if (isset($evdelete) && $dayuid) {
        $events->delEvent($eventuid);
        $events->saveEvents();
        $actionDone = true;
    }
    if (isset($evsave) && $etext) {
        $starttime = sprintf('%02s%02s00', $starthour, $startmin);
        $stoptime = sprintf('%02s%02s00', $stophour, $stopmin);
        // Clean it when we store it
        $etext = Telaen::sanitizeHTML($etext);
        $events->setEvent($day, $starttime, $stoptime, $etext, $dayuid);
        $events->saveEvents();
        $actionDone = true;
    }
} else {
    /* if out of bounds, just ignore */
    $actionDone = true;
}

$jssource .= <<<EOT
	<script type="text/javascript" src="./inc/js/calendar.js"></script>
	<script type="text/javascript" src="inc/editors/tinymce/tinymce.gzip.js"></script>
	<script type="text/javascript" src="inc/editors/tinymce/tiny_e_init.js"></script>
EOT;

$smarty->assign('pageMetas', $pmetas);
$smarty->assign('smJS', $jssource);

if ($actionDone) {
    $smarty->assign('smShowEventForm', 'NO');
} else {
    $event[] = $newevent;    // tack on new event at bottom of list
    $timestamp = mktime(0, 0, 0, $month, 1, 2010);
    $mdate = ':: &nbsp;&nbsp; '.date('M', $timestamp)." $day, $year &nbsp;&nbsp; ::<br/>";
    $smarty->assign('smEvent', $event);
    $smarty->assign('smShowEventForm', 'YES');
    $smarty->assign('smEventHeader', $mdate);
    $smarty->assign('mins', array('00', '05', 10, 15, 20, 25, 30, 35, 40, 45, 50, 55));
    $smarty->assign('hours', array('00', '01', '02', '03', '04', '05', '06', '07', '08', '09', 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23));
    $smarty->assign('dhours', array('12 am', '1 am', '2 am', '3 am', '4 am', '5 am', '6 am', '7 am', '8 am', '9 am', '10 am', '11 am',
        '12 pm', '1 pm', '2 pm', '3 pm', '4 pm', '5 pm', '6 pm', '7 pm', '8 pm', '9 pm', '10 pm', '11 pm', ));
}
unset($events);

$smarty->assign('webmailTitle', $TLN->config['webmail_title']);
$smarty->assign('smCCList', $TLN->config['webmail_title']);
$smarty->display("$themez/event.tpl");
