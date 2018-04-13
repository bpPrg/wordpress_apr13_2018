<?php
/**
 * Functions File
 *
 * @package Klean Blog
 * @since 1.0
 */

// Exit if accessed directly
if ( !defined( 'ABSPATH' ) ) exit;

/**
 * Sanitize customizer inputs
 *
 * @package Klean Blog
 * @since 1.0
 */
function klean_blog_theme_dynemic_css() {
	
	// Action to add theme dynemic CSS	// Menu bar Link Color
	$menu_bar_link_clr = klean_blog_get_theme_mod( 'menu_bar_link_clr' );
	
	// Menu bar Link Hover Color
	$menu_bar_linkh_clr = klean_blog_get_theme_mod( 'menu_bar_linkh_clr' );
	 
	// Heading Color
	$heading_clr = klean_blog_get_theme_mod( 'heading_clr' );
	
	// Link Color
	$link_clr = klean_blog_get_theme_mod( 'link_clr' );
	 
	// Link Hover Color
	$hover_link_clr = klean_blog_get_theme_mod( 'hover_link_clr' );

	$sidebar_textcolor  = klean_blog_get_theme_mod( 'header_textcolor' );
	$header_background_color  = klean_blog_get_theme_mod( 'header_background_color' );;
	
?>

<style>
@media screen and (min-width:954px){
.main-navigation a, .klean_blog-social-networks a{color:<?php echo klean_blog_esc_attr($menu_bar_link_clr); ?>;}
.main-navigation a:hover, .main-navigation a:active, .main-navigation a:focus, .klean_blog-social-networks a:hover, .klean_blog-social-networks a:focus, .klean_blog-social-networks a:active{color:<?php echo klean_blog_esc_attr($menu_bar_linkh_clr); ?>;} 
.widget-area, .widget-area ul li, .widget-area ul li a, h2.widget-title, .footer_copyrigh, .textwidget p, a.klean-blog-social-network-icon{color:#<?php echo klean_blog_esc_attr($sidebar_textcolor); ?>;}
}

h1.site-title a, .site-description, .site-title a, .site-description, .secondary-toggle::before {
    color:#<?php echo klean_blog_esc_attr($sidebar_textcolor); ?>;
}

body::before, .site-header {
    background-color: <?php echo klean_blog_esc_attr($header_background_color); ?>;
}

.site-content a:link, .site-content a:visited {
    color: <?php echo klean_blog_esc_attr($link_clr); ?>; 
}
.site-content a:hover, .site-content a:active {
    color: <?php echo klean_blog_esc_attr($hover_link_clr); ?>; 
}
h1, h2, h2.entry-title, h2.entry-title, h2.entry-title a:link, h2.entry-title a:visited, h3, h4, h5, h6 {
    color: <?php echo klean_blog_esc_attr($heading_clr); ?>; 
}
</style>
<?php
}
// Action to add theme dynemic CSS
add_action( 'wp_head', 'klean_blog_theme_dynemic_css' );