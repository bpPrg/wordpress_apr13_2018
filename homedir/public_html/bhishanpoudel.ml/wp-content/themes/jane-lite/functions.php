<?php

/*-----------------------------------------------------------------------------------*/
/* STYLES AND SCRIPTS */
/*-----------------------------------------------------------------------------------*/ 

if (!function_exists('janelite_enqueue_scripts')) {

	function janelite_enqueue_scripts() {

		wp_deregister_style ( 'suevafree-style' );
		wp_deregister_style ( 'suevafree-header_layout_1');
		wp_deregister_style ( 'suevafree_google_fonts' );

		wp_enqueue_style( 'janelite_template' , get_stylesheet_directory_uri() . '/assets/css/template.css' ); 
		wp_enqueue_script( 'janelite_template', get_stylesheet_directory_uri() . '/assets/js/jquery.functions.js' , array('jquery'), FALSE, TRUE );

		if ( !suevafree_setting( 'janelite_header_layout') || suevafree_setting( 'janelite_header_layout') == 'janelite_header_layout' ) {
		
			wp_enqueue_style ( 'janelite_header_layout', get_stylesheet_directory_uri() . '/assets/css/header-layout.css' );

		} else {
		
			$header_layout = str_replace('suevafree_', '', suevafree_setting( 'janelite_header_layout'));
			wp_enqueue_style( 'suevafree-' . $header_layout , get_template_directory_uri() . '/assets/css/header/' . $header_layout . '.css' );
		
		}

		if ( !get_theme_mod('suevafree_skin') ) {
			
			wp_enqueue_style( 'janelite_orange' , get_template_directory_uri() . '/assets/skins/orange.css' ); 

		} elseif ( get_theme_mod('suevafree_skin') ) { 
		
			wp_deregister_style( 'suevafree-' . get_theme_mod('suevafree_skin')); 
			wp_enqueue_style( 'janelite_' . get_theme_mod('suevafree_skin') , get_template_directory_uri() . '/assets/skins/' . get_theme_mod('suevafree_skin') . '.css' ); 
		
		}
		
		$fonts_args = array(
			'family' =>	str_replace('|', '%7C','Libre+Franklin:300,300i,400,400i,500,500i,600,600i,700,700i|Courgette'),
			'subset' =>	'latin,greek,greek-ext,vietnamese,cyrillic-ext,latin-ext,cyrillic'
		);

		wp_enqueue_style ( 'slick', get_stylesheet_directory_uri() . '/assets/css/slick.css' );
		wp_enqueue_script( 'slick', get_stylesheet_directory_uri() . '/assets/js/slick.js' , array('jquery'), FALSE, TRUE );
		wp_enqueue_style( 'janelite_google_fonts', add_query_arg ($fonts_args, "https://fonts.googleapis.com/css" ), array(), null);
	
	}
	
	add_action( 'wp_enqueue_scripts', 'janelite_enqueue_scripts', 99 );

}

/*-----------------------------------------------------------------------------------*/
/* CUSTOMIZE */
/*-----------------------------------------------------------------------------------*/   

if (!function_exists('janelite_customize_register')) {

	function janelite_customize_register( $wp_customize ) {

		$wp_customize->remove_setting( 'suevafree_header_layout');
		$wp_customize->remove_control( 'suevafree_header_layout');
		
		$wp_customize->add_section( 'janelite_slick_layout_section' , array(
			'title'    => esc_html__('Jane Lite Slick Slideshow','jane-lite'),
			'priority' => 9
		));   
	
		$wp_customize->add_setting( 'janelite_slick_layout', array(
			'default' => 'on',
			'sanitize_callback' => 'janelite_select_sanitize',
		));

		$wp_customize->add_control( 'janelite_slick_layout' , array(
									
			'type' => 'select',
			'section' => 'janelite_slick_layout_section',
			'priority' => 1,
			'label' => esc_html__('Jane Lite Slick Slideshow','jane-lite'),
			'description' => esc_html__('Do you want to display the Slick Slideshow?','jane-lite'),
			'choices'  => array (
				'off' => esc_html__( 'No',   'jane-lite'),
				'on' => esc_html__( 'Yes',   'jane-lite'),
			),
												
		));
		
		$wp_customize->add_setting( 'janelite_slick_overlay', array(
			'default' => 'on',
			'sanitize_callback' => 'janelite_select_sanitize',
		));

		$wp_customize->add_control( 'janelite_slick_overlay' , array(
									
			'type' => 'select',
			'section' => 'janelite_slick_layout_section',
			'priority' => 1,
			'label' => esc_html__('Caption Overlay','jane-lite'),
			'description' => esc_html__('Do you want to display the caption overlay on Slick Slideshow?','jane-lite'),
			'choices'  => array (
				'off' => esc_html__( 'No',   'jane-lite'),
				'on' => esc_html__( 'Yes',   'jane-lite'),
			),
												
		));

		$wp_customize->add_setting( 'janelite_header_layout', array(
			'default' => 'janelite_header_layout',
			'sanitize_callback' => 'janelite_select_sanitize',
		));

		$wp_customize->add_control( 'janelite_header_layout' , array(
									
			'type' => 'select',
			'section' => 'layouts_section',
			'priority' => 1,
			'label' => esc_html__('Header Layout','jane-lite'),
			'description' => esc_html__('Header Layout','jane-lite'),
			'choices'  => array (
				'janelite_header_layout' => esc_html__( 'Jane Lite Header Layout',   'jane-lite'),
				'suevafree_header_layout_1' => esc_html__( 'SuevaFree Header Layout 1', 'jane-lite'),
				'suevafree_header_layout_2' => esc_html__( 'SuevaFree Header Layout 2', 'jane-lite'),
				'suevafree_header_layout_3' => esc_html__( 'SuevaFree Header Layout 3', 'jane-lite'),
				'suevafree_header_layout_4' => esc_html__( 'SuevaFree Header Layout 4', 'jane-lite'),
				'suevafree_header_layout_5' => esc_html__( 'SuevaFree Header Layout 5', 'jane-lite'),
			),
												
		));

		function janelite_select_sanitize ($value, $setting) {
		
			global $wp_customize;
					
			$control = $wp_customize->get_control( $setting->id );
				 
			if ( array_key_exists( $value, $control->choices ) ) {
					
				return $value;
					
			} else {
					
				return $setting->default;
					
			}
			
		}

	}
	
	add_action( 'customize_register', 'janelite_customize_register', 11 );

}

