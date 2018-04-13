<?php
/**
 * The template for displaying 404 pages (Not Found)
 *
 * @since 1.0.0
 */

get_header(); ?>

<div id="primary" class="content-area alert alert-danger">
	<div id="content" class="site-content" role="main">

		<header class="page-header">
			<h1 class="page-title"><?php _e( 'Not Found', 'radar' ); ?></h1>
		</header>

		<div class="page-content">
			<p><?php _e( 'It looks like nothing was found at this location. Maybe try a search?', 'radar' ); ?></p>
			<div class="form-inline"><?php get_search_form(); ?></div>
		</div><!-- .page-content -->

	</div><!-- #content -->

</div><!-- #primary -->

<?php
get_footer();
