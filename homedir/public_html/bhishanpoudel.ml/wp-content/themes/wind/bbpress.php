<?php
/**
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */
get_header(); ?>
<div id="content" role="main" class="<?php echo wind_bbp_class(); ?>">
<?php
	while ( have_posts() ) {
		the_post();
		get_template_part( 'content', 'page' );
	}
?>
</div>
<?php get_sidebar('bbpress'); ?>	
<?php get_footer(); ?>
