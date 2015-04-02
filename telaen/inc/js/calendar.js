function doDays() {
	var grrr = navigator.userAgent.indexOf("MSIE")>-1;
	var tds = document.getElementById("calendar").getElementsByTagName("td");
	for (var i=0; i<tds.length; i++) {
		if (tds[i].className=="regday" || tds[i].className=="today" || tds[i].className=="evt" || tds[i].className=="tevt") {
			tds[i].onclick = epop(tds[i].id);
		}
		if (tds[i].className=="evt" || tds[i].className=="tevt") {
			var einfo = document.getElementById("e" + tds[i].id.substring(1));
			if (grrr && einfo!=null) {
				tds[i].onmouseover = function() {
					document.getElementById("e" + this.id.substring(1)).style.display = "block";
				};
				tds[i].onmouseout = function() {
					document.getElementById("e" + this.id.substring(1)).style.display = "none";
				};
				einfo.onmouseover = function() {
					document.getElementById(this.id).style.display = "block";
				};
				einfo.onmouseout = function() {
					document.getElementById(this.id).style.display = "none";
				};
			}
		}
	}
}

function epop(id) {
	var url = "./event.php?edate=" + id;
	window.open(url, "Event", "width=500, height=550, scrollbars=1, resizable=1");
	return false;
}

function replaceCal(month, year) {
    $.post('ajax.php', {action: "replaceCal", cal_month: month, cal_year: year },
    function(data) {
        $("#calendar").html(data);
        //doDays();
    });
    return false;
}

function refreshParent() {
	window.opener.location.reload();

	if (window.opener.eventWindow) {
		window.opener.eventWindow.close()
	}
  window.close();
}
