<?php
/**
 * temauno functions and definitions
 *
 * @package temauno
 */


if ( ! function_exists( 'temauno_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function temauno_setup() {

		/**
	 * Set the content width based on the theme's design and stylesheet.
	 */
	if ( ! isset( $content_width ) ) {
		$content_width = 782; /* pixels */
	}

	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on temauno, use a find and replace
	 * to change 'temauno' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'temauno', get_template_directory() . '/languages' );

	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );

	/*
	 * Let WordPress manage the document title.
	 * By adding theme support, we declare that this theme does not use a
	 * hard-coded <title> tag in the document head, and expect WordPress to
	 * provide it for us.
	 */
	add_theme_support( 'title-tag' );

	/*
	 * Enable support for Post Thumbnails on posts and pages.
	 *
	 * @link http://codex.wordpress.org/Function_Reference/add_theme_support#Post_Thumbnails
	 */
	add_theme_support( 'post-thumbnails' );

	/*
	 * Add custom image size for thumbnails appearing on the index page
	 *
	 * @link http://codex.wordpress.org/Function_Reference/add_image_size
	 */
	add_image_size( 'thumbnail-index', 782, 160, array( 'center', 'center' ));

	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => __( 'Primary Menu', 'temauno' ),
	) );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form', 'comment-form', 'comment-list', 'gallery', 'caption',
	) );

	/*
	 * Enable support for Post Formats.
	 * See http://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array('aside') );

	// Set up the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'temauno_custom_background_args', array(
		'default-color' => '#333333',
		'default-image' => '',
	) ) );
}
endif; // temauno_setup
add_action( 'after_setup_theme', 'temauno_setup' );

/**
 * Register widget area.
 *
 * @link http://codex.wordpress.org/Function_Reference/register_sidebar
 */
function temauno_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Sidebar', 'temauno' ),
		'id'            => 'sidebar-1',
		'description'   => __('Sidebar Widget Area', 'temauno'),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h1 class="widget-title">',
		'after_title'   => '</h1>',
	) );
	register_sidebars(3, array(
		'name'			=> __('Footer %d', 'temauno'),
		'description'   => __('Footer Widget Areas', 'temauno'),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget'  => '</aside>',
		'before_title'  => '<h1 class="widget-title">',
		'after_title'   => '</h1>',
	) );
}
add_action( 'widgets_init', 'temauno_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function temauno_scripts() {
	wp_enqueue_style( 'temauno-style', get_stylesheet_uri() );

	wp_enqueue_script( 'temauno-navigation', get_template_directory_uri() . '/js/navigation.js', array('jquery'), '20120206', true );

	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/font-awesome/css/font-awesome.min.css' );

	$headings_font = esc_html(get_theme_mod('temauno_headings_fonts'));
	$body_font = esc_html(get_theme_mod('temauno_body_fonts'));
	if( $headings_font ) {
		wp_enqueue_style( 'temauno-headings-fonts', '//fonts.googleapis.com/css?family='. $headings_font );	
	} else {
		wp_enqueue_style( 'temauno-headings-fonts', 'http://fonts.googleapis.com/css?family=Droid+Sans:400,700');
	}	
	if( $body_font ) {
		wp_enqueue_style( 'temauno-body-fonts', '//fonts.googleapis.com/css?family='. $body_font );	
	} else {
		wp_enqueue_style( 'temauno-body-fonts', 'http://fonts.googleapis.com/css?family=Droid+Sans:400,700');
	}

	wp_enqueue_script( 'temauno-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20130115', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'temauno_scripts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Custom functions that act independently of the theme templates.
 */
require get_template_directory() . '/inc/extras.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
require get_template_directory() . '/inc/jetpack.php';
