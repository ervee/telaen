<?php

/************************************************************************
Telaen is a GPL'ed software developed by 

 - The Telaen Group
 - http://www.telaen.com/

*************************************************************************/

class MyMonth {
	var $_month = 0;
	var $_year = 0;
	var $_mymonth;
	var $_firstday;
	var $_lastday;
	var $_today;
	var $_pmonth;
	var $_pyear;
	var $_nmonth;
	var $_nyear;
	var $_edir;
	var $_vcal;

	function MyMonth($year=0, $month=0) {
		global $UM, $userfolder;
		if (($month <= 0) || ($month >= 13) || ($year <= 2009) || $year >= 2050){
			$this->_mymonth	= getdate();
			$month = $this->_mymonth['mon'];
			$year = $this->_mymonth['year'];
		} else {
			$this->_mymonth	= getdate(mktime(0,0,0,$month,1,$year));
		}
		$fom = gmmktime(0,0,0,$this->_mymonth['mon'],1,$this->_mymonth['year']);
		$wd = explode(',',gmstrftime('%m,%Y,%B,%w',$fom));
		$this->_firstday = $wd[3];
		$this->_lastday = gmdate('t',$fom);
		$this->_today = getdate();
		$this->_month = intval($month);
		$this->_year = intval($year);
		$this->_pyear = $this->_nyear = $this->_year;
		$this->_pmonth = $this->_month - 1;
		if ($this->_pmonth <= 0) {
			$this->_pmonth = 12;
			$this->_pyear--;
		}
		$this->_nmonth = $this->_month + 1;
		if ($this->_nmonth >= 13) {
			$this->_nmonth = 1;
			$this->_nyear++;
		}
		$this->_edir = $userfolder."_infos/calendar/{$this->_year}/{$this->_month}";
		$this->_vcal = new vcalendar();
		$this->_vcal->setConfig( "unique_id", "Telaen" );
		$this->_vcal->setConfig( "directory", $this->_edir );
		$this->_vcal->setConfig( "filename",  "events.ics" );
		$this->_vcal->parse();
		$this->_vcal->sort();
	}

	function monthAsTable() {
		$ret = <<<EOT
<table class="month"><tr>
  <th class="week" onclick="replaceCal({$this->_pmonth}, {$this->_pyear});"> &laquo; </th>
  <th class="week" onclick="replaceCal({$this->_today["mon"]}, {$this->_today["year"]});" colspan="5"> {$this->_mymonth["month"]} - {$this->_mymonth["year"]} </th>
  <th class="week" onclick="replaceCal({$this->_nmonth}, {$this->_nyear});"> &raquo; </th>\n</tr>
  <tr class="days"><td>Su</td><td>Mo</td><td>Tu</td><td>We</td><td>Th</td><td>Fr</td><td>Sa</td></tr>
EOT;
		if (($this->_today["mon"] == $this->_month) && ($this->_today["year"] == $this->_year))
			$today = $this->_today["mday"];
		else
			$today = -1;

		$weekday = $this->_firstday;
		$ret .= "<tr>";
		if($weekday > 0) $ret .= "<td class=\"blankday\" colspan=\"{$weekday}\">&nbsp;</td>";
		for($day=1; $day<=$this->_lastday; $day++,$weekday++){
			if($weekday == 7) {
				$weekday = 0;
				$ret .= "</tr>\n<tr>";
			}
			$dclass = "regday";
			if ($day == $today)
				$dclass = "today";
			$fullevent = "";
			$event = $this->getEvent($day);
			if ($event) {
				$dclass = "evt";
				if ($day == $today)
					$dclass = "tevt";
				$fullevent = "<div class=\"einfo\">| {$this->_mymonth['month']} {$day}, {$this->_year} |<hr/>";
				foreach ($event as $foo) {
					$fullevent .= "<div id=\"e_{$foo[0]}\">";
					$fullevent .= "<div class=\"starttime\">Start: &nbsp;" . $foo[1] . "</div><br/>";
					$fullevent .= "<div class=\"stoptime\">Stop: &nbsp;" . $foo[2] . "</div><br/>";
					$fullevent .= $foo[3] . "</div><hr/>";
				}
				$fullevent .= "</div>";
			}
			$sday = sprintf("%2d", $day);
			$ret .= "<td id=\"d_{$this->_year}_{$this->_month}_{$sday}\" class=\"{$dclass}\"> $day $fullevent </td>";
		}
		if($weekday != 7) $ret .= "<td class=\"blankday\" colspan=".(7-$weekday).">&nbsp;</td>";
		$ret .= "</tr>\n</table>";
		return $ret;
	}

	function showMonthAsTable() {
		echo $this->monthAsTable();
	}

	function monthAsDiv() {
		$end = <<<EOT
</div>
<script type="text/javascript">
//<![CDATA[
	doDays();
//]]>
</script>
EOT;
		$ret = "<script type=\"text/javascript\" src=\"./js/calendar.js\"></script>\n<div id=\"calendar\">" . $this->monthAsTable() . $end;
		return $ret;
	}

	function showMonthAsDiv() {
		echo $this->monthAsDiv();
	}

	function saveEvents() {
		@mkdir($this->_edir, 0750, true);
		$this->_vcal->saveCalendar();
	}

	function getEvent($day) {
		$reta = Array();
		$this->_vcal->sort();
		$foo = $this->_vcal->selectComponents($this->_year, $this->_month, $day);
		foreach ($foo as $bar) {
			$dtstart = date("g:i a", strtotime($bar->getProperty("dtstart")));
			$dtend = date("g:i a", strtotime($bar->getProperty("dtend")));
			$reta[] = Array($bar->getProperty("uid"), $dtstart, $dtend, $bar->getProperty("description"));
		}
		return $reta;
	}

	function setEvent($day, $start, $stop, $val, $uid="") {
		if ($uid) {
			$this->delEvent($uid);	// just simpler
		}
		$uid = md5($day.$start.$stop.uniqid());
		$v = new vevent();
		$v->setProperty("dtstart", $this->_year.$this->_month.$day."T".$start);
		$v->setProperty("dtend", $this->_year.$this->_month.$day."T".$stop);
		$v->setProperty("uid", uid);
		$v->setProperty("description", $val);
		$this->_vcal->setComponent($v);
	}

	function delEvent($uid) {
		return $this->_vcal->deleteComponent($uid);
	}

}
?>
