<?php 

$original_cont= file_get_contents('test.txt');
$rule_value = "//*[@class='user-html']" ;
//$rule_value = '//*[contains(concat( " ", @class, " " ), concat( " ", "-spacing-small", " " ))]' ; // comments
$rule_value = "/html/body/div[1]/div[3]/div[1]/div[2]/div[3]/div/div[2]/div[5]/div[1]/div";

require_once 'inc/class.dom.php';
$wpAutomaticDom = new wpAutomaticDom($original_cont);
print_r( $wpAutomaticDom->getContentByXPath($rule_value,false) );
//print_r( $wpAutomaticDom->getContentByID('content') );
//print_r( $wpAutomaticDom->getTheTitle() );
//print_r( $wpAutomaticDom->getFullContent() );



?>