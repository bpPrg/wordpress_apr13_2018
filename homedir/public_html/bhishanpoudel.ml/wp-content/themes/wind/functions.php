<?php
/**
 * Wind Functions
 * 
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */

//Load Core functions
require_once( get_template_directory() . '/inc/theme-settings.php' );
require_once( get_template_directory() . '/core/core-functions.php' );

add_action( 'after_setup_theme', 'wind_theme_setup' );
if ( ! function_exists( 'wind_theme_setup' ) ):
function wind_theme_setup() {
	// Global variable for content width
	if ( ! isset( $content_width ) ) 
		$content_width = 690; // pixels
	
	register_nav_menus( array(
		'top-bar' => __( 'Top Menu' , 'wind' ),
		'section' => __( 'Section Menu' , 'wind' ),
		'footer'  => __( 'Footer Menu', 'wind' ),
	));
}
endif;

function wind_theme_scripts_method() {
	global $wind_options;
//	$wind_options = wind_get_options();
	
	$theme_uri = get_template_directory_uri();		

	wp_enqueue_style( 'wind', $theme_uri . '/css/wind.css', array( 'wind-foundation' ), WIND_VERSION );
	$child_pre = array( 'wind' );
	
    $option_css = wind_option_css();
	if ( ! empty( $option_css ) )
	    wp_add_inline_style( 'wind', htmlspecialchars_decode( $option_css ) );
    if ( ! empty( $wind_options['inline_css'] ) )
     	wp_add_inline_style( 'wind', htmlspecialchars_decode( $wind_options['inline_css'] ) );
    if ( 'default' != $wind_options['scheme'] ) {
		$schemes = apply_filters( 'wind_scheme_options', NULL );		
		wp_enqueue_style( 'wind-scheme', $schemes[ $wind_options['scheme'] ]['css'], $child_pre, WIND_VERSION );
 		$child_pre = array( 'wind-scheme' );
	}
	
	//Load child theme's style.css
    if ( $theme_uri != get_stylesheet_directory_uri() )
		wp_enqueue_style('wind-child', get_stylesheet_uri(), $child_pre, WIND_VERSION );

	// Load Javascript
	wp_enqueue_script( 'wind' , $theme_uri . '/js/wind.js', array( 'wind-foundation', 'wind-bxslider'), WIND_VERSION, true );
	$options = array( 'fixedmenu' => $wind_options['fixedmenu'] );
	wp_localize_script( 'wind', 'windData', $options );
}
if ( ! is_admin() )
	add_action( 'wp_enqueue_scripts', 'wind_theme_scripts_method' ); 
	
function wind_scheme_options( $scheme  ) {
	$theme_uri = get_template_directory_uri();
	$schemes = array(
		'default' 	=> array(
			'label' => __('Default','wind'),
			'css'   => '',
		),
		'dark' 		=> array(
			'label' => __('Dark','wind'),
			'css' => $theme_uri . '/css/dark.css',
		),
	);
	return $schemes;
}
add_filter( 'wind_scheme_options', 'wind_scheme_options');

function wind_theme_sidebars( $sidebars ) {
	$sidebars['bbp-widget-area'] = array(
			'name' => __( 'bbPress Widget Area', 'wind' ),
			'description' => __( 'bbPress/BuddyPress Widget Area', 'wind' ),
	);
	return $sidebars;
}
add_filter( 'wind_core_sidebars', 'wind_theme_sidebars');

function wind_theme_default_options( $defaults ) {
	$theme_defaults = array(
		'bbp_column1' => 9,
		'bbp_column2' => 3,
		'bbp_position' => 2,
	);
	return array_merge( $defaults, $theme_defaults);		
}
add_filter( 'wind_default_options', 'wind_theme_default_options' );

function wind_theme_additional_options( $theme_options ) {
	$options = array(
		'bbp_column1'	=> array(
			'name'	=> 'bbp_column1',
			'section'	=> 'layout',
			'heading'	=> __( 'bbPress Integration', 'wind' ),			
			'label'	=> __( 'Forum Content Width', 'wind' ),
			'type'	=> 'number',
			'desc' => __( 'Columns', 'wind' ),
		),
		'bbp_column2'	=> array(
			'name'	=> 'bbp_column2',
			'section'	=> 'layout',
			'label'	=> __( 'Sidebar Width', 'wind' ),
			'type'	=> 'number',
			'desc' => __( 'Columns', 'wind' ),	
		),
		'bbp_position'	=> array(
			'name'	=> 'bbp_position',
			'section'	=> 'layout',
			'label'	=> __( 'Sidebar Position', 'wind' ),
			'type'	=> 'radio',		
			'choices' => array(
				'1'		=> __( 'Left ', 'wind' ),
				'2'		=>  __( 'Right ', 'wind' ),
			),
		),
	);
	return array_merge( $theme_options, $options);
}
add_filter( 'wind_theme_options', 'wind_theme_additional_options' );

$wind_options = wind_get_options(); //Global Theme Options
