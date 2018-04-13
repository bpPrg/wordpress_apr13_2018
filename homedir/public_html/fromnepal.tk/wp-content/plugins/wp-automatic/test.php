<?php

$original_cont= file_get_contents('test.txt');
$rule_value = "//*[@class='user-html']" ;
$rule_value = '//*[@id="content"]/div/div[2]/div[4]/div[1]/div'; //chrome
$rule_value = '//div[@id="content"]/div[contains(concat (" ", normalize-space(@class), " "), " grid-container ")]/div[2][contains(concat (" ", normalize-space(@class), " "), " sidebar-l sidebar-right ")]/div[4][contains(concat (" ", normalize-space(@class), " "), " sidebar-stats ")]/div[1][contains(concat (" ", normalize-space(@class), " "), " sidebar-stats__item ")]/div[contains(concat (" ", normalize-space(@class), " "), " box -radius-all -spacing-small ")] | //html/body/div[1]/div[3]/div[1]/div[2]/div[3]/div/div[2]/div[4]/div[1]/div';
$rule_value = '//*[contains(concat( " ", @class, " " ), concat( " ", "-spacing-small", " " ))]';
$rule_value = '//*[contains(concat( " ", @class, " " ), concat( " ", "sidebar-stats__item", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]//*[contains(concat( " ", @class, " " ), concat( " ", "-spacing-small", " " ))]';

$rule_value = '//*[contains(concat( " ", @class, " " ), concat( " ", "-spacing-small", " " ))]' ; // comments
$rule_value = "//html/body/div[4]/article/div/div[1]/div/div/div[1]/div";
$rule_value = "//*[@class='article-entry text']";
$rule_value = '//*[contains(concat (" ", normalize-space(@class), " "), "article-entry")]';



/*
require_once 'inc/sxmldom_simple_html_dom.php';
$original_html_author = sxmldom_str_get_html($original_cont);
$ret=$original_html_author->find($rule_value);

$extract='';

foreach ($ret as $itm ) {
	
	if( 0 ){
		$extract = $extract . $itm->innertext ;
	}else{
		$extract = $extract . $itm->outertext ;
	}
	 
	
}

echo $extract;
exit;*/

// Dom object
$doc = new DOMDocument;

// Load Dom
@$doc->loadHTML($original_cont);

// xPath object
$xpath = new DOMXPath($doc);

$xpathMatches = $xpath->query("$rule_value");
 
/*
foreach ($xpathMatches as $xpathMatch){
	$rule_result.=  $xpathMatch->nodeValue;
}

echo $rule_result;
*/

foreach ($xpathMatches as $element) {
	echo "<br/>[". $element->nodeName. "]";
	
	$nodes = $element->childNodes;
	foreach ($nodes as $node) {
		echo $doc->saveHTML($node). "\n";
	}
}

?>