/*-----------------------------------------------------------------------------------*/
/* HEADER SIDEBAR REPLACE */
/*-----------------------------------------------------------------------------------*/ 

if (!function_exists('janelite_header_sidebar_replace')) {

	function janelite_header_sidebar_replace() {

		remove_action( 'suevafree_header_sidebar', 'suevafree_header_sidebar_function', 10, 2 );
	}
	
	add_action('init','janelite_header_sidebar_replace');

}

/*-----------------------------------------------------------------------------------*/
/* JANEPRO HEADER SIDEBAR */
/*-----------------------------------------------------------------------------------*/ 

if (!function_exists('janelite_header_sidebar_function')) {
	
	function janelite_header_sidebar_function($name) {

		if ( suevafree_setting('janelite_slick_layout', 'on') === 'on' && ( is_home() || is_front_page()) ) 
			do_action('janelite_slick_slider');

		if ( is_active_sidebar($name) ) : ?>
			
			<div id="header_sidebar" class="container sidebar-area">
			
				<div class="row">
				
					<div class="col-md-12">
						
						<?php dynamic_sidebar($name) ?>
												
					</div>
	
				</div>
				
			</div>
				
<?php 
	
		endif;
		
	}

	add_action( 'suevafree_header_sidebar', 'janelite_header_sidebar_function', 10, 2 );

}

/*-----------------------------------------------------------------------------------*/
/* JANEPRO THEME DEFAULT VALUES */
/*-----------------------------------------------------------------------------------*/   

if (!function_exists('janelite_theme_setup')) {

	function janelite_theme_setup() {

		add_image_size( 'janelite_slick', 940, 600, TRUE ); 
		
		load_child_theme_textdomain( 'jane-lite', get_stylesheet_directory() . '/languages' );
		
		require_once( trailingslashit( get_stylesheet_directory() ) . 'template-part/slick-slider.php' );
		require_once( trailingslashit( get_stylesheet_directory() ) . 'template-part/header-layout.php' );

		if ( !suevafree_setting('suevafree_thumb_triangle') )
			set_theme_mod( 'suevafree_thumb_triangle', 'on' );
			
		if ( !suevafree_setting('suevafree_thumb_hover') )
			set_theme_mod( 'suevafree_thumb_hover', 'on' );
			
		if ( !suevafree_setting('suevafree_disable_box_shadow') )
			set_theme_mod( 'suevafree_disable_box_shadow', 'on' );

		if ( !suevafree_setting('suevafree_post_format_layout') )
			set_theme_mod( 'suevafree_post_format_layout', 'on' );

		if ( !suevafree_setting('suevafree_post_details_layout') )
			set_theme_mod( 'suevafree_post_details_layout', 'suevafree_before_content_2' );

		if ( !suevafree_setting('suevafree_page_details_layout') )
			set_theme_mod( 'suevafree_page_details_layout', 'suevafree_before_content_3' );

		if ( !suevafree_setting('suevafree_sidebar_layout') )
			set_theme_mod( 'suevafree_sidebar_layout', 'sneak' );

		if ( !suevafree_setting('suevafree_footer_layout') )
			set_theme_mod( 'suevafree_footer_layout', 'footer_layout_3' );

		if ( !suevafree_setting('suevafree_menu_font_size') )
			set_theme_mod( 'suevafree_menu_font_size', '12px' );

		if ( !suevafree_setting('suevafree_menu_font_weight') )
			set_theme_mod( 'suevafree_menu_font_weight', '600' );

	}

	add_action( 'after_setup_theme', 'janelite_theme_setup' );

}

?>