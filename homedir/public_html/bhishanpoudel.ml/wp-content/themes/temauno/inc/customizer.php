<?php
/**
 * temauno Theme Customizer
 *
 * @package temauno
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function temauno_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';

	// Font Color
	$wp_customize->add_setting( 'temauno_font_color', array(
		'default' => 'ffffff',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_font_color', array(
		'label' => __('Font Color', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_font_color',
	)));

	// Links Color
	$wp_customize->add_setting( 'temauno_links_color', array(
		'default' => '#dd3333',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_links_color', array(
		'label' => __('Color for links', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_links_color',
	)));

	// Links Color : Visited
	$wp_customize->add_setting( 'temauno_links_color_visited', array(
		'default' => '#dd3333',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_links_color_visited', array(
		'label' => __('Visited Links color', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_links_color_visited',
	)));

	// Links Color: Hover
	$wp_customize->add_setting( 'temauno_links_color_hover', array(
		'default' => '#00b3fe',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_links_color_hover', array(
		'label' => __('Link color when mouse is hover', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_links_color_hover',
	)));

	// Menu Links: Color
	$wp_customize->add_setting( 'temauno_links_menu_color', array(
		'default' => '#ffffff',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_links_menu_color', array(
		'label' => __('Menu Links Color', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_links_menu_color',
	)));

	// Menu: Color
	$wp_customize->add_setting( 'temauno_menu_color', array(
		'default' => '#545454',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_menu_color', array(
		'label' => __('Menu color', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_menu_color',
	)));

	// Menu: Color Hover
	$wp_customize->add_setting( 'temauno_menu_color_hover', array(
		'default' => '#ec971f',
		'sanitize_callback' => 'sanitize_hex_color',
	));
	$wp_customize->add_control( new WP_Customize_Color_Control( $wp_customize, 'temauno_menu_color_hover', array(
		'label' => __('Menu color when mouse is hover', 'temauno'),
		'section' => 'colors',
		'setting' => 'temauno_menu_color_hover',
	)));

	// Fonts
    $wp_customize->add_section(
        'temauno_typography',
        array(
            'title' => __('Fonts', 'temauno' ),
            'priority' => 15,
        )
    );
	$font_choices = 
    array(
      'Fira Sans:400,700,400italic,700italic' => 'Fira Sans',
      'Merriweather:900,700' => 'Merriweather',
      'Source Sans Pro:400,700,400italic,700italic' => 'Source Sans Pro',   
      'Droid Sans:400,700' => 'Droid Sans',
      'Lato:400,700,400italic,700italic' => 'Lato',
      'Arvo:400,700,400italic,700italic' => 'Arvo',
      'Lora:400,700,400italic,700italic' => 'Lora',
      'PT Sans:400,700,400italic,700italic' => 'PT Sans',
      'PT+Sans+Narrow:400,700' => 'PT Sans Narrow',
      'Arimo:400,700,400italic,700italic' => 'Arimo',
      'Ubuntu:400,700,400italic,700italic' => 'Ubuntu',
      'Bitter:400,700,400italic' => 'Bitter',
      'Droid Serif:400,700,400italic,700italic' => 'Droid Serif',
      'Open+Sans:400italic,700italic,400,700' => 'Open Sans',
      'Roboto:400,400italic,700,700italic' => 'Roboto',
      'Oswald:400,700' => 'Oswald',
      'Open Sans Condensed:700,300italic,300' => 'Open Sans Condensed',
      'Roboto Condensed:400italic,700italic,400,700' => 'Roboto Condensed',
      'Raleway:400,700' => 'Raleway',
      'Roboto Slab:400,700' => 'Roboto Slab',
      'Yanone Kaffeesatz:400,700' => 'Yanone Kaffeesatz',
      'Rokkitt:400' => 'Rokkitt',
    );
  
  $wp_customize->add_setting(
    'temauno_headings_fonts',
    array(
      'sanitize_callback' => 'temauno_sanitize_fonts',
    )
  );
  
  $wp_customize->add_control(
    'temauno_headings_fonts',
    array(
      'type' => 'select',
      'priority'    => 9,
      'label' => __('Select fonts for the headings.', 'temauno'),
      'section' => 'temauno_typography',
      'choices' => $font_choices
    )
  );
  
  $wp_customize->add_setting(
    'temauno_body_fonts',
    array(
      'sanitize_callback' => 'temauno_sanitize_fonts',
    )
  );
  
  $wp_customize->add_control(
    'temauno_body_fonts',
    array(
      'type' => 'select',
      'priority'    => 10,
      'label' => __('Select fonts for the body.', 'temauno'),
      'section' => 'temauno_typography',
      'choices' => $font_choices
    )
  );

	// Social Icons
	$wp_customize->add_section( 'temauno_social_icons', array(
    'title'          => __( 'Social Icons', 'temauno' ),
    'description'    => __( 'Fill in the fields you wish to show with his correspondent url. For instance, for Twitter: https://twitter.com/your_username', 'blackcolors'),
	'priority'		=> '16',
	) );


	 /* Add setting und control for every social icon
    /*--------------------------------------*/
    $temauno_social_services = array('fa-twitter' => 'Twitter',
                                        'fa-facebook' => 'Facebook',
                                        'fa-google-plus' => 'Google+',
                                        'fa-behance' => 'Behance',
                                        'fa-codepen' => 'Codepen',
										'fa-dribbble' => 'Dribbble',
                                        'fa-github' => 'GitHub',
                                        'fa-linkedin' => 'LinkeIn',
                                        'fa-skype' => 'Skype',
                                        'fa-youtube' => 'YouTube',
                                        'fa-slack' => 'Slack',
                                        'fa-tumblr' => 'Tumblr',
                                        'fa-yelp' => 'Yelp',
                                        'fa-instagram' => 'Instagram',
                                        'fa-pinterest' => 'Pinterest',
                                        'fa-flickr' => 'Flickr',
                                        'fa-stack-exchange' => 'Stack Exchange',
										'fa-vimeo' => 'Vimeo',
										'fa-spotify' => 'Spotify');

    $a = 2;
    foreach($temauno_social_services as $id => $valor){
        $wp_customize->add_setting( "temauno_$id", array(
            'type'           => 'theme_mod',
            'capability'     => 'edit_theme_options',
            'sanitize_callback' => 'esc_url',
        ) );
    
        $wp_customize->add_control( new WP_Customize_Control( $wp_customize, "temauno_$id", array(
            'settings' => "temauno_$id",
            'label'    => $valor, // <- Translation function calls must NOT contain PHP variables. Var contains just non-translatable International Brands
            'section'  => 'temauno_social_icons',
            'type'     => 'text',
            'priority' => $a,
        ) ) );

        $a++;
    }
}
add_action( 'customize_register', 'temauno_customize_register' );

