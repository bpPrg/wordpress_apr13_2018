<?php
/**
 * Functions File
 *
 * @package klean_blog
 * @since 1.0
 */

// Exit if accessed directly
if ( !defined( 'ABSPATH' ) ) exit;

/**
 * Update theme default settings
 * 
 * @package klean_blog
 * @since 1.0
 */
function klean_blog_default_settings() {

	$default_settings = array(
								
								'menu_bar_link_clr'				=> '#000000',
								'menu_bar_linkh_clr'			=> '#FF6347',
								'heading_clr'					=> '#000000',
								'header_textcolor'				=> '#000000',
								'link_clr'						=> '#000000',
								'hover_link_clr'				=> '#FF6347',
								'header_background_color'       => '#FFFFFF',	
								'blog_excerpt_length'			=> 40,
								'blog_show_date'				=> 1,
								'blog_show_author'				=> 1,
								'blog_show_cat'					=> 1,
								'blog_show_tags'				=> 1,
								'cat_show_date'					=> 1,
								'cat_show_author'				=> 1,
								'cat_show_cat'					=> 1,
								'cat_show_tags'					=> 1,				
								'header_social'      			=> 1,
								'facebook'                		=> '',
								'twitter'                 		=> '',
								'linkedin'                		=> '',
								'behance'                 		=> '',
								'dribbble'                		=> '',
								'instagram'               		=> '',
								'youtube'                 		=> '',
								'copyright' 					=> esc_html__( '2017 WP Online Support', 'klean-blog' ),								
							);

	return apply_filters('klean_blog_options_default_values', $default_settings );
}

/**
 * Escape Tags & Slashes
 *
 * Handles escapping the slashes and tags
 *
 * @package klean_blog
 * @since 1.0
 */
function klean_blog_esc_attr($data) {
    return esc_attr( $data );
}


/**
 * Function to excerpt length
 * 
 * @package klean_blog
 * @since 1.0
 */
function klean_blog_excerpt_length( $length ) {
	
	if(!is_admin()){
		$length = klean_blog_get_theme_mod( 'blog_excerpt_length' );	
	}
	
	return (int)$length;
}
add_filter( 'excerpt_length', 'klean_blog_excerpt_length', 999 );