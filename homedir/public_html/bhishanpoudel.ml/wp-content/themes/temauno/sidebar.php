<?php
/**
 * The sidebar containing the main widget area.
 *
 * @package temauno
 */

if ( ! is_active_sidebar( 'sidebar-1' ) ) {
	return;
}
?>

<div id="secondary" class="widget-area" role="complementary">

	<?php temauno_social_icons(); ?>

	<?php dynamic_sidebar( 'sidebar-1' ); ?>
</div><!-- #secondary -->