function temauno_sanitize_fonts( $input ) {
    $valid = array(
      'Fira Sans:400,700,400italic,700italic' => 'Fira Sans',
      'Merriweather:900,700' => 'Merriweather',
      'Source Sans Pro:400,700,400italic,700italic' => 'Source Sans Pro',   
      'Droid Sans:400,700' => 'Droid Sans',
      'Lato:400,700,400italic,700italic' => 'Lato',
      'Arvo:400,700,400italic,700italic' => 'Arvo',
      'Lora:400,700,400italic,700italic' => 'Lora',
      'PT Sans:400,700,400italic,700italic' => 'PT Sans',
      'PT+Sans+Narrow:400,700' => 'PT Sans Narrow',
      'Arimo:400,700,400italic,700italic' => 'Arimo',
      'Ubuntu:400,700,400italic,700italic' => 'Ubuntu',
      'Bitter:400,700,400italic' => 'Bitter',
      'Droid Serif:400,700,400italic,700italic' => 'Droid Serif',
      'Open+Sans:400italic,700italic,400,700' => 'Open Sans',
      'Roboto:400,400italic,700,700italic' => 'Roboto',
      'Oswald:400,700' => 'Oswald',
      'Open Sans Condensed:700,300italic,300' => 'Open Sans Condensed',
      'Roboto Condensed:400italic,700italic,400,700' => 'Roboto Condensed',
      'Raleway:400,700' => 'Raleway',
      'Roboto Slab:400,700' => 'Roboto Slab',
      'Yanone Kaffeesatz:400,700' => 'Yanone Kaffeesatz',
      'Rokkitt:400' => 'Rokkitt',
    );
 
    if ( array_key_exists( $input, $valid ) ) {
        return $input;
    } else {
        return '';
    }
}

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function temauno_customize_preview_js() {
	wp_enqueue_script( 'temauno_customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20130508', true );
}
add_action( 'customize_preview_init', 'temauno_customize_preview_js' );

/* Checkbox Sanitization
/*----------------------------------*/
function temauno_sanitize_checkbox( $input ) {
  if ( $input == 1 ) {
    return 1;
  } else {
    return '';
  }
}

function temauno_cutomize_saved_styles(){
	
	$font_color = get_theme_mod('temauno_font_color', '#ffffff');
	$links_color = get_theme_mod('temauno_links_color', '#dd3333');
	$links_visited = get_theme_mod('temauno_links_color_visited', '#dd3333');
	$links_hover = get_theme_mod('temauno_links_color_hover', '#00b3fe');
	$links_menu = get_theme_mod('temauno_links_menu_color', '#ffffff');
	$menu_color = get_theme_mod('temauno_menu_color', '#545454');
	$menu_color_hover = get_theme_mod('temauno_menu_color_hover', '#ec971f');
	$headings_font = get_theme_mod('temauno_headings_fonts');
	$body_font = get_theme_mod('temauno_body_fonts');
	$headings_font = explode(":", $headings_font);
	$body_font = explode(":", $body_font);

	echo "<style type='text/css'>body, button, input, select { color: " . esc_attr($font_color) . "; font-family: " . esc_attr($body_font[0]) . ";} 
	#masthead{font-family: " . esc_attr($headings_font[0]) . ";}
	a:link{ color: " . esc_attr($links_color) . "; }
	a:visited{color: " . esc_attr($links_visited) . ";}
	a:hover{color: " . esc_attr($links_hover) . "; }
	#menu-principal a, #menu-principal a:link, #menu-principal a:visited, #menu-principal a:hover, .widget-title{color: " . esc_attr($links_menu) . ";}
	#site-navigation, .navigation, #menu-principal ul, .widget-title{ background-color: " . esc_attr($menu_color) . "; }
	.menu li:hover{ background-color: " . esc_attr($menu_color_hover) . "; }
	</style>";
}
add_action('wp_head', 'temauno_cutomize_saved_styles', 100);