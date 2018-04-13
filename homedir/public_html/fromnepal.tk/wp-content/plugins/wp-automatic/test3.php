<?php 

register_shutdown_function( "fatal_handler" );

function fatal_handler() {
	$errfile = "unknown file";
	$errstr  = "shutdown";
	$errno   = E_CORE_ERROR;
	$errline = 0;

	$error = error_get_last();
	
	print_r($error);
 
}

require_once 'inc/class.dom.php';

$wpAutomaticDom = new wpAutomaticDom(file_get_contents('test.txt'));

$regexMatchs = $wpAutomaticDom->getContentByXPath("//*[@class='user-html']");

print_r($regexMatchs);


?>