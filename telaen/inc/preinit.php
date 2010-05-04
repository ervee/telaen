<?php
/************************************************************************
Telaen is a GPL'ed software developed by 

 - The Telaen Group
 - http://www.telaen.com/

*************************************************************************/

/*
 * This module takes care of setting and/or initializing
 * various aspects of Telaen that should be universal.
 */

umask($default_umask);

$error_flags = E_ALL & ~E_NOTICE;

// set the error reporting, normally they are turned off
// but sometimes are useful for debugging 
if(isset($show_errors) && $show_errors) {
	@error_reporting($error_flags);
	@ini_set('error_reporting', $error_flags);
	@ini_set('display_errors', 1);
} else {
	@error_reporting(0);
	@ini_set('display_errors', 0); 
}

//$old_error_handler = set_error_handler("err_handler");

@set_magic_quotes_runtime(0);			// Smarty and magic_quotes_runtime ON do not mix.

$phpver = phpversion();
$phpver = doubleval($phpver[0].".".$phpver[2]);

/*
 * "emulate" register_globals ON
 */
// extract($_SERVER,EXTR_SKIP);
extract($_POST,EXTR_SKIP);
extract($_GET,EXTR_SKIP);
extract($_FILES);

$textout = <<<EOF
<!-- Page generated by Telaen (http://www.telaen.com/) -->
EOF;

if(!isset($pag)) $pag = 1;


define("FL_TYPE_MOVE", 1);
define("FL_TYPE_DELETE", 2);
define("FL_TYPE_MARK_READ", 4);

define("FL_FIELD_FROM", 1);
define("FL_FIELD_SUBJECT", 2);
define("FL_FIELD_TO", 4);

?>
