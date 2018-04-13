<?php
/**
 * class:wpAutomaticDom to extract content from html using class, id, regex or xpath
 * @author ValvePress
 * @version:1.0.0
 */
 
class wpAutomaticDom {
	
	public $html;
	public $doc;
	
	function __construct($html){
		
		$this->html = $html;
		$this->doc  =  new DOMDocument;
		
		try {
			$this->doc->loadHTML($html);
		} catch (Exception $e) {
			throw new Exception('Failed to load the Document as a Dom');
		}
		
	}
	
	/**
	 * Get content from the dom using an XPath
	 * @param string $xpath
	 * @return string[]
	 */
	function getContentByXPath($xpath,$inner=true){
		
		// xPath object
		$xpathObj = new DOMXPath($this->doc);
		$xpathMatches = $xpathObj->query("$xpath");

		$allMatchs= array();
		
		foreach ($xpathMatches as $element) {
		 	
			
		   $matchHtml = ''; // single match html
				
			
		   if($inner){

		   	$nodes = $element->childNodes;
			foreach ($nodes as $node) {
				$matchHtml.=  $this->doc->saveHTML($node). "\n";
			}
			
		   }else{
		   	 $matchHtml =  $this->doc->saveHTML($element);
		   }
			
			$allMatchs[] = $matchHtml;
			
		}
		
		return $allMatchs;
		
	}
	
	/**
	 * Get content from dom using class name
	 * @param string $className
	 * @return string[]
	 */
	function getContentByClass($className,$inner=true){
		$className = trim($className) ;
		$XPath= '//*[contains(concat (" ", normalize-space(@class), " "), "'.$className.'")]';
		return $this->getContentByXPath($XPath,$inner) ;
	}
	
	/**
	 * Get content from dom using id
	 * @param string $id
	 * @return string[]
	 */
	function getContentByID($id,$inner=true){
		$id=trim($id);
		$XPath = "//*[@id='$id']" ;
		return $this->getContentByXPath($XPath,$inner) ;
	}	
	
	/**
	 * Get default title from title tag or h1 tag 
	 * @return string the title
	 */
	function getTheTitle(){
		
		//return title from title tag
		preg_match('{<title>(.*?)</title>}s', $this->html,$titleMatchs);
		$possibleTitle = $titleMatchs[1];
		if(trim($possibleTitle) != '' ) return trim($possibleTitle); 
		
		//get from h1
		preg_match('{<h1.*?>(.*?)</h1>}s', $this->html,$titleMatchs);
		$possibleTitle = $titleMatchs[1];
		if(trim($possibleTitle) != '' ) return trim($possibleTitle);
		
		//default empty
		return '';
		
	}
	

	function getFullContent(){
		
		//readability
		require_once 'wp_automatic_readability/wp_automatic_Readability.php';
		$wp_automatic_Readability = new wp_automatic_Readability ( $this->html );
		
		$wp_automatic_Readability->debug = false;
		$result = $wp_automatic_Readability->init ();
		
		if ($result) {
			
			// Redability Content
			$content = $wp_automatic_Readability->getContent ()->innerHTML;
			
			// Remove  wp_automatic_Readability attributes
			$content = preg_replace('{ wp_automatic_Readability\=".*?"}s', '', $content);
			
			// Fix iframe if exists
			preg_match_all('{<iframe[^<]*/>}s', $content,$ifrMatches);
			$iframesFound = $ifrMatches[0];
			
			foreach ($iframesFound as $iframeFound){
				
				$correctIframe  = str_replace('/>','></iframe>',$iframeFound);
				$content = str_replace($iframeFound, $correctIframe, $content);
				
			}
			
			// Cleaning redability for better memory
			unset($wp_automatic_Readability);
			unset($result);

 
			return $content;
			
		}else{
			echo '<br>Failed to find the content.';
			return '';
		}
		
	}
	
	/**
	 * Extract content by a regex ex <h1>(.*?)</h1>
	 * @param string $regex
	 */
	function getContentByRegex($regex){
		
		preg_match_all('{'.$regex.'}is', $this->html,$matchregex);
		$foundMatchs = $matchregex[1];
		return $foundMatchs;
		
	}
	
}