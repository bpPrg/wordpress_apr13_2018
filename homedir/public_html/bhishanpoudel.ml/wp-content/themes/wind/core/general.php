<?php
/**
 * Content Functions
 * 
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */

//Sorting array by key
function wind_sort_array( &$array, $key ) {
    $sorter = array();
    $ret = array();
    reset( $array );
    foreach ( $array as $ii => $va ) {
        $sorter[ $ii ] = $va[ $key ];
    }
    asort( $sorter );
    foreach ( $sorter as $ii => $va ) {
        $ret[ $ii ] = $array[ $ii ];
    }
    $array = $ret;
}
// Return Post Type array
function wind_post_types() { 
	$types = array( 
		'post' => __( 'Post', 'wind' ),
		'page' => __( 'Page', 'wind' ),
	);

	$args = array(
  		'public'   => true,
  		'_builtin' => false ); 
	$post_types = get_post_types( $args ); 
	foreach ( $post_types as $post_type ) {
		$types[ $post_type ] = $post_type;
	}
	return apply_filters( 'wind_post_types', $types );
}
/* Content Filter: Remove image from post*/
function wind_remove_images( $content ) {
   $postOutput = preg_replace('/<img[^>]+./','', $content);
   return $postOutput;
}

// Return Thumbnail
if ( ! function_exists( 'wind_thumbnail_size' ) ) : 
function wind_thumbnail_size( $option, $x = 96, $y = 96 ) {

	if ( empty( $option ) )
		return 'thumbnail';
	elseif ( 'custom' == $option ) {
		if ( ($x > 0) && ($y > 0) )
			return array( $x, $y);
		else
			return 'thumbnail';		
	}
	else 
		return $option;
}
endif;

//Thumbal Array
function wind_thumbnail_array() {
	$sizes = array (
		''			=> __( 'Thumbnail', 'wind' ),
		'medium'	=> __( 'Medium', 'wind' ),
		'large'		=> __( 'Large', 'wind' ),
		'full'		=> __( 'Full', 'wind' ),	
		'none'		=> __( 'None', 'wind' ),	
	);
	
	global $_wp_additional_image_sizes;
	if ( isset( $_wp_additional_image_sizes ) )
		foreach( $_wp_additional_image_sizes as $key => $item) 
			$sizes[ $key ] = $key;
	return apply_filters( 'wind_thumbnail_array', $sizes );
}

/* Category Array */
function wind_categories() {
	$categories = get_categories();
	return apply_filters( 'wind_categories', $categories );
}

function wind_category_choices( $inc = 'all' ) {
	$categories = wind_categories();
	
	$choices = array();
	if ( 'all' == $inc )
		$choices[0] = __( 'All Categories', 'wind' );
	elseif ( 'metaall' == $inc )
		$choices[''] = __( 'All Categories', 'wind' );
	
	foreach ( $categories as $categorie )
		$choices[ $categorie->term_id ] = $categorie->name;
	return apply_filters( 'wind_category_choices', $choices );
}

function wind_top_categories( $count = 0 ) {
	$args = array(
		'orderby' => 'count',
		'order' => 'DESC',
		'parent' => 0 );
	$categories = get_categories( $args );
	$top_cats = array();
	foreach ( $categories as $category )
		if ( $category->count >= $count )
			$top_cats[] = $category;
	return apply_filters( 'wind_top_categories', $top_cats );
}

/* Return true if post meta _wind_featured is set */
function wind_is_featured() {
	global $post; // WP global variable
	
	$featured = get_post_meta( $post->ID, '_wind_featured', true);
	if ( !empty( $featured ) && 1 == $featured )
		return true;
	else
		return false;
}