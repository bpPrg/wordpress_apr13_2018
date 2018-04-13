<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package temauno
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
<!--[if lt IE 9]>
<script src="<?php echo esc_url( get_template_directory_uri() ); ?>/js/html5.js"></script>
<![endif]-->
<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'temauno' ); ?></a>

	<header id="masthead" class="site-header" role="banner">
		
		<div class="site-branding">
		<?php if(get_header_image() != ''): ?> <!-- Check if there is a header image -->
		    <?php if ( display_header_text() ) : ?> <!-- Check if there is text over the header -->
			<?php $header_color = get_header_textcolor(); ?>
			<div id="logo">
			    <img src="<?php header_image(); ?>" alt="<?php get_bloginfo('name'); ?>">
			</div>
			    <h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
				<h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>
			
		    <?php else: ?> <!-- if there are header image but no text over it -->
			<div id="logo">
			    <img src="<?php header_image(); ?>" alt="<?php get_bloginfo('name'); ?>">
			</div>
		    <?php endif; ?>
		<?php else: ?> <!-- if there are no header image... -->
		    <h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
			<h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>
		    <?php if(get_header_image() != ''): ?>
			<div id="logo">
			    <img src="<?php header_image(); ?>" alt="<?php get_bloginfo('name'); ?>">
			</div>
		    <?php endif ?>
		<?php endif; ?>
		</div>

		<nav id="site-navigation" class="main-navigation" role="navigation">
			<div id="open-menu"><a href="#"><i class="fa fa-bars fa-2x fa-border"></i></a></div><!--Responsive Menu Link-->
			<?php			
			if(has_nav_menu('primary')){
				wp_nav_menu(array( 'theme_location' => 'primary', 'container' => 'nav', 'container_class' => false, 'container_id' => 'menu-principal', 'fallback_cb' => false)); 
			}else{
				echo "<nav><div id='menu-principal'>";
				wp_nav_menu();
				echo "</div></nav>";
			}
			?>
		</nav><!-- #site-navigation -->
	</header><!-- #masthead -->

	<div id="content" class="site-content">
