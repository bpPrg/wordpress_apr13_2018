/* Responsive Layout - Antonio Sanchez - http://antsanchez.com */
jQuery(document).ready(function(){
    var ancho = jQuery(window).width();
	jQuery('#open-menu').click(function(a){
	    var variable = jQuery('#menu-principal').css("display");
	    if (variable == "block") {
		jQuery('#menu-principal').slideUp(500);
	    }else{
		jQuery('#menu-principal').slideDown(500);
	    } 
	})
    if(!!('ontouchstart' in window)){
	jQuery('#menu-principal .menu li:has(ul)').click(function(e) {
	    var variable = jQuery(this).find('ul').css("display");
	    if (variable == "block") {
			jQuery(this).children('ul').slideUp(1000);
	    }else{
		e.preventDefault();
			jQuery(this).children('ul').slideDown(500);
	    }
	});
    }else{
	jQuery('#menu-principal .menu li:has(ul)').hover(function(e) {
	    var variable = jQuery(this).find('ul').css("display");
	    if (variable == "block") {
			jQuery(this).children('ul').slideUp(1000);
	    }else{
		e.preventDefault();
			jQuery(this).children('ul').slideDown(500);
			jQuery(this).find('ul').css({zIndex: 99});
			jQuery(this).children('ul').css({zIndex: 100});
	    }
	});
    }
});
jQuery(window).resize(function(){
    var ancho = jQuery(window).width();
    if (ancho >= 768 ) {
		jQuery('#menu-principal').css({display: "block"});
    }else{
		jQuery('#menu-principal').css({display: "none"});
    }
});

