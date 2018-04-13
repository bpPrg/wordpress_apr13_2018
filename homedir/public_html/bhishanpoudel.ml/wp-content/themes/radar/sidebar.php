<?php
/**
 * The Sidebar containing the right widget area
 *
 * @since 1.0.0
 */
 
if ( ! is_active_sidebar( 'sidebar' ) ) {
	return;
}
?>

<div id="secondary" class="col-md-4">
	
	<div id="primary-sidebar" class="primary-sidebar widget-area" role="complementary">
		<?php dynamic_sidebar( 'sidebar' ); ?>
	</div><!-- #primary-sidebar -->
</div><!-- #secondary -->