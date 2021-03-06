<?php
/**
 * Template Name: Full Width Page
 *
 * @since 1.0.0
 */
 
__( 'Full Width Page', 'radar' );

get_header(); ?>

<div id="primary" class="content-area row">
	<div id="content" <?php radar_content_class(); ?> role="main">
		<?php
			// Start the Loop.
			while ( have_posts() ) : the_post();

				/*
				 * Include the post format-specific template for the content. If you want to
				 * use this in a child theme, then include a file called called content-___.php
				 * (where ___ is the post format) and that will be used instead.
				 */
				get_template_part( 'parts/content', 'page' );

				// If comments are open or we have at least one comment, load up the comment template.
				if ( comments_open() || get_comments_number() ) {
					comments_template();
				}
			endwhile;
		?>
	</div><!-- #content -->	
</div><!-- #primary -->

<?php
get_footer();
